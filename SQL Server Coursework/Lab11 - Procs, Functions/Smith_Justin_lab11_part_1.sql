--Exercise 1
USE MyGuitarShop;
IF OBJECT_ID('spInsertCategory') IS NOT NULL
	DROP PROC spInsertCategory;
GO

CREATE PROC spInsertCategory
	@Category_Name varchar(50)
AS 

IF NOT EXISTS 
		(SELECT *
		 FROM Categories
		 WHERE CategoryName=@Category_Name)
	INSERT INTO Categories
	Values( @Category_Name);
ELSE
	THROW 50001, 'Not a valid Category Name', 1;
GO

--First Attempt
BEGIN TRY
	EXEC spInsertCategory
	@Category_Name=	'pizza';
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());
	IF ERROR_NUMBER() >= 50000
		PRINT 'This is a custom error message.';
END CATCH;

--Second Attempt
BEGIN TRY
	EXEC spInsertCategory
	@Category_Name=	'Drums';
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());
END CATCH;

--Exercise 2
USE MyGuitarShop;
IF OBJECT_ID('spInsertProduct') IS NOT NULL
	DROP PROC spInsertProduct;
GO

CREATE PROC spInsertProduct
	@Category_ID int,
	@Product_Code varchar(10),
	@Product_Name varchar(255),
	@List_Price money,
	@Discount_Percent money
AS 

IF @List_Price < 0
	THROW 50001, 'Not a valid ListPrice', 1;

IF @Discount_Percent < 0
	THROW 50001, 'Not a valid DiscountPercent', 1;

ELSE
	INSERT INTO Products
	(CategoryID, ProductCode, ProductName, Description,
	 ListPrice, DiscountPercent, DateAdded)
	VALUES (@Category_ID,
			@Product_Code,
			@Product_Name,
			'',
			@List_Price,
			@Discount_Percent,
			GETDATE());
GO

--FIRST ATTEMPT, a valid entry
BEGIN TRY
	EXEC spInsertProduct
			 @Category_ID=3, @Product_Code='ludwige', @Product_Name= 'Ludwig 7-piece Drum Set',
			 @List_Price= 1000,  @Discount_Percent=15;
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());
END CATCH; 		

--SECOND ATTEMPT, a negative list price
BEGIN TRY
	EXEC spInsertProduct
			 @Category_ID=3, @Product_Code='ludwigg', @Product_Name= 'Ludwig 7-piece Drum Set',
			 @List_Price= -1000,  @Discount_Percent=15; 
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());
END CATCH; 

--THIRD ATTEMPT, a negative discount percent
BEGIN TRY
	EXEC spInsertProduct
	 @Category_ID=3, @Product_Code='ludwigge', @Product_Name= 'Ludwig 7-piece Drum Set',
			 @List_Price= 1000,  @Discount_Percent=-15; 			
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());
END CATCH;