USE proyecto_bd2;
ALTER TABLE  users MODIFY COLUMN `password` VARBINARY(255);

UPDATE users SET `password` = AES_ENCRYPT(`password`, '123456789')
WHERE users = users.id = 1;
select * from users;


-- encriptar valor simple 
SET @laintext = '123456789';
SET @ciphertext = AES_ENCRYPT(@plaintext, '1234567890');

-- verificar valor  cifrado
SELECT HEX(@ciphertext);

-- desencriptar el valor
SELECT CAST(AES_DECRYPT(@ciphertext, '1234567890') AS CHAR);


select * from users;


-- POLITOCAS DE LAS CONTRASEÑAS: TENGAN TIEMPO DE EXPIRACION

-- AUDITRIA DE ACCIONES 
/*HABILITAR PLUGINS(HERRAMIENTAS PARA POLITICAS EXTERNAS)*/
SHOW PLUGINS; -- del motor de busqueda
SELECT VERSION();
SET GLOBAL general_log = 'ON'; -- ACTIVAR LA AUDITORIA y se automatiza al ingresar mas datos
SHOW VARIABLES LIKE 'general_log%' -- guarda en un archivo(acciones realizadas -> update,insert...)
