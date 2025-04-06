WITH AgeIntervals AS
(
	SELECT l.BookID,
		FLOOR(DATEDIFF(YEAR, bor.DateOfBirth, GetDate()) / 10 * 10) + 1 As lowBound,
		FLOOR(DATEDIFF(YEAR, bor.DateOfBirth, GetDate()) / 10 * 10) + 10 As highBound

	FROM Loans l
	JOIN Borrowers bor
	ON l.BorrowerID = bor.BorrowerID
),
GenreCount AS
(
	SELECT COUNT(g.Name) AS genreCount,
	g.Name,
	CONCAT(ai.lowBound, '-', ai.highBound) AS interval
	FROM AgeIntervals ai
	JOIN Books b
	ON ai.BookID = b.BookID
	JOIN Genres g
	ON b.GenreID = g.GenreID
	GROUP BY ai.lowBound, ai.highBound, g.Name
),
MaxGenreCountBorrowed AS
(
	SELECT g.interval, MAX(g.GenreCount) AS maxGenre
	FROM GenreCount g
	GROUP BY g.interval
)

SELECT gc.interval, gc.Name, gc.GenreCount 
FROM GenreCount as gc
JOIN MaxGenreCountBorrowed as m
ON gc.interval = m.interval 
WHERE gc.GenreCount = m.maxGenre;