
USE [chat2connect]
GO

/****** Object:  StoredProcedure [proc_RoomMessagesLoadByPrimaryKey]    Script Date: 11/6/2014 1:22:07 AM ******/
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
		[MessageDate]
	FROM [RoomMessages]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomMessagesLoadAll]    Script Date: 11/6/2014 1:22:07 AM ******/
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
		[MessageDate]
	FROM [RoomMessages]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomMessagesUpdate]    Script Date: 11/6/2014 1:22:07 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMessagesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMessagesUpdate];
GO

CREATE PROCEDURE [proc_RoomMessagesUpdate]
(
	@ID bigint,
	@RoomID int,
	@MemberID int,
	@Message nvarchar(MAX) = NULL,
	@MessageDate datetime
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
		[MessageDate] = @MessageDate
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_RoomMessagesInsert]    Script Date: 11/6/2014 1:22:07 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMessagesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMessagesInsert];
GO

CREATE PROCEDURE [proc_RoomMessagesInsert]
(
	@ID bigint = NULL output,
	@RoomID int,
	@MemberID int,
	@Message nvarchar(MAX) = NULL,
	@MessageDate datetime
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
		[MessageDate]
	)
	VALUES
	(
		@RoomID,
		@MemberID,
		@Message,
		@MessageDate
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomMessagesDelete]    Script Date: 11/6/2014 1:22:07 AM ******/
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

