--Exercise 1
USE MyGuitarShop;

BEGIN TRY
	BEGIN TRAN;
		DELETE Addresses
		WHERE CustomerID=8;

		DELETE Customers
		WHERE CustomerID=8;
	COMMIT TRAN;
END TRY

BEGIN CATCH
	ROLLBACK TRAN;
END CATCH

--Exercise 2
USE MyGuitarShop;

BEGIN TRY
	BEGIN TRAN;
		INSERT Orders
		VALUES (3, GETDATE(), '10.00', '0.00', NULL, 4, 
		  'American Express', '378282246310005', '04/2019', 4); 
 
		DECLARE @OrderID int= @@IDENTITY; 
 
		INSERT OrderItems
		VALUES (@OrderID, 6, '415.00', '161.85', 1); 
 
		INSERT OrderItems
		VALUES (@OrderID, 1, '699.00', '209.70', 1);

	COMMIT TRAN;
END TRY

BEGIN CATCH
	ROLLBACK TRAN;
END CATCH;