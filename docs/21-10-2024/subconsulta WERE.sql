-- Subconsultas con WHERE
USE proyecto_bd2;

-- 1. Encontrar productos que nunca se han vendido
SELECT p.*
FROM products p
LEFT JOIN invoiceDetails id ON p.id = id.idProduct
WHERE id.idProduct IS NULL;

-- 2. Encontrar clientes que han gastado más que el promedio
SELECT p.*
FROM people p
INNER JOIN (
    SELECT idCustomer 
    FROM invoices 
    GROUP BY idCustomer 
    HAVING SUM(totalAmount) > (
        SELECT AVG(totalAmount) 
        FROM invoices
    )
) AS avgSpenders ON p.id = avgSpenders.idCustomer;