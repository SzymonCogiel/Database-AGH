-- Cw 4
-- Szymon Cogiel 408264


-- zmieniamy ga³aŸ na firma
USE firma;
GO

-- 1. Utwórz now¹ bazê danych nazywaj¹c j¹ firma

CREATE DATABASE firma;


-- ===============================================================================================================================================================
-- 2. Dodaj nowy schemat o nazwie rozliczenia. (sposob organizacji danych, wyswietla sie w zakladce Seciurity/Schemas)

CREATE SCHEMA rozliczenia;



/* ===============================================================================================================================================================
-- 3. Dodaj schematu rozliczenia dodaj cztery tabele wykonuj¹c nastêpuj¹ce dzia³ania:
a) Ustal typy danych tak, aby przetwarzanie i sk³adowanie danych by³o optymalne.
b) Zastanów siê, które pola musz¹ przyjmowaæ wartoœæ NOT NULL.
c) Ustaw klucz g³ówny dla ka¿dej tabeli (jako czêœæ polecenia CREATE TABLE).
d) Zastanów siê jakie zwi¹zki zachodz¹ pomiêdzy tabelami, a nastêpnie dodaj klucze obce
tam, gdzie wystêpuj¹ (wykorzystaj polecenie ALTER TABLE – po uprzednim stworzeniu
tabeli).
*/

-- pracownicy(id_pracownika, imie, nazwisko, adres, telefon)

CREATE TABLE rozliczenia.pracownicy (

	id_pracownika CHAR(8) PRIMARY KEY,
	imie VARCHAR(50) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	adres VARCHAR(100) NOT NULL,
	telefon CHAR(12) NULL,

);


-- godziny(id_godziny, data, liczba_godzin , id_pracownika)

CREATE TABLE rozliczenia.godziny (

	id_godziny CHAR(6) PRIMARY KEY,
	data DATE NOT NULL,
	liczba_godzin SMALLINT NOT NULL,
	id_pracownika CHAR(8) NOT NULL,

);


-- pensje(id_pensji, stanowisko, kwota, id_premii)

CREATE TABLE rozliczenia.pensje (

	id_pensji CHAR(8) PRIMARY KEY,
	stanowisko VARCHAR(50) NOT NULL,
	kwota SMALLMONEY NOT NULL,
	id_premii CHAR(8) NULL,

);


-- premie(id_premii, rodzaj, kwota)

CREATE TABLE rozliczenia.premie(

	id_premii CHAR(8) PRIMARY KEY,
	rodzaj VARCHAR(30) NULL,
	kwota SMALLMONEY NOT NULL,

);


-- d) ALTER TABLE = modyfikuje schemat realcji

-- Dodanie klucza obcego dla godzin

ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);


-- Dodanie klucza obcego dla pensje

ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);


-- ===============================================================================================================================================================
-- 4. Wype³nij ka¿d¹ tabelê 10. rekordami.

-- pracownicy

INSERT INTO rozliczenia.pracownicy(

	[id_pracownika],
	[imie],
	[nazwisko],
	[adres],
	[telefon]

)
VALUES
(
	'A1',
	'Jacu',
	'Placu',
	'Witolda Budryka 3/306, 30-072 Krakow',
	NULL
),
(
	'A2',
	'Jacu',
	'Glacu',
	'Witolda Budryka 3/306, 30-072 Krakow',
	'+48999999998'
),
(
	'A3',
	'Jacu',
	'Flacu',
	'Witolda Budryka 3/306, 30-072 Krakow',
	'+48999999997'
),
(
	'A4',
	'Jacu',
	'Tlacu',
	'Witolda Budryka 3/306, 30-072 Krakow',
	'+48999999996'
),
(
	'A5',
	'Jacu',
	'Mlacu',
	'Witolda Budryka 3/305, 30-072 Krakow',
	'+48999999995'
),
(
	'A6',
	'Jacu',
	'Olacu',
	'Witolda Budryka 3/305, 30-072 Krakow',
	'+48999999994'
),
(
	'A7',
	'Jacu',
	'Wlacu',
	'Witolda Budryka 3/304, 30-072 Krakow',
	'+48999999993'
),
(
	'A8',
	'Szymon',
	'Wlacu',
	'Witolda Budryka 3/304, 30-072 Krakow',
	'+48999999992'
),
(
	'A9',
	'Szymon',
	'Maj',
	'Witolda Budryka 3/303, 30-072 Krakow',
	'+48999999991'
),
(
	'A10',
	'Szymon',
	'Kaj',
	'Witolda Budryka 3/303, 30-072 Krakow',
	NULL
)


