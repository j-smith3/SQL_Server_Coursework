--Exercise 1
Select CategoryName, ProductName, ListPrice
From Products JOIN Categories
	ON Products.CategoryID = Categories.CategoryID
Order By CategoryName, ProductName;

--Exercise 2
Select FirstName, LastName, Line1, City, State, ZipCode
From Addresses JOIN Customers
	ON Addresses.CustomerID = Customers.CustomerID
Where Customers.EmailAddress='allan.sherwood@yahoo.com';

--Exercise 3
Select FirstName, LastName, Line1, City, State, ZipCode
From Addresses JOIN Customers
	ON Addresses.CustomerID = Customers.CustomerID
Where Addresses.AddressID= Customers.ShippingAddressID;

--Exercise 4
Select LastName, FirstName, OrderDate, 
	ProductName, ItemPrice, DiscountAmount, Quantity
From Customers AS cstm
	JOIN Orders AS ordr
	 	ON cstm.CustomerID = ordr.CustomerID
	JOIN OrderItems AS oItems
		ON ordr.OrderID=oItems.OrderID
	JOIN Products AS prod
		ON oItems.ProductID=prod.ProductID
Order By LastName, OrderDate, ProductName;

--Exercise 5
Select DISTINCT Products1.ProductName, Products1.ListPrice
From Products AS Products1 JOIN Products AS Products2
	ON Products1.ProductID<>Products2.ProductID
	AND Products1.ListPrice=Products2.ListPrice
Order By ProductName;

--Exercise 6
Select Categories.CategoryName, Products.ProductID
From Categories LEFT JOIN Products
	On Categories.CategoryID=Products.CategoryID
Where ProductID IS NULL;


