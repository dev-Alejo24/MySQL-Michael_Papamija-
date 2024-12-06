use parcial2;

CREATE VIEW coinsView AS
SELECT coins.*
FROM coins
WHERE coins.id = 1;

SELECT * FROM coinsView;

CREATE OR REPLACE VIEW coinsView AS
SELECT organizations.*
FROM organizations
WHERE organizations.id is not null;

DROP VIEW IF EXISTS coinsView;

SELECT TABLE_NAME
FROM information_schema.views
WHERE table_schema = 'parcial2';

SELECT * FROM Coins;

UPDATE Coins set `name`='COP' where id = 1