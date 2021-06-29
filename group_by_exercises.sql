
/* Create a new file named group_by_exercises.sql */

/* In your script, use DISTINCT to find the unique titles in the titles table.
How many unique titles have there ever been? Answer that in a comment in your SQL file. */

USE employees;

SELECT DISTINCT title
FROM titles;

/* 3.) Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY. 5 */

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

/* 4.) Write a query to to find all unique combinations of first and last names of all employees 
whose last names start and end with 'E'. 846 unique combinations*/

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name, first_name;

/* 5.) Write a query to find the unique last names with a 'q' but not 'qu'.
Include those names in a comment in your sql code. 3 row*/

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' and last_name NOT LIKE '%qu%'
GROUP BY last_name;

/* 6.) Add a COUNT() to your results (the query above) to find the number of employees with the same last name. 189 Chleq, 190 Lindqvist, 168 Qiwen*/

SELECT count(last_name), last_name
FROM employees
WHERE last_name LIKE '%q%' and last_name NOT LIKE '%qu%'
GROUP BY last_name;

/* 7.) Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*)
and GROUP BY to find the number of employees for each gender with those names. 232 Vidya, 241 Irena, 236 Maya*/

SELECT count(gender), first_name, gender
FROM employees
WHERE first_name in('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;

/* 8.) Using your query that generates a username for all of the employees,
generate a count employees for each unique username. Are there any duplicate usernames? yes, 285872 BONUS: How many duplicate usernames are there? */

USE employees;
SELECT LOWER(
CONCAT(SUBSTR(first_name, 1, 1), 
SUBSTR(last_name, 1, 4), "-", 
SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2))) as username, count(*) AS copies
FROM employees
GROUP BY username
ORDER BY copies DESC;
