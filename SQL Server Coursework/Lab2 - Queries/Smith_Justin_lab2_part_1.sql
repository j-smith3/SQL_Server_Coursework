--Exercise 1
Select ProductCode, ProductName, ListPrice, DiscountPercent
From Products
Order By ListPrice DESC;

--Exercise 2
Select LastName + ', ' + FirstName AS FullName
From Customers
Order By LastName DESC;

--Exercise 3
Select ProductName, ListPrice, DateAdded
From Products
Where ListPrice >500 AND ListPrice<2000
Order By DateAdded DESC;

--Exercise 4
Select ProductName, ListPrice, DiscountPercent,
	(ListPrice * DiscountPercent)/100 AS DiscountAmount,
	ListPrice - ((ListPrice * DiscountPercent)/100) AS DiscountPrice
From Products
Order By DiscountPrice DESC;

--Exercise 5
Select ItemID, ItemPrice, DiscountAmount, Quantity,
	ItemPrice * Quantity AS PriceTotal,
	DiscountAmount * Quantity AS DiscountTotal,
	(ItemPrice - DiscountAmount) * Quantity AS ItemTotal
From OrderItems
Where (ItemPrice - DiscountAmount) * Quantity >500
Order By ItemTotal DESC;

--Exercise 6
Select DISTINCT CardType, CardNumber
From Orders;

--Exercise 7
Select TOP 10 CustomerID, 
	ShipAmount + TaxAmount AS ShippingTaxTotal
From Orders
Order By ShippingTaxTotal DESC;
