--- «Количество больных в каждой палате» (итоговый запрос)
select
       count(h.id) as number_of_patients,
       w.capacity,
       w.id,
       w.number as ward_number,
       w.type,
       w.service,
       d2.name
from hospitalization h
left outer join diagnosis d on h.id = d.hospitalization_id
left join ward w on d.ward_id = w.id
left join department d2 on w.department_id = d2.id
where h.created_at > '2020-11-01' and
      h.end_at     < '2020-11-14'
group by w.id, w.number, w.type, w.capacity, w.service, d2.name;


-- больные в каждой палате
select
    h.start_at,
    h.end_at,
    w.capacity,
    w.id
from hospitalization h
         left outer join diagnosis d on h.id = d.hospitalization_id
         left join ward w on d.ward_id = w.id
         left join department d2 on w.department_id = d2.id
where h.created_at > '2020-11-01' and h.end_at < '2020-11-14'
order by capacity, id;