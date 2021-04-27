--Exercise 1
Select ProductID,
	2 AS CategoryID,
	ProductCode,
	ProductName,
	Description,
	ListPrice,
	DiscountPercent,
	DateAdded
Into ProductsCopy
From Products 
Where CategoryID<>3;

--Exercise 2
Merge Into ProductsCopy AS pCopy
Using Products AS prod
On prod.ProductID=pCopy.ProductID
When Matched Then
	Update Set 
		pCopy.CategoryID=prod.CategoryID
When Not Matched Then
	Insert 
		(CategoryId, ProductCode, ProductName, 
		Description, ListPrice, DiscountPercent, DateAdded)
	Values
		(prod.CategoryId, prod.ProductCode, prod.ProductName, 
		prod.Description, prod.ListPrice, prod.DiscountPercent, prod.DateAdded)
;
