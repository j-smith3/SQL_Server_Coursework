--EXERCISE 1
IF DB_ID('MyWebDB') IS NOT NULL
	DROP DATABASE MyWebDB
GO

CREATE DATABASE MyWebDB;
GO

USE MyWebDB;
CREATE TABLE Users
(UserID			INT				PRIMARY KEY 	IDENTITY,
EmailAddress	VARCHAR(50)		NOT NULL,
FirstName		VARCHAR(50)		NOT NULL,
LastName		VARCHAR(50)		NOT NULL);

CREATE TABLE Products
(ProductID		INT				NOT NULL	PRIMARY KEY,
ProductName		VARCHAR(50)		NOT NULL);

CREATE TABLE Downloads
(DownloadID 	INT				NOT NULL	PRIMARY KEY,
UserID			INT				NOT NULL	REFERENCES Users(UserID),
DownloadDate	SMALLDATETIME	NOT NULL,
FileName		VARCHAR(50)		NOT NULL,
ProductID		INT				NOT NULL	REFERENCES Products(ProductID));	


CREATE INDEX IX_Downloads_UserID  --Index user downloads  
	ON Downloads (UserID);
CREATE INDEX IX_Downloads_ProductID  --Index product downloads  
	ON Downloads (ProductID);
	
--EXERCISE 2
--USE MyWebDB;
ALTER TABLE Products
ADD Description		VARCHAR(100)	NOT NULL,
	ListPrice				MONEY			NOT NULL;
	
--EXERCISE 3
--USE MyGuitarShop;
CREATE VIEW v_OrderItemProducts AS 
	SELECT Orders.OrderID, 
		Orders.OrderDate, 
		Orders.TaxAmount, 
		Orders.ShipDate,
		OrderItems.ItemPrice,
		OrderItems.DiscountAmount,
		(OrderItems.ItemPrice-OrderItems.DiscountAmount) AS FinalPrice,
		OrderItems.Quantity,
		((OrderItems.ItemPrice-OrderItems.DiscountAmount)*OrderItems.Quantity) AS ItemTotal,
		Products.ProductName
	FROM Orders 
		JOIN OrderItems
			ON Orders.OrderID=OrderItems.OrderID
		JOIN Products
			ON OrderItems.ProductID=Products.ProductID; 
	
--EXERCISE 4
--USE MyGuitarShop;
CREATE VIEW v_ProductSummary AS
	SELECT ProductName,
		Count(*) AS OrderCount,
		SUM(ItemTotal)AS OrderTotal	
	FROM v_OrderItemProducts
	GROUP BY ProductName;
	