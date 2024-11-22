USE proyecto_bd2;

-- INSERT INTO STORE
INSERT INTO store (`name`, address, phone, openingDate) VALUES
('Supermercado Central', 'Avenida Principal 123', '123456789', '2020-01-01'),
('Supermercado Norte', 'Calle Secundaria 456', '987654321', '2021-06-15'),
('Supermercado Sur', 'Calle Tercera 789', '456789123', '2022-03-10'),
('Tienda de Barrio', 'Calle Cuarta 987', '654321987', '2023-07-01'),
('Mini Market Express', 'Carrera Quinta 654', '789456123', '2024-02-20');
SELECT * FROM store;

-- TABLE DOCUMENT TYPE
INSERT INTO documentType (`name`) VALUES
('Cedula Ciudadania'),
('Cedula Extranjeria'),
('Tarjeta de Identidad'),
('Pasaporte'),
('Permiso de Residencia');
SELECT * FROM documentType;

-- TABLE USERS
INSERT INTO users (email, `name`, `password`) VALUES
('john.doe01@example.com', 'John Doe', 'jhon01_password_123'),
('jane.smith@example.com', 'Jane Smith', 'jane00_password_456'),
('maria.garcia@example.com', 'Maria Garcia', 'maria00_password_789'),
('peter.johnson@example.com', 'Peter Johnson', 'pete0r_password_101'),
('linda.brown@example.com', 'Linda Brown', 'linda0_password_202');
SELECT * FROM users;

-- TABLE ROLES
INSERT INTO roles (`name`, `description`) VALUES
('Administrador', 'Has full access to the system'),
('Cliente', 'Can make purchases and view orders'),
('Proveedor', 'Supplies products to the store'),
('Empleado', 'Works in the store'),
('Gerente', 'Oversees employee and store operations');
SELECT * FROM roles;

-- TABLE USERS_ROLES
INSERT INTO usersRoles (idRole, idUser) VALUES
(1, 1),  -- John Doe is Admin
(2, 2),  -- Jane Smith is Customer
(3, 3),  -- Maria Garcia is Supplier
(4, 4),  -- Peter Johnson is Employee
(5, 5);  -- Linda Brown is Manager
SELECT * FROM usersRoles;

-- TABLE SHIFT
INSERT INTO shift (`name`, `description`) VALUES
('Dia', 'From 8 AM to 4 PM'),
('Tarde', 'From 12 PM to 8 PM'),
('Noche', 'From 8 PM to 4 AM'),
('Fin de semana', 'Saturday and Sunday only'),
('Flexible', 'Shift varies based on need');
SELECT * FROM shift;

-- TABLE PEOPLE
INSERT INTO people (idUser, firstName, middleName, lastNameMaternal, lastNamePaternal, idDocumentType, document, phone, address, hiringDate, salary) VALUES
(1, 'John', 'Michael', 'Doe', 'Smith', 1, '123456789', '1234567890', '123 Main St', '2023-01-15', 5000),
(2, 'Jane', 'Elizabeth', 'Smith', 'Johnson', 2, '234567890', '1234567891', '456 Oak St', '2023-02-20', 3000),
(3, 'Maria', 'Carmen', 'Garcia', 'Lopez', 3, '345678901', '1234567892', '789 Pine St', '2023-03-25', 2500),
(4, 'Peter', 'James', 'Johnson', 'Brown', 4, '456789012', '1234567893', '101 Maple St', '2023-04-30', 3200),
(5, 'Linda', 'Marie', 'Brown', 'White', 5, '567890123', '1234567894', '202 Birch St', '2023-05-05', 4000);
SELECT * FROM people;

-- TABLE PAYMENT METHOD
INSERT INTO paymentMethod (`name`, `description`) VALUES
('Tarjeta de credito', 'Payment via credit card'),
('Tarjeta Debito', 'Payment via debit card'),
('Efectivo', 'Payment via cash'),
('Transferencia', 'Payment via bank transfer'),
('PayPal', 'Payment via PayPal account');
SELECT * FROM paymentMethod;

-- TABLE PAYMENT DETAIL
INSERT INTO paymentDetail (idCustomer, paymentDate, paymentAmount, idPaymentMethod) VALUES
(1, '2024-09-01', 500.00, 1),
(2, '2024-09-02', 100.00, 2),
(3, '2024-09-03', 250.00, 3),
(4, '2024-09-04', 75.00, 4),
(5, '2024-09-05', 600.00, 5);
SELECT * FROM paymentDetail;

-- TABLE PRODUCTS CATEGORIES
INSERT INTO productsCategories (`name`, `description`) VALUES
('Lacteos', 'Derivados de la leche'),
('Granos', 'Granos en general'),
('Embutidos', 'Carnicos embutidos como salchichas'),
('Enlatados', 'Productos enlatados como atún'),
('Bebidas', 'Bebidas sin gas como jugos, Bebidas gaseosas, energizantes y Alcoholicas');
SELECT * FROM productsCategories;

