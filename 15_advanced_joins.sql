USE employees;

# This is same output as INNER JOIN
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM employees e, dept_manager dm
WHERE e.emp_no = dm.emp_no;

# Check
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM employees e JOIN dept_manager dm
ON e.emp_no = dm.emp_no;

SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e JOIN salaries s
ON e.emp_no = s.emp_no
WHERE s.salary > 145000;

SELECT e.first_name, e.last_name, e.hire_date, t.title
FROM employees e JOIN titles t
ON e.emp_no = t.emp_no
WHERE e.first_name = 'Margareta' AND e.last_name = 'Markovitch';

# CROSS JOIN is Cartesian product of values of two or more sets
# CROSS is not needed if no ON statement is given
SELECT dm.*, d.*
FROM dept_manager dm CROSS JOIN departments d
ORDER BY dm.emp_no, d.dept_no;

SELECT dm.*, d.*
FROM dept_manager dm CROSS JOIN departments d
WHERE d.dept_no = 'd009'
ORDER BY dm.emp_no;

SELECT e.*, d.*
FROM employees e CROSS JOIN departments d
WHERE e.emp_no <= 10010
ORDER BY e.emp_no, d.dept_no;

# Average salary for men and women
SELECT e.gender, AVG(s.salary)
FROM employees e JOIN salaries s
ON e.emp_no = s.emp_no
GROUP BY e.gender;

SELECT e.first_name, e.last_name, e.hire_date, m.from_date, d.dept_name
FROM (employees e JOIN dept_manager m ON e.emp_no = m.emp_no) JOIN departments d
ON m.dept_no = d.dept_no;

SELECT e.first_name, e.last_name, e.hire_date, t.title, m.from_date, d.dept_name
FROM ((employees e JOIN titles t ON e.emp_no = t.emp_no)
JOIN dept_manager m ON e.emp_no = m.emp_no) 
JOIN departments d ON m.dept_no = d.dept_no;

# Average salaries of departments with average salary > 60000
SELECT d.dept_name, AVG(s.salary) AS avg_salary
FROM departments d JOIN dept_manager m ON d.dept_no = m.dept_no
JOIN salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING avg_salary > 60000
ORDER BY avg_salary DESC;

# Number of male and female managers in the database
SELECT e.gender, COUNT(e.emp_no) AS num_of_managers
FROM employees e JOIN titles t ON e.emp_no = t.emp_no
WHERE t.title LIKE '%Manager%'
GROUP BY e.gender;

# Some setup for UNION (create employees_dup table)
DROP TABLE IF EXISTS employees_dup;

CREATE TABLE employees_dup (
	emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M', 'F'),
    hire_date DATE
);

INSERT INTO employees_dup 
SELECT * FROM employees
LIMIT 20;

SELECT * FROM employees_dup;

# Insert duplicate of first row
INSERT INTO employees_dup
VALUES ('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

# UNION combines results from two SELECT queries
# Need same number of columns with same name in same order with related data types for UNION ALL
# UNION displays only distinct values in the output
# UNION ALL optimizes performance

# The negative sign with DESC makes this order emp_no by ascending order
SELECT *
FROM
(SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL AS from_date
	FROM employees e
	WHERE last_name = 'Denis' UNION 
    SELECT NULL AS emp_no, NULL AS first_name, NULL AS last_name, dm.dept_no, dm.from_date
	FROM dept_manager dm
) AS a
ORDER BY -a.emp_no DESC;