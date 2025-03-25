WITH BorrowersCount AS
(
	SELECT BorrowerID,
	COUNT(*) AS Times
	FROM Loans
	WHERE DateReturned IS NULL
	GROUP BY BorrowerID
	HAVING COUNT(*) >= 2  
)
SELECT b.*, bc.Times
FROM Borrowers b
JOIN BorrowersCount bc
ON b.BorrowerID = bc.BorrowerID
