
/****** Object:  StoredProcedure [proc_MemberMessageLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberMessageLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberMessageLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberMessageLoadByPrimaryKey]
(
	@MemberMessageID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberMessageID],
		[MemberID],
		[MessageFolderID],
		[SenderID],
		[SendDate],
		[MessageSubject],
		[MessageContent],
		[IsDeleted],
		[IsRead],
		[OperationID]
	FROM [MemberMessage]
	WHERE
		([MemberMessageID] = @MemberMessageID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberMessageLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberMessageLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberMessageLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberMessageLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberMessageLoadAll];
GO

CREATE PROCEDURE [proc_MemberMessageLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberMessageID],
		[MemberID],
		[MessageFolderID],
		[SenderID],
		[SendDate],
		[MessageSubject],
		[MessageContent],
		[IsDeleted],
		[IsRead],
		[OperationID]
	FROM [MemberMessage]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberMessageLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberMessageLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberMessageUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberMessageUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberMessageUpdate];
GO

CREATE PROCEDURE [proc_MemberMessageUpdate]
(
	@MemberMessageID int,
	@MemberID int = NULL,
	@MessageFolderID int = NULL,
	@SenderID int = NULL,
	@SendDate datetime = NULL,
	@MessageSubject nvarchar(3000) = NULL,
	@MessageContent nvarchar(MAX) = NULL,
	@IsDeleted bit = NULL,
	@IsRead bit = NULL,
	@OperationID uniqueidentifier = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberMessage]
	SET
		[MemberID] = @MemberID,
		[MessageFolderID] = @MessageFolderID,
		[SenderID] = @SenderID,
		[SendDate] = @SendDate,
		[MessageSubject] = @MessageSubject,
		[MessageContent] = @MessageContent,
		[IsDeleted] = @IsDeleted,
		[IsRead] = @IsRead,
		[OperationID] = @OperationID
	WHERE
		[MemberMessageID] = @MemberMessageID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberMessageUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberMessageUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberMessageInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberMessageInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberMessageInsert];
GO

CREATE PROCEDURE [proc_MemberMessageInsert]
(
	@MemberMessageID int = NULL output,
	@MemberID int = NULL,
	@MessageFolderID int = NULL,
	@SenderID int = NULL,
	@SendDate datetime = NULL,
	@MessageSubject nvarchar(3000) = NULL,
	@MessageContent nvarchar(MAX) = NULL,
	@IsDeleted bit = NULL,
	@IsRead bit = NULL,
	@OperationID uniqueidentifier = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberMessage]
	(
		[MemberID],
		[MessageFolderID],
		[SenderID],
		[SendDate],
		[MessageSubject],
		[MessageContent],
		[IsDeleted],
		[IsRead],
		[OperationID]
	)
	VALUES
	(
		@MemberID,
		@MessageFolderID,
		@SenderID,
		@SendDate,
		@MessageSubject,
		@MessageContent,
		@IsDeleted,
		@IsRead,
		@OperationID
	)

	SET @Err = @@Error

	SELECT @MemberMessageID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberMessageInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberMessageInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberMessageDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberMessageDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberMessageDelete];
GO

CREATE PROCEDURE [proc_MemberMessageDelete]
(
	@MemberMessageID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberMessage]
	WHERE
		[MemberMessageID] = @MemberMessageID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberMessageDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberMessageDelete Error on Creation'
GO
