
SELECT b.*, l.BorrowerID
FROM Loans l
JOIN Books b
ON l.BookID = b.BookID
WHERE l.DateReturned IS NOT NULL AND DATEDIFF(DAY, l.DueDate, l.DateReturned) > 30