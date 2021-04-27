--Exercise 1
Select Count(*) AS NumberOfOrders, Sum(TaxAmount) AS TotalTaxAmount
From Orders;

--Exercise 2
Select
	Categories.CategoryName,
	Count(*) As NumberOfProducts,
	Max(ListPrice) As MostExpensiveProduct
From Categories Join Products
	On Categories.CategoryID=Products.CategoryID
Group by Categories.CategoryName
Order by NumberOfProducts DESC;

--Exercise 3
Select
	Customers.EmailAddress,
	Sum(OrderItems.ItemPrice*OrderItems.Quantity) AS TotalPrice,
	Sum(OrderItems.DiscountAmount*OrderItems.Quantity) AS TotalDiscount
From Customers Join Orders
		On Customers.CustomerID=Orders.CustomerID
	Join OrderItems
		On Orders.OrderID=OrderItems.OrderID
Group by Customers.EmailAddress
Order by TotalPrice DESC;

--Exercise 4
Select
	Customers.EmailAddress,
	Count(DISTINCT Orders.OrderID) AS NumberOfOrders,
	Sum((OrderItems.ItemPrice-OrderItems.DiscountAmount)*OrderItems.Quantity) AS TotalAmount
From Customers Join Orders
		On Customers.CustomerID=Orders.CustomerID
	Join OrderItems
		On Orders.OrderID=OrderItems.OrderID
Group by Customers.EmailAddress
Having Count(DISTINCT Orders.OrderID)>1
Order by TotalAmount DESC;

--Exercise 5
Select
	Customers.EmailAddress,
	Count(Distinct Orders.OrderID) AS NumberOfOrders,
	Sum((OrderItems.ItemPrice-OrderItems.DiscountAmount)*OrderItems.Quantity) AS TotalAmount
From Customers Join Orders
		On Customers.CustomerID=Orders.CustomerID
	Join OrderItems
		On Orders.OrderID=OrderItems.OrderID
Where ItemPrice>400
Group by Customers.EmailAddress
Having Count(Distinct Orders.OrderID)>1
Order by TotalAmount DESC;

--Exercise 6
Select
	Customers.EmailAddress,
	Count(DISTINCT ProductID) As Count	
From Customers Join Orders
		On Customers.CustomerID=Orders.CustomerID
	Join OrderItems
		On Orders.OrderID=OrderItems.OrderID
Group by Customers.EmailAddress
Having Count(*)>1