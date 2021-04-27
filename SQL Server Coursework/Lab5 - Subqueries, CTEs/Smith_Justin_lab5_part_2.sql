--Exercise 1
Select CustomerID,
	LastName + ', ' + FirstName AS Fullname,
	(Select COUNT(Distinct OrderId)--count of distinct orderIds where the outer and inner query have matching customerID
	From Orders
	Where Customers.CustomerID=Orders.CustomerID) AS TotalOrders
From Customers 
Order By TotalOrders DESC, Fullname ASC;

--Exercise 2
Select Customers.CustomerID,
	LastName + ', ' + FirstName AS Fullname,
	COUNT(Distinct OrderID) AS TotalOrders
From Customers Left Join Orders
	On Customers.CustomerID=Orders.CustomerID
Group By Customers.CustomerID,LastName + ', ' + FirstName 
Order By TotalOrders DESC, Fullname ASC;

--Exercise 3
WITH ShippingAddresses AS 
(
	Select *
	From Addresses 
	Where AddressID IN 
		(Select ShippingAddressID
		From Customers)
),
CustomersSingleAddress AS
(
	Select *
	From Customers 
	Where ShippingAddressID=BillingAddressID
)

Select CustomersSingleAddress.LastName + ', ' + CustomersSingleAddress.FirstName AS Fullname,
	ShippingAddresses.Line1,
	ShippingAddresses.City,
	ShippingAddresses.State
From CustomersSingleAddress left JOIN ShippingAddresses
	ON CustomersSingleAddress.CustomerID=ShippingAddresses.CustomerID
Order BY State, City, Fullname;

--Exercise 4
With CategoryTotals AS
(
	Select Categories.CategoryID,
		Categories.CategoryName,
		SUM(OrderItems.Quantity) AS TotalCatOrders
	From Categories JOIN Products	
			ON Categories.CategoryID=Products.CategoryID
		JOIN OrderItems
			ON Products.ProductID=OrderItems.ProductID
	Group BY Categories.CategoryID, Categories.CategoryName
),
ProductTables AS
(
	Select Products.CategoryID,
		Products.ProductName,
		SUM(OrderItems.Quantity) AS TotalProdOrders
	From Products JOIN OrderItems
		ON Products.ProductID=OrderItems.ProductID
	Group By Products.CategoryID, Products.ProductName
)

Select CategoryTotals.CategoryName,
	CategoryTotals.TotalCatOrders,
	ProductTables.ProductName,
	ProductTables.TotalProdOrders
From CategoryTotals JOIN ProductTables
	ON CategoryTotals.CategoryID=ProductTables.CategoryID
Order By CategoryTotals.TotalCatOrders DESC, ProductTables.TotalProdOrders DESC;