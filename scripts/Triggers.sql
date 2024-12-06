-- Estructura de Triggers
CREATE TRIGGER trigger_name
    'timing' event
    ON table_name
    FOR EACH ROW
    trigger_body;

-- Tabla de auditoria
CREATE TABLE CoinsAudit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    organizationId INT,
    `name` VARCHAR(255),
    symbol VARCHAR(255),
    actionTime DATETIME,
    createdAt DATETIME
);
CREATE TABLE auditLogs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `user` VARCHAR(255),
    `action` VARCHAR(50),
    tableName VARCHAR(255),
    recordId INT,
    oldValue TEXT,
    newValue TEXT,
    actionTime DATETIME
);    

DELIMITER //    
CREATE TRIGGER beforeInsertCoins
    BEFORE INSERT
    ON Coins
    FOR EACH ROW
BEGIN
    IF NEW.`name` is not null THEN
        SET NEW.`name` = 'Moneda'; 
    END IF;
END//

DELIMITER ;
INSERT INTO Coins(organizationId,`name`,symbol) 
values(1,'Hola kolasjdoijdsodssa ','%');

DELIMITER //    
CREATE TRIGGER beforeUpdateCoins
    BEFORE UPDATE
    ON Coins
    FOR EACH ROW
BEGIN
    IF OLD.organizationId != NEW.organizationId THEN
        INSERT INTO CoinsAudit(organizationId, `name`, symbol,createdAt,actionTime)
        VALUES (OLD.organizationId,NEW.`name`, NEW.symbol, NOW(),NOW());
    END IF;
END//
DELIMITER ;

UPDATE Coins
SET organizationId = 3,
     `name`= 'ecuatorial',
     symbol = '$',
     createdAt ='2024-02-01 20:00:00'
where Coins.id = 6

DELIMITER //

CREATE TRIGGER afterUpdateCoins
AFTER UPDATE
ON Coins
FOR EACH ROW
BEGIN
    -- Solo registrar si la conexión es desde localhost
    IF CURRENT_USER() LIKE '%localhost%' THEN
        INSERT INTO auditLogs (`user`, `action`, tableName, recordId, oldValue, newValue, actionTime)
        VALUES (USER(), 'UPDATE', 'Coins', OLD.id, CONCAT('name: ', OLD.name, ', symbol: ', OLD.symbol), CONCAT('name: ', NEW.name, ', symbol: ', NEW.symbol), NOW());
    END IF;
END//

DELIMITER ;

UPDATE Coins
SET organizationId = 3,
     `name`= 'hola mundo',
     symbol = '$',
     createdAt ='2024-02-01 20:00:00'
where Coins.id = 5;

SHOW TRIGGERS;
SHOW TRIGGERS LIKE 'Coins';
DROP TRIGGER beforeUpdateCoins;
