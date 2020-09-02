USE employees;

# iFNULL() and COALESCE() are used to substitute null values for another value

# Create duplicate table filled with the same data as departments table
CREATE TABLE departments_dup (
	dept_no CHAR(4),
    dept_name VARCHAR(40),
    PRIMARY KEY (dept_no)
);

INSERT INTO departments_dup 
SELECT * FROM departments;

SELECT * FROM departments_dup;

# Insert two new rows with null dept_name
INSERT INTO departments_dup (dept_no)
VALUES ('d010'), ('d011');

# Add new column for dept_manager after dept_name
ALTER TABLE employees.departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

COMMIT;

# IFNULL(x, y) returns x if not null, y if there is null value
SELECT dept_no, IFNULL(dept_name, "Department name not provided") AS dept_name
FROM departments_dup;
	
# COALESCE(x1, x2, ..., xN) returns first non null value reading left to right (ISNULL with more arguments)   
SELECT dept_no, dept_name, coalesce(dept_manager, dept_name, "N/A") AS dept_manager
FROM departments_dup;

SELECT dept_no, dept_name, coalesce('Department manager name') AS fake_column
FROM departments_dup;

SELECT ifnull(dept_no, 'N/A') AS dept_no, ifnull(dept_name, 'Department name not provided') AS dept_name, coalesce(dept_no, dept_name) AS dept_info
FROM departments_dup;


