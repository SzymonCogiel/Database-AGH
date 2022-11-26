CREATE DATABASE WymiarGeochronologiczny;

CREATE SCHEMA geo1;
-- 1

CREATE TABLE geo1.GeoEon
(
id_eon INTEGER NOT NULL PRIMARY KEY,
nazwa_eon VARCHAR(50) NOT NULL
);

CREATE TABLE geo1.GeoEra
(
id_era INTEGER NOT NULL PRIMARY KEY,
id_eon INTEGER REFERENCES geo1.GeoEon(id_eon),
nazwa_era VARCHAR(50) NOT NULL
);

CREATE TABLE geo1.GeoOkres
(
id_okres INTEGER NOT NULL PRIMARY KEY,
id_era INTEGER REFERENCES geo1.GeoEra(id_era),
nazwa_okres VARCHAR(50) NOT NULL
);

CREATE TABLE geo1.GeoWiek
(
id_lat INTEGER NOT NULL PRIMARY KEY,
lat INTEGER NOT NULL
);

CREATE TABLE geo1.GeoEpoka
(
id_epoka INTEGER NOT NULL PRIMARY KEY,
id_okres INTEGER REFERENCES geo1.GeoOkres(id_okres),
id_lat INTEGER REFERENCES geo1.GeoWiek(id_lat),
nazwa_epoka VARCHAR(50) NOT NULL
);

CREATE TABLE geo1.GeoPietro
(
id_pietro INTEGER NOT NULL PRIMARY KEY,
id_epoka INTEGER REFERENCES geo1.GeoEpoka(id_epoka),
nazwa_pietro VARCHAR(50) NOT NULL
);


