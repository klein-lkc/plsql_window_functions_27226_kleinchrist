CREATE TABLE treatment (
  treatment_id int NOT NULL,
  patient_id int DEFAULT NULL,
  staff_id int DEFAULT NULL,
  diagnostic varchar(100) DEFAULT NULL,
  date_treatment date DEFAULT NULL,
  cost_treatment decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (treatment_id),
  KEY patient_id (patient_id),
  KEY staff_id (staff_id),
  CONSTRAINT treatment_ibfk_1 
      FOREIGN KEY (patient_id) 
      REFERENCES patients (patient_id),
  CONSTRAINT treatment_ibfk_2 
      FOREIGN KEY (staff_id) 
      REFERENCES medical_staff (staff_id)
);

CREATE TABLE medical_staff (
  staff_id int NOT NULL,
  medecin_name varchar(100) NOT NULL,
  speciality varchar(100) DEFAULT NULL,
  department varchar(100) DEFAULT NULL,
  PRIMARY KEY (staff_id)
);

CREATE TABLE patients (
  patient_id int NOT NULL,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  birthday date DEFAULT NULL,
  city varchar(100) DEFAULT NULL,
  gender varchar(10) DEFAULT NULL,
  PRIMARY KEY (patient_id)
);
