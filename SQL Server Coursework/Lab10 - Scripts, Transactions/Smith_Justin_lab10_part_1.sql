--Exercise 1
DECLARE @counter int = 1;
DECLARE @twenty int=20;
DECLARE @ten int=10;

PRINT 'Common Factors of 10 and 20';

while (@counter <= @twenty)
	BEGIN
		IF (@twenty%@counter=0)
			BEGIN
				IF (@ten%@counter=0)
					PRINT @counter;
			END
		set @counter=@counter+1;
	END;
	
--Exercise 2 
USE MyGuitarShop;

BEGIN TRY
	INSERT INTO Categories
	VALUES ('Guitars');
	PRINT 'SUCCESS: Record was inserted.';
END TRY

BEGIN CATCH
	PRINT 'FAILURE: Record was not inserted.'
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;