-- TABLE PRODUCTS
INSERT INTO products (`name`, `code`, price, priceDiscount, stock, idCategory, `description`) VALUES
('Leche', 'ABC123', 999.99, 899.99, 10, 1, 'Bolsa de leche marca Colanta'),
('Arroz', 'DEF456', 19.99, 14.99, 100, 2, 'Arroz marca Diana'),
('Chorizo', 'GHI789', 1.50, 1.00, 500, 3, 'Chorizos Zenú'),
('Atún', 'JKL012', 12.99, 9.99, 50, 4, 'Atún marca Isabell'),
('Coca-Cola', 'MNO345', 199.99, 149.99, 20, 5, 'Coca-Cola');
SELECT * FROM products;

-- TABLE STORE_PRODUCTS
INSERT INTO storeProducts (idStore, idProduct, stock, restockDate) VALUES
(1, 1, 20, '2024-09-15'),  -- Supermercado Central tiene stock de leche
(1, 2, 50, '2024-09-20'),  -- Supermercado Central tiene stock de arroz
(2, 3, 200, '2024-09-18'), -- Supermercado Norte tiene stock de chorizos
(3, 4, 75, '2024-09-25'),  -- Supermercado Sur tiene stock de atún
(4, 5, 40, '2024-09-30');  -- Tienda de Barrio tiene stock de Coca-Cola
SELECT * FROM storeProducts;

-- TABLE SUPPLIER PRODUCT
INSERT INTO supplierProduct (idSupplier, idProduct, quantity, purchasePrice, salePrice, expirationDate) VALUES
(3, 1, 5, 800.00, 999.99, '2025-01-01'),
(3, 2, 50, 10.00, 19.99, '2025-02-01'),
(4, 3, 200, 0.80, 1.50, '2024-10-15'),
(5, 4, 25, 8.00, 12.99, '2025-03-01'),
(4, 5, 10, 100.00, 199.99, '2024-12-31');
SELECT * FROM supplierProduct;

-- TABLE PRODUCT DETAILS
INSERT INTO productDetails (idProduct, detailName, detailValue) VALUES
(1, 'Bolsa', '900ml'),
(1, 'Libra', '500g'),
(2, 'Pack', '4% chorizos'),
(3, 'Lata Grande', '142g'),
(5, 'Tamaño', '1.5 litros');
SELECT * FROM productDetails;

-- TABLE PEOPLE PHONE
INSERT INTO peoplePhone (idPeople, phone) VALUES
(1, '1234567890'),
(2, '2234567891'),
(3, '3234567892'),
(4, '4234567893'),
(5, '5234567894');
SELECT * FROM peoplePhone;

-- INSERT INTO INVOICES
INSERT INTO invoices (invoiceDate, totalAmount, idCustomer) VALUES
('2024-10-01', 1250.50, 1),
('2024-10-02', 500.75, 2),
('2024-10-03', 799.99, 3),
('2024-10-04', 1200.00, 4),
('2024-10-05', 999.49, 5);
SELECT * FROM invoices;

-- INSERT INTO INVOICE DETAILS
INSERT INTO invoiceDetails (idInvoice, idProduct, quantity, price) VALUES
(1, 1, 2, 999.99), -- 2 unidades de Leche (factura 1)
(1, 2, 5, 19.99), -- 5 unidades de Arroz (factura 1)
(2, 3, 50, 1.50), -- 50 unidades de Chorizo (factura 2)
(3, 4, 10, 12.99), -- 10 unidades de Atún (factura 3)
(4, 5, 20, 199.99), -- 20 unidades de Coca-Cola (factura 4)
(5, 1, 3, 999.99), -- 3 unidades de Leche (factura 5)
(5, 4, 5, 12.99); -- 5 unidades de Atún (factura 5)
SELECT * FROM invoiceDetails;

-- INSERT INTO PAYMENT
INSERT INTO payment (idInvoice, paymentDate, idPaymentMethod, paymentAmount) VALUES
(1, '2024-10-01', 1, 1250.50), -- Pago de factura 1 con tarjeta de crédito
(2, '2024-10-02', 2, 500.75),  -- Pago de factura 2 con tarjeta de débito
(3, '2024-10-03', 3, 799.99),  -- Pago de factura 3 con efectivo
(4, '2024-10-04', 4, 1200.00), -- Pago de factura 4 con transferencia bancaria
(5, '2024-10-05', 5, 999.49);  -- Pago de factura 5 con PayPal
SELECT * FROM payment;

-- INSERT INTO PAYMENT GATEWAY RECORDS
INSERT INTO paymentGatewayRecords (reference, idPayment, dataRespons) VALUES
('REF-001-JOHNDOE', 1, 'Factura para John Doe, cliente regular'), -- Referencia para el pago de la factura 1
('REF-002-JANESMITH', 2, 'Factura generada por compra con descuento'), -- Referencia para el pago de la factura 2
('REF-003-MARIAGARCIA', 3, 'Pago realizado en efectivo, cliente satisfecho'), -- Referencia para el pago de la factura 3
('REF-004-PETERJOHNSON', 4, 'Factura urgente, se necesita entrega inmediata'), -- Referencia para el pago de la factura 4
('REF-005-LINDABROWN', 5, 'Factura procesada con PayPal'); -- Referencia para el pago de la factura 5
SELECT * FROM paymentGatewayRecords;
