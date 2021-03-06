USE [chat2connect]
GO
IF NOT EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'SettingString' AND [object_id] = OBJECT_ID(N'RoomBot'))
BEGIN
    ALTER TABLE RoomBot ADD SettingString NVARCHAR(MAX)
END
GO
/****** Object:  StoredProcedure [proc_RoomBotLoadByPrimaryKey]    Script Date: 19/9/2014 11:34:42 AM ******/
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
		[TimeStamp],
		[SettingString]
	FROM [RoomBot]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomBotLoadAll]    Script Date: 19/9/2014 11:34:42 AM ******/
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
		[TimeStamp],
		[SettingString]
	FROM [RoomBot]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomBotUpdate]    Script Date: 19/9/2014 11:34:42 AM ******/
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
	@IsEnabled bit = NULL,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@TimeStamp datetime,
	@SettingString nvarchar(MAX) = NULL
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
		[TimeStamp] = @TimeStamp,
		[SettingString] = @SettingString
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_RoomBotInsert]    Script Date: 19/9/2014 11:34:42 AM ******/
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
	@IsEnabled bit = NULL,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@TimeStamp datetime,
	@SettingString nvarchar(MAX) = NULL
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
		[TimeStamp],
		[SettingString]
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
		@TimeStamp,
		@SettingString
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomBotDelete]    Script Date: 19/9/2014 11:34:42 AM ******/
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

DROP TABLE WelcomBot
GO
DROP TABLE LoginMembersBot
GO
DROP TABLE InviteFriendBanBoot
GO
DROP TABLE EmailOwnerBot
GO

DELETE FROM RoomBot
GO