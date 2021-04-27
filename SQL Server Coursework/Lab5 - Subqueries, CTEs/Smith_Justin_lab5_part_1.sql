--Exercise 1
Select DISTINCT CategoryName
From Categories
Where CategoryID IN
	(Select CategoryID
	From Products)
Order by CategoryName;

--Exercise 2
Select ProductName,
	ListPrice
From Products
Where ListPrice >
	(Select AVG(ListPrice)
	From Products)
Order By ListPrice DESC;

--Exercise 3
Select CategoryName
From Categories
Where NOT EXISTS 
	(Select *
	From Products
	Where Categories.CategoryID=Products.CategoryID);

--Exercise 4
Select Customers.EmailAddress,
	OrderItems.OrderID,
	SUM((OrderItems.ItemPrice-OrderItems.DiscountAmount)*OrderItems.Quantity) AS OrderTotal
From Customers JOIN Orders
	On Customers.CustomerID=Orders.CustomerID
	JOIN OrderItems
	ON Orders.OrderID=OrderItems.OrderID
Group by Customers.EmailAddress, OrderItems.OrderID;

Select Customers.EmailAddress,
	MAX(OrderTotal) AS MaxOrder
From Customers JOIN
	 (Select Customers.EmailAddress,
		OrderItems.OrderID,
		SUM((OrderItems.ItemPrice-OrderItems.DiscountAmount)*OrderItems.Quantity) AS OrderTotal
	From Customers JOIN Orders
		On Customers.CustomerID=Orders.CustomerID
		JOIN OrderItems
		ON Orders.OrderID=OrderItems.OrderID
	Group By Customers.EmailAddress, OrderItems.OrderID) AS TotalOrder
	ON Customers.EmailAddress=TotalOrder.EmailAddress
Group By Customers.EmailAddress;

--Exercise 5
SELECT DISTINCT table1.ProductName, table1.DiscountPercent
FROM Products AS table1
WHERE NOT EXISTS
    (SELECT table2.ProductName, table2.DiscountPercent
     FROM Products AS table2
     WHERE table1.DiscountPercent = table2.DiscountPercent
           AND table1.ProductName <> table2.ProductName)
		   --return a result set that has matching discount % from the two tables AND non matching names. Then NOT EXIST Excludes these from the final result set
ORDER BY ProductName;

--Exercise 6
Select EmailAddress, 
	OrderId,
	OrderDate AS OldestOrder
From Customers Join Orders 
	On Customers.CustomerID=Orders.CustomerID
Where Orders.OrderDate =
	(Select Min(OrderDate)
	From Orders AS Ord1
	Where Customers.CustomerID=Ord1.CustomerID)
--subQuery returns oldest date where the customerID matches the outer query