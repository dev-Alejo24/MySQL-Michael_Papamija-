USE proyecto_bd2;
-- Subconsultas con ALL/ANY

-- 1. Encontrar productos más caros que todos los productos de una categoría específica
SELECT *
FROM products
WHERE price > ALL (
    SELECT price 
    FROM products 
    WHERE idCategory = 2
);

-- 2. Encontrar facturas con un monto mayor que cualquier pago individual realizado
SELECT *
FROM invoices
WHERE totalAmount > ANY (
    SELECT paymentAmount 
    FROM payment
);