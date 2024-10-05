-- adicion de columnas
USE proyecto_bd2;

-- agregar campo de fecha de nacimiento
ALTER TABLE cliente
ADD fecha_nacimiento DATE;
