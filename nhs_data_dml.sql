USE nhs_data;
INSERT INTO Patient (patientid, nhsnumber, patientname, dob, gender, patientaddress, phone, email, password_hash) VALUES
(101, '4829103756', 'John Smith',      '1980-03-15', 'Male',   '123 Hill Road, London, N1 1AA',    '07800200001', 'john.smith@email.com',    SHA2('Password1!', 256)),
(102, '3971204865', 'Mary Jones',      '1975-07-22', 'Female', '456 Lake Avenue, Manchester, M2 2BB', '07800200002', 'mary.jones@email.com',    SHA2('Password2!', 256)),
(103, '5834021976', 'David Wilson',    '1990-11-08', 'Male',   '789 River Street, Birmingham, B2 2CC', '07800200003', 'david.wilson@email.com',  SHA2('Password3!', 256)),
(104, '2740398514', 'Sarah Taylor',    '1985-02-14', 'Female', '12 Oak Drive, Bristol, BS2 2DD',    '07800200004', 'sarah.taylor@email.com',  SHA2('Password4!', 256)),
(105, '6182934057', 'Michael Brown',   '1972-09-30', 'Male',   '34 Pine Lane, Leeds, LS2 2EE',     '07800200005', 'm.brown@email.com',        SHA2('Password5!', 256)),
(106, '8273019465', 'Emma Johnson',    '1995-04-17', 'Female', '56 Elm Close, Liverpool, L2 2FF',  '07800200006', 'emma.j@email.com',         SHA2('Password6!', 256)),
(107, '1047382956', 'Oliver Davis',    '1968-12-25', 'Male',   '78 Cedar Way, Sheffield, S2 2GG',  '07800200007', 'o.davis@email.com',        SHA2('Password7!', 256)),
(108, '9384756102', 'Sophie Evans',    '2000-06-11', 'Female', '90 Birch Road, Nottingham, NG2 2HH', '07800200008', 's.evans@email.com',      SHA2('Password8!', 256)),
(109, '3029174856', 'Liam Harris',     '1988-08-05', 'Male',   '11 Maple Street, Newcastle, NE2 2II', '07800200009', 'l.harris@email.com',    SHA2('Password9!', 256)),
(110, '7465920138', 'Chloe Martin',    '1993-01-28', 'Female', '22 Walnut Close, Oxford, OX2 2JJ', '07800200010', 'c.martin@email.com',      SHA2('Password10!', 256)),
(111, '5812034967', 'Harry Thompson',  '1960-10-03', 'Male',   '33 Chestnut Avenue, Cambridge, CB2 2KK', '07800200011', 'h.thompson@email.com', SHA2('Password11!', 256)),
(112, '2936487501', 'Grace White',     '2003-05-19', 'Female', '44 Ash Road, Brighton, BN2 2LL',  '07800200012', 'g.white@email.com',        SHA2('Password12!', 256));


INSERT INTO Clinic (clinicid, clinicname, clinicaddress, phone) VALUES
(1, 'Cardiology', '10 Main Street, London, EC1A 1BB', '02071234567'),
(2, 'General Practice', '22 River Road, Manchester, M1 2AB', '01612345678'),
(3, 'Orthopaedics', '5 Castle Lane, Birmingham, B1 3CD', '01213456789'),
(4, 'Neurology', '14 Oak Avenue, Bristol, BS1 4EF', '01174567890'),
(5, 'Oncology', '9 Park View, Leeds, LS1 5GH', '01135678901'),
(6, 'Paediatrics', '3 School Road, Liverpool, L1 6IJ', '01516789012'),
(7, 'Dermatology', '27 Beach Street, Brighton, BN1 7KL', '01237890123'),
(8, 'Psychiatry', '8 High Street, Sheffield, S1 8MN', '01148901234'),
(9, 'Endocrinology', '16 Market Square, Nottingham, NG1 9OP', '01159012345'),
(10, 'Rheumatology', '11 Crown Road, Newcastle, NE1 0QR', '01910123456'),
(11, 'Ophthalmology', '4 Church Lane, Oxford, OX1 1ST', '01861234567'),
(12, 'Gastroenterology', '33 Mill Road, Cambridge, CB1 2UV', '01232345678');

