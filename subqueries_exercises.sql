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

/* Find all the current department managers that are female. List their names in a comment in your code. 
Isamu	Legleitner
Karsten	Sigstam
Leon	DasSarma
Hilary	Kambil*/

SELECT first_name, last_name
FROM employees
WHERE gender 
	IN(
	SELECT gender
	FROM employees
    WHERE gender = 'F'
	) 
    AND emp_no 
      IN(SELECT emp_no
      from dept_manager
      where to_date > now()
      );

/* Find all the employees who currently have a higher salary than the companies overall, historical average salary. */

SELECT last_name, first_name
FROM employees
WHERE emp_no IN(
	SELECT emp_no
    FROM salaries
      WHERE salary > 
      		(select 
      		avg(salary) 
      		from salaries
      		) AND salaries.to_date > now()
      	);
/* How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this? */

select count(*)
from employees
where emp_no in(
select emp_no
from salaries
where salaries.to_date > now() AND 

salary between (
			select salary
			from salaries
			where salaries.to_date > now() and emp_no in (
				SELECT emp_no
				FROM employees
				WHERE emp_no IN(
					SELECT emp_no
    				FROM salaries
      				WHERE salary = 
      					(select 
      					max(salary) 
      					from salaries
      					) AND salaries.to_date > now()
      				)
      			)
      			)-(
				select STD(salary)
				from salaries
				where salaries.to_date > now()) 
				
			AND 
				
				
				   (select salary
					from salaries
					where salaries.to_date > now() and emp_no in (
						SELECT emp_no
						FROM employees
						WHERE emp_no IN(
							SELECT emp_no
    						FROM salaries
      						WHERE salary = 
      							(select max(salary) 
      							from salaries
      							) AND salaries.to_date > now()
      						)
      					)
      				)
);
			
/* select STD(salary)
from salaries
where salaries.to_date > now();


select salary
from salaries
where salaries.to_date > now() and emp_no in (
	SELECT emp_no
	FROM employees
	WHERE emp_no IN(
		SELECT emp_no
    	FROM salaries
      	WHERE salary = 
      			(select 
      			max(salary) 
      			from salaries
      			) AND salaries.to_date > now()
      	)
      	); */