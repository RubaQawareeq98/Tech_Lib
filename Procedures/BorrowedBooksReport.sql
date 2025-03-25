CREATE PROCEDURE sp_BorrowedBooksReport (@startDate DATE, @endDate DATE)
AS
BEGIN
	SELECT b.BookID, b.Title, bor.BorrowerID, CONCAT(bor.FirstName,' ', bor.LastName) as borrowerName,
	l.DateBorrowed
	FROM Loans l
	JOIN Books b
	ON l.BookID = b.BookID
	JOIN Borrowers bor
	ON l.BorrowerID = bor.BorrowerID
	WHERE
		l.DateBorrowed >= @startDate AND l.DateBorrowed <= @endDate
END