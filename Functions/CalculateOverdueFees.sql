CREATE FUNCTION fn_CalculateOverdueFees (@loanID INT)
RETURNS INT
BEGIN
DECLARE @fee INT = 0;
DECLARE @overdueDays INT = 0;
DECLARE @returnedDate DATE;
DECLARE @dueDate DATE;

	IF NOT EXISTS (SELECT '*' FROM Loans WHERE LoanID = @loanID)
	BEGIN
		RETURN NULL;
	END

	SELECT 
		@returnedDate = DateReturned,
		@dueDate = DueDate
	FROM Loans
	WHERE LoanID = @loanID;

	IF (@returnedDate IS NULL)
	BEGIN
		SET @returnedDate =	GETDATE()
	END
	
	SET @overdueDays = DATEDIFF(DAY, @dueDate, @returnedDate)
	
	IF (@overdueDays > 0 AND @overdueDays < 30)
	BEGIN
		SET @fee = @overdueDays
	END

	ELSE 
	BEGIN
		SET @overdueDays = @overdueDays - 30;
		SET @fee = 30 + @overdueDays * 2
	END
	RETURN @fee

END