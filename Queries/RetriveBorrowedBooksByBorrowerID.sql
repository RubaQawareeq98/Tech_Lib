WITH BorrowedBooks AS
(
	SELECT BookID
	FROM Loans 
	WHERE BorrowerID = 11
)
SELECT b.*
FROM BorrowedBooks bb
JOIN Books b
ON bb.BookID = b.BookID