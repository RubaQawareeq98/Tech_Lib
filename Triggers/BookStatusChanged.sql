CREATE OR ALTER TRIGGER trg_BookStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
	INSERT INTO AuditLog (BookID, OldStatus,NewStatus) 
	SELECT i.BookID, i.CurrentStatus as newStatus, d.CurrentStatus as oldStatus
	FROM inserted i
	JOIN deleted d
	ON i.BookID = d.BookID
	WHERE i.CurrentStatus <> d.CurrentStatus
END