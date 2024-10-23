USE proyecto_bd2;

-- consultas avanzadas

-- NOMBRE COMPPLETO
SELECT people.id, CONCAT(UPPER(firstName), ' ', UPPER(SUBSTRING(lastNamePaternal, 1, 1)), '. ', UPPER(lastNamePaternal)) AS 
fullName FROM people;

-- REDONDEO DE SALARIO
SELECT id, ROUND(salary, 2) AS roundedSalary, ABS(salary - 3000) AS salaryDifference
FROM people
WHERE salary > 2000;

-- SALARIO SEGUN PUESTO DE TRABAJO **CORREGIR**
SELECT idJobPosition, SUM(salary) AS totalSalary, AVG(salary) AS averageSalary
FROM people
GROUP BY idJobPosition;

-- CANT EMPLEADOS POR PUESTO **CORREGIR**
SELECT jp.name AS position, COUNT(p.id) AS totalEmployees
FROM people p
JOIN jobPosition jp ON p.idJobPosition = jp.id
GROUP BY jp.name;

-- MAX-MIN PRODUCTS AGRUPADOS POR CATEGORIAS
SELECT idCategory, MAX(price) AS highestPrice, MIN(price) AS lowestPrice
FROM products
GROUP BY idCategory;