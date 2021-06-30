use employees;


/* Find all the current employees with the same hire date as employee 101010 using a sub-query. 55 rows*/
SELECT first_name, last_name, hire_date
FROM employees
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
WHERE dept_emp.to_date > now() AND hire_date in(
	SELECT hire_date
	FROM employees
	WHERE emp_no = "101010"
	);

/* Find all the titles ever held by all current employees with the first name Aamod. */
SELECT title
FROM employees
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN titles
	ON titles.emp_no = employees.emp_no
WHERE dept_emp.to_date > now() AND first_name in(
	SELECT first_name
	FROM employees
	WHERE first_name = "Aamod"
	);


/* How many people in the employees table are no longer working for the company? Give the answer in a comment in your code. */

SELECT first_name, last_name
FROM employees
WHERE emp_no in(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_emp.to_date < now()
	);

/* Find all the current department managers that are female. List their names in a comment in your code. */

SELECT 
FROM employees
WHERE 

/* Find all the employees who currently have a higher salary than the companies overall, historical average salary. */



/* How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this? */