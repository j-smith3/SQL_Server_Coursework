--Exercise 1
USE MyGuitarShop;
IF OBJECT_ID('fnDiscountPrice') IS NOT NULL
	DROP FUNCTION fnDiscountPrice;
GO

CREATE FUNCTION fnDiscountPrice
	(@ItemID int)
	RETURNS money

BEGIN
	RETURN (SELECT ItemPrice-DiscountAmount AS DiscountPrice
			FROM OrderItems
			WHERE ItemID = @ItemID)
END;
GO

PRINT 'Discounted Price $' + CONVERT(varchar, dbo.fnDiscountPrice('5'), 1);

--Exercise 2
USE MyGuitarShop;
IF OBJECT_ID('Products_UPDATE') IS NOT NULL
	DROP TRIGGER Products_UPDATE;
GO

CREATE TRIGGER Products_UPDATE
	ON Products	
	AFTER UPDATE
AS
BEGIN 
	IF EXISTS (Select *
				From deleted JOIN Products
					ON deleted.ProductID=Products.ProductID
				Where deleted.DiscountPercent<>Products.DiscountPercent)
	Begin
		IF EXISTS (Select * 
				   From inserted
				   Where (DiscountPercent < 0 AND DiscountPercent > 100))
			Begin
				;
				THROW 50001, 'Not a valid DiscountPercent', 1;
				ROLLBACK TRAN;
			END; 

		 IF EXISTS (Select *
				   From inserted
				   Where (DiscountPercent > 0 AND DiscountPercent < 1))
			Begin
				;
				SET DiscountPercent = DiscountPercent * 100;
			END;
		
		ELSE 
			COMMIT TRAN;
	END;
END;
Go
--First Attempt, successful
BEGIN TRY
	UPDATE Products
	SET DiscountPercent=5
	Where ProductID=1;
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());
END CATCH

--Second Attempt, DiscountPercent >100
BEGIN TRY
	UPDATE Products
	SET DiscountPercent=101
	Where ProductID=1;
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());
END CATCH

--Third Attempt, DiscountPercent b/t 0-1
BEGIN TRY
	UPDATE Products
	SET DiscountPercent=.3
	Where ProductID=1;
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE());
END CATCH
