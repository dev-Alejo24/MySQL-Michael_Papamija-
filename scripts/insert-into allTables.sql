#INGRESAR DATOS A LAS TABLAS 
USE  proyecto_bd2;

-- Insertar registros en tipo_documento
INSERT INTO tipo_documento (tipo_documento) VALUES
('Cédula de Ciudadanía'),
('Pasaporte'),
('Tarjeta de Identidad');

-- Insertar registros en cargo
INSERT INTO cargo (cargo, descripcion) VALUES
('Gerente', 'Responsable de la gestión general de la empresa'),
('Vendedor', 'Encargado de la venta de productos'),
('Contador', 'Responsable de la contabilidad');

-- Insertar registros en turno
INSERT INTO turno (turno, descripcion) VALUES
('Mañana', 'Turno de 8 AM a 4 PM'),
('Tarde', 'Turno de 4 PM a 12 AM'),
('Noche', 'Turno de 12 AM a 8 AM');

-- Insertar registros en metodo_pago
INSERT INTO metodo_pago (metodo_pago, descripcion) VALUES
('Efectivo', 'Pago en efectivo'),
('Tarjeta de Crédito', 'Pago con tarjeta de crédito'),
('Transferencia Bancaria', 'Pago mediante transferencia bancaria');

-- Insertar registros en cliente
INSERT INTO cliente (nombre, apellido, id_tipo_documento, documento, telefono, email, direccion) VALUES
('Juan', 'Pérez', 1, '1234567890', '3001234567', 'juan.perez@example.com', 'Calle 123'),
('María', 'Gómez', 2, 'A098765432', '3009876543', 'maria.gomez@example.com', 'Avenida 456'),
('Carlos', 'Martínez', 3, 'T123456789', '3004567890', 'carlos.martinez@example.com', 'Carrera 789');

-- Insertar registros en empleado
INSERT INTO empleado (nombre, apellido, id_tipo_documento, documento, telefono, email, direccion, id_cargo, id_turno, fecha_contratacion, salario) VALUES
('Ana', 'López', 1, '1234567890', '3101234567', 'ana.lopez@example.com', 'Calle 321', 1, 1, '2024-01-15 09:00:00', 3000.00),
('Luis', 'Rivas', 2, 'A987654321', '3109876543', 'luis.rivas@example.com', 'Avenida 654', 2, 2, '2024-02-10 10:00:00', 1500.00),
('Laura', 'Sánchez', 3, 'T987654321', '3104567890', 'laura.sanchez@example.com', 'Carrera 987', 3, 3, '2024-03-05 11:00:00', 2500.00);

-- Insertar registros en venta
INSERT INTO venta (fecha, monto_total, id_metodo_pago, id_empleado, id_cliente) VALUES
('2024-09-01 15:30:00', 150.00, 1, 1, 1),
('2024-09-02 16:00:00', 200.00, 2, 2, 2),
('2024-09-03 17:45:00', 250.00, 3, 3, 3);

-- Insertar registros en categoria
INSERT INTO categoria (categoria, descripcion) VALUES
('Electrónica', 'Dispositivos electrónicos como teléfonos y computadoras'),
('Ropa', 'Ropa y accesorios'),
('Alimentos', 'Productos alimenticios');

-- Insertar registros en producto
INSERT INTO producto (producto, descripcion, precio, stock, id_categoria) VALUES
('Teléfono', 'Teléfono móvil de última generación', 300.00, 50, 1),
('Camiseta', 'Camiseta de algodón', 20.00, 100, 2),
('Arroz', 'Paquete de arroz de 1 kg', 5.00, 200, 3);

-- Insertar registros en detalle_venta
INSERT INTO detalle_venta (id_venta, id_producto, cantidad) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 5);

-- Insertar registros en proveedor
INSERT INTO proveedor (proveedor, nit, telefono, email, direccion) VALUES
('Proveedor A', '1234567890', '3001234567', 'contacto@proveedora.com', 'Calle Proveedor 1'),
('Proveedor B', '0987654321', '3009876543', 'contacto@proveedorb.com', 'Avenida Proveedor 2'),
('Proveedor C', '1122334455', '3004567890', 'contacto@proveedorc.com', 'Carrera Proveedor 3');

-- Insertar registros en inventario
INSERT INTO inventario (id_producto, cantidad_entrante, fecha_entrada, id_proveedor) VALUES
(1, 20, '2024-09-01', 1),
(2, 50, '2024-09-02', 2),
(3, 30, '2024-09-03', 3);

-- Insertar registros en habilidad
INSERT INTO habilidad (habilidad) VALUES
('Ventas'),
('Contabilidad'),
('Atención al Cliente');

-- Insertar registros en empleado_habilidad
INSERT INTO empleado_habilidad (id_empleado, id_habilidad) VALUES
(1, 1),
(2, 2),
(3, 3);
