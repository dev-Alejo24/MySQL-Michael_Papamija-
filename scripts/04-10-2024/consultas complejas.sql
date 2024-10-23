USE proyecto_bd2;

-- LIKE
SELECT name, price, stock 
FROM products
WHERE name LIKE '%Arroz%' 
   OR name LIKE '%Leche%'
ORDER BY price DESC;

-- ORDER BY DESCUENTO
SELECT `name`, price, priceDiscount, stock 
FROM products
WHERE priceDiscount IS NOT NULL 
  AND priceDiscount < price
ORDER BY (price - priceDiscount) DESC;

-- METODO DE PAGO
SELECT `name`, `description` 
FROM paymentMethod
WHERE name LIKE 'T%' 
   OR description LIKE '%Transferencia%'
ORDER BY name ASC;
