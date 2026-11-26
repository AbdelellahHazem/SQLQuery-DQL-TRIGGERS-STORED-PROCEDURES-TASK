

USE MY_COMPANY;
GO

-- Setup: add the Salary column
ALTER TABLE dbo.Employees
ADD Salary DECIMAL(10,2) NULL;
GO

-- Setup: insert sample data (use IDs that don't already exist)
INSERT INTO dbo.Employees (ID, Name, DeptName, ProjectID, Salary) VALUES
    (101, 'Ahmed',   'IT',        1, 55000),
    (102, 'Sara',    'HR',        2, 42000),
    (103, 'Omar',    'Finance',   3, 61000),
    (104, 'Mona',    'IT',        1, 48000),
    (105, 'Khaled',  'Marketing', 4, 39000),
    (106, 'Laila',   'HR',        2, 52000),
    (107, 'Youssef', 'Finance',   3, 75000),
    (108, 'Nour',    'IT',        5, 60000),
    (109, 'Hassan',  'Marketing', 4, 45000),
    (110, 'Dina',    'IT',        1, 58000),
    (111, 'Tarek',   'Finance',   3, 40000),
    (112, 'Salma',   'HR',        2, 67000);
GO


-- 1. Select all columns from the "Employees" table.
SELECT *
FROM dbo.Employees;


-- 2. Select only the "Name" and "Salary" columns from the "Employees" table.
SELECT Name, Salary
FROM dbo.Employees;


-- 3. Select distinct values of the "DeptName" column from the "Employees" table.
SELECT DISTINCT DeptName
FROM dbo.Employees;


-- 4. Select the top 5 records from the "Employees" table.
SELECT TOP 5 *
FROM dbo.Employees;


-- 5. Select all records from the "Employees" table, ordered by the "Salary" column in descending order.
SELECT *
FROM dbo.Employees
ORDER BY Salary DESC;


-- 6. Select the first 10 records from the "Employees" table, starting from the third record.
SELECT *
FROM dbo.Employees
ORDER BY ID
OFFSET 2 ROWS FETCH NEXT 10 ROWS ONLY;


-- 7. Select the average salary from the "Employees" table.
SELECT AVG(Salary) AS AverageSalary
FROM dbo.Employees;


-- 8. Select the maximum and minimum salaries from the "Employees" table.
SELECT MAX(Salary) AS MaxSalary,
       MIN(Salary) AS MinSalary
FROM dbo.Employees;


-- 9. Select the top 3 highest salaries from the "Employees" table.
SELECT TOP 3 Salary
FROM dbo.Employees
ORDER BY Salary DESC;


-- 10. Select all records from the "Employees" table, ordered by "Name" in ascending order.
SELECT *
FROM dbo.Employees
ORDER BY Name ASC;


-- 11. Select the first 5 records from the "Employees" table, starting from the second record,
--     ordered by "Salary" in descending order.
SELECT *
FROM dbo.Employees
ORDER BY Salary DESC
OFFSET 1 ROWS FETCH NEXT 5 ROWS ONLY;


-- 12. Select the sum of all salaries from the "Employees" table.
SELECT SUM(Salary) AS TotalSalaries
FROM dbo.Employees;


-- 13. Select records from the "Employees" table where the "Salary" is between 40000 and 60000,
--     ordered by "Salary" in ascending order.
SELECT *
FROM dbo.Employees
WHERE Salary BETWEEN 40000 AND 60000
ORDER BY Salary ASC;
GO


/* ========================================================================
   TASK 2 - DATABASE SETUP (CompanyDB)
   ======================================================================== */

-- 1. Create a new database named "CompanyDB."
CREATE DATABASE CompanyDB;
GO

USE CompanyDB;
GO


-- 2. Create a schema named "Sales" within the "CompanyDB" database.
CREATE SCHEMA Sales;
GO


-- 3. Create a table named "employees" with columns: employee_id (INT) using a sequence
--    instead of identity, first_name (VARCHAR), last_name (VARCHAR), salary (DECIMAL),
--    within the "Sales" schema.

-- Create the sequence first
CREATE SEQUENCE Sales.seq_employee_id
    AS INT
    START WITH 1
    INCREMENT BY 1;
GO

-- Create the table, using the sequence as the default for employee_id
CREATE TABLE Sales.employees (
    employee_id INT NOT NULL
        CONSTRAINT DF_employees_id DEFAULT (NEXT VALUE FOR Sales.seq_employee_id),
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    salary      DECIMAL(10,2),
    CONSTRAINT PK_employees PRIMARY KEY (employee_id)
);
GO


-- 4. Alter the "employees" table to add a new column named "hire_date" with the data type DATE.
ALTER TABLE Sales.employees
ADD hire_date DATE;
GO


-- 5. Add mock data to this table using Mockaroo.
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Ahmed',   'Hassan',  8500.50,  '2021-03-15');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Sara',    'Mostafa', 12000.00, '2020-07-01');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Omar',    'Ali',     6700.75,  '2022-11-20');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Mona',    'Ibrahim', 9300.00,  '2019-05-10');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Khaled',  'Nasser',  15000.00, '2018-01-25');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Laila',   'Fathy',   7800.25,  '2021-09-12');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Youssef', 'Adel',    18500.00, '2017-04-03');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Nour',    'Samir',   10200.00, '2020-02-18');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Hassan',  'Gamal',   5600.00,  '2023-01-09');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Dina',    'Salah',   11400.50, '2019-11-30');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Tarek',   'Farouk',  6400.00,  '2022-06-21');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Salma',   'Zaki',    13250.75, '2018-08-14');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Mahmoud', 'Reda',    9900.00,  '2021-12-05');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Heba',    'Kamal',   8700.00,  '2020-10-27');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Amr',     'Shawky',  14300.00, '2016-03-19');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Rania',   'Helmy',   7200.50,  '2022-04-08');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Mostafa', 'Tawfik',  16800.00, '2017-09-22');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Yasmin',  'Badr',    5900.00,  '2023-03-14');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Ibrahim', 'Sabry',   10850.25, '2019-07-02');
INSERT INTO Sales.employees (first_name, last_name, salary, hire_date) VALUES ('Fatma',   'Ragab',   12600.00, '2020-12-16');
GO


