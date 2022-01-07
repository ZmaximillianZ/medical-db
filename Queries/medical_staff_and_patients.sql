-- «Общий список врачей с количеством больных и больных с количеством дней пребывания» (запрос на объединение)
select
       count(p.id) as patients_number,
       ms.last_name || ' ' || ms.first_name || ' ' || ms.middle_name as full_name
from medical_staff ms
left join patient p on ms.id=p.medical_staff_id
left join hospitalization h on p.id = h.patient_id
where h.start_at > '2021-01-01' and h.start_at < '2021-01-23'
group by ms.first_name, ms.last_name, ms.middle_name;
--union
select
       -- COALESCE нужен для тех пациентов которые были в госпитализированы менее одного дня
       COALESCE(DATE_PART('day', h.end_at - h.start_at), 1) AS days_hospitalization,
       p.id,
       p.last_name || ' ' || p.first_name || ' ' || p.middle_name as full_name
from patient p
left join hospitalization h on p.id=h.patient_id
group by h.end_at, h.start_at, p.first_name, p.last_name,p.middle_name, p.id;
--пациенты которые госпитализированы более одного месяца
--having DATE_PART('day', h.end_at - h.start_at) >= 30;