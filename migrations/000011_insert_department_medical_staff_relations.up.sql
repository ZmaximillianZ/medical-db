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
    WHERE i < 10 -- (select count(*) / (select count(*) from department) from medical_staff)
)-- select id from department_rand;
update medical_staff
set department_id=department_rand.id
    from department_rand
where
    medical_staff.id%department_rand.id=0 or
    medical_staff.id%department_rand.id=5;

--update medical_staff set department_id=null where department_id is not null;
--select (select count(*) as department_1 from medical_staff where department_id=1),
--       (select count(*) as department_2 from medical_staff where department_id=2),
--       (select count(*) as department_3 from medical_staff where department_id=3),
--       (select count(*) as department_4 from medical_staff where department_id=4),
--       (select count(*) as department_5 from medical_staff where department_id=5),
--       (select count(*) as department_6 from medical_staff where department_id=6),
--       (select count(*) as department_7 from medical_staff where department_id=7),
--       (select count(*) as department_8 from medical_staff where department_id=8),
--       (select count(*) as department_9 from medical_staff where department_id=9);