-- Check poprawnosci

SELECT * FROM rozliczenia.pracownicy


-- godziny

INSERT INTO rozliczenia.godziny(

	[data],
	[id_godziny],
	[id_pracownika],
	[liczba_godzin]

)
VALUES
(
	'2022-04-02',
	1,
	'A1',
	8
),
(
	'2022-04-02',
	2,
	'A2',
	8
),
(
	'2022-04-03',
	3,
	'A3',
	8
),
(
	'2022-04-02',
	4,
	'A4',
	10
),
(
	'2022-04-03',
	5,
	'A5',
	9
),
(
	'2022-04-03',
	6,
	'A6',
	8
),
(
	'2022-04-03',
	7,
	'A7',
	5
),
(
	'2022-04-03',
	12,
	'A8',
	10
),
(
	'2022-04-03',
	8,
	'A9',
	2
),
(
	'2022-04-02',
	9,
	'A10',
	4
)


SELECT * FROM rozliczenia.godziny  ORDER BY data DESC


-- Premie

INSERT INTO rozliczenia.premie(

	[id_premii],
	[kwota],
	[rodzaj]

)
VALUES
(
	'PR1',
	2000,
	NULL
),
(
	'PR2',
	2220,
	NULL
),
(
	'PR3',
	2050,
	NULL
),
(
	'PR4',
	2010,
	NULL
),
(
	'PR5',
	2001,
	NULL
),
(
	'PR6',
	2600,
	NULL
),
(
	'PR7',
	3000,
	NULL
),
(
	'PR8',
	3020,
	NULL
),
(
	'PR9',
	2450,
	NULL
),
(
	'PR10',
	2900,
	NULL
)

SELECT * FROM rozliczenia.premie;



-- Pensje

INSERT INTO rozliczenia.pensje (
	[id_pensji],
	[id_premii],
	[kwota],
	[stanowisko]
)
VALUES
(
	'P1',
	'PR1',
	8000,
	'Junior Analyst'
),
(
	'P2',
	'PR2',
	8500,
	'Junior Analyst'
),
(
	'P3',
	'PR3',
	12000,
	'Analyst/Statistician'
),
(
	'P4',
	'PR4',
	40000,
	'Head Modeler Statistician'
),
(
	'P5',
	'PR5',
	12000,
	'Analyst/Statistician'
),
(
	'P6',
	'PR6',
	11000,
	'Analyst/Statistician'
),
(
	'P7',
	'PR7',
	4000,
	'Intern Analyst'
),
(
	'P8',
	'PR8',
	4800,
	'Intern Analyst'
),
(
	'P9',
	'PR9',
	10000,
	'DevOps'
),
(
	'P10',
	'PR10',
	11000,
	'Softwera enginer'
)


SELECT * FROM rozliczenia.pensje;


-- 5. Za pomoc¹ zapytania SQL wyœwietl nazwiska pracowników i ich adresy.

SELECT nazwisko, adres FROM rozliczenia.pracownicy;


-- 6. Napisz zapytanie, które przekonwertuje datê w tabeli godziny tak, aby wyœwietlana by³a informacja jaki to dzieñ tygodnia i jaki miesi¹c (funkcja DATEPART x2).

SELECT DATEPART ( dw , data ),
	DATEPART ( mm , data )
FROM rozliczenia.godziny;

-- 7. W tabeli pensje zmieñ nazwê atrybutu kwota na kwota_brutto oraz dodaj nowy o nazwie kwota_netto. Oblicz kwotê netto i zaktualizuj wartoœci w tabeli.

EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';

ALTER TABLE rozliczenia.pensje
ADD kwota_netto AS (pensje.kwota_brutto * 0.81);

SELECT * FROM rozliczenia.pensje;

-- usowanie do testow
ALTER TABLE rozliczenia.pensje
DROP COLUMN kwota_netto;