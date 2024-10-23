-- Subconsultas con SELECT
USE proyecto_bd2;

-- 1. Mostrar cada factura con el total de productos diferentes que incluye
SELECT i.*, 
COUNT(idProduct) AS numProductosDiferentes
FROM invoices i
LEFT JOIN invoiceDetails id ON i.id = id.idInvoice
GROUP BY i.id;

-- 2. Mostrar cada producto con su última fecha de venta
SELECT p.*, 
    (SELECT MAX(invoiceDate) 
     FROM invoices i 
     INNER JOIN invoiceDetails id ON i.id = id.idInvoice 
     WHERE id.idProduct = p.id) AS ultimaventa
FROM products p;