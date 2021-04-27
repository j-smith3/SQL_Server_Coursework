--Exercise 1
INSERT INTO Categories
	(CategoryName)
VALUES ('Brass');

--Exercise 2
UPDATE Categories
SET CategoryName='Woodwinds'
Where CategoryID=5;

--Exercise 3
DELETE Categories
WHERE CategoryID=5;

--Exercise 4
INSERT INTO Products	
	(CategoryID, ProductCode, ProductName, Description,
	ListPrice, DiscountPercent, DateAdded)
VALUES 
	(4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 
	'Long description to come.', 799.99, 0, '2019-02-21 20:32:10.000'); 

--Exercise 5
UPDATE Products
SET DiscountPercent=35
WHERE ProductID=11;

--Exercise 6
DELETE Products
WHERE CategoryID=4; 

DELETE Categories
WHERE CategoryID=4;

--Exercise 7
Insert Into Customers
	(EmailAddress, Password, FirstName, LastName)
Values
	('rick@raven.com', '', 'Rick', 'Raven');

--Exercise 8
Update Customers
Set Password='secret'
Where EmailAddress='rick@raven.com';

--Exercise 9
Update Customers
Set Password='reset';
