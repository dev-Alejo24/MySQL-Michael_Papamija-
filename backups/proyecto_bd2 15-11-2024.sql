 DROP DATABASE IF EXISTS proyecto_bd2;
CREATE DATABASE proyecto_bd2;
USE proyecto_bd2;

-- NEW TABLE TRIGGERS
CREATE TABLE auditLogs(
id INT PRIMARY KEY AUTO_INCREMENT
);

-- NEW TABLE
CREATE TABLE store(
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255),
    address VARCHAR(255),
    nit VARCHAR(20), -- NIT como VARCHAR,
    phone VARCHAR(255),
    openingDate date,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE documentType(
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- SE ELIMINA jobPosition que es similar a rolesusersusers
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    `name` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL UNIQUE, -- hashed password
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE roles(
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL UNIQUE,
    `description` TINYTEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE usersRoles(
    id INT PRIMARY KEY AUTO_INCREMENT,
    idRole INT,
    FOREIGN KEY (idRole) REFERENCES roles(id),
    idUser INT,
    FOREIGN KEY (idUser) REFERENCES users(id),
    UNIQUE(idRole, idUser), -- asegurando combinacion unica
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- DIRECTA A USERS
-- **CORECCION DE CONEXION A STORE**
CREATE TABLE shift (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL UNIQUE,
    `description` TINYTEXT,
    idStore INT,
    FOREIGN KEY (idStore) REFERENCES store(id), -- Corrección de referencia a store
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE paymentMethod (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` TINYTEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE people ( -- customer and employee
    id INT PRIMARY KEY AUTO_INCREMENT,
    idUser INT,
    FOREIGN KEY (idUser) REFERENCES users(id),
    firstName VARCHAR(255) NOT NULL,
    middleName VARCHAR(255),
    lastNameMaternal VARCHAR(255) NOT NULL,
    lastNamePaternal VARCHAR(255) NOT NULL,
    idDocumentType INT,
    FOREIGN KEY (idDocumentType) REFERENCES documentType(id),
    document VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(255),
    address VARCHAR(255),
    hiringDate DATETIME NOT NULL,
    salary DOUBLE NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE paymentDetail (
    id INT PRIMARY KEY AUTO_INCREMENT, -- add primary key and convert to strong table
    idCustomer INT,
    FOREIGN KEY (idCustomer) REFERENCES users(id), -- Corregida la referencia a users
    paymentDate DATETIME NOT NULL,
    paymentAmount DOUBLE NOT NULL,
    idPaymentMethod INT,
    FOREIGN KEY (idPaymentMethod) REFERENCES paymentMethod(id),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE productsCategories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `code` VARCHAR(255) UNIQUE NOT NULL, -- codigo del producto
    price DECIMAL(10, 2) NOT NULL,
    priceDiscount DECIMAL(10,2),
    stock INT NOT NULL DEFAULT 0,
    idCategory INT,
    FOREIGN KEY (idCategory) REFERENCES productsCategories(id),
    `description` TEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- NEW TABLE
CREATE TABLE storeProducts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    idStore INT,
    FOREIGN KEY (idStore) REFERENCES store(id),
    idProduct INT,
    FOREIGN KEY (idProduct) REFERENCES products(id),
    stock BIGINT,
    restockDate DATE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE supplierProduct(
    id INT PRIMARY KEY AUTO_INCREMENT,
    idSupplier INT,
    FOREIGN KEY (idSupplier) REFERENCES users(id), -- Relacion directa con users
    idProduct INT,
    FOREIGN KEY (idProduct) REFERENCES products(id),
    quantity INT NOT NULL,
    purchasePrice DECIMAL(10, 2) NOT NULL,
    salePrice DECIMAL(10, 2) NOT NULL,
    expirationDate DATE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE productDetails (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idProduct INT,
    FOREIGN KEY (idProduct) REFERENCES products(id),
    detailName VARCHAR(255) NOT NULL,
    detailValue VARCHAR(255),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE peoplePhone (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idPeople INT,
    FOREIGN KEY (idPeople) REFERENCES people(id),
    phone VARCHAR(255) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- TABLE INVOICES
CREATE TABLE invoices (
    id INT PRIMARY KEY AUTO_INCREMENT,
    invoiceDate DATETIME NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    idCustomer INT,
    FOREIGN KEY (idCustomer) REFERENCES users(id), -- conexion a *users*
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- TABLE INVOICE DETAILS
CREATE TABLE invoiceDetails (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idInvoice INT,
    FOREIGN KEY (idInvoice) REFERENCES invoices(id),
    idProduct INT,
    FOREIGN KEY (idProduct) REFERENCES products(id),
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    total DECIMAL(10, 2) GENERATED ALWAYS AS (quantity * price) STORED, -- auto-calculated
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- TABLE PAYMENT
CREATE TABLE payment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idInvoice INT,
    FOREIGN KEY (idInvoice) REFERENCES invoices(id),
    paymentDate DATETIME NOT NULL,
    idPaymentMethod INT,
    FOREIGN KEY (idPaymentMethod) REFERENCES paymentMethod(id),
    paymentAmount DECIMAL(10, 2) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- TABLE PAYMENT GATEWAY RECORDS
CREATE TABLE paymentGatewayRecords (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reference VARCHAR(255) NOT NULL, -- store reference or transaction code
    idPayment INT,
    FOREIGN KEY (idPayment) REFERENCES payment(id), -- Link to payment table
	dataRespons TEXT, -- Additional data or information related to the invoice ******************
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
