insert into diagnosis (
    status,
    created_at,
    updated_at,
    hospitalization_id
)
with hospitalization_created_at as (
    select id, start_at from hospitalization order by random()
)
select
    (array['предположительный'::diagnosis_status, 'подтвержденный'::diagnosis_status, 'не подтвержденный'::diagnosis_status])[floor(random() * 3 + 1)],
    start_at,
    start_at,
    id
from
    hospitalization_created_at;

