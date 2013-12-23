
/****** Object:  StoredProcedure [proc_BotLoadByPrimaryKey]    Script Date: 12/9/2013 11:26:16 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_BotLoadByPrimaryKey]
(
	@BotID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[BotID],
		[Name],
		[Price_Point],
		[Price_Money],
		[Period],
		[PicPath],
		[WelcomeMsg],
		[WelcomeMsgText],
		[ByeMsg],
		[ByeMsgText],
		[DisableRepeat],
		[DisableLinks],
		[RoomLaw],
		[Poetry],
		[Qoutes],
		[ReligionAlerts],
		[Ads],
		[Voting],
		[AbuseWords],
		[MarkMembers]
	FROM [Bot]
	WHERE
		([BotID] = @BotID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_BotLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_BotLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_BotLoadAll]    Script Date: 12/9/2013 11:26:16 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotLoadAll];
GO

CREATE PROCEDURE [proc_BotLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[BotID],
		[Name],
		[Price_Point],
		[Price_Money],
		[Period],
		[PicPath],
		[WelcomeMsg],
		[WelcomeMsgText],
		[ByeMsg],
		[ByeMsgText],
		[DisableRepeat],
		[DisableLinks],
		[RoomLaw],
		[Poetry],
		[Qoutes],
		[ReligionAlerts],
		[Ads],
		[Voting],
		[AbuseWords],
		[MarkMembers]
	FROM [Bot]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_BotLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_BotLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_BotUpdate]    Script Date: 12/9/2013 11:26:16 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotUpdate];
GO

CREATE PROCEDURE [proc_BotUpdate]
(
	@BotID int,
	@Name nvarchar(200) = NULL,
	@Price_Point int = NULL,
	@Price_Money decimal(8,4) = NULL,
	@Period int = NULL,
	@PicPath nvarchar(200) = NULL,
	@WelcomeMsg bit = NULL,
	@WelcomeMsgText nvarchar(1000) = NULL,
	@ByeMsg bit = NULL,
	@ByeMsgText nvarchar(1000) = NULL,
	@DisableRepeat bit = NULL,
	@DisableLinks bit = NULL,
	@RoomLaw nvarchar(MAX) = NULL,
	@Poetry nvarchar(MAX) = NULL,
	@Qoutes nvarchar(MAX) = NULL,
	@ReligionAlerts nvarchar(MAX) = NULL,
	@Ads nvarchar(MAX) = NULL,
	@Voting nvarchar(MAX) = NULL,
	@AbuseWords nvarchar(MAX) = NULL,
	@MarkMembers bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Bot]
	SET
		[Name] = @Name,
		[Price_Point] = @Price_Point,
		[Price_Money] = @Price_Money,
		[Period] = @Period,
		[PicPath] = @PicPath,
		[WelcomeMsg] = @WelcomeMsg,
		[WelcomeMsgText] = @WelcomeMsgText,
		[ByeMsg] = @ByeMsg,
		[ByeMsgText] = @ByeMsgText,
		[DisableRepeat] = @DisableRepeat,
		[DisableLinks] = @DisableLinks,
		[RoomLaw] = @RoomLaw,
		[Poetry] = @Poetry,
		[Qoutes] = @Qoutes,
		[ReligionAlerts] = @ReligionAlerts,
		[Ads] = @Ads,
		[Voting] = @Voting,
		[AbuseWords] = @AbuseWords,
		[MarkMembers] = @MarkMembers
	WHERE
		[BotID] = @BotID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_BotUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_BotUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_BotInsert]    Script Date: 12/9/2013 11:26:16 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotInsert];
GO

CREATE PROCEDURE [proc_BotInsert]
(
	@BotID int = NULL output,
	@Name nvarchar(200) = NULL,
	@Price_Point int = NULL,
	@Price_Money decimal(8,4) = NULL,
	@Period int = NULL,
	@PicPath nvarchar(200) = NULL,
	@WelcomeMsg bit = NULL,
	@WelcomeMsgText nvarchar(1000) = NULL,
	@ByeMsg bit = NULL,
	@ByeMsgText nvarchar(1000) = NULL,
	@DisableRepeat bit = NULL,
	@DisableLinks bit = NULL,
	@RoomLaw nvarchar(MAX) = NULL,
	@Poetry nvarchar(MAX) = NULL,
	@Qoutes nvarchar(MAX) = NULL,
	@ReligionAlerts nvarchar(MAX) = NULL,
	@Ads nvarchar(MAX) = NULL,
	@Voting nvarchar(MAX) = NULL,
	@AbuseWords nvarchar(MAX) = NULL,
	@MarkMembers bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Bot]
	(
		[Name],
		[Price_Point],
		[Price_Money],
		[Period],
		[PicPath],
		[WelcomeMsg],
		[WelcomeMsgText],
		[ByeMsg],
		[ByeMsgText],
		[DisableRepeat],
		[DisableLinks],
		[RoomLaw],
		[Poetry],
		[Qoutes],
		[ReligionAlerts],
		[Ads],
		[Voting],
		[AbuseWords],
		[MarkMembers]
	)
	VALUES
	(
		@Name,
		@Price_Point,
		@Price_Money,
		@Period,
		@PicPath,
		@WelcomeMsg,
		@WelcomeMsgText,
		@ByeMsg,
		@ByeMsgText,
		@DisableRepeat,
		@DisableLinks,
		@RoomLaw,
		@Poetry,
		@Qoutes,
		@ReligionAlerts,
		@Ads,
		@Voting,
		@AbuseWords,
		@MarkMembers
	)

	SET @Err = @@Error

	SELECT @BotID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_BotInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_BotInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_BotDelete]    Script Date: 12/9/2013 11:26:16 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BotDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BotDelete];
GO

CREATE PROCEDURE [proc_BotDelete]
(
	@BotID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Bot]
	WHERE
		[BotID] = @BotID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_BotDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_BotDelete Error on Creation'
GO
