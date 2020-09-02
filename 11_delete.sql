USE employees;

COMMIT;

DELETE FROM employees
WHERE emp_no = 999903;

SELECT * FROM employees WHERE emp_no = 999903;

# On delete cascade
select * from titles where emp_no = 999903;

ROLLBACK;

DELETE FROM departments
WHERE dept_no = "d010";

SELECT * FROM departments WHERE dept_no = "d010";

# DELETE without a WHERE clause will delete all records in a table!
#TRUNCATE does the same thing, but much faster (doesn't delete row by row)