
-- 1.Wykorzystuj�c wyra�enie CTE zbuduj zapytanie, kt�re znajdzie informacje na temat stawki pracownika oraz jego danych, a nast�pnie zapisze je do tabeli tymczasowej TempEmployeeInfo. Rozwi�� w oparciu o AdventureWorks.

WITH exp_1 (LoginID, JobTitle, BirthDate, Gender, HireDate, MaritalStatus, VacationHours, SickLeaveHours, Rate)
AS
(
	SELECT LoginID, JobTitle, BirthDate, Gender, HireDate, MaritalStatus, VacationHours, SickLeaveHours, Rate FROM AdventureWorks2017.HumanResources.Employee AS em
	INNER JOIN AdventureWorks2017.HumanResources.EmployeePayHistory AS pe
	ON em.BusinessEntityID = pe.BusinessEntityID
)
SELECT * INTO #TempEmployeeInfo FROM exp_1;

SELECT * FROM #TempEmployeeInfo;

-- 2.Uzyskaj informacje na tematprzychod�wze sprzeda�y wed�ug firmy i kontaktu (za pomoc� CTEi bazy AdventureWorksL). Wynik powinien wygl�da� nast�puj�co:

WITH exp_2 (CompanyContact, Revenue)
AS
(
	SELECT concat(CompanyName, ' (', FirstName, LastName, ')') AS CompanyContact, TotalDue AS Revenue 
	FROM AdventureWorksLT2019.SalesLT.Customer AS Cust
	INNER JOIN AdventureWorksLT2019.SalesLT.SalesOrderHeader AS SalHe
	ON Cust.CustomerID = SalHe.CustomerID
)
SELECT * FROM exp_2
ORDER BY CompanyContact;


-- 3.Napisz zapytanie, kt�re zwr�ci warto�� sprzeda�y dla poszczeg�lnych kategorii produkt�w.Wykorzystaj CTE i baz� AdventureWorksLT.
WITH exp_3 (Category, SalesValue)
AS
(
SELECT ProCa.Name AS Category, ROUND(UnitPrice, 2) * OrderQty AS SalesValue FROM AdventureWorksLT2019.SalesLT.Product AS Pro
INNER JOIN AdventureWorksLT2019.SalesLT.ProductCategory AS ProCa
ON Pro.ProductCategoryID = ProCa.ProductCategoryID
INNER JOIN AdventureWorksLT2019.SalesLT.SalesOrderDetail AS SalDe
ON Pro.ProductID = SalDe.ProductID
)
SELECT Category, SUM(SalesValue) AS SalesValue FROM exp_3
GROUP BY Category
ORDER BY Category;