-- 2
INSERT INTO geo1.GeoEon VALUES(1, 'Fanerozoik');
INSERT INTO geo1.GeoEra VALUES(1, 1, 'Paleozoik');
INSERT INTO geo1.GeoEra VALUES(2, 1, 'Mezozoik');
INSERT INTO geo1.GeoEra VALUES(3, 1, 'Kenozoik');
INSERT INTO geo1.GeoOkres VALUES(1, 1, 'Dewon');
INSERT INTO geo1.GeoOkres VALUES(2, 1, 'Karbon');
INSERT INTO geo1.GeoOkres VALUES(3, 1, 'Perm');
INSERT INTO geo1.GeoOkres VALUES(4, 2, 'Trias');
INSERT INTO geo1.GeoOkres VALUES(5, 2, 'Jura');
INSERT INTO geo1.GeoOkres VALUES(6, 2, 'Kreda');
INSERT INTO geo1.GeoOkres VALUES(7, 3, 'TrzeciorzedPaleogen');
INSERT INTO geo1.GeoOkres VALUES(8, 3, 'TrzeciorzedNeogen');
INSERT INTO geo1.GeoOkres VALUES(9, 3, 'Czwartorzed');
INSERT INTO geo1.GeoWiek VALUES(1, 395);
INSERT INTO geo1.GeoWiek VALUES(2, 345);
INSERT INTO geo1.GeoWiek VALUES(3, 280);
INSERT INTO geo1.GeoWiek VALUES(4, 230);
INSERT INTO geo1.GeoWiek VALUES(5, 195);
INSERT INTO geo1.GeoWiek VALUES(6, 140);
INSERT INTO geo1.GeoWiek VALUES(7, 65);
INSERT INTO geo1.GeoWiek VALUES(8, 22.5);
INSERT INTO geo1.GeoWiek VALUES(9, 1.8);
INSERT INTO geo1.GeoWiek VALUES(10, 0.010);
INSERT INTO geo1.GeoEpoka VALUES(1, 1, 1, 'Dolny');
INSERT INTO geo1.GeoEpoka VALUES(2, 1, 1, 'Srodkowy');
INSERT INTO geo1.GeoEpoka VALUES(3, 1, 1, 'Gorny');
INSERT INTO geo1.GeoEpoka VALUES(4, 2, 2, 'Dolny');
INSERT INTO geo1.GeoEpoka VALUES(5, 2, 2, 'Gorny');
INSERT INTO geo1.GeoEpoka VALUES(6, 3, 3, 'Dolny');
INSERT INTO geo1.GeoEpoka VALUES(7, 3, 3, 'Gorny');
INSERT INTO geo1.GeoEpoka VALUES(8, 4, 4, 'Dolna');
INSERT INTO geo1.GeoEpoka VALUES(9, 4, 4, 'Srodkowa');
INSERT INTO geo1.GeoEpoka VALUES(10, 4, 4, 'Gorna');
INSERT INTO geo1.GeoEpoka VALUES(11, 5, 5, 'Dolna');
INSERT INTO geo1.GeoEpoka VALUES(12, 5, 5, 'Srodkowa');
INSERT INTO geo1.GeoEpoka VALUES(13, 5, 5, 'Gorna');
INSERT INTO geo1.GeoEpoka VALUES(14, 6, 6, 'Dolna');
INSERT INTO geo1.GeoEpoka VALUES(15, 6, 6, 'Gorna');
INSERT INTO geo1.GeoEpoka VALUES(16, 7, 7, 'Paleocen');
INSERT INTO geo1.GeoEpoka VALUES(17, 7, 7, 'Eocen');
INSERT INTO geo1.GeoEpoka VALUES(18, 7, 7, 'Oligocen');
INSERT INTO geo1.GeoEpoka VALUES(19, 8, 8, 'Miocen');
INSERT INTO geo1.GeoEpoka VALUES(20, 8, 8, 'Pliocen');
INSERT INTO geo1.GeoEpoka VALUES(21, 9, 9, 'Plejstocen');
INSERT INTO geo1.GeoEpoka VALUES(22, 9, 10, 'Holocen');
INSERT INTO geo1.GeoPietro VALUES(1, 1, 'Lachkow');
INSERT INTO geo1.GeoPietro VALUES(2, 1, 'Prag');
INSERT INTO geo1.GeoPietro VALUES(3, 1, 'Ems');
INSERT INTO geo1.GeoPietro VALUES(4, 2, 'Eifel');
INSERT INTO geo1.GeoPietro VALUES(5, 2, 'Zywet');
INSERT INTO geo1.GeoPietro VALUES(6, 3, 'Fran');
INSERT INTO geo1.GeoPietro VALUES(7, 3, 'Famen');
INSERT INTO geo1.GeoPietro VALUES(8, 6, 'Assel');
INSERT INTO geo1.GeoPietro VALUES(9, 6, 'Sakmar');
INSERT INTO geo1.GeoPietro VALUES(10, 6, 'Artinsk');
INSERT INTO geo1.GeoPietro VALUES(11, 6, 'Kangur');
INSERT INTO geo1.GeoPietro VALUES(12, 7, 'Ufa');
INSERT INTO geo1.GeoPietro VALUES(13, 7, 'Kazan');
INSERT INTO geo1.GeoPietro VALUES(14, 7, 'Tatar');
INSERT INTO geo1.GeoPietro VALUES(15, 8, 'Ind');
INSERT INTO geo1.GeoPietro VALUES(16, 8, 'Olenek');
INSERT INTO geo1.GeoPietro VALUES(17, 9, 'Anizyk');
INSERT INTO geo1.GeoPietro VALUES(18, 9, 'Ladyn');
INSERT INTO geo1.GeoPietro VALUES(19, 10, 'Karnik');
INSERT INTO geo1.GeoPietro VALUES(20, 10, 'Noryk');
INSERT INTO geo1.GeoPietro VALUES(21, 10, 'Retyk');
INSERT INTO geo1.GeoPietro VALUES(22, 11, 'Hetang');
INSERT INTO geo1.GeoPietro VALUES(23, 11, 'Synemur');
INSERT INTO geo1.GeoPietro VALUES(24, 11, 'Pliensbach');
INSERT INTO geo1.GeoPietro VALUES(25, 11, 'Toark');
INSERT INTO geo1.GeoPietro VALUES(26, 12, 'Aalen');
INSERT INTO geo1.GeoPietro VALUES(27, 12, 'Bajos');
INSERT INTO geo1.GeoPietro VALUES(28, 12, 'Baton');
INSERT INTO geo1.GeoPietro VALUES(29, 12, 'Kelowej');
INSERT INTO geo1.GeoPietro VALUES(30, 13, 'Oksford');
INSERT INTO geo1.GeoPietro VALUES(31, 13, 'Kimeryd');
INSERT INTO geo1.GeoPietro VALUES(32, 13, 'Tyton');
INSERT INTO geo1.GeoPietro VALUES(33, 14, 'Berias');
INSERT INTO geo1.GeoPietro VALUES(34, 14, 'Walanzyn');
INSERT INTO geo1.GeoPietro VALUES(35, 14, 'Hoteryw');
INSERT INTO geo1.GeoPietro VALUES(36, 14, 'Barrem');
INSERT INTO geo1.GeoPietro VALUES(37, 14, 'Apt');
INSERT INTO geo1.GeoPietro VALUES(38, 14, 'Alb');
INSERT INTO geo1.GeoPietro VALUES(39, 15, 'Cenoman');
INSERT INTO geo1.GeoPietro VALUES(40, 15, 'Turon');
INSERT INTO geo1.GeoPietro VALUES(41, 15, 'Koniak');
INSERT INTO geo1.GeoPietro VALUES(42, 15, 'Santon');
INSERT INTO geo1.GeoPietro VALUES(43, 15, 'Kampan');
INSERT INTO geo1.GeoPietro VALUES(44, 15, 'Mastrycht');
INSERT INTO geo1.GeoPietro VALUES(45, 16, 'Dan');
INSERT INTO geo1.GeoPietro VALUES(46, 16, 'Zeland');
INSERT INTO geo1.GeoPietro VALUES(47, 16, 'Tanet');
INSERT INTO geo1.GeoPietro VALUES(48, 17, 'Iprez');
INSERT INTO geo1.GeoPietro VALUES(49, 17, 'Lutet');
INSERT INTO geo1.GeoPietro VALUES(50, 17, 'Barton');
INSERT INTO geo1.GeoPietro VALUES(51, 17, 'Priabon');
INSERT INTO geo1.GeoPietro VALUES(52, 18, 'Rupel');
INSERT INTO geo1.GeoPietro VALUES(53, 18, 'Szat');
INSERT INTO geo1.GeoPietro VALUES(54, 19, 'Akwitan');
INSERT INTO geo1.GeoPietro VALUES(55, 19, 'Burdygal');
INSERT INTO geo1.GeoPietro VALUES(56, 19, 'Lang');
INSERT INTO geo1.GeoPietro VALUES(57, 19, 'Serrawal');
INSERT INTO geo1.GeoPietro VALUES(58, 19, 'Torton');
INSERT INTO geo1.GeoPietro VALUES(59, 19, 'Mesyn');
INSERT INTO geo1.GeoPietro VALUES(60, 20, 'Zankl');
INSERT INTO geo1.GeoPietro VALUES(61, 20, 'Piacent');
INSERT INTO geo1.GeoPietro VALUES(62, 20, 'Gelas');


