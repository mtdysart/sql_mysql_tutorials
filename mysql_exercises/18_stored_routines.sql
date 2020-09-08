USE employees;

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
	SELECT * FROM employees LIMIT 1000;
END$$

DELIMITER ;

CALL employees.select_employees();

DELIMITER $$
CREATE PROCEDURE average_employee_salary()
BEGIN
	SELECT AVG(s.salary)
    FROM employees e JOIN salaries s ON e.emp_no = s.emp_no;
END$$

DELIMITER ;

CALL employees.average_employee_salary();

DROP PROCEDURE IF EXISTS employee_salary;

DELIMITER $$
CREATE PROCEDURE employee_salary(IN p_emp_no INTEGER)
BEGIN
	SELECT e.first_name, e.last_name, s.salary, s.from_date, s.to_date
    FROM employees e JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no;
END$$
DELIMITER ;

CALL employees.employee_salary(11300);

DROP PROCEDURE IF EXISTS emp_avg_salary_out;

# Procedure with both an in and out parameter
DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10, 2))
BEGIN
	SELECT AVG(s.salary) INTO p_avg_salary
    FROM employees e JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no;
END$$
DELIMITER ;

SET @v_avg_salary = 0;
CALL employees.emp_avg_salary_out(11300, @v_avg_salary);
SELECT @v_avg_salary;

DROP PROCEDURE IF EXISTS emp_info;

DELIMITER $$
CREATE PROCEDURE emp_info(IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255))
BEGIN
	SELECT emp_no 
    FROM employees e
	WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
END$$
DELIMITER ;

CALL employees.emp_info('Lillian', 'Fontet');

DELIMITER $$
CREATE PROCEDURE emp_info(IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), OUT p_emp_no INTEGER)
BEGIN
	SELECT emp_no INTO p_emp_no
    FROM employees e
	WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
END$$
DELIMITER ;

SET @v_emp_no = 0;
CALL employees.emp_info('Lillian', 'Fontet', @v_emp_no);
SELECT @v_emp_no;

# No OUT parameters for functions, return value instead
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
	DECLARE v_avg_salary DECIMAL(10, 2);
    
    SELECT AVG(s.salary) INTO v_avg_salary
    FROM salaries s
    WHERE s.emp_no = p_emp_no;
    
    RETURN v_avg_salary;
END$$
DELIMITER ;

# Do not call functions, SELECT instead
SELECT f_emp_avg_salary(11300);

DELIMITER $$
CREATE FUNCTION emp_info(p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
	DECLARE v_newest_salary INTEGER;
    DECLARE v_newest_contract_date DATE;
    
    SELECT MAX(s.from_date) INTO v_newest_contract_date
    FROM employees e JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
    
    SELECT  s.salary INTO v_newest_salary
    FROM employees e JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.first_name = p_first_name AND e.last_name = p_last_name AND s.from_date = v_newest_contract_date;
    
    RETURN v_newest_salary;
END$$
DELIMITER ;

SELECT emp_info('Lillian', 'Fontet');