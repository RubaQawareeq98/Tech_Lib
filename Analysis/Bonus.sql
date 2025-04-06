WITH BorrowCounts AS
(
	SELECT DATENAME(DW, DateBorrowed) as dayOfWeek,
	COUNT(*) as borrowsCount
	FROM Loans
	GROUP BY DATENAME(DW, DateBorrowed)
),
TotalBorrows AS
(
	SELECT SUM (borrowsCount) as Total
	FROM BorrowCounts
)
select b.dayOfWeek, b.borrowsCount, t.total,
ROUND(b.borrowsCount * 100.0 / t.total, 2) as borrowsPercentage
FROM TotalBorrows t
CROSS JOIN BorrowCounts b 
ORDER BY borrowsPercentage DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY
