-- «Общий список врачей с количеством больных и больных с количеством дней пребывания» (запрос на объединение)
-- todo: добавить условие фильтрации пациентов которых госпитализировали более одного раза
select
       count(p.id) as join_number,
       ms.first_name as first_name,
       ms.last_name as last_name,
       ms.middle_name as middle_name
from medical_staff ms
left join patient p on ms.id=p.medical_staff_id
union
select
       DATE_PART('day', AGE(DATE(h.start_at), DATE(h.start_at))) AS join_number,
       p.first_name as first_name,
       p.last_name as last_name,
       p.middle_name as middle_name
from patient p
left join hospitalization h on p.id=h.patient_id;