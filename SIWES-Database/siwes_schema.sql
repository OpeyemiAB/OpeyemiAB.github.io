-- SIWES Document Tracking System Schema
-- Designed for LASUED SIWES Unit
-- Created by Opeyemi Benjamin

CREATE DATABASE IF NOT EXISTS lasued_siwes_db;
USE lasued_siwes_db;

-- Table for Students
CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    matric_no VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    placement_company VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Supervisors
CREATE TABLE IF NOT EXISTS supervisors (
    supervisor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    staff_no VARCHAR(20) UNIQUE NOT NULL,
    department VARCHAR(100) NOT NULL,
    is_internal BOOLEAN DEFAULT TRUE -- TRUE for LASUED staff, FALSE for Industry staff
);

-- Table for Student-Supervisor Assignment
CREATE TABLE IF NOT EXISTS student_supervisor (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    supervisor_id INT NOT NULL,
    assignment_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (supervisor_id) REFERENCES supervisors(supervisor_id) ON DELETE CASCADE
);

-- Table for Document Tracking (Logbooks, Acceptance Letters, etc.)
CREATE TABLE IF NOT EXISTS document_tracking (
    tracking_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    document_type ENUM('Logbook', 'Acceptance Letter', 'Sc-05 Form', 'Evaluation Form') NOT NULL,
    submission_date DATE NOT NULL,
    status ENUM('Pending Review', 'Approved', 'Rejected', 'Missing') DEFAULT 'Pending Review',
    remarks TEXT,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);

-- Sample Data for Verification
INSERT INTO students (matric_no, first_name, last_name, department, placement_company)
VALUES ('2023/CS/001', 'Opeyemi', 'Benjamin', 'Computer Science', 'Sympho Engineering Limited');

INSERT INTO supervisors (name, staff_no, department)
VALUES ('Dr. Adekunle', 'LASUED/042', 'Computer Science');
