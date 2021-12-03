insert into diagnosis (
    status,
    created_at,
    updated_at,
    hospitalization_id,
    ward_id
)
with hospitalization_created_at as (
    select h.id, start_at, w.id as ward_id
    from hospitalization h
             left join patient p on h.patient_id = p.id
             left join medical_staff ms on ms.id = p.medical_staff_id
             left join department d on d.id = ms.department_id
             left join ward w on d.id = w.department_id
    order by random()
)
select
    (array['предположительный'::diagnosis_status, 'подтвержденный'::diagnosis_status, 'не подтвержденный'::diagnosis_status])[floor(random() * 3 + 1)],
    start_at,
    start_at,
    id,
    ward_id -- заполнение с учетом вместимости палаты!
from
    hospitalization_created_at;

