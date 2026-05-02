create database emp_details;
use emp_details;
CREATE TABLE Departments (
    id INT AUTO_INCREMENT PRIMARY KEY,         
    D_name VARCHAR(100) NOT NULL,                
    location VARCHAR(100)                      
);
select * from departments;
CREATE TABLE Employees (
    id INT AUTO_INCREMENT PRIMARY KEY,         
    first_name VARCHAR(50) NOT NULL,           
    last_name VARCHAR(50) NOT NULL,            
    email VARCHAR(100) NOT NULL UNIQUE,        
    phone_number VARCHAR(20),                  
    hire_date DATE NOT NULL,                   
    job_title VARCHAR(50) NOT NULL,            
    department_id INT,                         
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);
select *from emp_details.brand;

CREATE TABLE Projects (
    id INT AUTO_INCREMENT PRIMARY KEY,         
    P_name VARCHAR(100) NOT NULL,                
    P_Description TEXT,                          
    start_date DATE,                           
    end_date DATE,                             
    department_id INT,                        
    FOREIGN KEY (department_id) REFERENCES Departments(id) 
);

CREATE TABLE Timesheets (
    id INT AUTO_INCREMENT PRIMARY KEY,         
    employee_id INT,                           
    project_id INT,                            
    date_ts DATE NOT NULL,                        
    hours DECIMAL(5, 2) NOT NULL,              
    FOREIGN KEY (employee_id) REFERENCES Employees(id),   
    FOREIGN KEY (project_id) REFERENCES Projects(id)      
);
select * from timesheets;

INSERT INTO Departments (D_name, location) VALUES
('HR', 'New York'),           
('Finance', 'Chicago'),       
('Engineering', 'San Francisco'), 
('Marketing', 'Los Angeles'), 
('Sales', 'Boston'),
('IT Support', 'San Diego'), 
('Legal', 'Seattle'),        
('Operations', 'Houston'),   
('Customer Service','Miami');

INSERT INTO Employees (first_name, last_name, email, phone_number, hire_date, job_title, department_id) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', '2022-01-15', 'Manager',1),
('Jane', 'Smith', 'jane.smith@example.com', '555-2345', '2021-06-22', 'Developer',3),
('Tom', 'Brown', 'tom.brown@example.com', '555-3456', '2020-09-12', 'Manager',2),
('Lucy', 'Davis', 'lucy.davis@example.com', '555-4567', '2019-11-02', 'Developer',4),
('Mark', 'Taylor', 'mark.taylor@example.com', '555-5678', '2018-08-30', 'Sales Rep',5),
('Emma', 'Watson', 'emma.watson@example.com', '555-8765', '2020-05-14', 'Manager',6),
('David', 'Miller', 'david.miller@example.com', '555-7654', '2019-04-20', 'Developer',6),
('Sophia', 'Wilson', 'sophia.wilson@example.com', '555-6543', '2018-12-01', 'Manager',7),
('Liam', 'Johnson', 'liam.johnson@example.com', '555-5432', '2021-07-17', 'Developer',7),
('Olivia', 'Martinez', 'olivia.martinez@example.com', '555-4321', '2022-09-09', 'HR Specialist',1),
('Lucas', 'Garcia', 'lucas.garcia@example.com', '555-3210', '2023-02-22', 'Marketing Analyst',4),
('Mia', 'Davis', 'mia.davis@example.com', '555-2109', '2023-03-15', 'Sales Rep',5),
('James', 'Brown', 'james.brown@example.com', '555-1098', '2021-10-11', 'Operations Manager',8),
('Isabella', 'Rodriguez', 'isabella.rodriguez@example.com', '555-0987', '2017-08-06', 'Customer Service Rep',9);