INSERT INTO Doctor (doctorid, doctorname, specialty, clinicid, email, phone) VALUES
(1001, 'Dr. Sarah Adams', 'Cardiology', 1, 's.adams@nhs.uk', '07700100001'),
(1002, 'Dr. James Brown', 'General Practice', 2, 'j.brown@nhs.uk', '07700100002'),
(1003, 'Dr. Emily Clarke', 'Orthopaedics', 3, 'e.clarke@nhs.uk', '07700100003'),
(1004, 'Dr. Michael Davis', 'Neurology', 4, 'm.davis@nhs.uk', '07700100004'),
(1005, 'Dr. Rachel Evans', 'Oncology', 5, 'r.evans@nhs.uk', '07700100005'),
(1006, 'Dr. Thomas Foster', 'Paediatrics', 6, 't.foster@nhs.uk', '07700100006'),
(1007, 'Dr. Linda Green', 'Dermatology', 7, 'l.green@nhs.uk', '07700100007'),
(1008, 'Dr. David Harris', 'Psychiatry', 8, 'd.harris@nhs.uk', '07700100008'),
(1009, 'Dr. Susan Ingram', 'Endocrinology', 9, 's.ingram@nhs.uk', '07700100009'),
(1010, 'Dr. Peter Jones', 'Rheumatology', 10, 'p.jones@nhs.uk', '07700100010'),
(1011, 'Dr. Karen King', 'Ophthalmology', 11, 'k.king@nhs.uk', '07700100011'),
(1012, 'Dr. Robert Lewis', 'Gastroenterology', 12, 'r.lewis@nhs.uk', '07700100012');


INSERT INTO Medication (medicationid, medname, description, unit) VALUES
(201, 'Aspirin',          'Antiplatelet / analgesic',                  '75mg'),
(202, 'Beta Blocker',     'Atenolol – manages heart rate and BP',      '50mg'),
(203, 'Paracetamol',      'Analgesic and antipyretic',                 '500mg'),
(204, 'Metformin',        'First-line treatment for type 2 diabetes',  '500mg'),
(205, 'Lisinopril',       'ACE inhibitor for hypertension',            '10mg'),
(206, 'Amoxicillin',      'Broad-spectrum antibiotic (penicillin)',     '500mg'),
(207, 'Salbutamol',       'Bronchodilator for asthma',                 'inhaler'),
(208, 'Sertraline',       'SSRI antidepressant',                       '50mg'),
(209, 'Omeprazole',       'Proton pump inhibitor for acid reflux',     '20mg'),
(210, 'Prednisolone',     'Corticosteroid for inflammation',           '5mg'),
(211, 'Warfarin',         'Anticoagulant – prevents blood clots',      '5mg'),
(212, 'Simvastatin',      'Statin – lowers LDL cholesterol',           '40mg');

INSERT INTO Appointment (appointmentid, patientid, doctorid, clinicid, appointmentdate, appointmenttime, notes, status) VALUES
(21, 101, 1001, 1, '2024-05-01', '10:00:00', 'Follow-up in 2 weeks',          'Completed'),
(22, 102, 1002, 2, '2024-05-03', '09:00:00', 'First visit – general check-up', 'Completed'),
(23, 101, 1001, 1, '2024-05-10', '11:30:00', 'Blood pressure check',           'Completed'),
(24, 103, 1003, 3, '2024-05-12', '14:00:00', 'Knee pain evaluation',           'Completed'),
(25, 104, 1004, 4, '2024-05-15', '09:30:00', 'Migraine assessment',            'Completed'),
(26, 105, 1005, 5, '2024-05-18', '13:00:00', 'Routine oncology review',        'Completed'),
(27, 106, 1006, 6, '2024-05-20', '10:00:00', 'Child vaccinations',             'Completed'),
(28, 107, 1007, 7, '2024-06-01', '11:00:00', 'Skin rash examination',          'Scheduled'),
(29, 108, 1008, 8, '2024-06-05', '14:30:00', 'Anxiety review',                 'Scheduled'),
(30, 108, 1009, 9, '2024-06-10', '09:00:00', 'Thyroid function follow-up',     'Scheduled'),
(31, 110, 1010, 10, '2024-06-12', '10:00:00', 'Joint pain assessment',       'Scheduled'),
(32, 111, 1011, 11, '2024-06-15', '15:00:00', 'Glaucoma screening',          'Cancelled'),
(33, 112, 1012, 12, '2024-06-18', '11:30:00', 'IBS management review',       'Scheduled');


