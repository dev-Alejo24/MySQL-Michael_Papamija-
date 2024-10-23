USE proyecto_bd2;

-- RIGTH JOIN

-- roles y ususarios
SELECT r.name, u.name
FROM usersRoles ur
RIGHT JOIN roles r ON ur.idRole = r.id
RIGHT JOIN users u ON ur.idUser = u.id;

-- shift 
SELECT s.name, p.firstName
FROM shift s
RIGHT JOIN people p ON p.idShift = s.id;

-- metodos de pago
SELECT pm.name, pd.paymentAmount
FROM paymentMethod pm
RIGHT JOIN paymentDetail pd ON pd.idPaymentMethod = pm.id;