INSERT INTO Projects (P_name, P_Description, start_date, end_date, department_id) VALUES
('Project A', 'HR system overhaul', '2023-01-01', '2023-12-31',1),
('Project B', 'Financial Audit', '2023-03-01', '2023-12-01',2),
('Project C', 'New App Development', '2023-05-01', '2024-01-31',3),
('Project D', 'Marketing Campaign', '2023-07-01', '2023-11-30',4),
('Project E', 'Sales Platform Upgrade', '2023-09-01', '2024-06-30',5),
('Project F', 'IT Infrastructure Upgrade', '2023-04-01', '2023-12-31',6),
('Project G', 'Legal Compliance Audit', '2023-07-01', '2023-12-01',7),
('Project H', 'Operations Workflow Optimization', '2023-05-15', '2023-12-31',8),
('Project I', 'Customer Feedback System', '2023-06-01', '2024-03-31',9),
('Project J', 'Cloud Migration', '2023-09-01', '2024-05-31',6);

INSERT INTO Timesheets (employee_id, project_id, date_ts, hours) VALUES
(1, 1, '2023-02-15',8.0),
(2, 3, '2023-05-10',6.5),
(2, 3, '2023-05-11',7.0),
(3, 2, '2023-03-20',8.0),
(4, 4, '2023-08-10',5.5),
(4, 4, '2023-08-11',7.5),
(5, 5, '2023-10-15',6.0),
(6, 6, '2023-06-15',7.5), 
(7, 6, '2023-06-16',8.0), 
(7, 6, '2023-06-17',6.5),
(8, 7, '2023-08-01',8.0), 
(9, 7, '2023-08-02',7.0), 
(9, 7, '2023-08-03',8.5),
(10, 1, '2023-04-01',8.0), 
(11, 4, '2023-05-22',6.0), 
(11, 4, '2023-05-23',5.5),
(12, 5, '2023-09-15',7.0), 
(13, 8, '2023-07-05',6.5), 
(13, 8, '2023-07-06',8.0),
(14, 9, '2023-07-10',6.0), 
(14, 9, '2023-07-11',6.5),
(1, 3, '2023-06-12',7.5), 
(1, 3, '2023-06-13',8.0),
(2, 3, '2023-06-14',7.0);


-- Questions and answer
-- 1. Find out the working location of each employee
select first_name , location 
from employees e inner join departments d
on d.id = e.department_id;


SELECT e.first_name, e.last_name, d.location
FROM employees e
JOIN departments d 
ON e.department_id = d.id;

-- 2.Create Salary column & update the salaries for each department as below
/*
D1 → 40K
D2 → 30K
D3 → 55K
D4 → 60K
D5 → 75K
D6 → 100K
D7 → 125K
D8 → 130K
D9 → 150000
*/
alter table departments 
ADD Salary DECIMAL(10,2);
select * from departments;
update departments
set salary = case id
WHEN 1 THEN 40000
WHEN 2 THEN 30000
WHEN 3 THEN 55000
WHEN 4 THEN 60000
WHEN 5 THEN 75000
WHEN 6 THEN 100000
WHEN 7 THEN 125000
WHEN 8 THEN 130000
WHEN 9 THEN 150000
ELSE Salary
end
where id in (1,2,3,4,5,6,7,8,9)
;
select * from departments;
select * from projects;
select * from employees;
select * from timesheets;
select * from departments;

-- 3. Find which project the employee is working on.
select distinct e.first_name , t.project_id , p.p_name
from employees e join timesheets t 
on e.id = t.employee_id join projects p
on t.project_id=p.id;

SELECT DISTINCT e.first_name, e.last_name, p.p_name
FROM timesheets t
JOIN employees e ON t.employee_id = e.id
JOIN projects p ON t.project_id = p.id;

-- 4. Find out the total hours worked on each project by each employee.
select * from timesheets;
select e.first_name ,p.p_name ,sum(t.hours) as total_hour
from employees e join timesheets t
on e.id =t.employee_id join projects p
on t.project_id =p.id
group by  e.first_name ,p.p_name
;

select e.first_name ,p.p_name ,sum(t.hours) as total_hour
from employees e join timesheets t
on e.id =t.employee_id join projects p
on t.project_id =p.id
group by  e.id,p.id;


