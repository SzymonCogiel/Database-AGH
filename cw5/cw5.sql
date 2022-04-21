-- Database: firma

-- DROP DATABASE IF EXISTS firma;


-- 1. Utwórz nową bazę danych nazywając ją firma. 
CREATE DATABASE Firma
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'pl_PL.UTF-8'
    LC_CTYPE = 'pl_PL.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
    
    
COMMENT ON DATABASE Firma IS 'Firma, ktora posiada schemat ksiegowosc';


-- 2. Dodaj schemat o nazwie ksiegowosc.
CREATE SCHEMA ksiegowosc;

COMMENT ON SCHEMA ksiegowosc IS 'Schemat Księgowości dla sturtupa';


-- 3. Dodaj cztery tabele: 

-- pracownicy (id_pracownika, imie, nazwisko, adres, telefon)

CREATE TABLE ksiegowosc.pracownicy
	(
		id_pracownika INT PRIMARY KEY,
		imie VARCHAR(50) NOT NULL,
		nazwisko VARCHAR(50) NOT NULL,
		adres VARCHAR(100) NOT NULL,
		telefon VARCHAR(12) NULL
	);
    
COMMENT ON TABLE ksiegowosc.Pracownicy IS 'Tabela Pracownicy - zbiór pracownikow pracujacych cw dziale ksiegowosci';
COMMENT ON COLUMN ksiegowosc.Pracownicy.id_pracownika IS 'klucz glowny tabeli';
COMMENT ON COLUMN ksiegowosc.Pracownicy.imie IS 'Kolumna zwierajaca imiona pracowinkow';
COMMENT ON COLUMN ksiegowosc.Pracownicy.nazwisko IS 'Kolumna zwierajaca nazwiska pracowinkow';
COMMENT ON COLUMN ksiegowosc.Pracownicy.adres IS 'Kolumna zwierajaca adresy pracowinkow';
COMMENT ON COLUMN ksiegowosc.Pracownicy.telefon IS 'Kolumna zwierajaca numery telefonow pracowinkow';


CREATE TABLE ksiegowosc.Godziny
	(
		id_godziny INT PRIMARY KEY,
		data DATE NOT NULL,
		liczba_godzin INT NOT NULL,
		id_pracownika INT NOT NULL
	);
	
ALTER TABLE ksiegowosc.Godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.Pracownicy(id_pracownika);
COMMENT ON TABLE ksiegowosc.Godziny IS 'Tabela Godziny';

CREATE TABLE ksiegowosc.pensja 
	(
	id_pensji INT PRIMARY KEY,
	stanowisko VARCHAR(50) NOT NULL,
	kwota MONEY NOT NULL
	);

COMMENT ON TABLE ksiegowosc.pensja IS 'Tabela pensja';

CREATE TABLE ksiegowosc.premia
	(
		id_premii INT PRIMARY KEY,
		rodzaj VARCHAR(80) NULL,
		kwota MONEY NULL
	);

COMMENT ON TABLE ksiegowosc.premia IS 'Tabela Premia';


CREATE TABLE ksiegowosc.wynagrodzenie
	(
		id_wynagrodzenia INT PRIMARY KEY,
		data DATE NOT NULL,
		id_pracownika INT NOT NULL,
		id_godziny INT NOT NULL,
		id_pensji INT NOT NULL,
		id_premii INT NOT NULL
	);

ALTER TABLE ksiegowosc.wynagrodzenie
	ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.Pracownicy(id_pracownika),
	ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.Godziny(id_godziny),
	ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.Pensja(id_pensji),
	ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.Premia(id_premii);
	
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tabela Wynagrodzenia';


INSERT INTO ksiegowosc.pracownicy VALUES
(
	'11',
	'Anna',
	'Janito',
	'Witolda Budryka 3/306, 30-072 Krakow',
	NULL
),
(
	'1',
	'Jacu',
	'Placu',
	'Witolda Budryka 3/306, 30-072 Krakow',
	NULL
),
(
	'2',
	'Jacu',
	'Glacu',
	'Witolda Budryka 3/306, 30-072 Krakow',
	'+48999999998'
),
(
	'3',
	'Jacu',
	'Flacu',
	'Witolda Budryka 3/306, 30-072 Krakow',
	'+48999999997'
),
(
	'4',
	'Jacu',
	'Tlacu',
	'Witolda Budryka 3/306, 30-072 Krakow',
	'+48999999996'
),
(
	'5',
	'Jacu',
	'Mlacu',
	'Witolda Budryka 3/305, 30-072 Krakow',
	'+48999999995'
),
(
	'6',
	'Jacu',
	'Olacu',
	'Witolda Budryka 3/305, 30-072 Krakow',
	'+48999999994'
),
(
	'7',
	'Jacu',
	'Wlacu',
	'Witolda Budryka 3/304, 30-072 Krakow',
	'+48999999993'
),
(
	'8',
	'Szymon',
	'Wlacu',
	'Witolda Budryka 3/304, 30-072 Krakow',
	'+48999999992'
),
(
	'9',
	'Szymon',
	'Maj',
	'Witolda Budryka 3/303, 30-072 Krakow',
	'+48999999991'
),
(
	'10',
	'Szymon',
	'Kaj',
	'Witolda Budryka 3/303, 30-072 Krakow',
	NULL
);

