alter table patient
	add medical_staff_id int;

alter table patient
	add constraint patient_medical_staff_id_fk
		foreign key (medical_staff_id) references medical_staff;