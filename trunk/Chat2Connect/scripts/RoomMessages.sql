
/****** Object:  StoredProcedure [proc_RoomMessagesLoadByPrimaryKey]    Script Date: 6/29/2014 1:45:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMessagesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMessagesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomMessagesLoadByPrimaryKey]
(
	@ID bigint
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomID],
		[MemberID],
		[Message],
		[MessageDate],
		[MemberLevel]
	FROM [RoomMessages]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMessagesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMessagesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMessagesLoadAll]    Script Date: 6/29/2014 1:45:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMessagesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMessagesLoadAll];
GO

CREATE PROCEDURE [proc_RoomMessagesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomID],
		[MemberID],
		[Message],
		[MessageDate],
		[MemberLevel]
	FROM [RoomMessages]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMessagesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMessagesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMessagesUpdate]    Script Date: 6/29/2014 1:45:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMessagesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMessagesUpdate];
GO

CREATE PROCEDURE [proc_RoomMessagesUpdate]
(
	@ID bigint,
	@RoomID int,
	@MemberID int,
	@Message nvarchar(MAX) = NULL,
	@MessageDate datetime,
	@MemberLevel int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomMessages]
	SET
		[RoomID] = @RoomID,
		[MemberID] = @MemberID,
		[Message] = @Message,
		[MessageDate] = @MessageDate,
		[MemberLevel] = @MemberLevel
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMessagesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMessagesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RoomMessagesInsert]    Script Date: 6/29/2014 1:45:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMessagesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMessagesInsert];
GO

CREATE PROCEDURE [proc_RoomMessagesInsert]
(
	@ID bigint = NULL output,
	@RoomID int,
	@MemberID int,
	@Message nvarchar(MAX) = NULL,
	@MessageDate datetime,
	@MemberLevel int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomMessages]
	(
		[RoomID],
		[MemberID],
		[Message],
		[MessageDate],
		[MemberLevel]
	)
	VALUES
	(
		@RoomID,
		@MemberID,
		@Message,
		@MessageDate,
		@MemberLevel
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMessagesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMessagesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMessagesDelete]    Script Date: 6/29/2014 1:45:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMessagesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMessagesDelete];
GO

CREATE PROCEDURE [proc_RoomMessagesDelete]
(
	@ID bigint
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomMessages]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMessagesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMessagesDelete Error on Creation'
GO