-- 3

SELECT geo1.GeoPietro.id_pietro, geo1.GeoPietro.nazwa_pietro, geo1.GeoEpoka.id_epoka,
geo1.GeoEpoka.nazwa_epoka, geo1.GeoOkres.id_okres, geo1.GeoOkres.nazwa_okres, geo1.GeoEra.id_era,
geo1.GeoEra.nazwa_era, geo1.GeoEon.id_eon, geo1.GeoEon.nazwa_eon
INTO GeoTabela
FROM geo1.GeoPietro
JOIN geo1.GeoEpoka ON geo1.GeoEpoka.id_epoka = geo1.GeoPietro.id_epoka
JOIN geo1.GeoOkres ON geo1.GeoOkres.id_okres = geo1.GeoEpoka.id_okres
JOIN geo1.GeoEra ON geo1.GeoEra.id_era = geo1.GeoOkres.id_era
JOIN geo1.GeoEon ON geo1.GeoEon.id_eon = geo1.GeoEra.id_eon;


-- 4
ALTER TABLE GeoTabela
ADD PRIMARY KEY (id_pietro);



-- 5
CREATE TABLE geo1.Dziesiec
(
cyfra INTEGER NOT NULL PRIMARY KEY
);
INSERT INTO geo1.Dziesiec VALUES(1);
INSERT INTO geo1.Dziesiec VALUES(2);
INSERT INTO geo1.Dziesiec VALUES(3);
INSERT INTO geo1.Dziesiec VALUES(4);
INSERT INTO geo1.Dziesiec VALUES(5);
INSERT INTO geo1.Dziesiec VALUES(6);
INSERT INTO geo1.Dziesiec VALUES(7);
INSERT INTO geo1.Dziesiec VALUES(8);
INSERT INTO geo1.Dziesiec VALUES(9);

