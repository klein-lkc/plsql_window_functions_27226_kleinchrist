INSERT INTO treatment 
(treatment_id, patient_id, staff_id, diagnostic, date_treatment, cost_treatment) 
VALUES
(12, 366, 756, 'malaria', '2025-01-05', 150000),
(24, 593, 567, 'Typhoid fever', '2025-01-07', 200000),
(85, 135, 356, 'Follow Up consultation', '2025-01-15', 50000),
(54, 60, 196, 'COVID-19', '2025-01-22', 250000);

INSERT INTO Patients (patient_id, first_name, last_name, birthday, city, gender)
VALUES
    (11234, 'Obiang', 'Marie', '1985-03-15', 'Libreville', 'F'),
    (1789, 'Moussavou', 'Jean', '1990-07-22', 'Franceville', 'M'),
    (76876, 'Ndong', 'Claire', '1978-11-05', 'Port-Gentil', 'F'),
    (9474, 'Eba', 'Patrick', '1995-01-30', 'Oyem', 'M');

INSERT INTO medical_staff (staff_id, medecin_name, speciality, department) VALUES
    (2957, 'Dr. christ', 'general medicine', 'consultation'),
    (17465, 'Dr. Dorcas', 'Virology', 'Infectious diseases'),
    (18347, 'Dr. Albert', 'pediatrics', 'general services'),
    (27226, 'Dr. klein', 'parasitology', 'tropical research');
