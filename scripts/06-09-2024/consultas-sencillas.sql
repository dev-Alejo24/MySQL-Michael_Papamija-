# consultas sencillas
USE proyecto_bd2;

SELECT * FROM tipo_documento;
SELECT * FROM cargo;
SELECT * FROM turno;
SELECT * FROM metodo_pago;
SELECT * FROM cliente;
SELECT * FROM empleado;
SELECT * FROM venta;
SELECT * FROM categoria;
SELECT * FROM producto;
SELECT * FROM detalle_venta;
SELECT * FROM proveedor;
SELECT * FROM inventario;
SELECT * FROM habilidad;
SELECT * FROM empleado_habilidad;

SELECT * FROM producto
WHERE precio > 50;

SELECT * FROM venta
WHERE id_empleado = 1;



