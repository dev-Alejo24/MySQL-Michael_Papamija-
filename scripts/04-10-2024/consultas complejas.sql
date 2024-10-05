USE proyecto_bd2;

-- LIKE
SELECT name, price, stock 
FROM products
WHERE name LIKE '%Laptop%' 
   OR name LIKE '%Chair%'
ORDER BY price DESC;

-- ORDER BY DESCUENTO
SELECT name, price, price_discount, stock 
FROM products
WHERE price_discount IS NOT NULL 
  AND price_discount < price
ORDER BY (price - price_discount) DESC;

-- METODO DE PAGO
SELECT name, description 
FROM payment_method
WHERE name LIKE 'C%' 
   OR description LIKE '%transfer%'
ORDER BY name ASC;
