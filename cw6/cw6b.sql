-- Szymon Cogiel cw 6a

-- a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodając do niego kierunkowy dla Polski w nawiasie (+48)

-- zmiana rozmiary varchara na 15
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon TYPE VARCHAR(15);

-- czyszczenie staeych znakow
UPDATE ksiegowosc.Pracownicy
SET telefon = RIGHT(telefon, length(telefon) - 6)
WHERE length(telefon) = 15 AND telefon LIKE '+%';

-- czyszczenie staeych znakow
UPDATE ksiegowosc.Pracownicy
SET telefon = RIGHT(telefon, length(telefon) - 3)
WHERE length(telefon) = 12 AND telefon LIKE '+%';

-- dodawanie +48
UPDATE ksiegowosc.Pracownicy
SET telefon = '+48' || telefon
WHERE telefon IS NOT NULL;

SELECT *
FROM ksiegowosc.Pracownicy;

-- b) Zmodyfikuj atrybut telefonw tabeli pracownicytak, aby numer oddzielony był myślnikami wg wzoru: ‘555-222-333’

UPDATE ksiegowosc.Pracownicy
SET telefon = '' || SUBSTRING(telefon FROM 1 FOR 3) || ' ' || SUBSTRING(telefon FROM 4 FOR 3) || '-'  || SUBSTRING(telefon FROM 7 FOR 3) || '-'  || SUBSTRING(telefon FROM 10 FOR 3);

SELECT *
FROM ksiegowosc.Pracownicy;

-- c) Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter
SELECT
	p1.id_pracownika,
	UPPER(p1.imie) as imie,
	UPPER(p1.nazwisko) as nazwisko,
	UPPER(p1.adres) as adres,
	p1.telefon
FROM ksiegowosc.Pracownicy as p1
WHERE LENGTH(p1.nazwisko) = (
	SELECT MAX(LENGTH(p1.nazwisko))
	FROM ksiegowosc.Pracownicy as p1);

-- lub

SELECT
	p1.id_pracownika,
	UPPER(p1.imie) as imie,
	UPPER(p1.nazwisko) as nazwisko,
	UPPER(p1.adres) as adres,
	p1.telefon,
	LENGTH(p1.nazwisko) as len
FROM ksiegowosc.Pracownicy as p1
ORDER BY len DESC
LIMIT 1;

-- d) Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5

SELECT
	p1.id_pracownika,
	MD5(p1.imie) as imie,
	MD5(p1.nazwisko) as nazwisko,
	MD5(p1.adres) as adres,
	MD5(p1.telefon) as telefon,
	MD5(p2.kwota::char) as pensja
FROM ksiegowosc.Pracownicy as p1
INNER JOIN ksiegowosc.Wynagrodzenie AS w
ON p1.id_pracownika = w.id_pracownika
INNER JOIN ksiegowosc.Pensja AS p2
ON w.id_pensji = p2.id_pensji;


-- f) Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne.
SELECT *
FROM ksiegowosc.Pracownicy as p1
LEFT JOIN ksiegowosc.Wynagrodzenie AS w
ON p1.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.Pensja AS p2
ON w.id_pensji = p2.id_pensji
LEFT JOIN ksiegowosc.premia AS g
ON w.id_premii = g.id_premii;


-- g) wygeneruj raport (zapytanie), które zwróciw wyniki treść wg poniższego szablonu:

ALTER TABLE ksiegowosc.godziny
ADD Liczba_nadgodzin INTEGER NULL;

SELECT * FROM ksiegowosc.godziny;

UPDATE  ksiegowosc.godziny
SET Liczba_nadgodzin = liczba_godzin - 160
WHERE liczba_godzin > 160;

SELECT ksiegowosc.Pracownicy.id_pracownika,
concat(
        'Pracownik ', imie, ' ', nazwisko, 'w dniu ', w.data,
        ' otrzymał pensję całkowitą na kwotę ', p.kwota + p2.kwota,
        ' zł, gdzie wynagrodzenie zasadnicze wynosiło: ', p.kwota, ' zł,',
        ' premia: ', p2.kwota, ' zł, ',
        'nadgodziny: ', coalesce(g.liczba_nadgodzin, 0) * 40, 'zł.'
    )
FROM ksiegowosc.Pracownicy
LEFT JOIN ksiegowosc.Wynagrodzenie w on pracownicy.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.Pensja p on w.id_pensji = p.id_pensji
LEFT JOIN ksiegowosc.Premia p2 on w.id_premii = p2.id_premii
LEFT JOIN ksiegowosc.Godziny g on pracownicy.id_pracownika = g.id_pracownika;