CREATE OR ALTER TRIGGER trg_BookStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
	INSERT INTO AuditLog (BookID, OldStatus, NewStatus) 
	SELECT i.BookID, i.CurrentStatus as NewStatus, d.CurrentStatus as OldStatus
	FROM inserted i
	JOIN deleted d
	ON i.BookID = d.BookID
	WHERE i.CurrentStatus <> d.CurrentStatus
END