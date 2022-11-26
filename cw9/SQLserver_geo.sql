CREATE DATABASE WymiarGeochronologiczny;


CREATE TABLE GeoEon
(
id_eon INTEGER NOT NULL PRIMARY KEY,
nazwa_eon VARCHAR(50) NOT NULL
);
CREATE TABLE GeoEra
(
id_era INTEGER NOT NULL PRIMARY KEY,
id_eon INTEGER FOREIGN KEY REFERENCES GeoEon(id_eon),
nazwa_era VARCHAR(50) NOT NULL
);
CREATE TABLE GeoOkres
(
id_okres INTEGER NOT NULL PRIMARY KEY,
id_era INTEGER FOREIGN KEY REFERENCES GeoEra(id_era),
nazwa_okres VARCHAR(50) NOT NULL
);

CREATE TABLE GeoWiek
(
id_lat INTEGER NOT NULL PRIMARY KEY,
lata INTEGER NOT NULL
);

CREATE TABLE GeoEpoka
(
id_epoka INTEGER NOT NULL PRIMARY KEY,
id_okres INTEGER FOREIGN KEY REFERENCES GeoOkres(id_okres),
id_lat INTEGER FOREIGN KEY REFERENCES GeoWiek(id_lat),
nazwa_epoka VARCHAR(50) NOT NULL
);

CREATE TABLE GeoPietro
(
id_pietro INTEGER NOT NULL PRIMARY KEY,
id_epoka INTEGER FOREIGN KEY REFERENCES GeoEpoka(id_epoka),
nazwa_pietro VARCHAR(50) NOT NULL
);


