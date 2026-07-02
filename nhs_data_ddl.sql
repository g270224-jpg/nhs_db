

USE nhs_data;

SET FOREIGN_KEY_CHECKS = 0;

-- Drop tables in reverse order (to avoid FK conflicts)
DROP TABLE IF EXISTS `AppointmentAudit`;
DROP TABLE IF EXISTS `Prescription`;
DROP TABLE IF EXISTS `Appointment`;
DROP TABLE IF EXISTS `Doctor`;
DROP TABLE IF EXISTS `Medication`;
DROP TABLE IF EXISTS `Patient`;
DROP TABLE IF EXISTS `Clinic`;


CREATE TABLE `Clinic`(
    `clinicid` MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `clinicname` VARCHAR(100) NOT NULL,
    `clinicaddress` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(15) NULL
);

CREATE TABLE `Patient`(
    `patientid` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nhsnumber` VARCHAR(10) NOT NULL,
    `patientname` VARCHAR(100) NOT NULL,
    `dob` DATE NOT NULL,
    `gender` ENUM('Male', 'Female', 'Other') NOT NULL,
    `patientaddress` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(15) NULL,
    `email` VARCHAR(100) NULL,
    `password_hash` VARCHAR(255) NULL
);

ALTER TABLE `Patient` ADD UNIQUE `patient_nhsnumber_unique`(`nhsnumber`);

CREATE TABLE `Medication`(
    `medicationid` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `medname` VARCHAR(100) NOT NULL,
    `description` TEXT NULL,
    `unit` VARCHAR(20) NULL DEFAULT 'mg'
);


CREATE TABLE `Doctor`(
    `doctorid` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `doctorname` VARCHAR(100) NOT NULL,
    `specialty` VARCHAR(100) NOT NULL,
    `clinicid` MEDIUMINT NOT NULL,
    `email` VARCHAR(100) NULL,
    `phone` VARCHAR(15) NULL
);

CREATE TABLE `Appointment`(
    `appointmentid` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `patientid` BIGINT NOT NULL,
    `doctorid` BIGINT NOT NULL,
    `clinicid` MEDIUMINT NOT NULL,
    `appointmentdate` DATE NOT NULL,
    `appointmenttime` TIME NOT NULL,
    `notes` TEXT NULL,
    `status` ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL DEFAULT 'Scheduled'
);

CREATE TABLE `Prescription`(
    `prescriptionid` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `apptid` BIGINT NOT NULL,
    `medid` BIGINT NOT NULL,
    `dosage` VARCHAR(50) NOT NULL,
    `frequency` VARCHAR(50) NULL DEFAULT 'Once daily'
);

ALTER TABLE `Prescription` ADD UNIQUE `prescription_apptid_medid_unique`(`apptid`, `medid`);

CREATE TABLE `AppointmentAudit`(
    `auditid` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `appointmentid` BIGINT NULL,
    `patientid` BIGINT NULL,
    `doctorid` BIGINT NULL,
    `action` VARCHAR(20) NOT NULL,
    `action_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `performed_by` VARCHAR(100) NULL DEFAULT (USER())
);




ALTER TABLE `Doctor`
    ADD CONSTRAINT `doctor_clinicid_foreign`
    FOREIGN KEY(`clinicid`) REFERENCES `Clinic`(`clinicid`);

ALTER TABLE `Appointment`
    ADD CONSTRAINT `appointment_patientid_foreign`
    FOREIGN KEY(`patientid`) REFERENCES `Patient`(`patientid`);

ALTER TABLE `Appointment`
    ADD CONSTRAINT `appointment_doctorid_foreign`
    FOREIGN KEY(`doctorid`) REFERENCES `Doctor`(`doctorid`);

ALTER TABLE `Appointment`
    ADD CONSTRAINT `appointment_clinicid_foreign`
    FOREIGN KEY(`clinicid`) REFERENCES `Clinic`(`clinicid`);

ALTER TABLE `Prescription`
    ADD CONSTRAINT `prescription_apptid_foreign`
    FOREIGN KEY(`apptid`) REFERENCES `Appointment`(`appointmentid`);

ALTER TABLE `Prescription`
    ADD CONSTRAINT `prescription_medid_foreign`
    FOREIGN KEY(`medid`) REFERENCES `Medication`(`medicationid`);

SET FOREIGN_KEY_CHECKS = 1;
