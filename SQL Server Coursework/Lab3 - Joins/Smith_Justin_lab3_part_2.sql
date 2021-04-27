--Exercise 1
	Select 'SHIPPED' AS ShipStatus, OrderID, OrderDate
	From Orders
	Where ShipDate IS NOT NULL
UNION
	Select 'NOT SHIPPED' AS ShipStatus, OrderID, OrderDate
	From Orders
	Where ShipDate IS NULL
Order By OrderDate;

--Exercise 2
Select Customers.EmailAddress, 
	Customers.FirstName + ' ' + Customers.LastName AS Fullname,
	Products.ProductName,
	Products.ListPrice - (Products.ListPrice*Products.DiscountPercent*.01) AS DiscountPrice
From Customers JOIN Orders
	ON Customers.CustomerID=Orders.CustomerID
JOIN OrderItems
	ON Orders.OrderID=OrderItems.OrderID
JOIN Products
	ON OrderItems.ProductID=Products.ProductID		
Order By EmailAddress, ProductName;

--Exercise 3
	Select Customers.CustomerID
	From Customers
Except
	Select Orders.CustomerID
	From Orders;

--Exercise 4
	Select Customers.CustomerID
	From Customers
Intersect
	Select Orders.CustomerID
	From Orders

--Exercise 5
Select Customers.CustomerID
	From Customers
Intersect
	Select Addresses.CustomerID
	From Addresses
Except
	Select Orders.CustomerID
	From Orders
	
--Exercise 6
Select ProductName, Quantity, State
From OrderItems
	JOIN Products
		ON OrderItems.ProductID=Products.ProductID
	JOIN Orders
		ON OrderItems.OrderID=Orders.OrderID
	JOIN Customers
		ON Orders.CustomerID=Customers.CustomerID
	JOIN Addresses
		ON Customers.BillingAddressID=Addresses.AddressID
Order By ProductName, State;

