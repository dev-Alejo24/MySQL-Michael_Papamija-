USE proyecto_bd2;

-- consultas avanzadas

-- NOMBRE COMPPLETO
SELECT CONCAT(UPPER(first_name), ' ', UPPER(SUBSTRING(last_name_paternal, 1, 1)), '. ', UPPER(last_name_maternal)) AS 
full_name FROM people;

-- REDONDEO DE SALARIO
SELECT id, ROUND(salary, 2) AS rounded_salary, ABS(salary - 3000) AS salary_difference
FROM people
WHERE salary > 2000;

-- SALARIO SEGUN PUESTO DE TRABAJO
SELECT idJobPosition, SUM(salary) AS total_salary, AVG(salary) AS average_salary
FROM people
GROUP BY idJobPosition;

-- CANT EMPLEADOS POR PUESTO
SELECT jp.name AS position, COUNT(p.id) AS total_employees
FROM people p
JOIN job_position jp ON p.idJobPosition = jp.id
GROUP BY jp.name;

-- MAX-MIN PRODUCTS AGRUPADOS POR CATEGORIAS
SELECT idCategory, MAX(price) AS highest_price, MIN(price) AS lowest_price
FROM products
GROUP BY idCategory;