INSERT INTO Prescription (prescriptionid, apptid, medid, dosage, frequency) VALUES
(41, 21,  201,  '75mg',   'Once daily'),       -- John: Aspirin
(42, 21,  202,  '50mg',   'Twice daily'),      -- John: Beta Blocker
(43, 22,  203,  '500mg',  'As required'),      -- Mary: Paracetamol
(44, 23,  201,  '75mg',   'Once daily'),       -- John follow-up: Aspirin
(45, 23,  211, '5mg',    'Once daily'),       -- John follow-up: Warfarin
(46, 24,  210, '5mg',    'Once daily'),       -- David: Prednisolone
(47, 25,  208,  '50mg',   'Once daily'),       -- Sarah: Sertraline
(48, 26,  205,  '10mg',   'Once daily'),       -- Michael: Lisinopril
(49, 26,  212, '40mg',   'Once daily'),       -- Michael: Simvastatin
(50, 27,  206,  '500mg',  'Three times daily'), -- Emma: Amoxicillin
(51, 28,  207,  '1 puff', 'As required'),      -- Oliver: Salbutamol
(52, 29,  208,  '50mg',   'Once daily'),       -- Sophie: Sertraline
(53, 30, 204,  '500mg',  'Twice daily'),      -- Liam: Metformin
(54, 31, 209,  '20mg',   'Once daily');       -- Chloe: Omeprazole

-- Update appointment status when completed
UPDATE Appointment
SET status = 'Completed', notes = CONCAT(notes, ' – reviewed and closed')
WHERE appointmentid = 27;

-- Cancel an appointment
UPDATE Appointment
SET status = 'Cancelled'
WHERE appointmentid = 32;

-- Delete a duplicate prescription entry (demonstration)
-- First insert a duplicate to demonstrate DELETE
INSERT INTO Prescription (apptid, medid, dosage, frequency)
VALUES (22, 203, '500mg', 'As required')
ON DUPLICATE KEY UPDATE dosage = dosage;  -- no-op if already exists

INSERT INTO AppointmentAudit
(appointmentid, patientid, doctorid, action, action_time, performed_by)
VALUES
(21, 101, 1001, 'Created', '2024-05-01 09:45:00', 'reception1'),
(22, 102, 1002, 'Created', '2024-05-03 08:45:00', 'reception1'),
(23, 101, 1001, 'Created', '2024-05-10 11:15:00', 'reception1'),
(24, 103, 1003, 'Created', '2024-05-12 13:45:00', 'reception1'),
(25, 104, 1004, 'Created', '2024-05-15 09:15:00', 'reception1'),
(26, 105, 1005, 'Created', '2024-05-18 12:45:00', 'reception1'),
(27, 106, 1006, 'Created', '2024-05-20 09:45:00', 'reception1'),
(28, 107, 1007, 'Created', '2024-06-01 10:45:00', 'reception1'),
(29, 108, 1008, 'Created', '2024-06-05 14:15:00', 'reception1'),
(30, 108, 1009, 'Created', '2024-06-10 08:45:00', 'reception1'),
(31, 110, 1010, 'Created', '2024-06-12 09:45:00', 'reception1'),
(32, 111, 1011, 'Created', '2024-06-15 14:45:00', 'reception1'),
(33, 112, 1012, 'Created', '2024-06-18 11:15:00', 'reception1'),

(21, 101, 1001, 'Completed', '2024-05-01 10:30:00', 'Dr. Sarah Adams'),
(22, 102, 1002, 'Completed', '2024-05-03 09:30:00', 'Dr. James Brown'),
(23, 101, 1001, 'Completed', '2024-05-10 12:00:00', 'Dr. Sarah Adams'),
(24, 103, 1003, 'Completed', '2024-05-12 14:45:00', 'Dr. Emily Clarke'),
(25, 104, 1004, 'Completed', '2024-05-15 10:15:00', 'Dr. Michael Davis'),
(26, 105, 1005, 'Completed', '2024-05-18 13:45:00', 'Dr. Rachel Evans'),
(27, 106, 1006, 'Completed', '2024-05-20 10:45:00', 'Dr. Thomas Foster'),

(32, 111, 1011, 'Cancelled', '2024-06-14 16:00:00', 'reception1');
SELECT * FROM appointmentaudit;