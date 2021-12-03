--- «Количество больных в каждой палате» (итоговый запрос)
select
       count(p.id) as number_of_patients,
       w.capacity,
       w.number as ward_number,
       w.type,
       w.service,
       d2.name
from patient p
left join hospitalization h on p.id = h.patient_id
left outer join diagnosis d on h.id = d.hospitalization_id
left join ward w on d.ward_id = w.id
left join department d2 on w.department_id = d2.id
where h.end_at is null
group by w.number, w.type, w.capacity, w.service, d2.name;