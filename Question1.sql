DECLARE @BorrowerID INT = 11;

WITH BorrowedBooks AS
(
	SELECT BookID
	FROM Loans 
	WHERE BorrowerID = @BorrowerID
)

SELECT b.*
FROM BorrowedBooks bb
JOIN Books b
ON bb.BookID = b.BookID