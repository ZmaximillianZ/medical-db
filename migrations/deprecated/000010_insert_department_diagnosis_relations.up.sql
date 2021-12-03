WITH RECURSIVE department_rand AS (
    (
        SELECT
            1 as i,
            id
        FROM department
        ORDER BY random()
    )
    UNION
    SELECT
            i+1,
            id
    FROM department_rand
    WHERE i < 100 -- (select count(*) / (select count(*) from department) from diagnosis)
)-- select id from department_rand;
update diagnosis
set department_id=department_rand.id
    from department_rand
where
    diagnosis.id%department_rand.id=0 or
    diagnosis.id%department_rand.id=5;

--update diagnosis set department_id=null where department_id is not null;
--select (select count(*) as department_1 from diagnosis where department_id=1),
--       (select count(*) as department_2 from diagnosis where department_id=2),
--       (select count(*) as department_3 from diagnosis where department_id=3),
--       (select count(*) as department_4 from diagnosis where department_id=4),
--       (select count(*) as department_5 from diagnosis where department_id=5),
--       (select count(*) as department_6 from diagnosis where department_id=6),
--       (select count(*) as department_7 from diagnosis where department_id=7),
--       (select count(*) as department_8 from diagnosis where department_id=8),
--       (select count(*) as department_9 from diagnosis where department_id=9);