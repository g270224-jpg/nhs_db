

USE nhs_data;


CREATE ROLE 'administrator';
CREATE ROLE 'doctor';
CREATE ROLE 'receptionist';
CREATE ROLE 'patient';


CREATE VIEW PatientAppointmentView AS
SELECT
    a.appointmentid,
    p.patientid,
    p.patientname,
    d.doctorname,
    c.clinicname,
    a.appointmentdate,
    a.appointmenttime,
    a.status
FROM Appointment a
JOIN Patient p
    ON a.patientid = p.patientid
JOIN Doctor d
    ON a.doctorid = d.doctorid
JOIN Clinic c
    ON a.clinicid = c.clinicid;

CREATE VIEW PatientPrescriptionView AS
SELECT
    pr.prescriptionid,
    p.patientid,
    p.patientname,
    m.medname,
    pr.dosage,
    pr.frequency,
    a.appointmentdate
FROM Prescription pr
JOIN Appointment a
    ON pr.apptid = a.appointmentid
JOIN Patient p
    ON a.patientid = p.patientid
JOIN Medication m
    ON pr.medid = m.medicationid;



GRANT ALL PRIVILEGES
ON nhs_data.*
TO 'administrator';



GRANT SELECT
ON nhs_data.Patient
TO 'doctor';

GRANT SELECT
ON nhs_data.Doctor
TO 'doctor';

GRANT SELECT
ON nhs_data.Clinic
TO 'doctor';

GRANT SELECT, UPDATE
ON nhs_data.Appointment
TO 'doctor';

GRANT SELECT
ON nhs_data.Medication
TO 'doctor';

GRANT SELECT, INSERT, UPDATE
ON nhs_data.Prescription
TO 'doctor';

GRANT SELECT
ON nhs_data.AppointmentAudit
TO 'doctor';


GRANT SELECT
ON nhs_data.Patient
TO 'receptionist';

GRANT SELECT
ON nhs_data.Doctor
TO 'receptionist';

GRANT SELECT
ON nhs_data.Clinic
TO 'receptionist';

GRANT SELECT, INSERT, UPDATE
ON nhs_data.Appointment
TO 'receptionist';

GRANT INSERT
ON nhs_data.AppointmentAudit
TO 'receptionist';


GRANT SELECT
ON nhs_data.PatientAppointmentView
TO 'patient';

GRANT SELECT
ON nhs_data.PatientPrescriptionView
TO 'patient';


CREATE USER 'dbadmin'@'localhost'
IDENTIFIED BY 'Admin@123';

CREATE USER 'dr_sadams'@'localhost'
IDENTIFIED BY 'Doctor@123';

CREATE USER 'reception1'@'localhost'
IDENTIFIED BY 'Reception@123';

CREATE USER 'johnsmith'@'localhost'
IDENTIFIED BY 'Patient@123';


GRANT 'administrator'
TO 'dbadmin'@'localhost';

GRANT 'doctor'
TO 'dr_sadams'@'localhost';

GRANT 'receptionist'
TO 'reception1'@'localhost';

GRANT 'patient'
TO 'johnsmith'@'localhost';



SET DEFAULT ROLE 'administrator'
TO 'dbadmin'@'localhost';

SET DEFAULT ROLE 'doctor'
TO 'dr_sadams'@'localhost';

SET DEFAULT ROLE 'receptionist'
TO 'reception1'@'localhost';

SET DEFAULT ROLE 'patient'
TO 'johnsmith'@'localhost';

FLUSH PRIVILEGES;



SHOW GRANTS FOR 'dbadmin'@'localhost';

SHOW GRANTS FOR 'dr_sadams'@'localhost';

SHOW GRANTS FOR 'reception1'@'localhost';

SHOW GRANTS FOR 'johnsmith'@'localhost';

-- ============================================================
-- TASK D2 - PASSWORD HASHING
-- Passwords are stored using SHA2 hashing
-- ============================================================

SELECT
    patientid,
    patientname,
    email,
    password_hash
FROM Patient;



SELECT
    patientid,
    patientname,
    email
FROM Patient
WHERE email = 'john.smith@email.com'
AND password_hash = SHA2('Password1!', 256);



PREPARE PatientLogin
FROM
'SELECT patientid,
        patientname,
        email
 FROM Patient
 WHERE email = ?
 AND password_hash = SHA2(?,256)';

SET @user_email = 'john.smith@email.com';
SET @user_password = 'Password1!';

EXECUTE PatientLogin
USING @user_email, @user_password;

DEALLOCATE PREPARE PatientLogin;


