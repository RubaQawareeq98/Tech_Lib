CREATE FUNCTION fn_GetBorrowedBooksByBorrowerID (@borrowerID INT)
RETURNS TABLE AS
RETURN 

	WITH BorrowedBooks AS
	(
		SELECT BookID
		FROM Loans 
		WHERE BorrowerID = @borrowerID
	)
	SELECT b.*
	FROM BorrowedBooks bb
	JOIN Books b
	ON bb.BookID = b.BookID