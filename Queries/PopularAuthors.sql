WITH BooksRank AS
(
	SELECT BookID,
	COUNT(BookID) as TotalBooks
	FROM Loans 
	GROUP BY BookID
)

SELECT b.BookID, b.Author, b.Title, br.TotalBooks
FROM BooksRank br
JOIN Books b
ON br.BookID = b.BookID
ORDER BY TotalBooks DESC