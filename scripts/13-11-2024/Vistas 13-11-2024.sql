-- VISTAS 
USE proyecto_bd2;

-- 1.
CREATE OR REPLACE VIEW viewStoreProductDetails AS
SELECT 
    s.id AS storeId,
    s.`name` AS storeName,
    p.id AS productId,
    p.`name` AS productName,
    p.price,
    sp.stock AS storeStock,
    sp.restockDate
FROM store s
JOIN storeProducts sp ON s.id = sp.idStore
JOIN products p ON sp.idProduct = p.id;

SELECT * FROM viewStoreProductDetails;


-- 2.Pagos realizados por los clientes
CREATE OR REPLACE VIEW viewCustomerPayments AS
SELECT 
    u.id AS customerId,
    u.`name` AS customerName,
    pd.paymentDate,
    pd.paymentAmount,
    pm.`name` AS paymentMethod
FROM users u
JOIN paymentDetail pd ON u.id = pd.idCustomer
JOIN paymentMethod pm ON pd.idPaymentMethod = pm.id;

SELECT * FROM viewCustomerPayments;


-- 3.Resumen de las facturas emitidas
CREATE OR REPLACE VIEW viewSalesInvoice AS
SELECT 
    i.id AS invoiceId,
    i.invoiceDate,
    u.`name` AS customerName,
    i.totalAmount
FROM invoices i
JOIN users u ON i.idCustomer = u.id;

SELECT * FROM viewSalesInvoice;
SELECT * FROM viewSalesInvoice WHERE totalAmount < 1000;


-- 4.Productos suministrados
CREATE OR REPLACE VIEW viewSupplierProducts AS
SELECT 
    u.`name` AS supplierSame,
    p.`name` AS productSame,
    sp.quantity,
    sp.purchasePrice,
    sp.salePrice,
    sp.expirationDate
FROM supplierProduct sp
JOIN users u ON sp.idSupplier = u.id
JOIN products p ON sp.idProduct = p.id;

SELECT * FROM viewSupplierProducts;


-- 5.
CREATE OR REPLACE VIEW vieInvoiceProductDetails AS
SELECT 
    i.id AS invoiceId,
    i.invoiceDate,
    u.`name` AS customerName,
    p.`name` AS productName,
    id.quantity,
    id.price,
    id.total
FROM invoices i
JOIN invoiceDetails id ON i.id = id.idInvoice
JOIN users u ON i.idCustomer = u.id
JOIN products p ON id.idProduct = p.id;

SELECT *  FROM vieInvoiceProductDetails;