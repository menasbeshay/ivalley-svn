
USE [chat2connect]
GO

/****** Object:  StoredProcedure [proc_MemberMessageLoadByPrimaryKey]    Script Date: 13/5/2014 11:30:32 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberMessageLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberMessageLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberMessageLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberID],
		[MessageID],
		[MessageFolderID],
		[IsDeleted],
		[IsRead]
	FROM [MemberMessage]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberMessageLoadAll]    Script Date: 13/5/2014 11:30:32 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberMessageLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberMessageLoadAll];
GO

CREATE PROCEDURE [proc_MemberMessageLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberID],
		[MessageID],
		[MessageFolderID],
		[IsDeleted],
		[IsRead]
	FROM [MemberMessage]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberMessageUpdate]    Script Date: 13/5/2014 11:30:32 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberMessageUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberMessageUpdate];
GO

CREATE PROCEDURE [proc_MemberMessageUpdate]
(
	@ID int,
	@MemberID int = NULL,
	@MessageID int,
	@MessageFolderID int = NULL,
	@IsDeleted bit = NULL,
	@IsRead bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberMessage]
	SET
		[MemberID] = @MemberID,
		[MessageID] = @MessageID,
		[MessageFolderID] = @MessageFolderID,
		[IsDeleted] = @IsDeleted,
		[IsRead] = @IsRead
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_MemberMessageInsert]    Script Date: 13/5/2014 11:30:32 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberMessageInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberMessageInsert];
GO

CREATE PROCEDURE [proc_MemberMessageInsert]
(
	@ID int = NULL output,
	@MemberID int = NULL,
	@MessageID int,
	@MessageFolderID int = NULL,
	@IsDeleted bit = NULL,
	@IsRead bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberMessage]
	(
		[MemberID],
		[MessageID],
		[MessageFolderID],
		[IsDeleted],
		[IsRead]
	)
	VALUES
	(
		@MemberID,
		@MessageID,
		@MessageFolderID,
		@IsDeleted,
		@IsRead
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberMessageDelete]    Script Date: 13/5/2014 11:30:32 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberMessageDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberMessageDelete];
GO

CREATE PROCEDURE [proc_MemberMessageDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberMessage]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MessageLoadByPrimaryKey]    Script Date: 13/5/2014 11:30:32 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MessageLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[SenderID],
		[Subject],
		[Body],
		[ToMembers],
		[CreateDate]
	FROM [Message]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MessageLoadAll]    Script Date: 13/5/2014 11:30:32 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageLoadAll];
GO

CREATE PROCEDURE [proc_MessageLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[SenderID],
		[Subject],
		[Body],
		[ToMembers],
		[CreateDate]
	FROM [Message]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MessageUpdate]    Script Date: 13/5/2014 11:30:32 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageUpdate];
GO

CREATE PROCEDURE [proc_MessageUpdate]
(
	@ID int,
	@SenderID int,
	@Subject nvarchar(1000),
	@Body nvarchar(MAX),
	@ToMembers nvarchar(1000),
	@CreateDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Message]
	SET
		[SenderID] = @SenderID,
		[Subject] = @Subject,
		[Body] = @Body,
		[ToMembers] = @ToMembers,
		[CreateDate] = @CreateDate
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_MessageInsert]    Script Date: 13/5/2014 11:30:32 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageInsert];
GO

CREATE PROCEDURE [proc_MessageInsert]
(
	@ID int = NULL output,
	@SenderID int,
	@Subject nvarchar(1000),
	@Body nvarchar(MAX),
	@ToMembers nvarchar(1000),
	@CreateDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Message]
	(
		[SenderID],
		[Subject],
		[Body],
		[ToMembers],
		[CreateDate]
	)
	VALUES
	(
		@SenderID,
		@Subject,
		@Body,
		@ToMembers,
		@CreateDate
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MessageDelete]    Script Date: 13/5/2014 11:30:32 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageDelete];
GO

CREATE PROCEDURE [proc_MessageDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Message]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO

