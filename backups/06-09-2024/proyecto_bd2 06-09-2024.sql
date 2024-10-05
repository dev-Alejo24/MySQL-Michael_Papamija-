DROP DATABASE IF EXISTS proyecto_bd2;
CREATE DATABASE proyecto_bd2;
USE proyecto_bd2;


CREATE TABLE tipo_documento(
id_tipo_documento INT PRIMARY KEY AUTO_INCREMENT,
tipo_documento VARCHAR(45),
createdAt DATETIME,
updatedAt DATETIME
);

CREATE TABLE cargo(
id_cargo INT PRIMARY KEY AUTO_INCREMENT,
cargo VARCHAR(45),
descripicion TINYTEXT,
createdAt DATETIME,
updatedAt DATETIME
);

CREATE TABLE turno(
id_turno INT PRIMARY KEY AUTO_INCREMENT,
turno VARCHAR(15),
descripicion TINYTEXT,
createdAt DATETIME,
updatedAt DATETIME
);

CREATE TABLE metodo_pago(
id_metodo_pago INT PRIMARY KEY AUTO_INCREMENT,
metodo_pago VARCHAR(15),
descripcion TINYTEXT,
createdAt DATETIME,
updatedAt DATETIME
);

CREATE TABLE cliente(
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30) NOT NULL,
apelllido VARCHAR(30) NOT NULL,
id_tipo_documento INT, #llave 
FOREIGN KEY (id_tipo_documento) REFERENCES tipo_documento(id_tipo_documento),
documento VARCHAR(12),
telefono VARCHAR(12),
email VARCHAR(35),
direccion VARCHAR(45),
createdAt DATETIME,
udatedAt DATETIME
);

CREATE TABLE empleado(
id_empleado INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30) NOT NULL,
apelllido VARCHAR(30) NOT NULL,
id_tipo_documento INT, #llave
FOREIGN KEY (id_tipo_documento) REFERENCES tipo_documento(id_tipo_documento),
documento VARCHAR(12),
telefono VARCHAR(12),
email VARCHAR(35),
direccion VARCHAR(45),
id_cargo INT, #llave 
FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo),
id_turno INT, #llave
FOREIGN KEY (id_turno) REFERENCES turno(id_turno),
fecha_contratacion DATETIME,
salario DOUBLE,
createdAt DATETIME,
udatedAt DATETIME
);

CREATE TABLE venta(
id_venta INT PRIMARY KEY AUTO_INCREMENT,
fecha DATETIME,
monto_total INT,
id_metodo_pago INT, #llave 
FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id_metodo_pago),
id_empleado INT, #llave
FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
id_cliente INT, #llave
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
createdAt DATETIME,
updatedAt DATETIME
);

CREATE TABLE categoria(
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
categoria VARCHAR(45),
descripcion TINYTEXT,
createdAt DATETIME,
updatedAt DATETIME
);

CREATE TABLE producto(
id_producto INT PRIMARY KEY AUTO_INCREMENT,
producto VARCHAR(45),
desccripcion TINYTEXT,
precio DOUBLE,
stock INT,
id_categoria INT, #llave 
FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
createdAt DATETIME,
updatedAt DATETIME
);

CREATE TABLE detalle_venta(
id_dettale_venta INT PRIMARY KEY AUTO_INCREMENT,
id_venta INT, #llave
FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
id_producto INT, #llave
FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
createdAt DATETIME,
updatedAt DATETIME
);

CREATE TABLE proveedor(
id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
proveedor VARCHAR(50),
nit VARCHAR(12),
telefono VARCHAR(12),
email VARCHAR(50),
direccion VARCHAR(50),
createdAt DATETIME,
updatedAt DATETIME
);

CREATE TABLE inventario(
id_inventario INT PRIMARY KEY,
id_producto INT, #llave 
cantidad_entrante INT,
fecha_entrada DATE,
id_proveedor INT, #llave
FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
cratedAt DATETIME,
updatedAt DATETIME
);