SELECT * FROM ksiegowosc.pracownicy;


INSERT INTO ksiegowosc.Godziny VALUES
(
	'11',
	'2022-04-02',
	'180',
	'11'
),
(
	'1',
	'2022-04-02',
	'8',
	'1'
),
(
	'2',
	'2022-04-02',
	'8',
	'2'
),
(
	'3',
	'2022-04-02',
	'8',
	'3'
),
(
	'4',
	'2022-04-02',
	'8',
	'4'
),
(
	'5',
	'2022-04-02',
	'8',
	'5'
),
(
	'6',
	'2022-04-02',
	'8',
	'6'
),
(
	'7',
	'2022-04-02',
	'8',
	'7'
),
(
	'8',
	'2022-04-02',
	'8',
	'8'
),
(
	'9',
	'2022-04-02',
	'8',
	'9'
),
(
	'10',
	'2022-04-02',
	'8',
	'10'
);

SELECT * FROM ksiegowosc.Godziny  ORDER BY data DESC;

INSERT INTO ksiegowosc.premia VALUES
	('11', 'Git', '10001'),
	('1', 'Git', '1'),
	('2', 'Git', '2'),
	('3', 'Git', NULL),
	('4', 'Git', '1'),
	('5', 'Git', '1'),
	('6', 'Git', NULL),
	('7', 'Git', NULL),
	('8', 'Git', NULL),
	('9', 'Git', NULL),
	('10', 'Git', NULL);

SELECT * FROM ksiegowosc.premia;

INSERT INTO ksiegowosc.pensja VALUES
	('1', 'Programista', '10000'),
	('2', 'Analityk', '8000'),
	('3', 'Analityk', '10000'),
	('4', 'Analityk', '10000'),
	('5', 'Analityk', '10000'),
	('6', 'Analityk', '25000'),
	('7', 'Analityk', '25000'),
	('8', 'Analityk', '25000'),
	('9', 'Analityk', '25000'),
	('10', 'Project Menager', '10000')
	('11', 'januszer', '2000');
	
SELECT * FROM ksiegowosc.pensja;

INSERT INTO ksiegowosc.wynagrodzenie VALUES
	('11', '2022-03-10', '11', '11', '11', '11'),
	('1', '2022-03-10', '1', '1', '1', '1'),
	('2', '2022-03-10', '2', '2', '2', '2'),
	('3', '2022-03-11', '3', '3', '3', '3'),
	('4', '2022-03-11', '4', '4', '4', '4'),
	('5', '2022-03-12', '5', '5', '5', '5'),
	('6', '2022-03-12', '6', '6', '6', '6'),
	('7', '2022-03-13', '7', '7', '7', '7'),
	('8', '2022-03-13', '8', '8', '8', '8'),
	('9', '2022-03-13', '9', '9', '9', '9'),
	('10', '2022-03-09', '10', '10', '10', '10');
	
SELECT * FROM ksiegowosc.wynagrodzenie;

-- zad 6

-- a) Wyświetl tylko id pracownika oraz jego nazwisko.
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

-- b) Wyświetl id pracowników, których płaca jest większa niż 1000.

SELECT pra.id_pracownika FROM ksiegowosc.pracownicy AS pra
INNER JOIN ksiegowosc.wynagrodzenie as wyn
ON pra.id_pracownika = wyn.id_pracownika
INNER JOIN ksiegowosc.pensja AS pen
ON wyn.id_pensji = pen.id_pensji
WHERE pen.kwota > cast(20000 AS money);

-- c) Wyświetl id pracowników nieposiadających premii,których płaca jest większa niż 2000.
SELECT pra.id_pracownika FROM ksiegowosc.pracownicy AS pra
INNER JOIN ksiegowosc.wynagrodzenie AS wyn
ON pra.id_pracownika = wyn.id_pracownika
INNER JOIN ksiegowosc.pensja AS pen
ON wyn.id_pensji = pen.id_pensji
INNER JOIN ksiegowosc.premia AS pre
ON wyn.id_premii = pre.id_premii
WHERE pen.kwota > cast(20000 AS money) AND pre.kwota IS NULL;

-- d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’. 

SELECT * FROM ksiegowosc.pracownicy 
WHERE ksiegowosc.Pracownicy.imie LIKE 'J%';

-- e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.

SELECT * FROM ksiegowosc.pracownicy 
WHERE ksiegowosc.pracownicy.imie LIKE '%a' AND ksiegowosc.pracownicy.nazwisko LIKE '%n%';


-- f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie. 
SELECT pra.imie, pra.nazwisko, 
CASE WHEN (godz.liczba_godzin > 160) 
THEN godz.liczba_godzin-160 END
AS Liczba_nadgodzin
FROM ksiegowosc.pracownicy AS pra
INNER JOIN ksiegowosc.wynagrodzenie AS wyn
ON pra.id_pracownika = wyn.id_pracownika
INNER JOIN ksiegowosc.godziny as godz
ON wyn.id_godziny = godz.id_godziny;

