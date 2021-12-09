--  Создать процедуру, выводящую список палат с указанием количества коек и статуса палаты:
--  «пустая», если в палате никто не лежит,
--  «свободных мест нет», если палата заполнена,
--  «мужская», если в палате лежат только мужчины,
--  «женская», если в палате лежат только женщины,
--  «смешанная» во всех остальных случаях.
--  Написать функцию, возвращающую строку «больше месяца»,
--  если со времени поступления пациента прошло более 1 месяца.
--  В качестве параметра использовать диагноз, и заменять для
--  такого пациента его лечащего врача на того, у кого меньше всего больных.

create or replace function ward_status() returns record as $$
begin
    with ward_capacity_and_fullness as (
        select
            w.number as number,
            w.capacity as capacity,
            'мужская' as status
        from ward w
                 left join diagnosis d on w.id = d.ward_id
                 left join hospitalization h on h.id = d.hospitalization_id
                 left join patient p on p.id = h.patient_id
        where h.start_at > '2021-07-07' and h.start_at < '2021-07-08' and w.type='мужская'
        group by number, capacity
        having count(d.ward_id)<w.capacity
        union all
        select
            w.number as number,
            w.capacity as capacity,
            'женская' as status
        from ward w
                 left join diagnosis d on w.id = d.ward_id
                 left join hospitalization h on h.id = d.hospitalization_id
                 left join patient p on p.id = h.patient_id
        where h.start_at > '2021-07-07' and h.start_at < '2021-07-08' and w.type='женская'
        group by number, capacity
        having count(d.ward_id)<w.capacity
        union all
        select
            w.number as number,
            w.capacity as capacity,
            'смешанная' as status
        from ward w
                 left join diagnosis d on w.id = d.ward_id
                 left join hospitalization h on h.id = d.hospitalization_id
                 left join patient p on p.id = h.patient_id
        where h.start_at > '2021-07-07' and h.start_at < '2021-07-08' and w.type='смешанная'
        group by number, capacity
        having count(d.ward_id)<w.capacity
        union all
        select
            w.number number,
            w.capacity as capacity,
            'свободных мест нет' as status
        from ward w
                 left join diagnosis d on w.id = d.ward_id
                 left join hospitalization h on h.id = d.hospitalization_id
        where h.start_at > '2021-07-07' and h.start_at < '2021-07-08'
        group by number, capacity
        having count(d.ward_id)=w.capacity
        union all
        select w.number number, capacity as capacity, 'пустая' as status from ward w
        where id not in (
            select
                w.id as id
            from diagnosis d
                     left join ward w on w.id = d.ward_id
                     left join hospitalization h on h.id = d.hospitalization_id
            where h.start_at > '2021-07-07' and h.start_at < '2021-07-08'
        )
    ) select number, capacity, status from ward_capacity_and_fullness;
end;
$$ language plpgsql;
