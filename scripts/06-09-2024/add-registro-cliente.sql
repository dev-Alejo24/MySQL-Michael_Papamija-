-- adicion de registro en cliente
USE proyecto_bd2; 

-- agrega un nuevo cliente
INSERT INTO cliente (nombre, apellido, id_tipo_documento, documento, telefono, email, direccion, fecha_nacimiento) VALUES
('Sofía', 'Ramírez', 1, '2345678901', '3105678901', 'sofia.ramirez@example.com', 'Calle 456', '1990-07-15');
