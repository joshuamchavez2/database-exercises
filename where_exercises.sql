


DESCRIBE employees;


SELECT first_name, last_name
FROM employees
WHERE first_name IN('Irena', 'Vidya', 'Maya');

#709 records returned

SELECT *
FROM employees
WHERE first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';

#709 records returned

SELECT *
FROM employees

WHERE 
(first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya')
AND
(gender = 'M');
#441 records returned

SELECT *
FROM employees
WHERE last_name like 'E%';

#7330 records found

SELECT *
FROM employees
WHERE (last_name not like 'E%')
AND
(last_name like '%E');
#How many employees have a last name that ends with E, but does not start with E = 23393

SELECT *
FROM employees
WHERE (last_name like 'E%')
or
(last_name like '%E');
#Number of employees whose last name starts or ends with E = 30723

/* 
Find all current or previous employees employees whose last name starts and ends with 'E'. 
Enter a comment with the number of employees whose last name starts and ends with E. 
How many employees' last names end with E, regardless of whether they start with E? */

SELECT *
FROM employees
WHERE (last_name like 'E%') AND (last_name like '%E');

# Enter a comment with the number of employees whose last name starts and ends with E = 899

SELECT *
FROM employees
WHERE (last_name like '%E');

# How many employees' last names end with E, regardless of whether they start with E = 24292

SELECT *
FROM employees
WHERE hire_date LIKE '199%';

#135214 employees were hired in 1990s

SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';

#842 employees bday is on christmas

SELECT *
FROM employees
WHERE (hire_date LIKE '199%')
AND
(birth_date LIKE '%12-25');

#362 employees born on christmas and hired in the 90s

SELECT *
FROM employees
WHERE (last_name like '%q%');

#1873 employees have the letter q in their last name.

SELECT *
FROM employees
WHERE (last_name like '%q%') and (last_name not like '%qu%');

#547 employees have q but not qu in last name


