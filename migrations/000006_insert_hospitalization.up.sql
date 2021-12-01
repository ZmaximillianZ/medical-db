insert into hospitalization (
    type,
    start_at,
    end_at,
    patient_id
)
with patient_created_at as (
    select id, created_at from patient order by random()
)
select
    (array['по направлению'::hospitalization_type, 'скорая помощь'::hospitalization_type, 'самостоятельно'::hospitalization_type, 'перевод'::hospitalization_type, 'плановая'::hospitalization_type])[floor(random() * 5 + 1)],
    created_at,
    (created_at + interval '+5 hours') + '20 days'::interval * random(),
    id
from
    patient_created_at;

update hospitalization set end_at=null where end_at > now();