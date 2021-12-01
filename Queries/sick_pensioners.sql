-- «Больные-пенсионеры» (условная выборка)
select *
from patient
where
      (dob > now() - interval '60 years' and sex = 'female') and
      (dob > now() - interval '65 years' and sex = 'male');