-- 5.Find those employees who have not worked on any of the projects.
select e.first_name , p.p_name ,p.id
from employees e left join timesheets t 
on e.id=t.employee_id join projects p on p.id=t.project_id
where p.id is null ;


select e.id, e.first_name
from employees e
where e.id not in (select employee_id from timesheets);


-- 6.Find the maximum hours worked on which project.
select  p.p_name ,sum(t.hours) as max_hours
from  projects p join timesheets t
on p.id=t.project_id
group by  p.p_name 
order by  max_hours desc
limit 1
;
-- 6 which emp work maximum hour on which project
select e.first_name , p.p_name ,sum(t.hours) as max_hours,
from employees e join timesheets t
on e.id=t.employee_id join projects p 
on p.id=t.project_id
group by e.first_name,  p.p_name 
order by  max_hours desc;

-- 7. Create a view which stores employees' department names & their respective salaries.
create or replace view stores as 
select e.first_name,d.d_name,d.salary
from employees e join departments d
on e.department_id =d.id;

select * from employee_dep_salary;

CREATE OR REPLACE VIEW employee_dep_salary AS
SELECT e.first_name, e.last_name, d.d_name, d.salary
FROM employees e
JOIN departments d 
ON e.department_id = d.id;
select  employee_dep_salary;

-- 8. Create a view which stores the projects allocated to each employee
create or replace view  emp_project as
select (e.id) as emp_id, concat(e.first_name ," ",e.last_name) as Emp_name, (p.id) as project_id, p.p_name 
from employees e join timesheets t on
e.id = t.employee_id join projects p on
p.id=t.project_id;
select* from emp_project;
drop view  emp_project;

CREATE OR REPLACE VIEW emp_pr_allocated AS
SELECT DISTINCT e.first_name, e.last_name, p.p_name
FROM timesheets t
JOIN employees e ON t.employee_id = e.id
JOIN projects p ON t.project_id = p.id;

select* from emp_pr_allocated;

-- 9. Find the employees who have worked more than 20 hours on a single project.
select p.id as project_id,e.id,e.first_name,sum(hours)
from employees e join timesheets t on
e.id=t.employee_id join projects p on p.id=t.project_id
group by  p.id,e.id
having sum(hours) >20;
-- 10. Create a query that classifies employees based on their job titles as 'Manager','Developer', or 'Other'.
select concat(first_name , " " ,last_name) as emp_name ,job_title,
case
 when job_title='Manager' then "Manager"
 when job_title='Developer' then "Developer"
else "other"
end as job_category 
from employees;
-- 11. Retrieve a list of employees who worked on multiple projects.
select e.first_name , e.id,count(distinct t.project_id) as project_count
from employees e join timesheets t 
on e.id=t.employee_id 
group by e.id , e.first_name
having count(t.project_id) >1;

SELECT e.id AS emp_id,
       e.first_name,
       COUNT(DISTINCT t.project_id) AS project_count
FROM employees e
JOIN timesheets t ON e.id = t.employee_id
GROUP BY e.id, e.first_name
HAVING COUNT(DISTINCT t.project_id) > 1;


-- 12.Retrieve each employee’s total hours worked on projects, and show the rank of each employee based on total hours worked.
select concat(e.first_name , " " ,e.last_name) as emp_name,t.hours ,
rank() over(partition by hours order by hours )
from employees e join timesheets t 
on e.id=t.employee_id;

-- 13. List all employees whose total hours worked are above the overall average using subquery.
select e.first_name ,sum(t.hours) as sum_hour
from employees e join timesheets t 
on  e.id=t.employee_id
group by e.first_name
having sum_hour >(select (avg(t.hours)) as avg);




-- 14.Update the Employees table by changing the job_title of all employees working in the 'Engineering' department to 'Senior Developer', 
-- except for those who are 'Manager' or 'HR Specialist'.
UPDATE employees
SET job_title = 'Senior Developer'
WHERE department_name = 'Engineering'
  AND job_title NOT IN ('Manager', 'HR Specialist');







