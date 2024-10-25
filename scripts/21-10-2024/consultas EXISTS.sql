USE proyecto_bd2;
-- Subconsulta con EXISTS

-- Encontrar tiendas que tienen al menos un producto con stock
SELECT *
FROM store s
WHERE EXISTS (
    SELECT 1 
    FROM storeProducts sp 
    WHERE sp.idStore = s.id 
    AND sp.stock > 0
);

-- encontrar todas las facturas que tienen al menos un detalle asociado en la tabla invoiceDetails
SELECT *
FROM invoices i
WHERE EXISTS (
    SELECT 1
    FROM invoiceDetails id
    WHERE id.idInvoice = i.id
);