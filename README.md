-- 1. Department Table
CREATE TABLE department (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Device Table
CREATE TABLE device (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE
);

-- 3. Employee Table
CREATE TABLE employee (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
designation VARCHAR(100) NOT NULL,
joining_date DATE NOT NULL,
department_id INT NOT NULL,
FOREIGN KEY (department_id) REFERENCES department(id)
);

-- 4. DeviceAssignment Table (Join Table)
CREATE TABLE device_assignment (
id INT AUTO_INCREMENT PRIMARY KEY,
employee_id INT NOT NULL,
device_id INT NOT NULL,
assigned_on DATETIME DEFAULT CURRENT_TIMESTAMP,
UNIQUE KEY uq_employee_device (employee_id, device_id),
FOREIGN KEY (employee_id) REFERENCES employee(id),
FOREIGN KEY (device_id) REFERENCES device(id)
);
INSERT INTO department (name) VALUES
('HR'),
('Analytics'),
('Data'),
('Care'),
('Admin'),
('Finance'),
('IT');

ALTER TABLE department DROP COLUMN version;
INSERT INTO department (name) VALUES
('HR'),
('Analytics'),
('Data'),
('Care'),
('Admin'),
('Finance'),
('IT');

select * FROM department;

ALTER TABLE employee DROP COLUMN version;

INSERT INTO device (name, version) VALUES
('Laptop', 0),
('Monitor', 0),
('Headphone', 0),
('Mouse', 0);