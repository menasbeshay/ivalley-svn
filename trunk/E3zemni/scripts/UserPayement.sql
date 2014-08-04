
/****** Object:  StoredProcedure [proc_UserPayementLoadByPrimaryKey]    Script Date: 8/4/2014 1:27:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserPayementLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserPayementLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_UserPayementLoadByPrimaryKey]
(
	@PayementID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PayementID],
		[UserID],
		[CardID],
		[CardDesign],
		[CardCount],
		[EnvelopID],
		[EnvelopCount],
		[TotalPrice],
		[PayementDate],
		[OrderStatus]
	FROM [UserPayement]
	WHERE
		([PayementID] = @PayementID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserPayementLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserPayementLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserPayementLoadAll]    Script Date: 8/4/2014 1:27:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserPayementLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserPayementLoadAll];
GO

CREATE PROCEDURE [proc_UserPayementLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PayementID],
		[UserID],
		[CardID],
		[CardDesign],
		[CardCount],
		[EnvelopID],
		[EnvelopCount],
		[TotalPrice],
		[PayementDate],
		[OrderStatus]
	FROM [UserPayement]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserPayementLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserPayementLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserPayementUpdate]    Script Date: 8/4/2014 1:27:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserPayementUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserPayementUpdate];
GO

CREATE PROCEDURE [proc_UserPayementUpdate]
(
	@PayementID int,
	@UserID int = NULL,
	@CardID int = NULL,
	@CardDesign nvarchar(250) = NULL,
	@CardCount int = NULL,
	@EnvelopID int = NULL,
	@EnvelopCount int = NULL,
	@TotalPrice float = NULL,
	@PayementDate datetime = NULL,
	@OrderStatus int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [UserPayement]
	SET
		[UserID] = @UserID,
		[CardID] = @CardID,
		[CardDesign] = @CardDesign,
		[CardCount] = @CardCount,
		[EnvelopID] = @EnvelopID,
		[EnvelopCount] = @EnvelopCount,
		[TotalPrice] = @TotalPrice,
		[PayementDate] = @PayementDate,
		[OrderStatus] = @OrderStatus
	WHERE
		[PayementID] = @PayementID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserPayementUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserPayementUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_UserPayementInsert]    Script Date: 8/4/2014 1:27:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserPayementInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserPayementInsert];
GO

CREATE PROCEDURE [proc_UserPayementInsert]
(
	@PayementID int = NULL output,
	@UserID int = NULL,
	@CardID int = NULL,
	@CardDesign nvarchar(250) = NULL,
	@CardCount int = NULL,
	@EnvelopID int = NULL,
	@EnvelopCount int = NULL,
	@TotalPrice float = NULL,
	@PayementDate datetime = NULL,
	@OrderStatus int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [UserPayement]
	(
		[UserID],
		[CardID],
		[CardDesign],
		[CardCount],
		[EnvelopID],
		[EnvelopCount],
		[TotalPrice],
		[PayementDate],
		[OrderStatus]
	)
	VALUES
	(
		@UserID,
		@CardID,
		@CardDesign,
		@CardCount,
		@EnvelopID,
		@EnvelopCount,
		@TotalPrice,
		@PayementDate,
		@OrderStatus
	)

	SET @Err = @@Error

	SELECT @PayementID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserPayementInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserPayementInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserPayementDelete]    Script Date: 8/4/2014 1:27:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserPayementDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserPayementDelete];
GO

CREATE PROCEDURE [proc_UserPayementDelete]
(
	@PayementID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [UserPayement]
	WHERE
		[PayementID] = @PayementID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserPayementDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserPayementDelete Error on Creation'
GO
