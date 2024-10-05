DROP DATABASE IF EXISTS proyecto_bd2;
CREATE DATABASE proyecto_bd2;
USE proyecto_bd2;

CREATE TABLE document_type (
     id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(45) NOT NULL UNIQUE,
    `name` VARCHAR(35) NOT NULL,
    `password` VARCHAR(255) NOT NULL UNIQUE -- hashed password
);

CREATE TABLE people ( -- customer and employee
    id INT PRIMARY KEY AUTO_INCREMENT,
    idUser INT,
    FOREIGN KEY (idUser) REFERENCES users(id),
    first_name VARCHAR(30) NOT NULL,
	middle_name VARCHAR(15) NOT NULL,
    last_name_maternal VARCHAR(15) NOT NULL,
    last_name_paternal VARCHAR(15) NOT NULL,
    idDocumentType INT,
    FOREIGN KEY (idDocumentType) REFERENCES document_type(id),
    document VARCHAR(12) NOT NULL UNIQUE,
    phone VARCHAR(12),
    address VARCHAR(45),
    idJobPosition INT,
    FOREIGN KEY (idJobPosition) REFERENCES job_position(id),
    idShift INT,
    FOREIGN KEY (idShift) REFERENCES shift(idShift),
    hiring_date DATETIME NOT NULL,
    salary DOUBLE NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE roles(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(30) NOT NULL UNIQUE,
`description` TINYTEXT
);

CREATE TABLE users_roles(
id INT PRIMARY KEY AUTO_INCREMENT,
idRole INT,
FOREIGN KEY (idRole) REFERENCES roles(id),
idUser INT,
FOREIGN KEY (idUser) REFERENCES users(id),
UNIQUE(idRole, idUser) -- asegurando combinacion unica
);

CREATE TABLE job_position (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `description` TINYTEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE shift (
    id INT PRIMARY KEY AUTO_INCREMENT,
   `name` VARCHAR(15) NOT NULL UNIQUE,
    `description` TINYTEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE payment_method (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name`VARCHAR(45) NOT NULL,
    `description` TINYTEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Weak table: payment_detail
CREATE TABLE payment_detail (
    id INT PRIMARY KEY AUTO_INCREMENT, -- add primary key and convert to strong table
    idCustomer INT,
    FOREIGN KEY (idCustomer) REFERENCES users_roles(id), -- referencia table users_roles
    payment_date DATETIME NOT NULL,
    payment_amount DOUBLE NOT NULL,
    idPaymentMethod INT,
    FOREIGN KEY (idPaymentMethod) REFERENCES payment_method(idPaymentMethod),
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE products_categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `description` TEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE supplier_product(
	id INT PRIMARY KEY AUTO_INCREMENT,
	idSupplier INT,
    FOREIGN KEY (idSupplier) REFERENCES users_roles(id),
    idProduct INT,
    FOREIGN KEY (idProduct) REFERENCES products(id),
    quantity INT NOT NULL,
    purchase_price DECIMAL(10, 2) NOT NULL,
    sale_price DECIMAL(10, 2) NOT NULL,
    expiration_date DATE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    sku VARCHAR(20) UNIQUE NOT NULL, -- codigo del producto
    price DECIMAL(10, 2) NOT NULL,
    price_discount DECIMAL(10,2),
    stock INT NOT NULL DEFAULT 0,
    idCategory INT,
    FOREIGN KEY (idCategory) REFERENCES products_categories(id),
    descrip TEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE product_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idProduct INT,
    FOREIGN KEY (idProduct) REFERENCES products(id),
    detailName VARCHAR(50) NOT NULL,
    detailValue VARCHAR(100),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Multivalued attribute: customer phone
CREATE TABLE people_phone (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idPeople INT,
    FOREIGN KEY (idPeople) REFERENCES people(id),
    phone VARCHAR(12) NOT NULL,
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);