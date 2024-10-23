USE proyecto_bd2;

-- LEFT JOIN
SELECT u.`name`, r.`name`
FROM users u
LEFT JOIN usersRoles ur ON u.id = ur.idUser
LEFT JOIN roles r ON ur.idRole = r.id;

-- tipo de documento
SELECT p.firstName, dt.name
FROM people p
LEFT JOIN documentType dt ON p.idDocumentType = dt.id;

-- numeros de telefono
SELECT p.firstName, pp.phone
FROM people p
LEFT JOIN peoplePhone pp ON p.id = pp.idPeople;

-- productos con detalles
SELECT p.name, pd.detailName
FROM products p
LEFT JOIN productDetails pd ON p.id = pd.idProduct;