INSERT INTO GeoEon Values(1, 'Fanerozoik');
INSERT INTO GeoEra Values(1, 1, 'Paleozoik');
INSERT INTO GeoEra Values(2, 1, 'Mezozoik');
INSERT INTO GeoEra Values(3, 1, 'Kenozoik');
INSERT INTO GeoOkres Values(1, 1, 'Dewon');
INSERT INTO GeoOkres Values(2, 1, 'Karbon');
INSERT INTO GeoOkres Values(3, 1, 'Perm');
INSERT INTO GeoOkres Values(4, 2, 'Trias');
INSERT INTO GeoOkres Values(5, 2, 'Jura');
INSERT INTO GeoOkres Values(6, 2, 'Kreda');
INSERT INTO GeoOkres Values(7, 3, 'TrzeciorzedPaleogen');
INSERT INTO GeoOkres Values(8, 3, 'TrzeciorzedNeogen');
INSERT INTO GeoOkres Values(9, 3, 'Czwartorzed');
INSERT INTO GeoWiek Values(1, 395);
INSERT INTO GeoWiek Values(2, 345);
INSERT INTO GeoWiek Values(3, 280);
INSERT INTO GeoWiek Values(4, 230);
INSERT INTO GeoWiek Values(5, 195);
INSERT INTO GeoWiek Values(6, 140);
INSERT INTO GeoWiek Values(7, 65);
INSERT INTO GeoWiek Values(8, 22.5);
INSERT INTO GeoWiek Values(9, 1.8);
INSERT INTO GeoWiek Values(10, 0.010);
INSERT INTO GeoEpoka Values(1, 1, 1, 'Dolny');
INSERT INTO GeoEpoka Values(2, 1, 1, 'Srodkowy');
INSERT INTO GeoEpoka Values(3, 1, 1, 'Gorny');
INSERT INTO GeoEpoka Values(4, 2, 2, 'Dolny');
INSERT INTO GeoEpoka Values(5, 2, 2, 'Gorny');
INSERT INTO GeoEpoka Values(6, 3, 3, 'Dolny');
INSERT INTO GeoEpoka Values(7, 3, 3, 'Gorny');
INSERT INTO GeoEpoka Values(8, 4, 4, 'Dolna');
INSERT INTO GeoEpoka Values(9, 4, 4, 'Srodkowa');
INSERT INTO GeoEpoka Values(10, 4, 4, 'Gorna');
INSERT INTO GeoEpoka Values(11, 5, 5, 'Dolna');
INSERT INTO GeoEpoka Values(12, 5, 5, 'Srodkowa');
INSERT INTO GeoEpoka Values(13, 5, 5, 'Gorna');
INSERT INTO GeoEpoka Values(14, 6, 6, 'Dolna');
INSERT INTO GeoEpoka Values(15, 6, 6, 'Gorna');
INSERT INTO GeoEpoka Values(16, 7, 7, 'Paleocen');
INSERT INTO GeoEpoka Values(17, 7, 7, 'Eocen');
INSERT INTO GeoEpoka Values(18, 7, 7, 'Oligocen');
INSERT INTO GeoEpoka Values(19, 8, 8, 'Miocen');
INSERT INTO GeoEpoka Values(20, 8, 8, 'Pliocen');
INSERT INTO GeoEpoka Values(21, 9, 9, 'Plejstocen');
INSERT INTO GeoEpoka Values(22, 9, 10, 'Holocen');
INSERT INTO GeoPietro Values(1, 1, 'Lachkow');
INSERT INTO GeoPietro Values(2, 1, 'Prag');
INSERT INTO GeoPietro Values(3, 1, 'Ems');
INSERT INTO GeoPietro Values(4, 2, 'Eifel');
INSERT INTO GeoPietro Values(5, 2, 'Zywet');
INSERT INTO GeoPietro Values(6, 3, 'Fran');
INSERT INTO GeoPietro Values(7, 3, 'Famen');
INSERT INTO GeoPietro Values(8, 6, 'Assel');
INSERT INTO GeoPietro Values(9, 6, 'Sakmar');
INSERT INTO GeoPietro Values(10, 6, 'Artinsk');
INSERT INTO GeoPietro Values(11, 6, 'Kangur');
INSERT INTO GeoPietro Values(12, 7, 'Ufa');
INSERT INTO GeoPietro Values(13, 7, 'Kazan');
INSERT INTO GeoPietro Values(14, 7, 'Tatar');
INSERT INTO GeoPietro Values(15, 8, 'Ind');
INSERT INTO GeoPietro Values(16, 8, 'Olenek');
INSERT INTO GeoPietro Values(17, 9, 'Anizyk');
INSERT INTO GeoPietro Values(18, 9, 'Ladyn');
INSERT INTO GeoPietro Values(19, 10, 'Karnik');
INSERT INTO GeoPietro Values(20, 10, 'Noryk');
INSERT INTO GeoPietro Values(21, 10, 'Retyk');
INSERT INTO GeoPietro Values(22, 11, 'Hetang');
INSERT INTO GeoPietro Values(23, 11, 'Synemur');
INSERT INTO GeoPietro Values(24, 11, 'Pliensbach');
INSERT INTO GeoPietro Values(25, 11, 'Toark');
INSERT INTO GeoPietro Values(26, 12, 'Aalen');
INSERT INTO GeoPietro Values(27, 12, 'Bajos');
INSERT INTO GeoPietro Values(28, 12, 'Baton');
INSERT INTO GeoPietro Values(29, 12, 'Kelowej');
INSERT INTO GeoPietro Values(30, 13, 'Oksford');
INSERT INTO GeoPietro Values(31, 13, 'Kimeryd');
INSERT INTO GeoPietro Values(32, 13, 'Tyton');
INSERT INTO GeoPietro Values(33, 14, 'Berias');
INSERT INTO GeoPietro Values(34, 14, 'Walanzyn');
INSERT INTO GeoPietro Values(35, 14, 'Hoteryw');
INSERT INTO GeoPietro Values(36, 14, 'Barrem');
INSERT INTO GeoPietro Values(37, 14, 'Apt');
INSERT INTO GeoPietro Values(38, 14, 'Alb');
INSERT INTO GeoPietro Values(39, 15, 'Cenoman');
INSERT INTO GeoPietro Values(40, 15, 'Turon');
INSERT INTO GeoPietro Values(41, 15, 'Koniak');
INSERT INTO GeoPietro Values(42, 15, 'Santon');
INSERT INTO GeoPietro Values(43, 15, 'Kampan');
INSERT INTO GeoPietro Values(44, 15, 'Mastrycht');
INSERT INTO GeoPietro Values(45, 16, 'Dan');
INSERT INTO GeoPietro Values(46, 16, 'Zeland');
INSERT INTO GeoPietro Values(47, 16, 'Tanet');
INSERT INTO GeoPietro Values(48, 17, 'Iprez');
INSERT INTO GeoPietro Values(49, 17, 'Lutet');
INSERT INTO GeoPietro Values(50, 17, 'Barton');
INSERT INTO GeoPietro Values(51, 17, 'Priabon');
INSERT INTO GeoPietro Values(52, 18, 'Rupel');
INSERT INTO GeoPietro Values(53, 18, 'Szat');
INSERT INTO GeoPietro Values(54, 19, 'Akwitan');
INSERT INTO GeoPietro Values(55, 19, 'Burdygal');
INSERT INTO GeoPietro Values(56, 19, 'Lang');
INSERT INTO GeoPietro Values(57, 19, 'Serrawal');
INSERT INTO GeoPietro Values(58, 19, 'Torton');
INSERT INTO GeoPietro Values(59, 19, 'Mesyn');
INSERT INTO GeoPietro Values(60, 20, 'Zankl');
INSERT INTO GeoPietro Values(61, 20, 'Piacent');
INSERT INTO GeoPietro Values(62, 20, 'Gelas');


