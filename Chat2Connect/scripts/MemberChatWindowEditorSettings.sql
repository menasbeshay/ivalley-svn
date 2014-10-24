CREATE TABLE [dbo].[MemberChatWindowEditorSettings](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[WindowID] [int] NOT NULL,
	[WindowType] [varchar](50) NOT NULL,
	[IsBold] [bit] NOT NULL,
	[IsItalic] [bit] NOT NULL,
	[FontSize] [varchar](50) NULL,
	[ForeColor] [varchar](50) NULL,
 CONSTRAINT [PK_MemberChatWindowEditorSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  StoredProcedure [proc_MemberChatWindowEditorSettingsLoadByPrimaryKey]    Script Date: 23/10/2014 11:58:24 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberChatWindowEditorSettingsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberChatWindowEditorSettingsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberChatWindowEditorSettingsLoadByPrimaryKey]
(
	@ID bigint
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberID],
		[WindowID],
		[WindowType],
		[IsBold],
		[IsItalic],
		[FontSize],
		[ForeColor]
	FROM [MemberChatWindowEditorSettings]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberChatWindowEditorSettingsLoadAll]    Script Date: 23/10/2014 11:58:24 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberChatWindowEditorSettingsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberChatWindowEditorSettingsLoadAll];
GO

CREATE PROCEDURE [proc_MemberChatWindowEditorSettingsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberID],
		[WindowID],
		[WindowType],
		[IsBold],
		[IsItalic],
		[FontSize],
		[ForeColor]
	FROM [MemberChatWindowEditorSettings]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberChatWindowEditorSettingsUpdate]    Script Date: 23/10/2014 11:58:24 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberChatWindowEditorSettingsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberChatWindowEditorSettingsUpdate];
GO

CREATE PROCEDURE [proc_MemberChatWindowEditorSettingsUpdate]
(
	@ID bigint,
	@MemberID int,
	@WindowID int,
	@WindowType varchar(50),
	@IsBold bit,
	@IsItalic bit,
	@FontSize varchar(50) = NULL,
	@ForeColor varchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberChatWindowEditorSettings]
	SET
		[MemberID] = @MemberID,
		[WindowID] = @WindowID,
		[WindowType] = @WindowType,
		[IsBold] = @IsBold,
		[IsItalic] = @IsItalic,
		[FontSize] = @FontSize,
		[ForeColor] = @ForeColor
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_MemberChatWindowEditorSettingsInsert]    Script Date: 23/10/2014 11:58:24 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberChatWindowEditorSettingsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberChatWindowEditorSettingsInsert];
GO

CREATE PROCEDURE [proc_MemberChatWindowEditorSettingsInsert]
(
	@ID bigint = NULL output,
	@MemberID int,
	@WindowID int,
	@WindowType varchar(50),
	@IsBold bit,
	@IsItalic bit,
	@FontSize varchar(50) = NULL,
	@ForeColor varchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberChatWindowEditorSettings]
	(
		[MemberID],
		[WindowID],
		[WindowType],
		[IsBold],
		[IsItalic],
		[FontSize],
		[ForeColor]
	)
	VALUES
	(
		@MemberID,
		@WindowID,
		@WindowType,
		@IsBold,
		@IsItalic,
		@FontSize,
		@ForeColor
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberChatWindowEditorSettingsDelete]    Script Date: 23/10/2014 11:58:24 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberChatWindowEditorSettingsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberChatWindowEditorSettingsDelete];
GO

CREATE PROCEDURE [proc_MemberChatWindowEditorSettingsDelete]
(
	@ID bigint
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberChatWindowEditorSettings]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO

