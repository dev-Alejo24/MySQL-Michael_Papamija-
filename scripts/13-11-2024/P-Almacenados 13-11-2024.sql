-- PROCEDIMIENTOS ALMACENADOS
USE proyecto_bd2;

-- 1. Procedimiento para Consultar una Tienda por su ID
DELIMITER //

CREATE PROCEDURE getStoreById (IN storeId INT)
BEGIN
    SELECT * FROM store WHERE id = storeId;
END //

DELIMITER ;

CALL getStoreById(2);


-- 2. Procedimiento para Consultar Productos por Categoría
DELIMITER //

CREATE PROCEDURE getProductsCategory (IN categoryId INT)
BEGIN
    SELECT * FROM products WHERE idCategory = categoryId;
END //

DELIMITER ;

CALL getProductsCategory(2)


-- 3.  Procedimiento para Agregar un Cliente (Persona) con Datos Básicos
DELIMITER //

CREATE PROCEDURE addCustomer(
    IN userEmail VARCHAR(255),
    IN userPassword VARCHAR(255),
    IN firstName VARCHAR(255),
     IN middleName VARCHAR(255),
    IN lastNameMaternal VARCHAR(255),
    IN lastNamePaternal VARCHAR(255),
    IN documentTypeId INT,
    IN document VARCHAR(255),
    IN phone VARCHAR(255),
    IN address VARCHAR(255),
    IN salary DOUBLE
)
BEGIN
    DECLARE userId INT;

    -- Insertar el usuario
    INSERT INTO users (email, `password`, `name`)
    VALUES (userEmail, userPassword, CONCAT(firstName, ' ', lastNamePaternal));

    -- Obtener el último id insertado para el usuario
    SET userId = LAST_INSERT_ID();

    -- Insertar la persona asociada al usuario
    INSERT INTO people (idUser, firstName, middleName, lastNameMaternal, lastNamePaternal, idDocumentType, document, phone, address, hiringDate, salary)
    VALUES (userId, firstName, lastNameMaternal, lastNamePaternal, documentTypeId, document, phone, address, NOW(), salary);
END //

DELIMITER ;

CALL addCustomer(
    'cliente@example.com', 'hashed_password', 'Carlos', 'Martinez', 'Perez', 
    1, '12345678', '555-1234', 'Calle Falsa 123', 2500.00
);
-- se agrega en las 2 tablas
select * from users;
select * from people