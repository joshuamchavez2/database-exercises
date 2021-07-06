
use employees;

/* 
1	Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name,
	last_name, and dept_name for employees currently with that department.
*/

CREATE TEMPORARY TABLE germain_1487.employees_with_departments AS
	SELECT first_name, last_name, dept_name
	FROM employees
	JOIN dept_emp 
		ON dept_emp.emp_no = employees.emp_no
	JOIN departments
		ON departments.dept_no = dept_emp.dept_no
	WHERE dept_emp.to_date > now();

SELECT *
FROM germain_1487.employees_with_departments;
/*
1A	Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.
*/

DESCRIBE germain_1487.employees_with_departments;
ALTER TABLE germain_1487.employees_with_departments ADD fullname VARCHAR();
ALTER TABLE germain_1487.employees_with_departments CHANGE fullname full_name VARCHAR(30);

SELECT *
FROM germain_1487.employees_with_departments;

/*
1B	Update the table so that full name column contains the correct data.
*/

UPDATE germain_1487.employees_with_departments SET fullname = CONCAT(first_name, " ", last_name);

SELECT *
FROM germain_1487.employees_with_departments;

/* 
1C	Remove the first_name and last_name columns from the table.
*/

DESCRIBE germain_1487.employees_with_departments;
ALTER TABLE germain_1487.employees_with_departments DROP COLUMN first_name;
ALTER TABLE germain_1487.employees_with_departments DROP COLUMN last_name;


/* 
1D What is another way you could have ended up with this same table? You could have just added select concat(first, last)
	orginially without first and last name.  also adding the dept_name.
*/

#####################################################################################
/* 
2	Create a temporary table based on the payment table from the sakila database.

	Write the SQL necessary to transform the amount column such that it is
	stored as an integer representing the number of cents
	of the payment. For example, 1.99 should become 199.
*/
USE sakila;
CREATE TEMPORARY TABLE germain_1487.payment_from_sakila as 
SELECT *
FROM payment;

DESCRIBE germain_1487.payment_from_sakila;

ALTER TABLE germain_1487.payment_from_sakila CHANGE amount amount float;
UPDATE germain_1487.payment_from_sakila SET amount = amount * 100;
ALTER TABLE germain_1487.payment_from_sakila CHANGE amount amount int;

SELECT *
FROM germain_1487.payment_from_sakila;


/*
3	Find out how the current average pay in each department compares to the overall, historical average pay. 
	In order to make the comparison easier, you should use the Z-score for salaries.
	In terms of salary, what is the best department right now to work for? The worst? 
*/
#CREATE TEMPORARY TABLE germain_1487.casecurrent_emp AS

SELECT 
    CASE
			WHEN dept_name IN ('Customer Service') THEN "Customer Service"
			WHEN dept_name IN ('Finance') THEN "Finance"
			WHEN dept_name IN ('Human Resources') THEN "Human Resources"
			WHEN dept_name IN ('Sales') THEN "Sales"
			WHEN dept_name IN ('Marketing') THEN "Marketing"
			WHEN dept_name IN ('Production') THEN "Production"
			WHEN dept_name IN ('Quality Management') THEN "Quality Management"
			WHEN dept_name IN ('Research') THEN "Research"
			WHEN dept_name IN ('Development') THEN "Development"
			ELSE "Bugs"
    END as dept, AVG(salary) as current
FROM germain_1487.current_emp
GROUP BY dept;


CREATE TEMPORARY TABLE germain_1487.casenotcurrent_emp AS
SELECT 
    CASE
			WHEN dept_name IN ('Customer Service') THEN "Customer Service"
			WHEN dept_name IN ('Finance') THEN "Finance"
			WHEN dept_name IN ('Human Resources') THEN "Human Resources"
			WHEN dept_name IN ('Sales') THEN "Sales"
			WHEN dept_name IN ('Marketing') THEN "Marketing"
			WHEN dept_name IN ('Production') THEN "Production"
			WHEN dept_name IN ('Quality Management') THEN "Quality Management"
			WHEN dept_name IN ('Research') THEN "Research"
			WHEN dept_name IN ('Development') THEN "Development"
			ELSE "Bugs"
    END as dept, AVG(salary) as notcurrent, STD(salary) as std
FROM germain_1487.notcurrent_emp
GROUP BY dept;

CREATE TEMPORARY TABLE germain_1487.final AS
SELECT germain_1487.casecurrent_emp.dept, current, notcurrent, std
FROM germain_1487.casecurrent_emp
	JOIN germain_1487.casenotcurrent_emp
		ON germain_1487.casenotcurrent_emp.dept = germain_1487.casecurrent_emp.dept;

select dept, ((current - notcurrent)/std) as ZScore
FROM germain_1487.final
ORDER BY ZScore DESC;

CREATE TEMPORARY TABLE germain_1487.current_emp AS
SELECT first_name, last_name, employees.emp_no, dept_name, salary
FROM employees
	JOIN dept_emp 
		ON dept_emp.emp_no = employees.emp_no
	JOIN departments
		ON departments.dept_no = dept_emp.dept_no
	JOIN salaries
		ON salaries.emp_no = employees.emp_no
	WHERE	(dept_emp.to_date > now())
		AND
				(salaries.to_date > now());

CREATE TEMPORARY TABLE germain_1487.notcurrent_emp AS
SELECT first_name, last_name, employees.emp_no, dept_name, salary
FROM employees
	JOIN dept_emp 
		ON dept_emp.emp_no = employees.emp_no
	JOIN departments
		ON departments.dept_no = dept_emp.dept_no
	JOIN salaries
		ON salaries.emp_no = employees.emp_no
	WHERE salaries.to_date != '9999-01-01';


