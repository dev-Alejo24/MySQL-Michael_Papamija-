USE proyecto_bd2;
-- Subconsultas con FROM

-- 1. Obtener el promedio de ventas por cliente junto con sus datos personales
SELECT p.*, avgSales.promedioVentas
FROM people p
INNER JOIN (
    SELECT idCustomer, AVG(totalAmount) as promedioVentas 
    FROM invoices 
    GROUP BY idCustomer
) avgSales ON p.id = avgSales.idCustomer;

-- 2. Obtener los productos más vendidos por categoría
SELECT pc.`name` as categoria, topProducts.*
FROM productsCategories pc
INNER JOIN (
    SELECT p.idCategory, p.`name`, COUNT(id.idProduct) as vecesVendido
    FROM products p
    INNER JOIN invoiceDetails id ON p.id = id.idProduct
    GROUP BY p.id, p.`name`, p.idCategory
) topProducts ON pc.id = topProducts.idCategory;