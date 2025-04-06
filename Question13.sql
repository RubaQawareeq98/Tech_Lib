CREATE PROCEDURE sp_StoreOverdueBorrowsToTempTable
AS
BEGIN
	DROP TABLE IF EXISTS OverdueBorrowers
	CREATE TABLE OverdueBorrowers(
	OverdueID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	BorrowerID INT NOT NULL,
	LoanID INT NOT NULL
	);

	INSERT INTO OverdueBorrowers (BorrowerID, LoanID)
	SELECT BorrowerID, LoanID
	FROM Loans
	WHERE DateReturned IS NULL AND GETDATE() > DueDate;

	SELECT o.BorrowerID, l.BookID, l.DueDate
	FROM OverdueBorrowers as o
	JOIN Loans as l
	ON l.LoanID = o.LoanID;

END