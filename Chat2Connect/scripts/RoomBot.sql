
/****** Object:  StoredProcedure [proc_RoomBotLoadByPrimaryKey]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomBotLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomBotLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomBotLoadByPrimaryKey]
(
	@BotID int,
	@RoomID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[BotID],
		[RoomID],
		[ExpiryDate]
	FROM [RoomBot]
	WHERE
		([BotID] = @BotID) AND
		([RoomID] = @RoomID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomBotLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomBotLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomBotLoadAll]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomBotLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomBotLoadAll];
GO

CREATE PROCEDURE [proc_RoomBotLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[BotID],
		[RoomID],
		[ExpiryDate]
	FROM [RoomBot]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomBotLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomBotLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomBotUpdate]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomBotUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomBotUpdate];
GO

CREATE PROCEDURE [proc_RoomBotUpdate]
(
	@BotID int,
	@RoomID int,
	@ExpiryDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomBot]
	SET
		[ExpiryDate] = @ExpiryDate
	WHERE
		[BotID] = @BotID
	AND	[RoomID] = @RoomID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomBotUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomBotUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RoomBotInsert]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomBotInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomBotInsert];
GO

CREATE PROCEDURE [proc_RoomBotInsert]
(
	@BotID int,
	@RoomID int,
	@ExpiryDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomBot]
	(
		[BotID],
		[RoomID],
		[ExpiryDate]
	)
	VALUES
	(
		@BotID,
		@RoomID,
		@ExpiryDate
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomBotInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomBotInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomBotDelete]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomBotDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomBotDelete];
GO

CREATE PROCEDURE [proc_RoomBotDelete]
(
	@BotID int,
	@RoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomBot]
	WHERE
		[BotID] = @BotID AND
		[RoomID] = @RoomID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomBotDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomBotDelete Error on Creation'
GO