-- g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 –3000PLN.

SELECT pra.imie, pra.nazwisko FROM ksiegowosc.pracownicy AS pra
INNER JOIN ksiegowosc.wynagrodzenie AS wyn
ON pra.id_pracownika = wyn.id_pracownika
INNER JOIN ksiegowosc.pensja AS pen
ON wyn.id_pensji = pen.id_pensji
WHERE pen.kwota BETWEEN cast(1500 AS money) AND cast(3000 AS money);

-- h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinachi nie otrzymali premii.
SELECT pra.imie, pra.nazwisko,
CASE WHEN (godz.liczba_godzin > 160) 
THEN godz.liczba_godzin-160 END
AS Liczba_nadgodzin
FROM ksiegowosc.pracownicy AS pra
INNER JOIN ksiegowosc.wynagrodzenie AS wyn
ON pra.id_pracownika = wyn.id_pracownika
INNER JOIN ksiegowosc.godziny as godz
ON wyn.id_godziny = godz.id_godziny
INNER JOIN ksiegowosc.premia AS pre
ON wyn.id_premii = pre.id_premii
WHERE (godz.liczba_godzin > 160) AND pre.kwota IS NULL

-- i) Uszereguj pracowników według pensji.
SELECT * FROM ksiegowosc.pracownicy AS pra
INNER JOIN ksiegowosc.wynagrodzenie AS wyn
ON pra.id_pracownika = wyn.id_pracownika
INNER JOIN ksiegowosc.pensja AS pen
ON wyn.id_pensji = pen.id_pensji
ORDER BY pen.kwota;

-- j) Uszereguj pracowników według pensji i premii malejąco.
SELECT * FROM ksiegowosc.pracownicy AS pra
INNER JOIN ksiegowosc.wynagrodzenie AS wyn
ON pra.id_pracownika = wyn.id_pracownika
INNER JOIN ksiegowosc.pensja AS pen
ON wyn.id_pensji = pen.id_pensji
INNER JOIN ksiegowosc.premia AS pre
ON wyn.id_premii = pre.id_premii
ORDER BY pen.kwota, pre.kwota DESC;

-- k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’.

SELECT
	pen.stanowisko,
	COUNT(pen.stanowisko)
FROM ksiegowosc.pracownicy AS pra
INNER JOIN ksiegowosc.wynagrodzenie AS wyn
ON pra.id_pracownika = wyn.id_pracownika
INNER JOIN ksiegowosc.pensja AS pen
ON wyn.id_pensji = pen.id_pensji
GROUP BY pen.stanowisko


-- l) Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie masz, to przyjmij dowolne inne).

SELECT pen.stanowisko, AVG(pen.kwota::numeric), MIN(pen.kwota), MAX(pen.kwota)
FROM ksiegowosc.pracownicy AS pra
INNER JOIN ksiegowosc.wynagrodzenie AS wyn
ON pra.id_pracownika = wyn.id_pracownika
INNER JOIN ksiegowosc.pensja AS pen
ON wyn.id_pensji = pen.id_pensji
GROUP BY pen.stanowisko

-- m) Policz sumę wszystkich wynagrodzeń.
SELECT SUM(pen.kwota)
FROM ksiegowosc.pracownicy AS pra
INNER JOIN ksiegowosc.wynagrodzenie AS wyn
ON pra.id_pracownika = wyn.id_pracownika
INNER JOIN ksiegowosc.pensja AS pen
ON wyn.id_pensji = pen.id_pensji

-- n) Policz sumę wynagrodzeń w ramach danego stanowiska.
SELECT pen.stanowisko, SUM(pen.kwota)
FROM ksiegowosc.pracownicy AS pra
INNER JOIN ksiegowosc.wynagrodzenie AS wyn
ON pra.id_pracownika = wyn.id_pracownika
INNER JOIN ksiegowosc.pensja AS pen
ON wyn.id_pensji = pen.id_pensji
GROUP BY pen.stanowisko;

-- o) Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.
SELECT pen.stanowisko, COUNT(pre.id_premii)
FROM ksiegowosc.pracownicy AS pra
INNER JOIN ksiegowosc.wynagrodzenie AS wyn
ON pra.id_pracownika = wyn.id_pracownika
INNER JOIN ksiegowosc.premia AS pre
ON wyn.id_premii = pre.id_premii
INNER JOIN ksiegowosc.pensja AS pen
ON wyn.id_pensji = pen.id_pensji
WHERE pre.kwota IS NOT NULL
GROUP BY pen.stanowisko;

-- p) Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł.

DELETE 
FROM ksiegowosc.Pracownicy AS pra
USING ksiegowosc.Wynagrodzenie AS wyn, ksiegowosc.Pensja AS pen
WHERE 
	pra.id_pracownika = wyn.id_pracownika AND
	wyn.id_pensji = pen.id_pensji AND
	pen.kwota < cast(1500 AS money);