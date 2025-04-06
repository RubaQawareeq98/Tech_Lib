-- Loans
CREATE INDEX IX_Loans_BorrowerID ON Loans (BorrowerID);
CREATE INDEX IX_Loans_BookID ON Loans (BookID);
CREATE INDEX IX_Loans_DateReturned ON Loans (DateReturned);
CREATE INDEX IX_Loans_DateBorrowed ON Loans (DateBorrowed);
CREATE INDEX IX_Loans_DueDate ON Loans (DueDate);
CREATE INDEX IX_Loans_DateBorrowed_BookID ON Loans (DateBorrowed, BookID);
CREATE INDEX IX_Loans_DateBorrowed_BookID_BorrowerID ON Loans(DateBorrowed, BookID, BorrowerID);
CREATE INDEX IX_Loans_DueDate_DateReturned ON Loans(DueDate, DateReturned, BorrowerID, LoanID);
CREATE INDEX IX_OverdueBorrowers_BorrowerID_LoanID ON OverdueBorrowers(BorrowerID, LoanID);


-- Books
CREATE INDEX IX_Books_GenreID ON Books (GenreID);
CREATE INDEX IX_Books_CurrentStatus ON Books (CurrentStatus);

-- Borrowers
CREATE UNIQUE INDEX UIX_Borrowers_Email ON Borrowers (Email);

