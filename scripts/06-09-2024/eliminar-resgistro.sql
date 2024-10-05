-- eliminar registros
USE proyecto_bd2;

-- eliminar el cliente con id=3
DELETE FROM cliente
WHERE id_cliente = 3;

select * from cliente;