-- 6
CREATE TABLE geo1.Milion
(
liczba INTEGER NOT NULL PRIMARY KEY
);

WITH RECURSIVE ID(number)
AS
(
 SELECT 1 AS number
 UNION ALL
 SELECT number + 1
 FROM ID
 WHERE number < 1000000
)
INSERT INTO geo1.Milion SELECT number
 FROM ID;


-- 7. Dodanie indeksów do tabeli, ponieważ w porównaniu do SQL Server indeksy nie tworzą się automatycznie po dodaniu klucza głownego

CREATE INDEX id_eon ON geo1.GeoEon(id_eon);
CREATE INDEX id_era ON geo1.GeoEra(id_era);
CREATE INDEX id_epoka ON geo1.GeoEpoka(id_epoka);
CREATE INDEX id_okres ON geo1.GeoOkres(id_okres);
CREATE INDEX id_piet ON geo1.GeoPietro(id_pietro);
CREATE INDEX id_lat ON geo1.GeoWiek(id_lat);
CREATE INDEX liczba ON geo1.Milion(liczba);
CREATE INDEX cyfra ON geo1.Dziesiec(cyfra);
CREATE INDEX id_pietro ON GeoTabela(id_pietro);


-- 8.

SELECT COUNT(*) AS zl1
FROM geo1.Milion
JOIN GeoTabela ON (geo1.Milion.liczba % 62) = GeoTabela.id_pietro;


SELECT COUNT(*) AS zl2
FROM geo1.Milion
JOIN geo1.GeoPietro ON (geo1.Milion.liczba % 62) = geo1.GeoPietro.id_pietro
JOIN geo1.GeoEpoka ON geo1.GeoEpoka.id_epoka = geo1.GeoPietro.id_epoka
JOIN geo1.GeoOkres ON geo1.GeoOkres.id_okres = geo1.GeoEpoka.id_okres
JOIN geo1.GeoEra ON geo1.GeoEra.id_era = geo1.GeoOkres.id_era
JOIN geo1.GeoEon ON geo1.GeoEon.id_eon = geo1.GeoEra.id_eon;

SELECT COUNT(*) AS zg3
FROM geo1.Milion
WHERE (geo1.Milion.liczba % 62) =
(SELECT id_pietro
FROM GeoTabela
WHERE (geo1.Milion.liczba % 62) = (id_pietro));



SELECT COUNT(*) AS zg4
FROM geo1.Milion
WHERE (geo1.Milion.liczba % 62) IN
(SELECT geo1.GeoPietro.id_pietro
FROM geo1.GeoPietro
JOIN geo1.GeoEpoka ON geo1.GeoEpoka.id_epoka = geo1.GeoPietro.id_epoka
JOIN geo1.GeoOkres ON geo1.GeoOkres.id_okres = geo1.GeoEpoka.id_okres
JOIN geo1.GeoEra ON geo1.GeoEra.id_era = geo1.GeoOkres.id_era
JOIN geo1.GeoEon ON geo1.GeoEon.id_eon = geo1.GeoEra.id_eon);


-- DROP DATABASE WymiarGeochronologiczny;
-- DROP SCHEMA geo1 CASCADE;
-- DROP TABLE geotabela;
-- grant usage on schema public to public;

SELECT version();