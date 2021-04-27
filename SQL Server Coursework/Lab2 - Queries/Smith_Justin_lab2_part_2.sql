--Exercise 1
Select CustomerID, City, State
From Addresses
Where (City = 'Abilene' AND State = 'TX')
	OR (City = 'Bridgewater' AND State = 'NJ')
Order By City, State, CustomerID;

--Exercise 2
Select CustomerID, City, State
From Addresses
Where State IN ('AK', 'CA', 'TX') 
	AND City NOT IN ('Fairbanks', 'San Francisco', 'Abilene')
Order By State, City, CustomerID;

--Exercise 3
Select CustomerID, City, State
From Addresses
Where City LIKE 'C%' 
	AND State LIKE '%[A-M]'
Order By State, City, CustomerID;

--Exercise 4
Select OrderID, OrderDate, ShipDate
From Orders
Where ShipDate IS NULL;

--Exercise 5
Select 100 AS Price,
	.07 AS TaxRate,
	100 * .07 AS TaxAmount,
	100 + (100 * .07) AS Total;
	
