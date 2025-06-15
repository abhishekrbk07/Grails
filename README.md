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

CREATE TABLE users (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(64) NOT NULL UNIQUE,
password VARCHAR(255) NOT NULL,
role ENUM('ADMIN', 'EMPLOYEE') NOT NULL,
enabled BOOLEAN DEFAULT TRUE,
date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Users log in (via username/password, secured with JWT).

Admins can add/edit/delete employees, assign them to a department, and give them devices (Laptop, Monitor, etc.).

Each employee can have multiple devices.

Everyone (depending on permissions) can view employees and their details.

There’s search, export, and a department pie chart.


Entities and Relationships:
1. DEPARTMENT
   id (PK), name

Relationship:

One department has many employees (1-to-many).

2. EMPLOYEE
   id (PK), name, designation, joiningDate, department_id (FK)

Relationships:

Belongs to one department (department_id is FK to DEPARTMENT)

Many-to-many with DEVICE via DEVICEASSIGNMENT table.

3. DEVICE
   id (PK), name

Relationship:

One device can be assigned to many employees (via DEVICEASSIGNMENT).

4. DEVICEASSIGNMENT
   id (PK), employee_id (FK), device_id (FK)

Purpose:

This is a link (join) table to support the many-to-many relationship between EMPLOYEE and DEVICE.

Each row means "This employee has this device".

5. USER
   id (PK), username, password, role, enabled, dateCreated, lastUpdated

Relationship:

No direct relationships to the other tables, as this is only for login/authentication/roles.


Application Features (Short Version)
User login and registration (Admin & Employee)

Employee CRUD (add, edit, delete, view)

Assign multiple devices to employees

Department management and filtering

Pie chart for employee distribution by department

Export employee data to Excel

Secure password storage (hashed)


Data Flow & Working
User Login/Register

User enters credentials (registers or logs in).

Credentials are sent to the backend, validated, and securely stored/checked.

Dashboard Loaded

After login, the system fetches all employees (with their departments and assigned devices).

Data is loaded from the database and passed to the GSP (view).

Display Employees

On the dashboard, employee cards show info from the Employee, Department, and Device tables.

DeviceAssignment is used to link employees to their devices.

Add/Edit Employee

Admin fills the form (name, designation, department, devices).

On submit, data is validated, and new Employee (with device assignments) is saved in the database.

Assign Devices

DeviceAssignment table stores the link between employees and their devices (many-to-many).

Search & Filter

User can filter employees by name or department.

Search input is sent to the backend, which queries the Employee table with filters, then reloads the view with results.

Pie Chart

Department-wise employee counts are calculated and sent to the frontend.

Chart library displays this visually.

Export to Excel

When exporting, employee data is read from the database and written row-wise to an Excel file.

User downloads the file.

https://www.highcharts.com/demo/highcharts/pie-basic