/* ========================================================================
   TASK 3 - DATA MANIPULATION EXERCISES (Sales.employees)
   ======================================================================== */

-- Q1: Select all columns from the "employees" table.
SELECT *
FROM Sales.employees;


-- Q2: Retrieve only the "first_name" and "last_name" columns from the "employees" table.
SELECT first_name, last_name
FROM Sales.employees;


-- Q3: Retrieve "full name" as one column from "first_name" and "last_name" columns.
SELECT first_name + ' ' + last_name AS full_name
FROM Sales.employees;


-- Q4: Show the average salary of all employees. (Use AVG() function)
SELECT AVG(salary) AS average_salary
FROM Sales.employees;


-- Q5: Select employees whose salary is greater than 50000.
SELECT *
FROM Sales.employees
WHERE salary > 50000;


-- Q6: Retrieve employees hired in the year 2020.
SELECT *
FROM Sales.employees
WHERE YEAR(hire_date) = 2020;


-- Q7: List employees whose last names start with 'S'.
SELECT *
FROM Sales.employees
WHERE last_name LIKE 'S%';


-- Q8: Display the top 10 highest-paid employees.
SELECT TOP 10 *
FROM Sales.employees
ORDER BY salary DESC;


-- Q9: Find employees with salaries between 40000 and 60000.
SELECT *
FROM Sales.employees
WHERE salary BETWEEN 40000 AND 60000;


-- Q10: Show employees with names containing the substring 'man'.
SELECT *
FROM Sales.employees
WHERE first_name LIKE '%man%'
   OR last_name  LIKE '%man%';


-- Q11: Display employees with a NULL value in the "hire_date" column.
SELECT *
FROM Sales.employees
WHERE hire_date IS NULL;


-- Q12: Select employees with a salary in the set (40000, 45000, 50000).
SELECT *
FROM Sales.employees
WHERE salary IN (40000, 45000, 50000);


-- Q13: Retrieve employees hired between '2020-01-01' and '2021-01-01'.
SELECT *
FROM Sales.employees
WHERE hire_date BETWEEN '2020-01-01' AND '2021-01-01';


-- Q14: List employees with salaries in descending order.
SELECT *
FROM Sales.employees
ORDER BY salary DESC;


-- Q15: Show the first 5 employees ordered by "last_name" in ascending order.
SELECT TOP 5 *
FROM Sales.employees
ORDER BY last_name ASC;


