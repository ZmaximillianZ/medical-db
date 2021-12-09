-- «Количество заболевших по годам» (запрос по полю с типом дата).
select
       extract(year from created_at) as year,
       count(id) as sick_number
from patient
group by year
order by year;
