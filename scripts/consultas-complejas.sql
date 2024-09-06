#consultas complejas
USE proyecto_bd2;

# Obtener el nombre y apellido de los empleados con salario mayor a 2000, ordenados por salario descendente:
SELECT nombre, apellido, salario
FROM empleado
WHERE salario > 2000
ORDER BY salario DESC;

#Obtener los detalles de ventas para productos con un precio entre 10 y 100
SELECT dv.id_detalle_venta, p.producto, dv.cantidad, p.precio
FROM detalle_venta dv
JOIN producto p ON dv.id_producto = p.id_producto
WHERE p.precio BETWEEN 10 AND 100;

-- clientes que inicien con la letra 'J'
SELECT * FROM cliente
WHERE nombre LIKE 'J%';

-- Obtener los productos que tienen un stock menor a 50 y su categoría es 'Electrónica
SELECT p.producto, p.stock, c.categoria
FROM producto p
JOIN categoria c ON p.id_categoria = c.id_categoria
WHERE p.stock < 50 AND c.categoria = 'Electrónica';

-- Obtener los proveedores que tienen un nombre que contiene la letra 'A' y cuyo NIT comienza con '1
SELECT * FROM proveedor
WHERE proveedor LIKE '%A%' AND nit LIKE '1%';