-- Q16: Display employees with a salary greater than 55000 and hired in 2020.
SELECT *
FROM Sales.employees
WHERE salary > 55000
  AND YEAR(hire_date) = 2020;


-- Q17: Select employees whose first name is 'John' or 'Jane'.
SELECT *
FROM Sales.employees
WHERE first_name IN ('John', 'Jane');


-- Q18: List employees with a salary <= 55000 and a hire date after '2022-01-01'.
SELECT *
FROM Sales.employees
WHERE salary <= 55000
  AND hire_date > '2022-01-01';


-- Q19: Retrieve employees with a salary greater than the average salary.
SELECT *
FROM Sales.employees
WHERE salary > (SELECT AVG(salary) FROM Sales.employees);


-- Q20: Display the 3rd to 7th highest-paid employees. (Use OFFSET and FETCH)
SELECT *
FROM Sales.employees
ORDER BY salary DESC
OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY;


-- Q21: List employees hired after '2021-01-01' in alphabetical order.
SELECT *
FROM Sales.employees
WHERE hire_date > '2021-01-01'
ORDER BY first_name ASC, last_name ASC;


-- Q22: Retrieve employees with a salary > 50000 and last name not starting with 'A'.
SELECT *
FROM Sales.employees
WHERE salary > 50000
  AND last_name NOT LIKE 'A%';


-- Q23: Display employees with a salary that is not NULL.
SELECT *
FROM Sales.employees
WHERE salary IS NOT NULL;


-- Q24: Show employees with names containing 'e' or 'i' and a salary > 45000.
SELECT *
FROM Sales.employees
WHERE (   first_name LIKE '%e%' OR first_name LIKE '%i%'
       OR last_name  LIKE '%e%' OR last_name  LIKE '%i%')
  AND salary > 45000;
GO


/* ========================================================================
   TASK 4 - JOIN-RELATED EXERCISES
   ======================================================================== */

-- Q25: Create a new table named "departments" with columns:
--      department_id (Primary Key, INT),
--      department_name (VARCHAR),
--      manager_id (INT, references "employees".employee_id).
CREATE TABLE Sales.departments (
    department_id   INT          NOT NULL,
    department_name VARCHAR(100) NOT NULL,
    manager_id      INT          NULL,
    CONSTRAINT PK_departments PRIMARY KEY (department_id),
    CONSTRAINT FK_departments_manager
        FOREIGN KEY (manager_id) REFERENCES Sales.employees(employee_id)
);
GO

-- Sample departments (manager_id values are existing employee IDs)
INSERT INTO Sales.departments (department_id, department_name, manager_id) VALUES (1, 'IT',        1);
INSERT INTO Sales.departments (department_id, department_name, manager_id) VALUES (2, 'HR',        6);
INSERT INTO Sales.departments (department_id, department_name, manager_id) VALUES (3, 'Finance',  11);
INSERT INTO Sales.departments (department_id, department_name, manager_id) VALUES (4, 'Marketing', 16);
INSERT INTO Sales.departments (department_id, department_name, manager_id) VALUES (5, 'Legal',     NULL);  -- no employees (shows 0 in Q29)
GO


-- Q26: Assign each employee to a department by creating a "department_id" column
--      in "employees" and making it a foreign key referencing "departments".department_id.
ALTER TABLE Sales.employees
ADD department_id INT NULL;
GO

ALTER TABLE Sales.employees
ADD CONSTRAINT FK_employees_department
    FOREIGN KEY (department_id) REFERENCES Sales.departments(department_id);
GO

-- Assign employees to departments (employees 18-20 are left without a department for Q28)
UPDATE Sales.employees SET department_id = 1 WHERE employee_id BETWEEN 1  AND 5;
UPDATE Sales.employees SET department_id = 2 WHERE employee_id BETWEEN 6  AND 10;
UPDATE Sales.employees SET department_id = 3 WHERE employee_id BETWEEN 11 AND 14;
UPDATE Sales.employees SET department_id = 4 WHERE employee_id BETWEEN 15 AND 17;
GO


-- Q27: Retrieve all employees with their department names. (Use INNER JOIN)
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.salary,
       d.department_name
FROM Sales.employees AS e
INNER JOIN Sales.departments AS d
        ON e.department_id = d.department_id;


-- Q28: Retrieve employees who don't belong to any department. (Use LEFT JOIN and check for NULL)
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.salary
FROM Sales.employees AS e
LEFT JOIN Sales.departments AS d
       ON e.department_id = d.department_id
