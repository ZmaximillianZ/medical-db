insert into diagnosis (
    status,
    created_at,
    updated_at,
    hospitalization_id
)
with hospitalization_created_at as (
    select h.id, start_at
    from hospitalization h
    left join patient p on h.patient_id = p.id
    left join medical_staff ms on ms.id = p.medical_staff_id
    left join department d on d.id = ms.department_id
    -- сортируем по дате госпитализации для правильной проверки заполненности палаты на дату добавления диагноза
    order by start_at
)
select
    (array['предположительный'::diagnosis_status, 'подтвержденный'::diagnosis_status, 'не подтвержденный'::diagnosis_status])[floor(random() * 3 + 1)],
    start_at,
    start_at,
    id
from
    hospitalization_created_at;

