DECLARE @month INT = 5; 

WITH PopularBooks AS
	(
		SELECT BookID,
		DENSE_RANK() OVER(ORDER BY COUNT(*)  DESC) as Rank

		FROM Loans
		WHERE Month(DateBorrowed) = @month
		GROUP BY BookID
	),
	MostPopularBook AS
	(
		SELECT TOP 1 * FROM PopularBooks
	)
	select  g.*
	from Books b
	JOIN Genres g
	ON b.GenreID = g.GenreID
	JOIN MostPopularBook m
	ON m.BookID = b.BookID