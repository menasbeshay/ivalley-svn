
/****** Object:  StoredProcedure [proc_PassengerLoadByPrimaryKey]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PassengerLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PassengerLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PassengerLoadByPrimaryKey]
(
	@PassengerID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PassengerID],
		[TitleID],
		[FirstName],
		[LastName],
		[DateOfBirth],
		[IsChild],
		[TicketID]
	FROM [Passenger]
	WHERE
		([PassengerID] = @PassengerID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PassengerLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PassengerLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PassengerLoadAll]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PassengerLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PassengerLoadAll];
GO

CREATE PROCEDURE [proc_PassengerLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PassengerID],
		[TitleID],
		[FirstName],
		[LastName],
		[DateOfBirth],
		[IsChild],
		[TicketID]
	FROM [Passenger]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PassengerLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PassengerLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PassengerUpdate]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PassengerUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PassengerUpdate];
GO

CREATE PROCEDURE [proc_PassengerUpdate]
(
	@PassengerID int,
	@TitleID int = NULL,
	@FirstName nvarchar(200) = NULL,
	@LastName nvarchar(200) = NULL,
	@DateOfBirth datetime = NULL,
	@IsChild bit = NULL,
	@TicketID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Passenger]
	SET
		[TitleID] = @TitleID,
		[FirstName] = @FirstName,
		[LastName] = @LastName,
		[DateOfBirth] = @DateOfBirth,
		[IsChild] = @IsChild,
		[TicketID] = @TicketID
	WHERE
		[PassengerID] = @PassengerID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PassengerUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PassengerUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PassengerInsert]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PassengerInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PassengerInsert];
GO

CREATE PROCEDURE [proc_PassengerInsert]
(
	@PassengerID int = NULL output,
	@TitleID int = NULL,
	@FirstName nvarchar(200) = NULL,
	@LastName nvarchar(200) = NULL,
	@DateOfBirth datetime = NULL,
	@IsChild bit = NULL,
	@TicketID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Passenger]
	(
		[TitleID],
		[FirstName],
		[LastName],
		[DateOfBirth],
		[IsChild],
		[TicketID]
	)
	VALUES
	(
		@TitleID,
		@FirstName,
		@LastName,
		@DateOfBirth,
		@IsChild,
		@TicketID
	)

	SET @Err = @@Error

	SELECT @PassengerID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PassengerInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PassengerInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PassengerDelete]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PassengerDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PassengerDelete];
GO

CREATE PROCEDURE [proc_PassengerDelete]
(
	@PassengerID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Passenger]
	WHERE
		[PassengerID] = @PassengerID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PassengerDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PassengerDelete Error on Creation'
GO
