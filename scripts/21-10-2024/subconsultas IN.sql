USE proyecto_bd2;
-- Subconsultas con IN

-- 1. Encontrar todos los usuarios que tienen rol de administrador
SELECT *
FROM users
WHERE id IN (
    SELECT idUser 
    FROM usersRoles 
    WHERE idRole IN (
        SELECT id 
        FROM roles 
        WHERE `name` = 'Administrador'
    )
);

-- 2. Encontrar productos que están en tiendas con stock mayor a 100
SELECT *
FROM products
WHERE id IN (
    SELECT idProduct 
    FROM storeProducts 
    WHERE stock > 100
);
