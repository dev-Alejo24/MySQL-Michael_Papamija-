USE borrador_pbd2;
select * from store;

-- indices agrupados
CREATE INDEX idxStoreId ON store(id);
DROP INDEX idxStoreId ON store;
SELECT * FROM store WHERE id=3;

CREATE  INDEX idxUsersId ON users(id);
SELECT * FROM users WHERE id=5;

CREATE  INDEX idxRolesId ON roles(id);
SELECT * FROM roles WHERE id=5;

CREATE  INDEX idxProductsId ON products(id);
SELECT * FROM products WHERE id=4;

CREATE  INDEX idxInvoicesId ON invoices(id);
SELECT * FROM invoices WHERE id=1;


-- indices no agrupados
CREATE INDEX idxStoreName ON store(`name`);
SELECT * FROM store WHERE `name` = 'Tienda de Barrio';

CREATE INDEX idxUsersEmail ON users(email);
SELECT email FROM users WHERE email LIKE 'maria%';

CREATE INDEX idxRolesName ON roles(`name`);
SELECT * FROM roles WHERE `name` = 'Proveedor';

CREATE INDEX idxProductsName ON products(`code`);
SELECT * FROM products WHERE `code` LIKE'A%';

CREATE INDEX idxInvoicesTotalAmount ON invoices(totalAmount);
 SELECT * FROM invoices WHERE totalAmount < 1000;
 
 
 -- indices unicos
 CREATE UNIQUE INDEX idxStoreNit ON store(nit);
 DROP INDEX idxStoreNit ON store;
 SELECT * FROM store WHERE nit LIKE'A%';

CREATE UNIQUE INDEX idxUsersEmailUnique ON users(email);
SELECT * 
FROM users 
WHERE email LIKE '%@example.com';

CREATE UNIQUE INDEX idxProductsCodeUnique ON products(`code`);
SELECT * FROM products WHERE `code` = 'JKL012';

CREATE UNIQUE INDEX idxPaymentReferenceUnique ON paymentGatewayRecords(`reference`);
SELECT COUNT(*) AS referenceExists FROM paymentGatewayRecords WHERE `reference` LIKE'REF%';


-- indices compuestos
CREATE INDEX idx_store_name_address ON store(name, address);
SELECT * FROM store WHERE name = 'Mini Market Express' AND address = 'Carrera Quinta 654';

CREATE INDEX idx_users_name_email ON users(`name`, email);
SELECT * FROM invoices WHERE invoiceDate > '2024-01-01' AND idCustomer = 5;

CREATE INDEX idx_products_name_price ON products(`name`, price);
SELECT `name`, price, stock FROM products 
WHERE `name` LIKE 'Le%' AND price > 500.00;


CREATE INDEX idx_invoices_date_customer ON invoices(invoiceDate, idCustomer);
SELECT idCustomer, COUNT(*) AS totalInvoices FROM invoices 
WHERE invoiceDate >= '2024-10-01' AND invoiceDate <= '2024-10-30' 
GROUP BY idCustomer;

