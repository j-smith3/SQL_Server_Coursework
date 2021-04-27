--Exercise 1
Select
	Addresses.State,
	Addresses.City,
	Count(Distinct OrderID) AS NumberOrders
From Addresses Join Customers
		On Addresses.CustomerID=Customers.CustomerID
	Join Orders
		On Customers.CustomerID=Orders.CustomerID
Group By Rollup(Addresses.State,Addresses.City)
Order By Addresses.State DESC, Addresses.City DESC;

--Exercise 2
Select
	Addresses.State, 
	Addresses.City,
	Count(Distinct OrderID) AS NumberOrders
From Addresses Join Customers
		On Addresses.CustomerID=Customers.CustomerID
	Join Orders
		On Customers.CustomerID=Orders.CustomerID
Group By Cube(Addresses.State,Addresses.City)
Order By Addresses.State DESC, Addresses.City DESC;

--Exercise 3
Select
	Customers.FirstName + ' ' + Customers.LastName AS Fullname,
	Addresses.State,
	Addresses.City,
	Count(Distinct OrderID) AS NumberOrders
From Addresses Join Customers
		On Addresses.CustomerID=Customers.CustomerID
	Join Orders
		On Customers.CustomerID=Orders.CustomerID
Group by GROUPING SETS (Rollup(State, City), (Customers.FirstName + ' ' + Customers.LastName))
Order By Addresses.State DESC, Addresses.City DESC;

--Exercise 4
Select 
	Products.ProductName,
	Orders.OrderDate,
	OrderItems.ItemPrice-OrderItems.DiscountAmount AS ItemPrice,
	SUM (OrderItems.ItemPrice-OrderItems.DiscountAmount)
		OVER (PARTITION BY Orders.OrderDate) AS TotalSalesOnDate,
	AVG (OrderItems.ItemPrice-OrderItems.DiscountAmount)
		OVER (PARTITION BY Orders.OrderDate) AS AvgSalesOnDate,
	Count(OrderItems.ItemPrice)
		OVER (PARTITION BY Orders.OrderDate) AS TotalItemsSoldOnDate
From 
	Orders Join OrderItems
		ON Orders.OrderID=OrderItems.OrderID
	Join Products
		ON OrderItems.ProductID=Products.ProductID
Order By Orders.OrderDate, Products.ProductName;