WHERE d.department_id IS NULL;


-- Q29: Show all departments and their employee count. (Use JOIN and GROUP BY)
SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM Sales.departments AS d
LEFT JOIN Sales.employees AS e
       ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;


-- Q30: Retrieve the highest-paid employee in each department. (Use JOIN and MAX(salary))
SELECT d.department_name,
       e.employee_id,
       e.first_name,
       e.last_name,
       e.salary
FROM Sales.employees AS e
INNER JOIN Sales.departments AS d
        ON e.department_id = d.department_id
INNER JOIN (
            SELECT department_id,
                   MAX(salary) AS max_salary
            FROM Sales.employees
            GROUP BY department_id
           ) AS m
        ON e.department_id = m.department_id
       AND e.salary        = m.max_salary;
GO


/* ========================================================================
   TASK 5 - STORED PROCEDURES AND TRIGGER
   ======================================================================== */

/* ------------------------------- PART 1 ------------------------------- */

-- Create a table Employees with columns: Id, FirstName, LastName, Salary.
CREATE TABLE dbo.Employees (
    Id        INT IDENTITY(1,1) NOT NULL,
    FirstName VARCHAR(50)       NOT NULL,
    LastName  VARCHAR(50)       NOT NULL,
    Salary    DECIMAL(10,2)     NOT NULL,
    CONSTRAINT PK_dbo_Employees PRIMARY KEY (Id)
);
GO

-- Sample data
INSERT INTO dbo.Employees (FirstName, LastName, Salary) VALUES ('Ahmed', 'Hassan',  8500.50);
INSERT INTO dbo.Employees (FirstName, LastName, Salary) VALUES ('Sara',  'Mostafa', 12000.00);
INSERT INTO dbo.Employees (FirstName, LastName, Salary) VALUES ('Omar',  'Ali',     6700.75);
GO


-- 1- Create a stored procedure named GetAllEmployees that selects all rows from Employees.
CREATE PROCEDURE dbo.GetAllEmployees
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, FirstName, LastName, Salary
    FROM dbo.Employees;
END;
GO

EXEC dbo.GetAllEmployees;
GO


-- 2- Create a stored procedure GetHighSalaryEmployees with one input parameter @MinSalary
--    which selects all employees with Salary > @MinSalary.
CREATE PROCEDURE dbo.GetHighSalaryEmployees
    @MinSalary DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, FirstName, LastName, Salary
    FROM dbo.Employees
    WHERE Salary > @MinSalary;
END;
GO

EXEC dbo.GetHighSalaryEmployees @MinSalary = 8000;
GO


-- 3- Create AddEmployee SP with @FirstName, @LastName, @Salary which inserts a new row into Employees.
CREATE PROCEDURE dbo.AddEmployee
    @FirstName VARCHAR(50),
    @LastName  VARCHAR(50),
    @Salary    DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Employees (FirstName, LastName, Salary)
    VALUES (@FirstName, @LastName, @Salary);
END;
GO

EXEC dbo.AddEmployee @FirstName = 'Mona', @LastName = 'Ibrahim', @Salary = 9300;
GO

/* ------------------------------- PART 2 ------------------------------- */

-- Create a table EmployeeLog (Id, EmployeeId, Action, ActionDate).
CREATE TABLE dbo.EmployeeLog (
    Id         INT IDENTITY(1,1) NOT NULL,
    EmployeeId INT               NOT NULL,
    Action     VARCHAR(50)       NOT NULL,
    ActionDate DATETIME          NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_EmployeeLog PRIMARY KEY (Id)
);
GO


-- Create an AFTER INSERT trigger which automatically logs when a new employee is added.
CREATE TRIGGER dbo.trg_Employees_AfterInsert
ON dbo.Employees
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- "inserted" holds the new rows, so this also works for multi-row inserts
    INSERT INTO dbo.EmployeeLog (EmployeeId, Action, ActionDate)
    SELECT Id, 'INSERT', GETDATE()
    FROM inserted;
END;
GO




-- Execute AddEmployee AFTER the trigger exists, so the insert is logged
EXEC dbo.AddEmployee @FirstName = 'Mona', @LastName = 'Ibrahim', @Salary = 9300;
GO

SELECT * FROM dbo.Employees;
SELECT * FROM dbo.EmployeeLog;
GO