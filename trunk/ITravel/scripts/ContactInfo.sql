
/****** Object:  StoredProcedure [proc_ContactInfoLoadByPrimaryKey]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ContactInfoLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ContactInfoLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ContactInfoLoadByPrimaryKey]
(
	@ContactInfoID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ContactInfoID],
		[PassengerID],
		[TitleID],
		[FirstName],
		[LastName],
		[Email],
		[CountryCode],
		[Mobile]
	FROM [ContactInfo]
	WHERE
		([ContactInfoID] = @ContactInfoID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ContactInfoLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ContactInfoLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ContactInfoLoadAll]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ContactInfoLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ContactInfoLoadAll];
GO

CREATE PROCEDURE [proc_ContactInfoLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ContactInfoID],
		[PassengerID],
		[TitleID],
		[FirstName],
		[LastName],
		[Email],
		[CountryCode],
		[Mobile]
	FROM [ContactInfo]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ContactInfoLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ContactInfoLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ContactInfoUpdate]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ContactInfoUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ContactInfoUpdate];
GO

CREATE PROCEDURE [proc_ContactInfoUpdate]
(
	@ContactInfoID int,
	@PassengerID int = NULL,
	@TitleID int = NULL,
	@FirstName nvarchar(200) = NULL,
	@LastName nvarchar(200) = NULL,
	@Email nvarchar(200) = NULL,
	@CountryCode nvarchar(7) = NULL,
	@Mobile nvarchar(10) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [ContactInfo]
	SET
		[PassengerID] = @PassengerID,
		[TitleID] = @TitleID,
		[FirstName] = @FirstName,
		[LastName] = @LastName,
		[Email] = @Email,
		[CountryCode] = @CountryCode,
		[Mobile] = @Mobile
	WHERE
		[ContactInfoID] = @ContactInfoID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ContactInfoUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ContactInfoUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ContactInfoInsert]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ContactInfoInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ContactInfoInsert];
GO

CREATE PROCEDURE [proc_ContactInfoInsert]
(
	@ContactInfoID int = NULL output,
	@PassengerID int = NULL,
	@TitleID int = NULL,
	@FirstName nvarchar(200) = NULL,
	@LastName nvarchar(200) = NULL,
	@Email nvarchar(200) = NULL,
	@CountryCode nvarchar(7) = NULL,
	@Mobile nvarchar(10) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [ContactInfo]
	(
		[PassengerID],
		[TitleID],
		[FirstName],
		[LastName],
		[Email],
		[CountryCode],
		[Mobile]
	)
	VALUES
	(
		@PassengerID,
		@TitleID,
		@FirstName,
		@LastName,
		@Email,
		@CountryCode,
		@Mobile
	)

	SET @Err = @@Error

	SELECT @ContactInfoID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ContactInfoInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ContactInfoInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ContactInfoDelete]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ContactInfoDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ContactInfoDelete];
GO

CREATE PROCEDURE [proc_ContactInfoDelete]
(
	@ContactInfoID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [ContactInfo]
	WHERE
		[ContactInfoID] = @ContactInfoID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ContactInfoDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ContactInfoDelete Error on Creation'
GO
