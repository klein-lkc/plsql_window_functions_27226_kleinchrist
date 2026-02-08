//1. Display the list of treatments with the patient's name, the doctor's name, the diagnosis, and the cost. 
  
SELECT 
    t.date_treatment,
    p.first_name,
    ms.medecin_name,
    t.diagnostic,
    t.cost_treatment
FROM treatment t
INNER JOIN Patients p ON t.patient_id = p.patient_id
INNER JOIN medical_staff ms ON t.staff_id = ms.staff_id;

// 2.Identify registered patients who have not yet received any treatment

SELECT 
    p.patient_id,
    p.first_name,
    p.last_name,
    p.city,
    p.birthday,
    p.gender
FROM Patients p
LEFT JOIN treatment t 
    ON p.patient_id = t.patient_id
WHERE t.patient_id IS NULL;

// 3.Identify medical staff and view their associated treatments

SELECT 
    ms.staff_id,
    ms.medecin_name,
    ms.speciality,
    ms.department,
    t.treatment_id,
    t.diagnostic,
    t.date_treatment,
    t.cost_treatment
FROM treatment t
RIGHT JOIN medical_staff ms 
    ON t.staff_id = ms.staff_id;

// 4.Complete list of all patients and all treatments, even without a match.
  SELECT 
    p.patient_id,
    p.first_name,
    p.last_name,
    t.treatment_id,
    t.diagnostic,
    t.date_treatment,
    t.cost_treatment
FROM Patients p
LEFT JOIN treatment t 
    ON p.patient_id = t.patient_id

UNION

-- Traitements avec ou sans patient (au cas où)
SELECT 
    p.patient_id,
    p.first_name,
    p.last_name,
    t.treatment_id,
    t.diagnostic,
    t.date_treatment,
    t.cost_treatment
FROM Patients p
RIGHT JOIN treatment t 
    ON p.patient_id = t.patient_id;

// 5. Find pairs of patients from the same city
SELECT 
    p1.patient_id AS patient1_id,
    p1.first_name AS patient1_first_name,
    p1.last_name AS patient1_last_name,
    p2.patient_id AS patient2_id,
    p2.first_name AS patient2_first_name,
    p2.last_name AS patient2_last_name,
    p1.city
FROM Patients p1
INNER JOIN Patients p2 
    ON p1.city = p2.city
    AND p1.patient_id < p2.patient_id
ORDER BY p1.city;





