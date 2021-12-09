create function ward_capacity() returns trigger as $ward_capacity$
declare
    current_ward record;
    current_sex sex;
begin
    if NEW.ward_id is not null then
        return NEW;
    end if;
    -- проходим каждой палате которая относится к отделению
    -- врача который прикреплен к пациенту
    for current_ward in
        select
               id,
               capacity,
               department_id,
               type
        from ward
        where department_id = (
            select department_id
            from medical_staff
            left join patient p on medical_staff.id = p.medical_staff_id
            left join hospitalization h2 on p.id = h2.patient_id
            where h2.id=NEW.hospitalization_id
            limit 1
            )
        loop
            current_sex := (
                select p.sex
                from patient p
                left join hospitalization h on p.id = h.patient_id
                where h.id=NEW.hospitalization_id
                limit 1
            );
            -- если количество пациентов текущей палаты меньше ее вместимости на дату создания
            -- диагноза, то то присваиваем палату к диагнозу.
            if ((select COUNT(ward_id)
                from diagnosis
                left join hospitalization h on h.id = diagnosis.hospitalization_id
                where ward_id=current_ward.id and
                      h.start_at < NEW.created_at and
                      h.end_at > NEW.created_at
               ) < current_ward.capacity) and
               (
                    (current_sex='мужской' and (current_ward.type='мужская' or current_ward.type='смешанная')) or
                    (current_sex='женский' and (current_ward.type='женская' or current_ward.type='смешанная'))
               )
            then
                NEW.ward_id=current_ward.id;
                exit;
            else
                continue;
            end if;
        end loop;
    if NEW.ward_id is null then
        return null;
    end if;
    return NEW;
end;
$ward_capacity$ language plpgsql;

create trigger diagnosis_check_ward_capacity before insert or update on diagnosis
    for each row execute procedure ward_capacity();