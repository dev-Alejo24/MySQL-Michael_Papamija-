USE proyecto_bd2;
-- CONSULTAS CON INNER JOIN

-- Listar productos por categoría
SELECT pc.`name` AS category, p.`name` AS product, p.price
FROM products p
INNER JOIN productsCategories pc ON p.idCategory = pc.id
ORDER BY pc.`name`, p.`name`;

-- Lista de empleados con sus turnos y salarios **agg al informe de consultas**
-- **CORREGIR**
SELECT u.id, p.firstName, p.lastNamePaternal, p.salary 
FROM shift s 
INNER JOIN people p ON s.id = p.idShift
INNER JOIN users u ON p.idUser = u.id
INNER JOIN usersRoles us ON us.idUser = u.id
INNER JOIN roles r ON r.id = us.idRole
WHERE r.`name` = 'Empleado';

-- Mostrar productos más caros por categoría
SELECT pc.`name` AS category, MAX(p.price) AS maxPrice 
FROM products p 
INNER JOIN productsCategories pc ON pc.id = p.idCategory
GROUP BY pc.`name`;

-- 2. shift, id, short name y user name de empleado  **CORREGIR**
SELECT CONCAT(UPPER(SUBSTRING(p.firstName, 1, 1)), '.', UPPER(p.lastNamePaternal)) AS shortName, p.salary
FROM people p 
INNER JOIN users u ON p.idUser = u.id
INNER JOIN usersRoles us ON us.idUser = u.id
INNER JOIN roles r ON r.id = us.idRole
WHERE p.salary > (SELECT AVG(salary) FROM people) AND r.`name` = 'Empleado';

-- Tipo de documento de people
SELECT p.id, CONCAT(UPPER(p.firstName), ' ', UPPER(SUBSTRING(p.lastNamePaternal, 1, 1)), '. ', UPPER(p.lastNameMaternal)) AS fullName, 
dt.`name` AS documentType
FROM people p 
INNER JOIN documentType dt ON p.idDocumentType = dt.id;

-- Lista de métodos de pago populares
SELECT pm.`name` AS paymentMethod, COUNT(pd.paymentAmount) AS totalPayments 
FROM paymentMethod pm 
INNER JOIN paymentDetail pd ON pd.idPaymentMethod = pm.id
GROUP BY pm.`name`
ORDER BY totalPayments DESC;

-- Empleados con salario mayor a la media **CORREGIR**
SELECT CONCAT(UPPER(SUBSTRING(p.firstName, 1, 1)), '.', UPPER(p.lastNamePaternal)) AS shortName, p.salary
FROM people p 
INNER JOIN users u ON p.idUser = u.id
INNER JOIN usersRoles us ON us.idUser = u.id
INNER JOIN roles r ON r.id = us.idRole
WHERE p.salary > (SELECT AVG(salary) FROM people) AND r.`name` = 'Empleado';

-- Lista de proveedores con más productos
SELECT sp.idSupplier, COUNT(sp.idProduct) AS numProducts, r.`name` AS role
FROM users u
INNER JOIN usersRoles us ON us.idUser = u.id
INNER JOIN roles r ON r.id = us.idRole
INNER JOIN supplierProduct sp ON sp.idSupplier = u.id
WHERE r.`name` = 'Proveedor' 
GROUP BY sp.idSupplier
ORDER BY numProducts DESC;

-- Empleados con salarios más altos por posición **CORREGIR**
SELECT jp.id, jp.`name` AS jobPosition, p.firstName, p.lastNamePaternal, MAX(p.salary) AS maxSalary 
FROM jobPosition jp 
INNER JOIN people p ON jp.id = p.idJobPosition
INNER JOIN users u ON p.idUser = u.id
INNER JOIN usersRoles us ON us.idUser = u.id
INNER JOIN roles r ON us.idRole = r.id
WHERE r.`name` = 'Empleado'
GROUP BY jp.id, jp.`name`, p.firstName, p.lastNamePaternal
ORDER BY maxSalary DESC;
