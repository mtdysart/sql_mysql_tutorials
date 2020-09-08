USE employees;

# Local variables don't need @ 

# Session variables need @
SET @s_var1 = 3;
SELECT @s_var1;

# Global variables
SET GLOBAL max_connections = 1000;

COMMIT;

# BEFORE INSERT Trigger
DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = 0; 
	END IF; 
END $$

DELIMITER ;

SELECT * FROM salaries WHERE emp_no = 10001;

# New salary will become 0
INSERT INTO salaries VALUES (10001, -92891, '2010-06-22', '9999-01-01');

# BEFORE UPDATE
DELIMITER $$

CREATE TRIGGER trig_upd_salary
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = OLD.salary; 
	END IF; 
END $$

DELIMITER ;

# Old salary of 0 is kept
UPDATE salaries 
SET salary = -50000
WHERE emp_no = '10001' AND from_date = '2010-06-22';

# SYSDATE() delivers the date and time of the moment at which you have invoked the function.
SELECT SYSDATE();

DROP TRIGGER IF EXISTS trig_upd_from_date;

DELIMITER $$

CREATE TRIGGER trig_upd_from_date
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.from_date > sysdate() THEN 
		SET NEW.from_date = date_format(sysdate(), '%y-%m-%d'); 
	END IF; 
END $$

DELIMITER ;

UPDATE salaries
SET from_date = '21-01-01'
WHERE from_date = '2010-06-22' AND emp_no = 10001;

# Indexes can increase speed of searches
SELECT * FROM employees WHERE hire_date > '2000-01-01';
CREATE INDEX i_hire_date ON employees (hire_date);

SELECT * FROM employees WHERE first_name = 'Georgi' AND last_name = 'Facello';
CREATE INDEX i_composite ON employees (first_name, last_name);

ALTER TABLE employees DROP INDEX i_hire_date;

SELECT * FROM salaries WHERE salary > 89000;
CREATE INDEX i_salaries ON salaries (salary);

# CASE statement
SELECT 
	emp_no, 
    first_name, 
    last_name,
    CASE gender
		WHEN 'M' THEN 'Male'
        ELSE 'Female'
	END AS gender
FROM employees;

# Same result
SELECT 
	emp_no, 
    first_name, 
    last_name,
    IF (gender = 'M', 'Male', 'Female') AS gender
FROM employees;

SELECT 
	e.emp_no, 
    e.first_name, 
    e.last_name,
    IF (dm.dept_no IS NOT NULL, 'Manager', 'Employee') AS employee_type
FROM employees e LEFT JOIN dept_manager dm ON e.emp_no = dm.emp_no
WHERE e.emp_no > 109990
GROUP BY e.emp_no;

SELECT 
	e.emp_no, 
    e.first_name, 
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS max_salary_difference,
    IF (MAX(s.salary) - MIN(s.salary) > 30000, 'YES', 'NOT') AS greater_than_30000
FROM (employees e JOIN dept_manager dm ON e.emp_no = dm.emp_no) JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY e.emp_no;

SELECT 
	e.emp_no, 
    e.first_name, 
    e.last_name,
    IF (MAX(d.to_date) < sysdate(), 'Not an employee anymore', 'Is still employeed') AS current_employee
FROM employees e JOIN dept_emp d ON e.emp_no = d.emp_no
GROUP BY e.emp_no
LIMiT 100;

ROLLBACK;