select * from departments;
select * from employees;
select first_name ,d_name,
case 
when job_title='Engineering' then d_name = 'Senior Developer'
end as senior_developer
from employees e join departments d 
on e.department_id = d.id 
;


-- 15. Find out which department has the highest average employee salary.
select d.d_name ,avg(d.salary)
from employees e join departments d 
on e.department_id=d.id
group by  d.d_name
order by avg(d.salary) desc
limit 1;

SELECT d.d_name,
       AVG(d.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.id
GROUP BY d.d_name
ORDER BY avg_salary DESC
LIMIT 1;

SELECT d_name, salary
FROM departments
ORDER BY salary DESC
LIMIT 1; 





-- this query is written by sir
-- Question 1. Find out the working location of each employee

SELECT e.first_name, e.last_name, d.location
FROM employees e
JOIN departments d 
ON e.department_id = d.id;

-- Question 2. Create salary column and update salary
-- D1 → 40K
-- D2 → 30K
-- D3 → 55K
-- D4 → 60K
-- D5 → 75K
-- D6 → 100K
-- D7 → 125K
-- D8 → 130K
-- D9 → 150K

ALTER TABLE departments
ADD COLUMN salary INT;
UPDATE departments
SET salary = CASE d_name
    WHEN 'HR' THEN 40000
    WHEN 'Finance' THEN 30000
    WHEN 'Engineering' THEN 55000
    WHEN 'Marketing' THEN 60000
    WHEN 'Sales' THEN 75000
    WHEN 'IT Support' THEN 100000
    WHEN 'Legal' THEN 125000
    WHEN 'Operations' THEN 130000
    WHEN 'Customer Service' THEN 150000
END;

-- 3. Find which project the employee is working on.

SELECT DISTINCT e.first_name, e.last_name, p.p_name
FROM timesheets t
JOIN employees e ON t.employee_id = e.id
JOIN projects p ON t.project_id = p.id;

-- 4. Find out the total hours worked on each project by each employee.

SELECT e.first_name, e.last_name, p.p_name, 
       SUM(t.hours) AS total_hours
FROM timesheets t
JOIN employees e ON t.employee_id = e.id
JOIN projects p ON t.project_id = p.id
GROUP BY e.id, p.id;

-- 4. Find out the total hours worked on each project by each employee.
select * from timesheets;
select e.first_name ,p.p_name ,sum(t.hours) as total_hour
from employees e join timesheets t
on e.id =t.employee_id join projects p
on t.project_id =p.id
group by  e.id,p.id;

-- 5.Find those employees who have not worked on any of the projects.

SELECT e.first_name, e.last_name
FROM employees e
LEFT JOIN timesheets t 
ON e.id = t.employee_id
WHERE t.employee_id IS NULL;

-- 5.1 find those project on which not worked any employee

SELECT p.p_name,p.id
FROM projects p
LEFT JOIN timesheets t 
ON t.project_id = p.id
WHERE t.project_id IS NULL;


-- 6 which emp work maximum hour on which project
SELECT p.p_name, SUM(t.hours) AS total_hours
FROM projects p
JOIN timesheets t ON t.project_id = p.id
GROUP BY p.id
ORDER BY total_hours DESC
LIMIT 1;
-- 6 which emp work maximum hour on which project
select e.first_name,e.id , p.p_name ,sum(t.hours) as max_hours
from employees e join timesheets t
on e.id=t.employee_id join projects p 
on p.id=t.project_id
group by e.id,  p.p_name 
order by  max_hours desc;




-- 7. Create a view which stores employees' department names & their respective salaries.

CREATE OR REPLACE VIEW employee_dep_salary AS
SELECT e.first_name, e.last_name, d.d_name, d.salary
FROM employees e
JOIN departments d 
ON e.department_id = d.id;
select  employee_dep_salary;
-- 8. Create a view which stores the projects allocated to each employee
CREATE OR REPLACE VIEW emp_pr_allocated AS
SELECT DISTINCT e.first_name, e.last_name, p.p_name
FROM timesheets t
JOIN employees e ON t.employee_id = e.id
JOIN projects p ON t.project_id = p.id;

create  view  emp_project as
select distinct  concat(e.first_name ," ",e.last_name) as Emp_name, p.p_name 
from employees e join timesheets t on
e.id = t.employee_id join projects p on
p.id=t.project_id;
drop view  emp_project;
select* from emp_project;
select * from emp_pr_allocated;
-- 9. Find the employees who have worked more than 20 hours on a single project.
SELECT e.first_name, e.last_name, p.p_name, 
       SUM(t.hours) AS total_hours
FROM timesheets t
JOIN employees e ON t.employee_id = e.id
JOIN projects p ON t.project_id = p.id
GROUP BY e.id, p.id
HAVING total_hours > 20;

select p.id as project_id,e.id,e.first_name,sum(hours)
from employees e join timesheets t on
e.id=t.employee_id join projects p on p.id=t.project_id
group by  p.id,e.id
having sum(hours) >20;

-- 10. Create a query that classifies employees based on their job titles as 'Manager','Developer', or 'Other'.

SELECT first_name, last_name,
CASE 
    WHEN job_title LIKE '%Manager%' THEN 'Manager'
    WHEN job_title LIKE '%Developer%' THEN 'Developer'
    ELSE 'Other'
END AS category
FROM employees;

-- 11. Retrieve a list of employees who worked on multiple projects.

SELECT e.first_name, e.last_name, 
       COUNT(DISTINCT t.project_id) AS project_count
FROM timesheets t
JOIN employees e ON t.employee_id = e.id
GROUP BY e.id
HAVING project_count > 1;

select e.first_name , e.id,count(distinct t.project_id) as project_count
from employees e join timesheets t 
on e.id=t.employee_id 
group by e.id 
having count(distinct t.project_id) >1;

-- 12.Retrieve each employee’s total hours worked on projects, and show the rank of each employee based on total hours worked.

SELECT 
    e.first_name,
    e.last_name,
    SUM(t.hours) AS total_hours,
    RANK() OVER (ORDER BY SUM(t.hours) DESC) AS rank_hours
FROM employees e
JOIN timesheets t ON e.id = t.employee_id
GROUP BY e.id;

-- ank
 select e.first_name, e.last_name, sum(t.hours) as Total_hours,
rank () over(partition by p.P_name order by sum(t.hours)) as Rank_hours
from employees as e inner join projects as p on e.department_id = p.department_id 
inner join timesheets as t on p.id = t.project_id
group by e.first_name, e.last_name, p.P_name;

select concat(e.first_name , " " ,e.last_name) as emp_name,t.hours ,
rank() over(order by hours )
from employees e join timesheets t 
on e.id=t.employee_id;

-- 13. List all employees whose total hours worked are above the overall average using subquery.


SELECT e.first_name, e.last_name, 
       SUM(t.hours) AS total_hours
FROM employees e
JOIN timesheets t ON t.employee_id = e.id
GROUP BY e.id
HAVING total_hours >
(
    SELECT AVG(emp_total)
    FROM (
        SELECT SUM(hours) AS emp_total
        FROM timesheets
        GROUP BY employee_id
    ) AS sub
);
select e.first_name ,sum(t.hours) as sum_hour
from employees e join timesheets t 
on  e.id=t.employee_id
group by e.first_name
having sum_hour >(select (avg(t.hours)) as avg);

-- 14.Update the Employees table by changing the job_title of all employees working in the 'Engineering' department to 'Senior Developer', 
-- except for those who are 'Manager' or 'HR Specialist'.
UPDATE employees e
JOIN departments d 
ON e.department_id = d.id
SET e.job_title = 'Senior Developer'
WHERE d.d_name = 'Engineering'
AND e.job_title NOT LIKE '%Manager%';

-- 15. Find out which department has the highest average employee salary.

SELECT d_name, salary
FROM departments
ORDER BY salary DESC
LIMIT 1; 

-- in this question he didnt mention average salary





