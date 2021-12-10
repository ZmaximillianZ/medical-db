--  Создать процедуру, выводящую список палат с указанием количества коек и статуса палаты:
--  «пустая», если в палате никто не лежит,
--  «свободных мест нет», если палата заполнена,
--  «мужская», если в палате лежат только мужчины,
--  «женская», если в палате лежат только женщины,
--  «смешанная» во всех остальных случаях.

create or replace function ward_status()
    returns table (
                      number varchar,
                      capacity bigint,
                      status varchar
                  )
    language plpgsql
as $$
begin
    return query with ward_capacity_and_fullness as (
        select
                w.number || ' (' || d2.name || ')'as number1,
                w.capacity as capacity1,
                'мужская' as status1
        from ward w
                 left join department d2 on d2.id = w.department_id
                 left join diagnosis d on w.id = d.ward_id
                 left join hospitalization h on h.id = d.hospitalization_id
                 left join patient p on p.id = h.patient_id
        where h.start_at <= '2021-07-07 00:00:00' and h.end_at >= '2021-07-07 00:00:00' and w.type='мужская'
        group by w.number, d2.name, w.capacity
        having count(d.ward_id)<w.capacity
        union all
        select
                w.number || ' (' || d2.name || ')'as number1,
                w.capacity as capacity1,
                'женская' as status1
        from ward w
                 left join department d2 on d2.id = w.department_id
                 left join diagnosis d on w.id = d.ward_id
                 left join hospitalization h on h.id = d.hospitalization_id
                 left join patient p on p.id = h.patient_id
        where h.start_at <= '2021-07-07 00:00:00' and h.end_at >= '2021-07-07 00:00:00' and w.type='женская'
        group by w.number, d2.name, w.capacity
        having count(d.ward_id)<w.capacity
        union all
        select
                w.number || ' (' || d2.name || ')'as number1,
                w.capacity as capacity1,
                'смешанная' as status1
        from ward w
                 left join department d2 on d2.id = w.department_id
                 left join diagnosis d on w.id = d.ward_id
                 left join hospitalization h on h.id = d.hospitalization_id
                 left join patient p on p.id = h.patient_id
        where h.start_at <= '2021-07-07 00:00:00' and h.end_at >= '2021-07-07 00:00:00' and w.type='смешанная'
        group by w.number, d2.name, w.capacity
        having count(d.ward_id)<w.capacity
        union all
        select
                w.number || ' (' || d2.name || ')'as number1,
                w.capacity as capacity1,
                'свободных мест нет' as status1
        from ward w
                 left join department d2 on d2.id = w.department_id
                 left join diagnosis d on w.id = d.ward_id
                 left join hospitalization h on h.id = d.hospitalization_id
        where h.start_at <= '2021-07-07 00:00:00' and h.end_at >= '2021-07-07 00:00:00'
        group by w.number, d2.name, w.capacity
        having count(d.ward_id)=w.capacity
        union all
        select w.number || ' (' || d2.name || ')'as number1, w.capacity as capacity1, 'пустая' as status1
        from ward w
                 left join department d2 on d2.id = w.department_id
        where w.id not in (
            select
                w.id as id
            from diagnosis d
                     left join ward w on w.id = d.ward_id
                     left join hospitalization h on h.id = d.hospitalization_id
            where h.start_at <= '2021-07-07 00:00:00' and h.end_at >= '2021-07-07 00:00:00'
        )
    ) select number1::varchar, capacity1::bigint, status1::varchar from ward_capacity_and_fullness;
end;$$;

create or replace function ward_status_by_date(
    ward_date timestamp
)
    returns table (
                      number varchar,
                      capacity bigint,
                      status varchar
                  )
    language plpgsql
as $$
begin
    return query with ward_capacity_and_fullness as (
        select
                w.number || ' (' || d2.name || ')'as number1,
                w.capacity as capacity1,
                'мужская' as status1
        from ward w
                left join department d2 on d2.id = w.department_id
                left join diagnosis d on w.id = d.ward_id
                left join hospitalization h on h.id = d.hospitalization_id
                left join patient p on p.id = h.patient_id
        where h.start_at <= ward_date and h.end_at >= ward_date and w.type='мужская'
        group by w.number, d2.name, w.capacity
        having count(d.ward_id)<w.capacity
        union all
        select
                w.number || ' (' || d2.name || ')'as number1,
                w.capacity as capacity1,
                'женская' as status1
        from ward w
                 left join department d2 on d2.id = w.department_id
                 left join diagnosis d on w.id = d.ward_id
                 left join hospitalization h on h.id = d.hospitalization_id
                 left join patient p on p.id = h.patient_id
        where h.start_at <= ward_date and h.end_at >= ward_date and w.type='женская'
        group by w.number, d2.name, w.capacity
        having count(d.ward_id)<w.capacity
        union all
        select
                w.number || ' (' || d2.name || ')'as number1,
                w.capacity as capacity1,
                'смешанная' as status1
        from ward w
                 left join department d2 on d2.id = w.department_id
                 left join diagnosis d on w.id = d.ward_id
                 left join hospitalization h on h.id = d.hospitalization_id
                 left join patient p on p.id = h.patient_id
        where h.start_at <= ward_date and h.end_at >= ward_date and w.type='смешанная'
        group by w.number, d2.name, w.capacity
        having count(d.ward_id)<w.capacity
        union all
        select
                w.number || ' (' || d2.name || ')'as number1,
                w.capacity as capacity1,
                'свободных мест нет' as status1
        from ward w
                 left join department d2 on d2.id = w.department_id
                 left join diagnosis d on w.id = d.ward_id
                 left join hospitalization h on h.id = d.hospitalization_id
        where h.start_at <= ward_date and h.end_at >= ward_date
        group by w.number, d2.name, w.capacity
        having count(d.ward_id)=w.capacity
        union all
        select w.number || ' (' || d2.name || ')'as number1, w.capacity as capacity1, 'пустая' as status1
        from ward w
                 left join department d2 on d2.id = w.department_id
        where w.id not in (
            select
                w.id as id
            from diagnosis d
                     left join ward w on w.id = d.ward_id
                     left join hospitalization h on h.id = d.hospitalization_id
            where h.start_at <= ward_date and h.end_at >= ward_date
        )
    ) select number1::varchar, capacity1::bigint, status1::varchar from ward_capacity_and_fullness;
end;$$;

--select * from ward_status_by_date('2016-12-10');