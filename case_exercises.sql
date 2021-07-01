


/* Write a query that returns all employees (emp_no), their department number, their start date, , and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. */

USE employees; #using employees DB
/* in the select section im including the department number, their start date, and a is_current_employee columns.  */
SELECT  employees.emp_no, 
		dept_no,
		hire_date, -- I understood this as either the start date of a new position or the start date(hire_date) with the company as a whole.  I went with hire_date
		dept_emp.to_date, 
		IF
			(dept_emp.to_date > now(), True, False) AS is_current_employee -- if statement checking if employee is still at the company. 1 for yes and 0 for no
FROM employees
JOIN dept_emp on dept_emp.emp_no = employees.emp_no; -- Joined the department employees and employee table by employee number


/* Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name. */

USE employees; #using employees DB

/* I am selecting all last names and creating a case group called aplha group */
SELECT 
	last_name, 
	CASE
		WHEN last_name between 'A%' and 'I%' THEN 'A-H' -- I used in between a - i vs a - h because h was not inclusive 
		WHEN last_name between 'I%' and 'R%' THEN 'I-Q' -- I used in between i - r vs a - q because q was not inclusive 
		WHEN last_name between 'R%' and 'Z%' THEN 'R-Z' -- I used in between r - z vs a - z because z was not inclusive 
		ELSE 'R-Z'
		END AS alpha_group
FROM employees
ORDER BY last_name;

/* How many employees (current or previous) were born in each decade? */

#using employees DB
USE employees;
/* In this select statement we have count and two if statements returning a 0 or 1 if its in the 50's or 60's */
SELECT count(*),
		-- Used an If statement instead of case because this seemed to make more sense to me. 
		 IF
			(birth_date like '195%', True, False) AS 50s, -- in the 50s column you should expect a 1 for true and 0 for no
		IF
			(birth_date like '196%', True, False) AS 60s -- in the 60s column you should expect a 1 for true and 0 for no

FROM employees
GROUP By 50s, 60s; -- grouping by 50s and 60s

########################################### Bonus ###########################################

/* What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service? */

USE employees;
SELECT dept_name,
	CASE 
	WHEN departments.dept_name = 'Customer Service' THEN (select avg(salary)
FROM employees
JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
JOIN salaries
ON salaries.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Customer Service' and dept_emp.to_date > now())
	ELSE NULL	END AS 'AVG Salary',

	
	CASE
	WHEN departments.dept_name = 'Marketing' THEN (select avg(salary)
FROM employees
JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
JOIN salaries
ON salaries.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Marketing' and dept_emp.to_date > now())
	ELSE NULL	END AS 'AVG Salary'
FROM employees
JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
JOIN salaries
ON salaries.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
Group By dept_name;


select avg(salary)
FROM employees
JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
JOIN salaries
ON salaries.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Marketing' and dept_emp.to_date > now();

SELECTdept_name,COUNT(CASE	WHEN title = 'Senior Engineer' THEN title 
	ELSE NULL	END) AS 'Senior Engineer'



