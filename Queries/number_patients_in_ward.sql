--- «Количество больных в каждой палате» (итоговый запрос)
select w.number as ward_number, count(p.id) as number_of_patients from ward w
left join diagnosis d on w.diagnosis_id=d.id
left join hospitalization h on d.hospitalization_id=h.id
left join patient p on h.patient_id=p.id
group by w.name;