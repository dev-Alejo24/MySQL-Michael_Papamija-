-- actualizar registros 
USE proyecto_bd2;

-- Actualizar el salario del empleado con ID 2 a 1800.00
UPDATE empleado
SET salario = 1800.00
WHERE id_empleado = 2;

select * from empleado;

-- Actualizar el precio del producto con ID 1 a 320.00
UPDATE producto
SET precio = 320.00
WHERE id_producto = 1;

select * from producto;
