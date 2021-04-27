--Exerise 1
Select ListPrice,
	Cast(ListPrice AS decimal(18,1)) AS DecimalPrice,
	Convert(int, ListPrice) AS IntPrice,
	Cast(ListPrice AS int) AS IntPrice2
From Products;

--Exercise 2
Select DateAdded,
	Cast(DateAdded AS date) AS DateOnly,
	Cast(DateAdded AS time) AS TimeOnly,
	Cast(DateAdded AS varchar(6)) AS MonthDay
From Products;

--Exercise 3
Select 
	Convert(varchar, OrderDate, 101),
	Convert(varchar, OrderDate, 100),
	Convert(varchar, OrderDate, 8)
From Orders;