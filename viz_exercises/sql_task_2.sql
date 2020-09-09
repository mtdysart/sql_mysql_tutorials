# Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990
USE employees_mod;

# The active column will be used to count the number of managers by year
CREATE VIEW active_dept_managers AS
    SELECT 
        d.dept_name,
        e.gender,
        dm.emp_no,
        dm.from_date,
        dm.to_date,
        calendar_years.calendar_year,
        CASE
            WHEN
                YEAR(dm.from_date) <= calendar_year
                    AND calendar_year <= YEAR(dm.to_date)
            THEN
                1
            ELSE 0
        END AS active
    FROM
        t_dept_manager dm
            CROSS JOIN
        (SELECT 
            YEAR(hire_date) AS calendar_year
        FROM
            t_employees
        WHERE
            hire_date >= '1990-01-01'
        GROUP BY calendar_year) AS calendar_years
            JOIN
        t_departments d ON dm.dept_no = d.dept_no
            JOIN
        t_employees e ON dm.emp_no = e.emp_no
    ORDER BY dm.emp_no , calendar_year; 

SELECT * FROM active_dept_managers;