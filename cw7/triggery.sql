USE AdventureWorks2019
GO

-- 2. Napisz trigger DML, kt�ry po wprowadzeniu danych do tabeli Personszmodyfikuje nazwisko tak, aby by�o napisane du�ymi literami. 
CREATE TRIGGER TriggerUpperLetters
ON Person.Person
AFTER INSERT
AS
BEGIN
UPDATE Person.Person SET Person.LastName = UPPER(Person.LastName) WHERE LastName IN (SELECT LastName FROM INSERTED)
END

INSERT INTO Person.BusinessEntity(rowguid)
VALUES(newid())

INSERT INTO Person.Person (BusinessEntityID,PersonType,FirstName,MiddleName,LastName) VALUES (20779,'IN','Szymon','Michal','Cogiel')
GO

SELECT * FROM Person.BusinessEntity
SELECT * FROM Person.Person

-- 3. Przygotuj trigger �taxRateMonitoring�, kt�ry wy�wietli komunikat o b��dzie, je�eli nast�pi zmiana warto�ci w polu �TaxRate�o wi�cej ni� 30%.

CREATE TRIGGER taxCHECK
ON Sales.SalesTaxRate
AFTER INSERT ,UPDATE , DELETE
AS
BEGIN
DECLARE @NewTaxRate int, @TaxRate int
SELECT @NewTaxRate = TaxRate FROM inserted
SELECT @TaxRate = TaxRate FROM deleted
IF @NewTaxRate > 1.3* @TaxRate
PRINT 'Tak nie wolno'
END


SELECT * FROM Sales.SalesTaxRate;


UPDATE Sales.SalesTaxRate 
set TaxRate =  21.00
where SalesTaxRateID = 4;
