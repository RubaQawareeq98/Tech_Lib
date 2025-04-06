SELECT BorrowerID,
RANK() OVER(ORDER BY COUNT(BorrowerID) DESC) AS BorrowingFrequencyRank
FROM Loans
GROUP By BorrowerID