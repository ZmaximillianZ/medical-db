--  Написать функцию, возвращающую строку «больше месяца»,
--  если со времени поступления пациента прошло более 1 месяца.
--  В качестве параметра использовать диагноз, и заменять для
--  такого пациента его лечащего врача на того, у кого меньше всего больных.

create or replace function is_patient_long_term(
    diagnosis_id int,
    curr_date timestamp
) returns varchar
    language plpgsql
as $$
declare long_term_patient int;
begin
    long_term_patient := (
        select
            p.id
        from patient p
                 left join hospitalization h on p.id = h.patient_id
                 left outer join diagnosis d on h.id = d.hospitalization_id
        where (curr_date - h.start_at) > interval '1 month' and
            h.end_at is null and
                d.id=diagnosis_id
    );
    if long_term_patient is not null then
        update patient set medical_staff_id=(
            select
                ms.id
            from medical_staff ms
                     left join patient p on ms.id = p.medical_staff_id
                     left join hospitalization h on p.id = h.patient_id
            where h.start_at <= curr_date and h.end_at >= curr_date and ms.id not in (
                select medical_staff_id from patient where id=long_term_patient
            )
            group by ms.id
            order by count(p.medical_staff_id)
            limit 1
        )
        where id=long_term_patient;
        return 'больше месяца';
    end if;
    return '';
end;
$$;

--select is_patient_long_term(37553, '2021-12-08');