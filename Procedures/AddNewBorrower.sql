CREATE PROCEDURE sp_AddNewBorrower
			(
			@FirstName NVARCHAR(100),
			@LastName NVARCHAR(100),
			@Email NVARCHAR(256),
			@DateOfBirth DATE,
			@MembershipDate DATE
			)
AS
BEGIN
	IF EXISTS (SELECT * FROM Borrowers WHERE Email = @Email)
	BEGIN
		RAISERROR ('Email is already Taken', 16,1)
	END

	INSERT INTO Borrowers VALUES (@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);
	RETURN SCOPE_IDENTITY()
END