WITH AllBorrowerLoans AS
(
	SELECT BorrowerID,
	COUNT(*) AS Times
	FROM Loans
	GROUP BY BorrowerID
	HAVING COUNT(*) >= 2  
),
NotReturnedBooks AS
(
	SELECT BorrowerID,
	COUNT(*) AS Times
	FROM Loans
	WHERE DateReturned IS NULL
	GrouP BY BorrowerID
)

SELECT bc.*
FROM NotReturnedBooks bc
JOIN AllBorrowerLoans bl
ON bc.BorrowerID = bl.BorrowerID
WHERE bc.Times  = bl.Times
