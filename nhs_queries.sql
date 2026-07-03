
USE nhs_data;

SELECT
    d.doctorname,
    d.specialty,
    COUNT(a.appointmentid) AS total_appointments,
    SUM(CASE WHEN a.status='Completed' THEN 1 ELSE 0 END) AS completed,
    SUM(CASE WHEN a.status='Scheduled' THEN 1 ELSE 0 END) AS scheduled
FROM Doctor d
LEFT JOIN Appointment a
ON d.doctorid = a.doctorid
GROUP BY
    d.doctorid,
    d.doctorname,
    d.specialty
ORDER BY total_appointments DESC
LIMIT 15;


USE nhs_data;

SELECT
    a.appointmentid,
    p.patientname,
    d.doctorname,
    c.clinicname,
    a.appointmentdate,
    a.appointmenttime,
    a.status
FROM Appointment a
INNER JOIN Patient p
    ON a.patientid = p.patientid
INNER JOIN Doctor d
    ON a.doctorid = d.doctorid
INNER JOIN Clinic c
    ON a.clinicid = c.clinicid
ORDER BY a.appointmentdate, a.appointmenttime;


USE nhs_data;

SELECT
    patientid,
    nhsnumber,
    patientname,
    dob,
    gender,
    patientaddress,
    phone,
    email
FROM Patient
ORDER BY patientid
LIMIT 15;

USE nhs_data;

SELECT
    a.appointmentid,
    p.patientname,
    d.doctorname,
    c.clinicname,
    a.appointmentdate,
    a.appointmenttime,
    a.status
FROM Appointment a
INNER JOIN Patient p
    ON a.patientid = p.patientid
INNER JOIN Doctor d
    ON a.doctorid = d.doctorid
INNER JOIN Clinic c
    ON a.clinicid = c.clinicid
ORDER BY a.appointmentdate, a.appointmenttime
LIMIT 15;

USE nhs_data;

SELECT
    d.doctorid AS 'Doctor ID',
    d.doctorname AS 'Doctor Name',
    d.specialty AS 'Specialty',
    COUNT(a.appointmentid) AS 'Total Appointments',
    SUM(CASE WHEN a.status = 'Completed' THEN 1 ELSE 0 END) AS 'Completed',
    SUM(CASE WHEN a.status = 'Scheduled' THEN 1 ELSE 0 END) AS 'Scheduled'
FROM Doctor d
LEFT JOIN Appointment a
    ON d.doctorid = a.doctorid
GROUP BY
    d.doctorid,
    d.doctorname,
    d.specialty
ORDER BY
    COUNT(a.appointmentid) DESC;
    
USE nhs_data;
CREATE USER IF NOT EXISTS 'nhs_admin'@'localhost'
IDENTIFIED BY 'Admin123!';
GRANT ALL PRIVILEGES
ON nhs_data.*
TO 'nhs_admin'@'localhost';


CREATE USER IF NOT EXISTS 'nhs_doctor'@'localhost'
IDENTIFIED BY 'Doctor123!';

GRANT SELECT
ON nhs_data.Patient
TO 'nhs_doctor'@'localhost';

GRANT SELECT, INSERT, UPDATE
ON nhs_data.Appointment
TO 'nhs_doctor'@'localhost';

GRANT SELECT, INSERT, UPDATE
ON nhs_data.Prescription
TO 'nhs_doctor'@'localhost';


CREATE USER IF NOT EXISTS 'nhs_receptionist'@'localhost'
IDENTIFIED BY 'Reception123!';

GRANT SELECT
ON nhs_data.Patient
TO 'nhs_receptionist'@'localhost';

GRANT SELECT
ON nhs_data.Appointment
TO 'nhs_receptionist'@'localhost';

FLUSH PRIVILEGES;


USE nhs_data;

-- Transaction 1: Successful transaction
START TRANSACTION;

INSERT INTO Appointment
(patientid, doctorid, clinicid, appointmentdate,
 appointmenttime, notes, status)
VALUES
(101, 201, 301,
 '2024-08-15',
 '09:30:00',
 'Routine health check',
 'Scheduled');

COMMIT;

-- Transaction 2: Cancelled transaction
START TRANSACTION;

INSERT INTO Appointment
(patientid, doctorid, clinicid, appointmentdate,
 appointmenttime, notes, status)
VALUES
(102, 202, 302,
 '2024-08-16',
 '11:00:00',
 'Follow-up consultation',
 'Scheduled');

ROLLBACK;

-- Verify the committed transaction
SELECT
    appointmentid,
    patientid,
    doctorid,
    clinicid,
    appointmentdate,
    appointmenttime,
    status
FROM Appointment
WHERE appointmentdate = '2024-08-15';

