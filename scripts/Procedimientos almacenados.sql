use parcial2;

DELIMITER //

CREATE PROCEDURE getStores (IN storeId VARCHAR(50))
BEGIN
    SELECT * FROM stores WHERE id = storeId COLLATE utf8mb4_unicode_ci;
END //

DELIMITER ;
DROP PROCEDURE IF EXISTS getStores;
CALL getStores('38cc3d85-62c4-4008-b337-eaedfdba0f26');

DELIMITER //

CREATE PROCEDURE getOrganizations (IN organizationId INT)
BEGIN
    SELECT * FROM organizations WHERE id = organizationId;
END //

DELIMITER ;

CALL getOrganizations(2);
DELIMITER //

CREATE PROCEDURE updateCoinsAndAudit(
    IN coinId INT,
    IN newName VARCHAR(255),
    IN newSymbol VARCHAR(255),
    IN newOrganizationId INT
)
BEGIN
    -- Actualizar la tabla Coins
    UPDATE Coins
    SET `name` = newName, symbol = newSymbol, organizationId = newOrganizationId
    WHERE id = coinId;

    -- Insertar una auditoría de la actualización
    INSERT INTO CoinsAudit (organizationId, `name`, symbol, createdAt, actionTime)
    VALUES (newOrganizationId, newName, newSymbol, NOW(), NOW());
END//

DELIMITER ;
DROP PROCEDURE IF EXISTS updateCoinsAndAudit;
CALL updateCoinsAndAudit(1,'COLOMBIANA','$',1);
-- Verifica la colación de la columna 'id' en la tabla 'stores'
SHOW FULL COLUMNS FROM stores;


SELECT * FROM stores;
SELECT * FROM organizations;

SELECT ROUTINE_NAME
FROM information_schema.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'
  AND ROUTINE_SCHEMA = 'parcial2';
