insert into hospitalization (
    type,
    start_at,
    end_at,
    created_at,
    updated_at,
    patient_id
)
with patient_created_at as (
    -- госпитализация с периодом минимум 5 часов и максимум 45 дней
    select id, created_at, (created_at + interval '+5 hours') + '45 days'::interval * random() as end_at from patient order by random()
)
select
    (array['по направлению'::hospitalization_type, 'скорая помощь'::hospitalization_type, 'самостоятельно'::hospitalization_type, 'перевод'::hospitalization_type, 'плановая'::hospitalization_type])[floor(random() * 5 + 1)],
    created_at,
    end_at,
    created_at,
    end_at,
    id
from
    patient_created_at;

update hospitalization set updated_at=created_at where end_at > now();
update hospitalization set end_at=null where end_at > now();