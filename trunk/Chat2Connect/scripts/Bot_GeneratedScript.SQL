
USE [chat2connect]
GO

/****** Object:  StoredProcedure [proc_BotLoadByPrimaryKey]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_BotLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[Name],
		[Title],
		[Description],
		[IconPath],
		[IsOptional],
		[RowStatusID]
	FROM [Bot]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_BotLoadAll]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotLoadAll];
GO

CREATE PROCEDURE [proc_BotLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[Name],
		[Title],
		[Description],
		[IconPath],
		[IsOptional],
		[RowStatusID]
	FROM [Bot]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_BotUpdate]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotUpdate];
GO

CREATE PROCEDURE [proc_BotUpdate]
(
	@ID int,
	@Name varchar(50),
	@Title nvarchar(500) = NULL,
	@Description nvarchar(MAX) = NULL,
	@IconPath varchar(250) = NULL,
	@IsOptional nchar(10) = NULL,
	@RowStatusID tinyint
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Bot]
	SET
		[Name] = @Name,
		[Title] = @Title,
		[Description] = @Description,
		[IconPath] = @IconPath,
		[IsOptional] = @IsOptional,
		[RowStatusID] = @RowStatusID
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_BotInsert]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotInsert];
GO

CREATE PROCEDURE [proc_BotInsert]
(
	@ID int,
	@Name varchar(50),
	@Title nvarchar(500) = NULL,
	@Description nvarchar(MAX) = NULL,
	@IconPath varchar(250) = NULL,
	@IsOptional nchar(10) = NULL,
	@RowStatusID tinyint
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Bot]
	(
		[ID],
		[Name],
		[Title],
		[Description],
		[IconPath],
		[IsOptional],
		[RowStatusID]
	)
	VALUES
	(
		@ID,
		@Name,
		@Title,
		@Description,
		@IconPath,
		@IsOptional,
		@RowStatusID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_BotDelete]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotDelete];
GO

CREATE PROCEDURE [proc_BotDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Bot]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_BotPointsLoadByPrimaryKey]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotPointsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotPointsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_BotPointsLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[BotID],
		[Points],
		[BotDurationID]
	FROM [BotPoints]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_BotPointsLoadAll]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotPointsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotPointsLoadAll];
GO

CREATE PROCEDURE [proc_BotPointsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[BotID],
		[Points],
		[BotDurationID]
	FROM [BotPoints]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_BotPointsUpdate]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotPointsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotPointsUpdate];
GO

CREATE PROCEDURE [proc_BotPointsUpdate]
(
	@ID int,
	@BotID int,
	@Points int,
	@BotDurationID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [BotPoints]
	SET
		[BotID] = @BotID,
		[Points] = @Points,
		[BotDurationID] = @BotDurationID
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_BotPointsInsert]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotPointsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotPointsInsert];
GO

CREATE PROCEDURE [proc_BotPointsInsert]
(
	@ID int = NULL output,
	@BotID int,
	@Points int,
	@BotDurationID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [BotPoints]
	(
		[BotID],
		[Points],
		[BotDurationID]
	)
	VALUES
	(
		@BotID,
		@Points,
		@BotDurationID
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_BotPointsDelete]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotPointsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotPointsDelete];
GO

CREATE PROCEDURE [proc_BotPointsDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [BotPoints]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_EmailOwnerBotLoadByPrimaryKey]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EmailOwnerBotLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EmailOwnerBotLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_EmailOwnerBotLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomBotID],
		[Message]
	FROM [EmailOwnerBot]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_EmailOwnerBotLoadAll]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EmailOwnerBotLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EmailOwnerBotLoadAll];
GO

CREATE PROCEDURE [proc_EmailOwnerBotLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomBotID],
		[Message]
	FROM [EmailOwnerBot]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_EmailOwnerBotUpdate]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EmailOwnerBotUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EmailOwnerBotUpdate];
GO

CREATE PROCEDURE [proc_EmailOwnerBotUpdate]
(
	@ID int,
	@RoomBotID int,
	@Message nvarchar(500)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [EmailOwnerBot]
	SET
		[RoomBotID] = @RoomBotID,
		[Message] = @Message
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_EmailOwnerBotInsert]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EmailOwnerBotInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EmailOwnerBotInsert];
GO

CREATE PROCEDURE [proc_EmailOwnerBotInsert]
(
	@ID int = NULL output,
	@RoomBotID int,
	@Message nvarchar(500)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [EmailOwnerBot]
	(
		[RoomBotID],
		[Message]
	)
	VALUES
	(
		@RoomBotID,
		@Message
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_EmailOwnerBotDelete]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EmailOwnerBotDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EmailOwnerBotDelete];
GO

CREATE PROCEDURE [proc_EmailOwnerBotDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [EmailOwnerBot]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_InviteFriendBanBootLoadByPrimaryKey]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InviteFriendBanBootLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InviteFriendBanBootLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_InviteFriendBanBootLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomBotID],
		[MemberLevels]
	FROM [InviteFriendBanBoot]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_InviteFriendBanBootLoadAll]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InviteFriendBanBootLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InviteFriendBanBootLoadAll];
GO

CREATE PROCEDURE [proc_InviteFriendBanBootLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomBotID],
		[MemberLevels]
	FROM [InviteFriendBanBoot]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_InviteFriendBanBootUpdate]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InviteFriendBanBootUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InviteFriendBanBootUpdate];
GO

CREATE PROCEDURE [proc_InviteFriendBanBootUpdate]
(
	@ID int,
	@RoomBotID int,
	@MemberLevels varchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [InviteFriendBanBoot]
	SET
		[RoomBotID] = @RoomBotID,
		[MemberLevels] = @MemberLevels
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_InviteFriendBanBootInsert]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InviteFriendBanBootInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InviteFriendBanBootInsert];
GO

CREATE PROCEDURE [proc_InviteFriendBanBootInsert]
(
	@ID int = NULL output,
	@RoomBotID int,
	@MemberLevels varchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [InviteFriendBanBoot]
	(
		[RoomBotID],
		[MemberLevels]
	)
	VALUES
	(
		@RoomBotID,
		@MemberLevels
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_InviteFriendBanBootDelete]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InviteFriendBanBootDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InviteFriendBanBootDelete];
GO

CREATE PROCEDURE [proc_InviteFriendBanBootDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [InviteFriendBanBoot]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_LoginMembersBotLoadByPrimaryKey]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_LoginMembersBotLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_LoginMembersBotLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_LoginMembersBotLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomBotID],
		[MemberLevels]
	FROM [LoginMembersBot]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_LoginMembersBotLoadAll]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_LoginMembersBotLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_LoginMembersBotLoadAll];
GO

CREATE PROCEDURE [proc_LoginMembersBotLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomBotID],
		[MemberLevels]
	FROM [LoginMembersBot]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_LoginMembersBotUpdate]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_LoginMembersBotUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_LoginMembersBotUpdate];
GO

CREATE PROCEDURE [proc_LoginMembersBotUpdate]
(
	@ID int,
	@RoomBotID int,
	@MemberLevels varchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [LoginMembersBot]
	SET
		[RoomBotID] = @RoomBotID,
		[MemberLevels] = @MemberLevels
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_LoginMembersBotInsert]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_LoginMembersBotInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_LoginMembersBotInsert];
GO

CREATE PROCEDURE [proc_LoginMembersBotInsert]
(
	@ID int = NULL output,
	@RoomBotID int,
	@MemberLevels varchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [LoginMembersBot]
	(
		[RoomBotID],
		[MemberLevels]
	)
	VALUES
	(
		@RoomBotID,
		@MemberLevels
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_LoginMembersBotDelete]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_LoginMembersBotDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_LoginMembersBotDelete];
GO

CREATE PROCEDURE [proc_LoginMembersBotDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [LoginMembersBot]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomBotLoadByPrimaryKey]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomBotLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomBotLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomBotLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomID],
		[BotID],
		[ShortcutKey],
		[CreatedByMemberID],
		[IsEnabled],
		[StartDate],
		[EndDate],
		[TimeStamp]
	FROM [RoomBot]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomBotLoadAll]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomBotLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomBotLoadAll];
GO

CREATE PROCEDURE [proc_RoomBotLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomID],
		[BotID],
		[ShortcutKey],
		[CreatedByMemberID],
		[IsEnabled],
		[StartDate],
		[EndDate],
		[TimeStamp]
	FROM [RoomBot]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomBotUpdate]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomBotUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomBotUpdate];
GO

CREATE PROCEDURE [proc_RoomBotUpdate]
(
	@ID int,
	@RoomID int,
	@BotID int,
	@ShortcutKey varchar(50) = NULL,
	@CreatedByMemberID int = NULL,
	@IsEnabled nchar(10) = NULL,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@TimeStamp datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomBot]
	SET
		[RoomID] = @RoomID,
		[BotID] = @BotID,
		[ShortcutKey] = @ShortcutKey,
		[CreatedByMemberID] = @CreatedByMemberID,
		[IsEnabled] = @IsEnabled,
		[StartDate] = @StartDate,
		[EndDate] = @EndDate,
		[TimeStamp] = @TimeStamp
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_RoomBotInsert]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomBotInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomBotInsert];
GO

CREATE PROCEDURE [proc_RoomBotInsert]
(
	@ID int = NULL output,
	@RoomID int,
	@BotID int,
	@ShortcutKey varchar(50) = NULL,
	@CreatedByMemberID int = NULL,
	@IsEnabled nchar(10) = NULL,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@TimeStamp datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomBot]
	(
		[RoomID],
		[BotID],
		[ShortcutKey],
		[CreatedByMemberID],
		[IsEnabled],
		[StartDate],
		[EndDate],
		[TimeStamp]
	)
	VALUES
	(
		@RoomID,
		@BotID,
		@ShortcutKey,
		@CreatedByMemberID,
		@IsEnabled,
		@StartDate,
		@EndDate,
		@TimeStamp
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomBotDelete]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomBotDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomBotDelete];
GO

CREATE PROCEDURE [proc_RoomBotDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomBot]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_WelcomBotLoadByPrimaryKey]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_WelcomBotLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_WelcomBotLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_WelcomBotLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomBotID],
		[LoginMessage],
		[LogoutMessage]
	FROM [WelcomBot]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_WelcomBotLoadAll]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_WelcomBotLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_WelcomBotLoadAll];
GO

CREATE PROCEDURE [proc_WelcomBotLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomBotID],
		[LoginMessage],
		[LogoutMessage]
	FROM [WelcomBot]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_WelcomBotUpdate]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_WelcomBotUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_WelcomBotUpdate];
GO

CREATE PROCEDURE [proc_WelcomBotUpdate]
(
	@ID int,
	@RoomBotID int,
	@LoginMessage nvarchar(1000) = NULL,
	@LogoutMessage nvarchar(1000) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [WelcomBot]
	SET
		[RoomBotID] = @RoomBotID,
		[LoginMessage] = @LoginMessage,
		[LogoutMessage] = @LogoutMessage
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_WelcomBotInsert]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_WelcomBotInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_WelcomBotInsert];
GO

CREATE PROCEDURE [proc_WelcomBotInsert]
(
	@ID int = NULL output,
	@RoomBotID int,
	@LoginMessage nvarchar(1000) = NULL,
	@LogoutMessage nvarchar(1000) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [WelcomBot]
	(
		[RoomBotID],
		[LoginMessage],
		[LogoutMessage]
	)
	VALUES
	(
		@RoomBotID,
		@LoginMessage,
		@LogoutMessage
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_WelcomBotDelete]    Script Date: 30/8/2014 10:06:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_WelcomBotDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_WelcomBotDelete];
GO

CREATE PROCEDURE [proc_WelcomBotDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [WelcomBot]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO

