USE proyecto_bd2;

-- TABLE DOCUMENT TYPE
INSERT INTO document_type (name) VALUES 
('Passport'),
('Driver License'),
('ID Card'),
('Resident Permit'),
('Social Security Number');
SELECT * FROM document_type;

-- TABLE USERS
INSERT INTO users (email, name, password) VALUES
('john.doe@example.com', 'John Doe', 'hashed_password_123'),
('jane.smith@example.com', 'Jane Smith', 'hashed_password_456'),
('maria.garcia@example.com', 'Maria Garcia', 'hashed_password_789'),
('peter.johnson@example.com', 'Peter Johnson', 'hashed_password_101'),
('linda.brown@example.com', 'Linda Brown', 'hashed_password_202');
SELECT * FROM users;

-- TABLE JOB POSITION
INSERT INTO job_position (name, description) VALUES
('Manager', 'Oversees operations'),
('Cashier', 'Handles customer transactions'),
('Sales Associate', 'Assists customers with purchases'),
('Warehouse Worker', 'Manages stock and inventory'),
('HR Specialist', 'Handles employee relations and recruitment');
SELECT * FROM job_position;

-- TABLE ROLES
INSERT INTO roles (name, description) VALUES
('Admin', 'Has full access to the system'),
('Customer', 'Can make purchases and view orders'),
('Supplier', 'Supplies products to the store'),
('Employee', 'Works in the store'),
('Manager', 'Oversees employee and store operations');
SELECT * FROM roles;

-- TABLE USERS_ROLES
INSERT INTO users_roles (idRole, idUser) VALUES
(1, 1),  -- John Doe is Admin
(2, 2),  -- Jane Smith is Customer
(3, 3),  -- Maria Garcia is Supplier
(4, 4),  -- Peter Johnson is Employee
(5, 5);  -- Linda Brown is Manager
SELECT * FROM users_roles;

-- TABLE SHIFT
INSERT INTO shift (name, description) VALUES
('Morning', 'From 8 AM to 4 PM'),
('Afternoon', 'From 12 PM to 8 PM'),
('Night', 'From 8 PM to 4 AM'),
('Weekend', 'Saturday and Sunday only'),
('Flexible', 'Shift varies based on need');
SELECT * FROM shift;

-- TABLE PEOPLE
INSERT INTO people (idUser, first_name, middle_name, last_name_maternal, last_name_paternal, idDocumentType, document, phone, address, idJobPosition, idShift, hiring_date, salary) VALUES
(1, 'John', 'Michael', 'Doe', 'Smith', 1, '123456789', '1234567890', '123 Main St', 1, 1, '2023-01-15', 5000),
(2, 'Jane', 'Elizabeth', 'Smith', 'Johnson', 2, '234567890', '1234567891', '456 Oak St', 2, 2, '2023-02-20', 3000),
(3, 'Maria', 'Carmen', 'Garcia', 'Lopez', 3, '345678901', '1234567892', '789 Pine St', 3, 3, '2023-03-25', 2500),
(4, 'Peter', 'James', 'Johnson', 'Brown', 4, '456789012', '1234567893', '101 Maple St', 4, 4, '2023-04-30', 3200),
(5, 'Linda', 'Marie', 'Brown', 'White', 5, '567890123', '1234567894', '202 Birch St', 5, 5, '2023-05-05', 4000);
SELECT * FROM people;

-- TABBLE PYMENT METHOD
INSERT INTO payment_method (name, description) VALUES
('Credit Card', 'Payment via credit card'),
('Debit Card', 'Payment via debit card'),
('Cash', 'Payment via cash'),
('Bank Transfer', 'Payment via bank transfer'),
('PayPal', 'Payment via PayPal account');

SELECT * FROM payment_method;

-- TABLE PAYMENT DETAIL
INSERT INTO payment_detail (idCustomer, payment_date, payment_amount, idPaymentMethod) VALUES
(1, '2024-09-01', 500.00, 1),
(2, '2024-09-02', 100.00, 2),
(3, '2024-09-03', 250.00, 3),
(4, '2024-09-04', 75.00, 4),
(5, '2024-09-05', 600.00, 5);
SELECT * FROM payment_detail;

-- TABLE PRODUCTS CATEGORIES
INSERT INTO products_categories (name, description) VALUES
('Electronics', 'Devices and gadgets'),
('Clothing', 'Apparel and accessories'),
('Groceries', 'Food and beverages'),
('Books', 'Printed and digital books'),
('Furniture', 'Home and office furniture');
SELECT * FROM products_categories;

-- TABLE PRODUCTS
INSERT INTO products (name, sku, price, price_discount, stock, idCategory, descrip) VALUES
('Laptop', 'ABC123', 999.99, 899.99, 10, 1, 'High-performance laptop with 16GB RAM'),
('T-Shirt', 'DEF456', 19.99, 14.99, 100, 2, 'Cotton T-shirt, various colors'),
('Apple', 'GHI789', 1.50, 1.00, 500, 3, 'Fresh organic apples'),
('Novel', 'JKL012', 12.99, 9.99, 50, 4, 'Bestselling fiction novel'),
('Office Chair', 'MNO345', 199.99, 149.99, 20, 5, 'Ergonomic office chair with lumbar support');
SELECT * FROM products;

-- TABLE SUPPLIER PRODUCT
INSERT INTO supplier_product (idSupplier, idProduct, quantity, purchase_price, sale_price, expiration_date) VALUES
(3, 1, 5, 800.00, 999.99, '2025-01-01'),
(3, 2, 50, 10.00, 19.99, '2025-02-01'),
(4, 3, 200, 0.80, 1.50, '2024-10-15'),
(5, 4, 25, 8.00, 12.99, '2025-03-01'),
(4, 5, 10, 100.00, 199.99, '2024-12-31');
SELECT * FROM supplier_product;

-- TABLE PRODUCT DETAILS
INSERT INTO product_details (idProduct, detailName, detailValue) VALUES
(1, 'Processor', 'Intel Core i7'),
(1, 'RAM', '16GB'),
(2, 'Material', '100% Cotton'),
(3, 'Weight', '200g per apple'),
(5, 'Dimensions', '24x24x36 inches');
SELECT * FROM product_details;

-- TABLE PEOPLE PHONE
INSERT INTO people_phone (idPeople, phone) VALUES
(1, '1234567890'),
(2, '1234567891'),
(3, '1234567892'),
(4, '1234567893'),
(5, '1234567894');
SELECT * FROM people_phone;