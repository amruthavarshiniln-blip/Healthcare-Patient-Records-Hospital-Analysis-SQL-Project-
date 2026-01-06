CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0),
    gender VARCHAR(10),
    city VARCHAR(50)
);
GO
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50) NOT NULL
);
GO
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    disease VARCHAR(100),

    CONSTRAINT fk_patient
        FOREIGN KEY (patient_id) REFERENCES patients(patient_id),

    CONSTRAINT fk_doctor
        FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
GO
CREATE TABLE billing (
    bill_id INT PRIMARY KEY,
    appointment_id INT NOT NULL,
    amount DECIMAL(10,2) CHECK (amount >= 0),
    payment_status VARCHAR(20) CHECK (payment_status IN ('Paid','Pending')),

    CONSTRAINT fk_appointment
        FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);
GO
INSERT INTO patients VALUES
(1, 'Ravi Kumar', 45, 'Male', 'Bangalore'),
(2, 'Anita Sharma', 30, 'Female', 'Mumbai'),
(3, 'John Paul', 60, 'Male', 'Chennai');
GO
INSERT INTO doctors VALUES
(101, 'Dr. Meena', 'Cardiology'),
(102, 'Dr. Raj', 'Orthopedics'),
(103, 'Dr. Smith', 'General Medicine');
GO
INSERT INTO appointments VALUES
(1001, 1, 101, '2025-01-05', 'Heart Pain'),
(1002, 2, 103, '2025-01-06', 'Fever'),
(1003, 3, 102, '2025-01-07', 'Knee Pain');
GO
INSERT INTO billing VALUES
(501, 1001, 5000.00, 'Paid'),
(502, 1002, 1500.00, 'Paid'),
(503, 1003, 3000.00, 'Pending');
GO
SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM appointments;
SELECT * FROM billing;
