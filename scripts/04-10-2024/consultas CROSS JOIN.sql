USE proyecto_bd2;

-- CROSS JOIN

-- payment method and shift 
SELECT pm.name AS PaymentMethod, s.name AS Shift
FROM paymentMethod pm
CROSS JOIN shift s;

-- idSippler and paymentMethod
SELECT sp.idSupplier, pm.name AS PaymentMethod
FROM supplierProduct sp
CROSS JOIN paymentMethod pm;