SELECT GeoPietro.id_pietro, GeoPietro.nazwa_pietro, GeoEpoka.id_epoka,
GeoEpoka.nazwa_epoka, GeoOkres.id_okres, GeoOkres.nazwa_okres, GeoEra.id_era,
GeoEra.nazwa_era, GeoEon.id_eon, GeoEon.nazwa_eon
INTO GeoTabela
FROM GeoPietro
JOIN GeoEpoka ON GeoEpoka.id_epoka = GeoPietro.id_epoka
JOIN GeoOkres ON GeoOkres.id_okres = GeoEpoka.id_okres
JOIN GeoEra ON GeoEra.id_era = GeoOkres.id_era
JOIN GeoEon ON GeoEon.id_eon = GeoEra.id_eon;ALTER TABLE GeoTabela
ADD PRIMARY KEY (id_pietro);CREATE TABLE Dziesiec
(
cyfra INTEGER NOT NULL PRIMARY KEY
);
INSERT INTO Dziesiec VALUES(1);
INSERT INTO Dziesiec VALUES(2);
INSERT INTO Dziesiec VALUES(3);
INSERT INTO Dziesiec VALUES(4);
INSERT INTO Dziesiec VALUES(5);
INSERT INTO Dziesiec VALUES(6);
INSERT INTO Dziesiec VALUES(7);
INSERT INTO Dziesiec VALUES(8);
INSERT INTO Dziesiec VALUES(9);CREATE TABLE Milion
(
liczba INTEGER NOT NULL PRIMARY KEY
);
WITH ID(number)
AS
(
 SELECT 1 AS number
 UNION ALL
 SELECT number + 1
 FROM ID
 WHERE number < 1000000
)
INSERT INTO Milion
 SELECT number
 FROM ID
 OPTION(maxrecursion 0);


CREATE INDEX indx_Pietro ON GeoPietro(id_pietro, id_epoka);
CREATE INDEX indx_Epoka ON GeoEpoka(id_epoka, id_okres);
CREATE INDEX indx_Okres ON GeoOkres(id_okres, id_era);
CREATE INDEX indx_Era ON GeoEra(id_era, id_eon);
CREATE INDEX indx_Eon ON GeoEon(id_eon);

CREATE INDEX indx_Liczba ON Milion(liczba);
CREATE INDEX indx_GeoTabela ON GeoTabela(id_pietro, id_epoka, id_era, id_okres, id_eon);


DROP INDEX indx_Pietro ON GeoPietro;
DROP INDEX indx_Epoka ON GeoEpoka;
DROP INDEX indx_Okres ON GeoOkres;
DROP INDEX indx_Era ON GeoEra;
DROP INDEX indx_Eon ON GeoEon;
DROP INDEX indx_Liczba ON Milion;
DROP INDEX indx_GeoTabela ON GeoTabela;



 SET STATISTICS IO, TIME ON --1SELECT COUNT(*) AS ZL1
FROM Milion
JOIN GeoTabela ON (Milion.liczba % 62) = GeoTabela.id_pietro;-- 2SELECT COUNT(*) AS ZL2
FROM Milion
JOIN GeoPietro ON (Milion.liczba % 62) = GeoPietro.id_pietro
JOIN GeoEpoka ON GeoEpoka.id_epoka = GeoPietro.id_epoka
JOIN GeoOkres ON GeoOkres.id_okres = GeoEpoka.id_okres
JOIN GeoEra ON GeoEra.id_era = GeoOkres.id_era
JOIN GeoEon ON GeoEon.id_eon = GeoEra.id_eon-- 3SELECT COUNT(*) AS ZG3
FROM Milion
WHERE (Milion.liczba % 62) =
(SELECT id_pietro
FROM GeoTabela
WHERE (Milion.liczba % 62) = (id_pietro));-- 4SELECT COUNT(*) AS ZG4
FROM Milion
WHERE (Milion.liczba % 62) IN
(SELECT GeoPietro.id_pietro
FROM GeoPietro
JOIN GeoEpoka ON GeoEpoka.id_epoka = GeoPietro.id_epoka
JOIN GeoOkres ON GeoOkres.id_okres = GeoEpoka.id_okres
JOIN GeoEra ON GeoEra.id_era = GeoOkres.id_era
JOIN GeoEon ON GeoEon.id_eon = GeoEra.id_eon);