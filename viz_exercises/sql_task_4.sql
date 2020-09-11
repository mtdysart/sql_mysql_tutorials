# Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range. 
# Let this range be defined by two values the user can insert when calling the procedure.
# Finally, visualize the obtained result-set in Tableau as a double bar chart. 

USE employees_mod;

DROP PROCEDURE IF EXISTS avg_salary_in_range;

DELIMITER $$
CREATE PROCEDURE avg_salary_in_range(IN min_salary FLOAT, IN max_salary FLOAT)
BEGIN
	
    SELECT e.gender, d.dept_name, ROUND(AVG(s.salary), 2) AS avg_salary
    FROM t_salaries s JOIN t_employees e ON s.emp_no = e.emp_no JOIN t_dept_emp de ON e.emp_no = de.emp_no JOIN t_departments d ON de.dept_no = d.dept_no
    WHERE s.salary BETWEEN min_salary AND max_salary
    GROUP BY d.dept_no, e.gender
    ORDER BY d.dept_no;
    
END $$

DELIMITER ;

CALL avg_salary_in_range(50000, 90000);