--Exercise 1
Select ListPrice,
	DiscountPercent,
	Round((ListPrice * DiscountPercent * .01),2) AS DiscountAmount
From Products;

--Exercise 2
Select OrderDate,
	DatePart(year, OrderDate) AS OnlyYear,
	DatePart(day, OrderDate) AS OnlyDay,
	DateAdd(day, 30, OrderDate) AS Plus30Days
From Orders;

--Exercise 3
Select CardNumber,
	Len(CardNumber) AS CardLength,
	Right(CardNumber,4) AS LastFourDigits,
	Concat('XXXX-XXXX-XXXX-', Right(CardNumber,4)) AS EncryptedCardNumber
From Orders;

--Exercise 4
Select OrderID,
	OrderDate,
	DateAdd(day, 2, OrderDate) AS ApproxShipDate,
	ShipDate,
	DateDiff(day, OrderDate, ShipDate) AS DaysToShip
From Orders
Where OrderDate >= '2016-03-01' AND OrderDate < '2016-04-01';

--Exercise 5
Select ProductName,
	ListPrice,
	Case
		When ListPrice < 500 Then 'Low End'
		When ListPrice >=500 AND ListPrice < 1000 Then 'Middle'
		When ListPrice >=1000 Then 'High End'
	END AS [Product PriceDesc]
From Products
Order By ListPrice;

--Exercise 6
Select ProductName,
	ListPrice,
	IIF (ListPrice < 500, 'Low End',
		IIF ((ListPrice >=500 AND ListPrice < 1000), 'Middle',
			IIF (ListPrice >=1000, 'High End', 'Not a Number'))) AS [Product PriceDesc]
From Products
Order By ListPrice;
