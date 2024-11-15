-- TIGGERS
USE proyecto_bd2;

-- 1. beforeInsert en la tabla payment
DELIMITER //

CREATE TRIGGER beforeInsertPayment
BEFORE INSERT
ON payment
FOR EACH ROW
BEGIN
    IF NEW.paymentAmount IS NULL THEN
        SET NEW.paymentAmount = 0.00;
    END IF;
END //

DELIMITER ;


-- 2. afterInsert en la tabla payment
DELIMITER //

CREATE TRIGGER afterInsertPayment
AFTER INSERT
ON payment
FOR EACH ROW
BEGIN
    INSERT INTO auditLogs (`user`, `action`, tableName, recordId, newValue, actionTime)
    VALUES (USER(), 'INSERT', 'payment', NEW.id, CONCAT('paymentAmount: ', NEW.paymentAmount), NOW());
END //

DELIMITER ;


-- 3. beforeUpdate en la tabla products
DELIMITER //

CREATE TRIGGER beforeUpdateProducts
BEFORE UPDATE
ON products
FOR EACH ROW
BEGIN
    IF OLD.price != NEW.price OR OLD.stock != NEW.stock THEN
        INSERT INTO auditLogs (`user`, `action`, tableName, recordId, oldValue, newValue, actionTime)
        VALUES (USER(), 'BEFORE UPDATE', 'products', OLD.id, 
                CONCAT('price: ', OLD.price, ', stock: ', OLD.stock), 
                CONCAT('price: ', NEW.price, ', stock: ', NEW.stock), NOW());
    END IF;
END //

DELIMITER ;


-- 4. afterUpdate en la tabla people

DELIMITER //

CREATE TRIGGER afterUpdatePeople
AFTER UPDATE
ON people
FOR EACH ROW
BEGIN
    INSERT INTO auditLogs (`user`, `action`, tableName, recordId, oldValue, newValue, actionTime)
    VALUES (USER(), 'AFTER UPDATE', 'people', OLD.id, 
            CONCAT('firstName: ', OLD.firstName, ', lastNamePaternal: ', OLD.lastNamePaternal), 
            CONCAT('firstName: ', NEW.firstName, ', lastNamePaternal: ', NEW.lastNamePaternal), NOW());
END //

DELIMITER ;


-- 5. beforeDelete en la tabla invoices
DELIMITER //

CREATE TRIGGER beforeDeleteInvoices
BEFORE DELETE
ON invoices
FOR EACH ROW
BEGIN
    INSERT INTO auditLogs (`user`, `action`, tableName, recordId, oldValue, actionTime)
    VALUES (USER(), 'BEFORE DELETE', 'invoices', OLD.id, CONCAT('totalAmount: ', OLD.totalAmount), NOW());
END //

DELIMITER ;


-- consultar los TRIGERS individualmente para mayores detalles 
SHOW CREATE TRIGGER beforeDeleteInvoices;

-- consulta todos los TRIGGERS que tenga la base de datos
SHOW TRIGGERS FROM proyecto_bd2;