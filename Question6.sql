CREATE FUNCTION fn_CalculateOverdueFees (@loanID INT)
RETURNS INT
BEGIN
DECLARE @fee INT = 0;
DECLARE @overdueDays INT = 0;
DECLARE @returnedDate DATE;

	SELECT @returnedDate = DateReturned
	FROM Loans
	WHERE LoanID = @loanID;

	IF (@returnedDate IS NULL)
	BEGIN
		SET @returnedDate =	GETDATE()
	END
	
	SELECT @overdueDays = DATEDIFF(DAY, DueDate, @returnedDate)
	FROM Loans
	WHERE LoanID = @loanID
	
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