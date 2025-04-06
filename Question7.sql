CREATE FUNCTION fn_BookBorrowingFrequency (@bookID INT)
RETURNS INT
AS BEGIN
	
	DECLARE @borrowingCount INT = 0;
	
	SELECT @borrowingCount = COUNT(*) 
	FROM Loans
	WHERE BookID = @bookID
	GROUP BY BookID

	RETURN @borrowingCount
END