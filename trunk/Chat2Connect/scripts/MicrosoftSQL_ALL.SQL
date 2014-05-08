
USE [Chat2Connect_db]
GO

/****** Object:  StoredProcedure [proc_AdminTypeLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AdminTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AdminTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_AdminTypeLoadByPrimaryKey]
(
	@AdminTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AdminTypeID],
		[Name]
	FROM [AdminType]
	WHERE
		([AdminTypeID] = @AdminTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AdminTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_AdminTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AdminTypeLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AdminTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AdminTypeLoadAll];
GO

CREATE PROCEDURE [proc_AdminTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AdminTypeID],
		[Name]
	FROM [AdminType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AdminTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_AdminTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AdminTypeUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AdminTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AdminTypeUpdate];
GO

CREATE PROCEDURE [proc_AdminTypeUpdate]
(
	@AdminTypeID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [AdminType]
	SET
		[Name] = @Name
	WHERE
		[AdminTypeID] = @AdminTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AdminTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_AdminTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_AdminTypeInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AdminTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AdminTypeInsert];
GO

CREATE PROCEDURE [proc_AdminTypeInsert]
(
	@AdminTypeID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [AdminType]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @AdminTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AdminTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_AdminTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AdminTypeDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AdminTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AdminTypeDelete];
GO

CREATE PROCEDURE [proc_AdminTypeDelete]
(
	@AdminTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [AdminType]
	WHERE
		[AdminTypeID] = @AdminTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AdminTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_AdminTypeDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_BotLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
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

/****** Object:  StoredProcedure [proc_BotLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
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

/****** Object:  StoredProcedure [proc_BotUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
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




/****** Object:  StoredProcedure [proc_BotInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
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

/****** Object:  StoredProcedure [proc_BotDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
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

/****** Object:  StoredProcedure [proc_CategoryLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CategoryLoadByPrimaryKey]
(
	@CategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[Name],
		[IconPath]
	FROM [Category]
	WHERE
		([CategoryID] = @CategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoryLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryLoadAll];
GO

CREATE PROCEDURE [proc_CategoryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[Name],
		[IconPath]
	FROM [Category]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoryUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryUpdate];
GO

CREATE PROCEDURE [proc_CategoryUpdate]
(
	@CategoryID int,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Category]
	SET
		[Name] = @Name,
		[IconPath] = @IconPath
	WHERE
		[CategoryID] = @CategoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CategoryInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryInsert];
GO

CREATE PROCEDURE [proc_CategoryInsert]
(
	@CategoryID int = NULL output,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Category]
	(
		[Name],
		[IconPath]
	)
	VALUES
	(
		@Name,
		@IconPath
	)

	SET @Err = @@Error

	SELECT @CategoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoryDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryDelete];
GO

CREATE PROCEDURE [proc_CategoryDelete]
(
	@CategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Category]
	WHERE
		[CategoryID] = @CategoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CountryLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CountryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CountryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CountryLoadByPrimaryKey]
(
	@CountryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CountryID],
		[Name]
	FROM [Country]
	WHERE
		([CountryID] = @CountryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CountryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CountryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CountryLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CountryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CountryLoadAll];
GO

CREATE PROCEDURE [proc_CountryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CountryID],
		[Name]
	FROM [Country]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CountryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CountryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CountryUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CountryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CountryUpdate];
GO

CREATE PROCEDURE [proc_CountryUpdate]
(
	@CountryID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Country]
	SET
		[Name] = @Name
	WHERE
		[CountryID] = @CountryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CountryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CountryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CountryInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CountryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CountryInsert];
GO

CREATE PROCEDURE [proc_CountryInsert]
(
	@CountryID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Country]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @CountryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CountryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CountryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CountryDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CountryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CountryDelete];
GO

CREATE PROCEDURE [proc_CountryDelete]
(
	@CountryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Country]
	WHERE
		[CountryID] = @CountryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CountryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CountryDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FavRoomLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FavRoomLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FavRoomLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_FavRoomLoadByPrimaryKey]
(
	@MemberID int,
	@RoomID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[RoomID]
	FROM [FavRoom]
	WHERE
		([MemberID] = @MemberID) AND
		([RoomID] = @RoomID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FavRoomLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_FavRoomLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FavRoomLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FavRoomLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FavRoomLoadAll];
GO

CREATE PROCEDURE [proc_FavRoomLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[RoomID]
	FROM [FavRoom]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FavRoomLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_FavRoomLoadAll Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


/****** Object:  StoredProcedure [proc_FavRoomInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FavRoomInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FavRoomInsert];
GO

CREATE PROCEDURE [proc_FavRoomInsert]
(
	@MemberID int,
	@RoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [FavRoom]
	(
		[MemberID],
		[RoomID]
	)
	VALUES
	(
		@MemberID,
		@RoomID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FavRoomInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_FavRoomInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FavRoomDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FavRoomDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FavRoomDelete];
GO

CREATE PROCEDURE [proc_FavRoomDelete]
(
	@MemberID int,
	@RoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [FavRoom]
	WHERE
		[MemberID] = @MemberID AND
		[RoomID] = @RoomID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FavRoomDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_FavRoomDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FriendGroupLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FriendGroupLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FriendGroupLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_FriendGroupLoadByPrimaryKey]
(
	@FriendGroupID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[FriendGroupID],
		[MemberID],
		[Name]
	FROM [FriendGroup]
	WHERE
		([FriendGroupID] = @FriendGroupID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FriendGroupLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_FriendGroupLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FriendGroupLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FriendGroupLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FriendGroupLoadAll];
GO

CREATE PROCEDURE [proc_FriendGroupLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[FriendGroupID],
		[MemberID],
		[Name]
	FROM [FriendGroup]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FriendGroupLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_FriendGroupLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FriendGroupUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FriendGroupUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FriendGroupUpdate];
GO

CREATE PROCEDURE [proc_FriendGroupUpdate]
(
	@FriendGroupID int,
	@MemberID int = NULL,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [FriendGroup]
	SET
		[MemberID] = @MemberID,
		[Name] = @Name
	WHERE
		[FriendGroupID] = @FriendGroupID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FriendGroupUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_FriendGroupUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_FriendGroupInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FriendGroupInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FriendGroupInsert];
GO

CREATE PROCEDURE [proc_FriendGroupInsert]
(
	@FriendGroupID int = NULL output,
	@MemberID int = NULL,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [FriendGroup]
	(
		[MemberID],
		[Name]
	)
	VALUES
	(
		@MemberID,
		@Name
	)

	SET @Err = @@Error

	SELECT @FriendGroupID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FriendGroupInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_FriendGroupInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FriendGroupDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FriendGroupDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FriendGroupDelete];
GO

CREATE PROCEDURE [proc_FriendGroupDelete]
(
	@FriendGroupID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [FriendGroup]
	WHERE
		[FriendGroupID] = @FriendGroupID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FriendGroupDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_FriendGroupDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiftLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiftLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiftLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_GiftLoadByPrimaryKey]
(
	@GiftID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GiftID],
		[Name],
		[Price_Point],
		[PicPath]
	FROM [Gift]
	WHERE
		([GiftID] = @GiftID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiftLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiftLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiftLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiftLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiftLoadAll];
GO

CREATE PROCEDURE [proc_GiftLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GiftID],
		[Name],
		[Price_Point],
		[PicPath]
	FROM [Gift]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiftLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiftLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiftUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiftUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiftUpdate];
GO

CREATE PROCEDURE [proc_GiftUpdate]
(
	@GiftID int,
	@Name nvarchar(200) = NULL,
	@Price_Point int = NULL,
	@PicPath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Gift]
	SET
		[Name] = @Name,
		[Price_Point] = @Price_Point,
		[PicPath] = @PicPath
	WHERE
		[GiftID] = @GiftID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiftUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiftUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_GiftInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiftInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiftInsert];
GO

CREATE PROCEDURE [proc_GiftInsert]
(
	@GiftID int = NULL output,
	@Name nvarchar(200) = NULL,
	@Price_Point int = NULL,
	@PicPath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Gift]
	(
		[Name],
		[Price_Point],
		[PicPath]
	)
	VALUES
	(
		@Name,
		@Price_Point,
		@PicPath
	)

	SET @Err = @@Error

	SELECT @GiftID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiftInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiftInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiftDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiftDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiftDelete];
GO

CREATE PROCEDURE [proc_GiftDelete]
(
	@GiftID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Gift]
	WHERE
		[GiftID] = @GiftID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiftDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiftDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberLoadByPrimaryKey]
(
	@MemberID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[UserID],
		[IsOnLine],
		[Name],
		[Credit_Point],
		[Credit_Money],
		[PicPath],
		[MemberTypeID],
		[BirthDate],
		[ReligionID],
		[CountryID],
		[JobTitle],
		[Interests],
		[BestTeam],
		[BestFood],
		[BestCar],
		[BestCounrty],
		[MoreData],
		[MemberStatus],
		[MemberTypeExpiryDate],
		[ProfilePic],
		[likeCount],
		[StatusMsg],
		[Answer],
		[Religion],
		[fbURL],
		[tURL],
		[ytURL],
		[Status],
		[IP],
		[RowStatusID]
	FROM [Member]
	WHERE
		([MemberID] = @MemberID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberLoadAll];
GO

CREATE PROCEDURE [proc_MemberLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[UserID],
		[IsOnLine],
		[Name],
		[Credit_Point],
		[Credit_Money],
		[PicPath],
		[MemberTypeID],
		[BirthDate],
		[ReligionID],
		[CountryID],
		[JobTitle],
		[Interests],
		[BestTeam],
		[BestFood],
		[BestCar],
		[BestCounrty],
		[MoreData],
		[MemberStatus],
		[MemberTypeExpiryDate],
		[ProfilePic],
		[likeCount],
		[StatusMsg],
		[Answer],
		[Religion],
		[fbURL],
		[tURL],
		[ytURL],
		[Status],
		[IP],
		[RowStatusID]
	FROM [Member]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberUpdate];
GO

CREATE PROCEDURE [proc_MemberUpdate]
(
	@MemberID int,
	@UserID uniqueidentifier = NULL,
	@IsOnLine bit = NULL,
	@Name nvarchar(200) = NULL,
	@Credit_Point int = NULL,
	@Credit_Money decimal(8,4) = NULL,
	@PicPath nvarchar(200) = NULL,
	@MemberTypeID int = NULL,
	@BirthDate datetime = NULL,
	@ReligionID int = NULL,
	@CountryID int = NULL,
	@JobTitle nvarchar(200) = NULL,
	@Interests nvarchar(1000) = NULL,
	@BestTeam nvarchar(1000) = NULL,
	@BestFood nvarchar(1000) = NULL,
	@BestCar nvarchar(1000) = NULL,
	@BestCounrty nvarchar(1000) = NULL,
	@MoreData nvarchar(MAX) = NULL,
	@MemberStatus nvarchar(200) = NULL,
	@MemberTypeExpiryDate datetime = NULL,
	@ProfilePic nvarchar(200) = NULL,
	@likeCount int = NULL,
	@StatusMsg nvarchar(100) = NULL,
	@Answer nvarchar(100) = NULL,
	@Religion nvarchar(50) = NULL,
	@fbURL nvarchar(400) = NULL,
	@tURL nvarchar(400) = NULL,
	@ytURL nvarchar(400) = NULL,
	@Status int = NULL,
	@IP varchar(50) = NULL,
	@RowStatusID tinyint
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Member]
	SET
		[UserID] = @UserID,
		[IsOnLine] = @IsOnLine,
		[Name] = @Name,
		[Credit_Point] = @Credit_Point,
		[Credit_Money] = @Credit_Money,
		[PicPath] = @PicPath,
		[MemberTypeID] = @MemberTypeID,
		[BirthDate] = @BirthDate,
		[ReligionID] = @ReligionID,
		[CountryID] = @CountryID,
		[JobTitle] = @JobTitle,
		[Interests] = @Interests,
		[BestTeam] = @BestTeam,
		[BestFood] = @BestFood,
		[BestCar] = @BestCar,
		[BestCounrty] = @BestCounrty,
		[MoreData] = @MoreData,
		[MemberStatus] = @MemberStatus,
		[MemberTypeExpiryDate] = @MemberTypeExpiryDate,
		[ProfilePic] = @ProfilePic,
		[likeCount] = @likeCount,
		[StatusMsg] = @StatusMsg,
		[Answer] = @Answer,
		[Religion] = @Religion,
		[fbURL] = @fbURL,
		[tURL] = @tURL,
		[ytURL] = @ytURL,
		[Status] = @Status,
		[IP] = @IP,
		[RowStatusID] = @RowStatusID
	WHERE
		[MemberID] = @MemberID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberInsert];
GO

CREATE PROCEDURE [proc_MemberInsert]
(
	@MemberID int = NULL output,
	@UserID uniqueidentifier = NULL,
	@IsOnLine bit = NULL,
	@Name nvarchar(200) = NULL,
	@Credit_Point int = NULL,
	@Credit_Money decimal(8,4) = NULL,
	@PicPath nvarchar(200) = NULL,
	@MemberTypeID int = NULL,
	@BirthDate datetime = NULL,
	@ReligionID int = NULL,
	@CountryID int = NULL,
	@JobTitle nvarchar(200) = NULL,
	@Interests nvarchar(1000) = NULL,
	@BestTeam nvarchar(1000) = NULL,
	@BestFood nvarchar(1000) = NULL,
	@BestCar nvarchar(1000) = NULL,
	@BestCounrty nvarchar(1000) = NULL,
	@MoreData nvarchar(MAX) = NULL,
	@MemberStatus nvarchar(200) = NULL,
	@MemberTypeExpiryDate datetime = NULL,
	@ProfilePic nvarchar(200) = NULL,
	@likeCount int = NULL,
	@StatusMsg nvarchar(100) = NULL,
	@Answer nvarchar(100) = NULL,
	@Religion nvarchar(50) = NULL,
	@fbURL nvarchar(400) = NULL,
	@tURL nvarchar(400) = NULL,
	@ytURL nvarchar(400) = NULL,
	@Status int = NULL,
	@IP varchar(50) = NULL,
	@RowStatusID tinyint
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Member]
	(
		[UserID],
		[IsOnLine],
		[Name],
		[Credit_Point],
		[Credit_Money],
		[PicPath],
		[MemberTypeID],
		[BirthDate],
		[ReligionID],
		[CountryID],
		[JobTitle],
		[Interests],
		[BestTeam],
		[BestFood],
		[BestCar],
		[BestCounrty],
		[MoreData],
		[MemberStatus],
		[MemberTypeExpiryDate],
		[ProfilePic],
		[likeCount],
		[StatusMsg],
		[Answer],
		[Religion],
		[fbURL],
		[tURL],
		[ytURL],
		[Status],
		[IP],
		[RowStatusID]
	)
	VALUES
	(
		@UserID,
		@IsOnLine,
		@Name,
		@Credit_Point,
		@Credit_Money,
		@PicPath,
		@MemberTypeID,
		@BirthDate,
		@ReligionID,
		@CountryID,
		@JobTitle,
		@Interests,
		@BestTeam,
		@BestFood,
		@BestCar,
		@BestCounrty,
		@MoreData,
		@MemberStatus,
		@MemberTypeExpiryDate,
		@ProfilePic,
		@likeCount,
		@StatusMsg,
		@Answer,
		@Religion,
		@fbURL,
		@tURL,
		@ytURL,
		@Status,
		@IP,
		@RowStatusID
	)

	SET @Err = @@Error

	SELECT @MemberID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberDelete];
GO

CREATE PROCEDURE [proc_MemberDelete]
(
	@MemberID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Member]
	WHERE
		[MemberID] = @MemberID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberFriendLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberFriendLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberFriendLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberFriendLoadByPrimaryKey]
(
	@MemberFriendID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberFriendID],
		[MemberID],
		[FriendID],
		[FriendGroupID]
	FROM [MemberFriend]
	WHERE
		([MemberFriendID] = @MemberFriendID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberFriendLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberFriendLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberFriendLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberFriendLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberFriendLoadAll];
GO

CREATE PROCEDURE [proc_MemberFriendLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberFriendID],
		[MemberID],
		[FriendID],
		[FriendGroupID]
	FROM [MemberFriend]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberFriendLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberFriendLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberFriendUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberFriendUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberFriendUpdate];
GO

CREATE PROCEDURE [proc_MemberFriendUpdate]
(
	@MemberFriendID int,
	@MemberID int = NULL,
	@FriendID int = NULL,
	@FriendGroupID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberFriend]
	SET
		[MemberID] = @MemberID,
		[FriendID] = @FriendID,
		[FriendGroupID] = @FriendGroupID
	WHERE
		[MemberFriendID] = @MemberFriendID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberFriendUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberFriendUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberFriendInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberFriendInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberFriendInsert];
GO

CREATE PROCEDURE [proc_MemberFriendInsert]
(
	@MemberFriendID int = NULL output,
	@MemberID int = NULL,
	@FriendID int = NULL,
	@FriendGroupID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberFriend]
	(
		[MemberID],
		[FriendID],
		[FriendGroupID]
	)
	VALUES
	(
		@MemberID,
		@FriendID,
		@FriendGroupID
	)

	SET @Err = @@Error

	SELECT @MemberFriendID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberFriendInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberFriendInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberFriendDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberFriendDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberFriendDelete];
GO

CREATE PROCEDURE [proc_MemberFriendDelete]
(
	@MemberFriendID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberFriend]
	WHERE
		[MemberFriendID] = @MemberFriendID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberFriendDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberFriendDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberGiftLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberGiftLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberGiftLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberGiftLoadByPrimaryKey]
(
	@MemberGiftID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberGiftID],
		[MemberID],
		[GiftID],
		[SenderID],
		[SendDate]
	FROM [MemberGift]
	WHERE
		([MemberGiftID] = @MemberGiftID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberGiftLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberGiftLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberGiftLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberGiftLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberGiftLoadAll];
GO

CREATE PROCEDURE [proc_MemberGiftLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberGiftID],
		[MemberID],
		[GiftID],
		[SenderID],
		[SendDate]
	FROM [MemberGift]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberGiftLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberGiftLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberGiftUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberGiftUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberGiftUpdate];
GO

CREATE PROCEDURE [proc_MemberGiftUpdate]
(
	@MemberGiftID int,
	@MemberID int = NULL,
	@GiftID int = NULL,
	@SenderID int = NULL,
	@SendDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberGift]
	SET
		[MemberID] = @MemberID,
		[GiftID] = @GiftID,
		[SenderID] = @SenderID,
		[SendDate] = @SendDate
	WHERE
		[MemberGiftID] = @MemberGiftID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberGiftUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberGiftUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberGiftInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberGiftInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberGiftInsert];
GO

CREATE PROCEDURE [proc_MemberGiftInsert]
(
	@MemberGiftID int = NULL output,
	@MemberID int = NULL,
	@GiftID int = NULL,
	@SenderID int = NULL,
	@SendDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberGift]
	(
		[MemberID],
		[GiftID],
		[SenderID],
		[SendDate]
	)
	VALUES
	(
		@MemberID,
		@GiftID,
		@SenderID,
		@SendDate
	)

	SET @Err = @@Error

	SELECT @MemberGiftID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberGiftInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberGiftInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberGiftDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberGiftDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberGiftDelete];
GO

CREATE PROCEDURE [proc_MemberGiftDelete]
(
	@MemberGiftID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberGift]
	WHERE
		[MemberGiftID] = @MemberGiftID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberGiftDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberGiftDelete Error on Creation'
GO

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

/****** Object:  StoredProcedure [proc_MemberPicLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberPicLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberPicLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberPicLoadByPrimaryKey]
(
	@MemberPicID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberPicID],
		[MemberID],
		[Description]
	FROM [MemberPic]
	WHERE
		([MemberPicID] = @MemberPicID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberPicLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberPicLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberPicLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberPicLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberPicLoadAll];
GO

CREATE PROCEDURE [proc_MemberPicLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberPicID],
		[MemberID],
		[Description]
	FROM [MemberPic]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberPicLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberPicLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberPicUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberPicUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberPicUpdate];
GO

CREATE PROCEDURE [proc_MemberPicUpdate]
(
	@MemberPicID int,
	@MemberID int = NULL,
	@Description nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberPic]
	SET
		[MemberID] = @MemberID,
		[Description] = @Description
	WHERE
		[MemberPicID] = @MemberPicID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberPicUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberPicUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberPicInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberPicInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberPicInsert];
GO

CREATE PROCEDURE [proc_MemberPicInsert]
(
	@MemberPicID int = NULL output,
	@MemberID int = NULL,
	@Description nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberPic]
	(
		[MemberID],
		[Description]
	)
	VALUES
	(
		@MemberID,
		@Description
	)

	SET @Err = @@Error

	SELECT @MemberPicID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberPicInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberPicInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberPicDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberPicDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberPicDelete];
GO

CREATE PROCEDURE [proc_MemberPicDelete]
(
	@MemberPicID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberPic]
	WHERE
		[MemberPicID] = @MemberPicID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberPicDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberPicDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberSettingLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberSettingLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberSettingLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberSettingLoadByPrimaryKey]
(
	@MemberSettingID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberSettingID],
		[MemberID],
		[HidePics],
		[HideRoomPics],
		[HideProfile],
		[NotifyOnPrivateChat],
		[NotifyOnFriendsOnOff],
		[NotifyOnFriendChangeStatus],
		[NotifyOnGetMsg],
		[NotifyOnVoiceMail],
		[SearchMeByMail],
		[VoiceNotfication],
		[AcceptPM],
		[AcceptSMS],
		[AcceptMSG],
		[AcceptVoiceMail],
		[AcceptFiles],
		[AcceptInvitations],
		[ChangeMyStatus],
		[ChangeMyStatusMin]
	FROM [MemberSetting]
	WHERE
		([MemberSettingID] = @MemberSettingID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberSettingLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberSettingLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberSettingLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberSettingLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberSettingLoadAll];
GO

CREATE PROCEDURE [proc_MemberSettingLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberSettingID],
		[MemberID],
		[HidePics],
		[HideRoomPics],
		[HideProfile],
		[NotifyOnPrivateChat],
		[NotifyOnFriendsOnOff],
		[NotifyOnFriendChangeStatus],
		[NotifyOnGetMsg],
		[NotifyOnVoiceMail],
		[SearchMeByMail],
		[VoiceNotfication],
		[AcceptPM],
		[AcceptSMS],
		[AcceptMSG],
		[AcceptVoiceMail],
		[AcceptFiles],
		[AcceptInvitations],
		[ChangeMyStatus],
		[ChangeMyStatusMin]
	FROM [MemberSetting]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberSettingLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberSettingLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberSettingUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberSettingUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberSettingUpdate];
GO

CREATE PROCEDURE [proc_MemberSettingUpdate]
(
	@MemberSettingID int,
	@MemberID int = NULL,
	@HidePics bit = NULL,
	@HideRoomPics bit = NULL,
	@HideProfile bit = NULL,
	@NotifyOnPrivateChat bit = NULL,
	@NotifyOnFriendsOnOff bit = NULL,
	@NotifyOnFriendChangeStatus bit = NULL,
	@NotifyOnGetMsg bit = NULL,
	@NotifyOnVoiceMail bit = NULL,
	@SearchMeByMail bit = NULL,
	@VoiceNotfication bit = NULL,
	@AcceptPM bit = NULL,
	@AcceptSMS bit = NULL,
	@AcceptMSG bit = NULL,
	@AcceptVoiceMail bit = NULL,
	@AcceptFiles bit = NULL,
	@AcceptInvitations bit = NULL,
	@ChangeMyStatus bit = NULL,
	@ChangeMyStatusMin int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberSetting]
	SET
		[MemberID] = @MemberID,
		[HidePics] = @HidePics,
		[HideRoomPics] = @HideRoomPics,
		[HideProfile] = @HideProfile,
		[NotifyOnPrivateChat] = @NotifyOnPrivateChat,
		[NotifyOnFriendsOnOff] = @NotifyOnFriendsOnOff,
		[NotifyOnFriendChangeStatus] = @NotifyOnFriendChangeStatus,
		[NotifyOnGetMsg] = @NotifyOnGetMsg,
		[NotifyOnVoiceMail] = @NotifyOnVoiceMail,
		[SearchMeByMail] = @SearchMeByMail,
		[VoiceNotfication] = @VoiceNotfication,
		[AcceptPM] = @AcceptPM,
		[AcceptSMS] = @AcceptSMS,
		[AcceptMSG] = @AcceptMSG,
		[AcceptVoiceMail] = @AcceptVoiceMail,
		[AcceptFiles] = @AcceptFiles,
		[AcceptInvitations] = @AcceptInvitations,
		[ChangeMyStatus] = @ChangeMyStatus,
		[ChangeMyStatusMin] = @ChangeMyStatusMin
	WHERE
		[MemberSettingID] = @MemberSettingID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberSettingUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberSettingUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberSettingInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberSettingInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberSettingInsert];
GO

CREATE PROCEDURE [proc_MemberSettingInsert]
(
	@MemberSettingID int = NULL output,
	@MemberID int = NULL,
	@HidePics bit = NULL,
	@HideRoomPics bit = NULL,
	@HideProfile bit = NULL,
	@NotifyOnPrivateChat bit = NULL,
	@NotifyOnFriendsOnOff bit = NULL,
	@NotifyOnFriendChangeStatus bit = NULL,
	@NotifyOnGetMsg bit = NULL,
	@NotifyOnVoiceMail bit = NULL,
	@SearchMeByMail bit = NULL,
	@VoiceNotfication bit = NULL,
	@AcceptPM bit = NULL,
	@AcceptSMS bit = NULL,
	@AcceptMSG bit = NULL,
	@AcceptVoiceMail bit = NULL,
	@AcceptFiles bit = NULL,
	@AcceptInvitations bit = NULL,
	@ChangeMyStatus bit = NULL,
	@ChangeMyStatusMin int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberSetting]
	(
		[MemberID],
		[HidePics],
		[HideRoomPics],
		[HideProfile],
		[NotifyOnPrivateChat],
		[NotifyOnFriendsOnOff],
		[NotifyOnFriendChangeStatus],
		[NotifyOnGetMsg],
		[NotifyOnVoiceMail],
		[SearchMeByMail],
		[VoiceNotfication],
		[AcceptPM],
		[AcceptSMS],
		[AcceptMSG],
		[AcceptVoiceMail],
		[AcceptFiles],
		[AcceptInvitations],
		[ChangeMyStatus],
		[ChangeMyStatusMin]
	)
	VALUES
	(
		@MemberID,
		@HidePics,
		@HideRoomPics,
		@HideProfile,
		@NotifyOnPrivateChat,
		@NotifyOnFriendsOnOff,
		@NotifyOnFriendChangeStatus,
		@NotifyOnGetMsg,
		@NotifyOnVoiceMail,
		@SearchMeByMail,
		@VoiceNotfication,
		@AcceptPM,
		@AcceptSMS,
		@AcceptMSG,
		@AcceptVoiceMail,
		@AcceptFiles,
		@AcceptInvitations,
		@ChangeMyStatus,
		@ChangeMyStatusMin
	)

	SET @Err = @@Error

	SELECT @MemberSettingID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberSettingInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberSettingInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberSettingDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberSettingDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberSettingDelete];
GO

CREATE PROCEDURE [proc_MemberSettingDelete]
(
	@MemberSettingID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberSetting]
	WHERE
		[MemberSettingID] = @MemberSettingID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberSettingDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberSettingDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberTypeLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberTypeLoadByPrimaryKey]
(
	@MemberTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberTypeID],
		[Name],
		[IconPath],
		[Price_Money],
		[Price_Point],
		[Color]
	FROM [MemberType]
	WHERE
		([MemberTypeID] = @MemberTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberTypeLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeLoadAll];
GO

CREATE PROCEDURE [proc_MemberTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberTypeID],
		[Name],
		[IconPath],
		[Price_Money],
		[Price_Point],
		[Color]
	FROM [MemberType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberTypeUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeUpdate];
GO

CREATE PROCEDURE [proc_MemberTypeUpdate]
(
	@MemberTypeID int,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL,
	@Price_Money decimal(8,4) = NULL,
	@Price_Point int = NULL,
	@Color nvarchar(7) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberType]
	SET
		[Name] = @Name,
		[IconPath] = @IconPath,
		[Price_Money] = @Price_Money,
		[Price_Point] = @Price_Point,
		[Color] = @Color
	WHERE
		[MemberTypeID] = @MemberTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberTypeInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeInsert];
GO

CREATE PROCEDURE [proc_MemberTypeInsert]
(
	@MemberTypeID int = NULL output,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL,
	@Price_Money decimal(8,4) = NULL,
	@Price_Point int = NULL,
	@Color nvarchar(7) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberType]
	(
		[Name],
		[IconPath],
		[Price_Money],
		[Price_Point],
		[Color]
	)
	VALUES
	(
		@Name,
		@IconPath,
		@Price_Money,
		@Price_Point,
		@Color
	)

	SET @Err = @@Error

	SELECT @MemberTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberTypeDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeDelete];
GO

CREATE PROCEDURE [proc_MemberTypeDelete]
(
	@MemberTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberType]
	WHERE
		[MemberTypeID] = @MemberTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MessageFolderLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageFolderLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageFolderLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MessageFolderLoadByPrimaryKey]
(
	@MessageFolderID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MessageFolderID],
		[MemberID],
		[Name]
	FROM [MessageFolder]
	WHERE
		([MessageFolderID] = @MessageFolderID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MessageFolderLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MessageFolderLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MessageFolderLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageFolderLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageFolderLoadAll];
GO

CREATE PROCEDURE [proc_MessageFolderLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MessageFolderID],
		[MemberID],
		[Name]
	FROM [MessageFolder]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MessageFolderLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MessageFolderLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MessageFolderUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageFolderUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageFolderUpdate];
GO

CREATE PROCEDURE [proc_MessageFolderUpdate]
(
	@MessageFolderID int,
	@MemberID int = NULL,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MessageFolder]
	SET
		[MemberID] = @MemberID,
		[Name] = @Name
	WHERE
		[MessageFolderID] = @MessageFolderID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MessageFolderUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MessageFolderUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MessageFolderInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageFolderInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageFolderInsert];
GO

CREATE PROCEDURE [proc_MessageFolderInsert]
(
	@MessageFolderID int = NULL output,
	@MemberID int = NULL,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MessageFolder]
	(
		[MemberID],
		[Name]
	)
	VALUES
	(
		@MemberID,
		@Name
	)

	SET @Err = @@Error

	SELECT @MessageFolderID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MessageFolderInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MessageFolderInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MessageFolderDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageFolderDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageFolderDelete];
GO

CREATE PROCEDURE [proc_MessageFolderDelete]
(
	@MessageFolderID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MessageFolder]
	WHERE
		[MessageFolderID] = @MessageFolderID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MessageFolderDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MessageFolderDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ReligionLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReligionLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReligionLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ReligionLoadByPrimaryKey]
(
	@ReligionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReligionID],
		[Name]
	FROM [Religion]
	WHERE
		([ReligionID] = @ReligionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReligionLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReligionLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ReligionLoadAll]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReligionLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReligionLoadAll];
GO

CREATE PROCEDURE [proc_ReligionLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReligionID],
		[Name]
	FROM [Religion]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReligionLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReligionLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ReligionUpdate]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReligionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReligionUpdate];
GO

CREATE PROCEDURE [proc_ReligionUpdate]
(
	@ReligionID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Religion]
	SET
		[Name] = @Name
	WHERE
		[ReligionID] = @ReligionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReligionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReligionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ReligionInsert]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReligionInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReligionInsert];
GO

CREATE PROCEDURE [proc_ReligionInsert]
(
	@ReligionID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Religion]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @ReligionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReligionInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReligionInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ReligionDelete]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReligionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReligionDelete];
GO

CREATE PROCEDURE [proc_ReligionDelete]
(
	@ReligionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Religion]
	WHERE
		[ReligionID] = @ReligionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReligionDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReligionDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RestrictedNamesLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RestrictedNamesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RestrictedNamesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RestrictedNamesLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[Name]
	FROM [RestrictedNames]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RestrictedNamesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RestrictedNamesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RestrictedNamesLoadAll]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RestrictedNamesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RestrictedNamesLoadAll];
GO

CREATE PROCEDURE [proc_RestrictedNamesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[Name]
	FROM [RestrictedNames]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RestrictedNamesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RestrictedNamesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RestrictedNamesUpdate]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RestrictedNamesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RestrictedNamesUpdate];
GO

CREATE PROCEDURE [proc_RestrictedNamesUpdate]
(
	@ID int,
	@Name nvarchar(256)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RestrictedNames]
	SET
		[Name] = @Name
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RestrictedNamesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RestrictedNamesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RestrictedNamesInsert]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RestrictedNamesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RestrictedNamesInsert];
GO

CREATE PROCEDURE [proc_RestrictedNamesInsert]
(
	@ID int = NULL output,
	@Name nvarchar(256)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RestrictedNames]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RestrictedNamesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RestrictedNamesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RestrictedNamesDelete]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RestrictedNamesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RestrictedNamesDelete];
GO

CREATE PROCEDURE [proc_RestrictedNamesDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RestrictedNames]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RestrictedNamesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RestrictedNamesDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomLoadByPrimaryKey]
(
	@RoomID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomID],
		[CategoryID],
		[SubCategoryID],
		[Name],
		[IconPath],
		[RoomTypeID],
		[CreatedDate],
		[WelcomeText],
		[RoomPassword],
		[RoomPasswordenabled],
		[EnableCam],
		[EnableMic],
		[EnableMicForAdminsOnly],
		[MarkOnLoginWithWrite],
		[MarkOnLoginWithoutWrite],
		[CreatedBy],
		[EnableOneMic],
		[EnableTwoMic],
		[EnableThreeMic],
		[RoomAdminPassword],
		[RowStatusID],
		[OpenCams]
	FROM [Room]
	WHERE
		([RoomID] = @RoomID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomLoadAll]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomLoadAll];
GO

CREATE PROCEDURE [proc_RoomLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomID],
		[CategoryID],
		[SubCategoryID],
		[Name],
		[IconPath],
		[RoomTypeID],
		[CreatedDate],
		[WelcomeText],
		[RoomPassword],
		[RoomPasswordenabled],
		[EnableCam],
		[EnableMic],
		[EnableMicForAdminsOnly],
		[MarkOnLoginWithWrite],
		[MarkOnLoginWithoutWrite],
		[CreatedBy],
		[EnableOneMic],
		[EnableTwoMic],
		[EnableThreeMic],
		[RoomAdminPassword],
		[RowStatusID],
		[OpenCams]
	FROM [Room]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomUpdate]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomUpdate];
GO

CREATE PROCEDURE [proc_RoomUpdate]
(
	@RoomID int,
	@CategoryID int = NULL,
	@SubCategoryID int = NULL,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL,
	@RoomTypeID int = NULL,
	@CreatedDate datetime = NULL,
	@WelcomeText nvarchar(MAX) = NULL,
	@RoomPassword nvarchar(50) = NULL,
	@RoomPasswordenabled bit = NULL,
	@EnableCam bit = NULL,
	@EnableMic bit = NULL,
	@EnableMicForAdminsOnly bit = NULL,
	@MarkOnLoginWithWrite bit = NULL,
	@MarkOnLoginWithoutWrite bit = NULL,
	@CreatedBy int = NULL,
	@EnableOneMic bit = NULL,
	@EnableTwoMic bit = NULL,
	@EnableThreeMic bit = NULL,
	@RoomAdminPassword nvarchar(50) = NULL,
	@RowStatusID tinyint,
	@OpenCams smallint = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Room]
	SET
		[CategoryID] = @CategoryID,
		[SubCategoryID] = @SubCategoryID,
		[Name] = @Name,
		[IconPath] = @IconPath,
		[RoomTypeID] = @RoomTypeID,
		[CreatedDate] = @CreatedDate,
		[WelcomeText] = @WelcomeText,
		[RoomPassword] = @RoomPassword,
		[RoomPasswordenabled] = @RoomPasswordenabled,
		[EnableCam] = @EnableCam,
		[EnableMic] = @EnableMic,
		[EnableMicForAdminsOnly] = @EnableMicForAdminsOnly,
		[MarkOnLoginWithWrite] = @MarkOnLoginWithWrite,
		[MarkOnLoginWithoutWrite] = @MarkOnLoginWithoutWrite,
		[CreatedBy] = @CreatedBy,
		[EnableOneMic] = @EnableOneMic,
		[EnableTwoMic] = @EnableTwoMic,
		[EnableThreeMic] = @EnableThreeMic,
		[RoomAdminPassword] = @RoomAdminPassword,
		[RowStatusID] = @RowStatusID,
		[OpenCams] = @OpenCams
	WHERE
		[RoomID] = @RoomID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RoomInsert]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomInsert];
GO

CREATE PROCEDURE [proc_RoomInsert]
(
	@RoomID int = NULL output,
	@CategoryID int = NULL,
	@SubCategoryID int = NULL,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL,
	@RoomTypeID int = NULL,
	@CreatedDate datetime = NULL,
	@WelcomeText nvarchar(MAX) = NULL,
	@RoomPassword nvarchar(50) = NULL,
	@RoomPasswordenabled bit = NULL,
	@EnableCam bit = NULL,
	@EnableMic bit = NULL,
	@EnableMicForAdminsOnly bit = NULL,
	@MarkOnLoginWithWrite bit = NULL,
	@MarkOnLoginWithoutWrite bit = NULL,
	@CreatedBy int = NULL,
	@EnableOneMic bit = NULL,
	@EnableTwoMic bit = NULL,
	@EnableThreeMic bit = NULL,
	@RoomAdminPassword nvarchar(50) = NULL,
	@RowStatusID tinyint,
	@OpenCams smallint = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Room]
	(
		[CategoryID],
		[SubCategoryID],
		[Name],
		[IconPath],
		[RoomTypeID],
		[CreatedDate],
		[WelcomeText],
		[RoomPassword],
		[RoomPasswordenabled],
		[EnableCam],
		[EnableMic],
		[EnableMicForAdminsOnly],
		[MarkOnLoginWithWrite],
		[MarkOnLoginWithoutWrite],
		[CreatedBy],
		[EnableOneMic],
		[EnableTwoMic],
		[EnableThreeMic],
		[RoomAdminPassword],
		[RowStatusID],
		[OpenCams]
	)
	VALUES
	(
		@CategoryID,
		@SubCategoryID,
		@Name,
		@IconPath,
		@RoomTypeID,
		@CreatedDate,
		@WelcomeText,
		@RoomPassword,
		@RoomPasswordenabled,
		@EnableCam,
		@EnableMic,
		@EnableMicForAdminsOnly,
		@MarkOnLoginWithWrite,
		@MarkOnLoginWithoutWrite,
		@CreatedBy,
		@EnableOneMic,
		@EnableTwoMic,
		@EnableThreeMic,
		@RoomAdminPassword,
		@RowStatusID,
		@OpenCams
	)

	SET @Err = @@Error

	SELECT @RoomID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomDelete]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomDelete];
GO

CREATE PROCEDURE [proc_RoomDelete]
(
	@RoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Room]
	WHERE
		[RoomID] = @RoomID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomBotLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:51 PM ******/
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

/****** Object:  StoredProcedure [proc_RoomBotLoadAll]    Script Date: 5/8/2014 1:38:51 PM ******/
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

/****** Object:  StoredProcedure [proc_RoomBotUpdate]    Script Date: 5/8/2014 1:38:51 PM ******/
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




/****** Object:  StoredProcedure [proc_RoomBotInsert]    Script Date: 5/8/2014 1:38:51 PM ******/
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

/****** Object:  StoredProcedure [proc_RoomBotDelete]    Script Date: 5/8/2014 1:38:51 PM ******/
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

/****** Object:  StoredProcedure [proc_RoomMemberLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomMemberLoadByPrimaryKey]
(
	@MemberID int,
	@RoomID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[RoomID],
		[IsAdmin],
		[AdminTypeID],
		[HasMic],
		[HasCam],
		[CanAccessMic],
		[CanAccessCam],
		[CanWrite],
		[IsBanned],
		[IsBannedFor24],
		[IsBannedFor7Days],
		[IsBannedForMonth],
		[IsMarked],
		[AskForMic],
		[QueueOrder],
		[UserRate],
		[InRoom]
	FROM [RoomMember]
	WHERE
		([MemberID] = @MemberID) AND
		([RoomID] = @RoomID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMemberLoadAll]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberLoadAll];
GO

CREATE PROCEDURE [proc_RoomMemberLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[RoomID],
		[IsAdmin],
		[AdminTypeID],
		[HasMic],
		[HasCam],
		[CanAccessMic],
		[CanAccessCam],
		[CanWrite],
		[IsBanned],
		[IsBannedFor24],
		[IsBannedFor7Days],
		[IsBannedForMonth],
		[IsMarked],
		[AskForMic],
		[QueueOrder],
		[UserRate],
		[InRoom]
	FROM [RoomMember]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMemberUpdate]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberUpdate];
GO

CREATE PROCEDURE [proc_RoomMemberUpdate]
(
	@MemberID int,
	@RoomID int,
	@IsAdmin bit = NULL,
	@AdminTypeID int = NULL,
	@HasMic bit = NULL,
	@HasCam bit = NULL,
	@CanAccessMic bit = NULL,
	@CanAccessCam bit = NULL,
	@CanWrite bit = NULL,
	@IsBanned bit = NULL,
	@IsBannedFor24 bit = NULL,
	@IsBannedFor7Days bit = NULL,
	@IsBannedForMonth bit = NULL,
	@IsMarked bit = NULL,
	@AskForMic bit = NULL,
	@QueueOrder int = NULL,
	@UserRate smallint = NULL,
	@InRoom bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomMember]
	SET
		[IsAdmin] = @IsAdmin,
		[AdminTypeID] = @AdminTypeID,
		[HasMic] = @HasMic,
		[HasCam] = @HasCam,
		[CanAccessMic] = @CanAccessMic,
		[CanAccessCam] = @CanAccessCam,
		[CanWrite] = @CanWrite,
		[IsBanned] = @IsBanned,
		[IsBannedFor24] = @IsBannedFor24,
		[IsBannedFor7Days] = @IsBannedFor7Days,
		[IsBannedForMonth] = @IsBannedForMonth,
		[IsMarked] = @IsMarked,
		[AskForMic] = @AskForMic,
		[QueueOrder] = @QueueOrder,
		[UserRate] = @UserRate,
		[InRoom] = @InRoom
	WHERE
		[MemberID] = @MemberID
	AND	[RoomID] = @RoomID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RoomMemberInsert]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberInsert];
GO

CREATE PROCEDURE [proc_RoomMemberInsert]
(
	@MemberID int,
	@RoomID int,
	@IsAdmin bit = NULL,
	@AdminTypeID int = NULL,
	@HasMic bit = NULL,
	@HasCam bit = NULL,
	@CanAccessMic bit = NULL,
	@CanAccessCam bit = NULL,
	@CanWrite bit = NULL,
	@IsBanned bit = NULL,
	@IsBannedFor24 bit = NULL,
	@IsBannedFor7Days bit = NULL,
	@IsBannedForMonth bit = NULL,
	@IsMarked bit = NULL,
	@AskForMic bit = NULL,
	@QueueOrder int = NULL,
	@UserRate smallint = NULL,
	@InRoom bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomMember]
	(
		[MemberID],
		[RoomID],
		[IsAdmin],
		[AdminTypeID],
		[HasMic],
		[HasCam],
		[CanAccessMic],
		[CanAccessCam],
		[CanWrite],
		[IsBanned],
		[IsBannedFor24],
		[IsBannedFor7Days],
		[IsBannedForMonth],
		[IsMarked],
		[AskForMic],
		[QueueOrder],
		[UserRate],
		[InRoom]
	)
	VALUES
	(
		@MemberID,
		@RoomID,
		@IsAdmin,
		@AdminTypeID,
		@HasMic,
		@HasCam,
		@CanAccessMic,
		@CanAccessCam,
		@CanWrite,
		@IsBanned,
		@IsBannedFor24,
		@IsBannedFor7Days,
		@IsBannedForMonth,
		@IsMarked,
		@AskForMic,
		@QueueOrder,
		@UserRate,
		@InRoom
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMemberDelete]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberDelete];
GO

CREATE PROCEDURE [proc_RoomMemberDelete]
(
	@MemberID int,
	@RoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomMember]
	WHERE
		[MemberID] = @MemberID AND
		[RoomID] = @RoomID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMemberSettingLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberSettingLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberSettingLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomMemberSettingLoadByPrimaryKey]
(
	@RoomID int,
	@MemberID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomID],
		[MemberID],
		[NotifyOnFriendsLogOn],
		[NotifyOnFriendsLogOff],
		[NotifyOnMicOn],
		[NotifyOnMicOff],
		[NotifyOnOpenCam],
		[NotifyOnCloseCam]
	FROM [RoomMemberSetting]
	WHERE
		([RoomID] = @RoomID) AND
		([MemberID] = @MemberID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberSettingLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberSettingLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMemberSettingLoadAll]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberSettingLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberSettingLoadAll];
GO

CREATE PROCEDURE [proc_RoomMemberSettingLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomID],
		[MemberID],
		[NotifyOnFriendsLogOn],
		[NotifyOnFriendsLogOff],
		[NotifyOnMicOn],
		[NotifyOnMicOff],
		[NotifyOnOpenCam],
		[NotifyOnCloseCam]
	FROM [RoomMemberSetting]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberSettingLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberSettingLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMemberSettingUpdate]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberSettingUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberSettingUpdate];
GO

CREATE PROCEDURE [proc_RoomMemberSettingUpdate]
(
	@RoomID int,
	@MemberID int,
	@NotifyOnFriendsLogOn bit = NULL,
	@NotifyOnFriendsLogOff bit = NULL,
	@NotifyOnMicOn bit = NULL,
	@NotifyOnMicOff bit = NULL,
	@NotifyOnOpenCam bit = NULL,
	@NotifyOnCloseCam bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomMemberSetting]
	SET
		[NotifyOnFriendsLogOn] = @NotifyOnFriendsLogOn,
		[NotifyOnFriendsLogOff] = @NotifyOnFriendsLogOff,
		[NotifyOnMicOn] = @NotifyOnMicOn,
		[NotifyOnMicOff] = @NotifyOnMicOff,
		[NotifyOnOpenCam] = @NotifyOnOpenCam,
		[NotifyOnCloseCam] = @NotifyOnCloseCam
	WHERE
		[RoomID] = @RoomID
	AND	[MemberID] = @MemberID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberSettingUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberSettingUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RoomMemberSettingInsert]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberSettingInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberSettingInsert];
GO

CREATE PROCEDURE [proc_RoomMemberSettingInsert]
(
	@RoomID int,
	@MemberID int,
	@NotifyOnFriendsLogOn bit = NULL,
	@NotifyOnFriendsLogOff bit = NULL,
	@NotifyOnMicOn bit = NULL,
	@NotifyOnMicOff bit = NULL,
	@NotifyOnOpenCam bit = NULL,
	@NotifyOnCloseCam bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomMemberSetting]
	(
		[RoomID],
		[MemberID],
		[NotifyOnFriendsLogOn],
		[NotifyOnFriendsLogOff],
		[NotifyOnMicOn],
		[NotifyOnMicOff],
		[NotifyOnOpenCam],
		[NotifyOnCloseCam]
	)
	VALUES
	(
		@RoomID,
		@MemberID,
		@NotifyOnFriendsLogOn,
		@NotifyOnFriendsLogOff,
		@NotifyOnMicOn,
		@NotifyOnMicOff,
		@NotifyOnOpenCam,
		@NotifyOnCloseCam
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberSettingInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberSettingInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMemberSettingDelete]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberSettingDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberSettingDelete];
GO

CREATE PROCEDURE [proc_RoomMemberSettingDelete]
(
	@RoomID int,
	@MemberID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomMemberSetting]
	WHERE
		[RoomID] = @RoomID AND
		[MemberID] = @MemberID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberSettingDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberSettingDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomTypeLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomTypeLoadByPrimaryKey]
(
	@RoomTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomTypeID],
		[Name],
		[IconPath],
		[Price_Money],
		[Price_Point],
		[Color]
	FROM [RoomType]
	WHERE
		([RoomTypeID] = @RoomTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomTypeLoadAll]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeLoadAll];
GO

CREATE PROCEDURE [proc_RoomTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomTypeID],
		[Name],
		[IconPath],
		[Price_Money],
		[Price_Point],
		[Color]
	FROM [RoomType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomTypeUpdate]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeUpdate];
GO

CREATE PROCEDURE [proc_RoomTypeUpdate]
(
	@RoomTypeID int,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL,
	@Price_Money decimal(8,4) = NULL,
	@Price_Point int = NULL,
	@Color nvarchar(7) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomType]
	SET
		[Name] = @Name,
		[IconPath] = @IconPath,
		[Price_Money] = @Price_Money,
		[Price_Point] = @Price_Point,
		[Color] = @Color
	WHERE
		[RoomTypeID] = @RoomTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RoomTypeInsert]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeInsert];
GO

CREATE PROCEDURE [proc_RoomTypeInsert]
(
	@RoomTypeID int = NULL output,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL,
	@Price_Money decimal(8,4) = NULL,
	@Price_Point int = NULL,
	@Color nvarchar(7) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomType]
	(
		[Name],
		[IconPath],
		[Price_Money],
		[Price_Point],
		[Color]
	)
	VALUES
	(
		@Name,
		@IconPath,
		@Price_Money,
		@Price_Point,
		@Color
	)

	SET @Err = @@Error

	SELECT @RoomTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomTypeDelete]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeDelete];
GO

CREATE PROCEDURE [proc_RoomTypeDelete]
(
	@RoomTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomType]
	WHERE
		[RoomTypeID] = @RoomTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomTypeDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RowStatusLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RowStatusLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RowStatusLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RowStatusLoadByPrimaryKey]
(
	@RowStatusID tinyint
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RowStatusID],
		[StatusName]
	FROM [RowStatus]
	WHERE
		([RowStatusID] = @RowStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RowStatusLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RowStatusLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RowStatusLoadAll]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RowStatusLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RowStatusLoadAll];
GO

CREATE PROCEDURE [proc_RowStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RowStatusID],
		[StatusName]
	FROM [RowStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RowStatusLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RowStatusLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RowStatusUpdate]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RowStatusUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RowStatusUpdate];
GO

CREATE PROCEDURE [proc_RowStatusUpdate]
(
	@RowStatusID tinyint,
	@StatusName nvarchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RowStatus]
	SET
		[StatusName] = @StatusName
	WHERE
		[RowStatusID] = @RowStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RowStatusUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RowStatusUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RowStatusInsert]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RowStatusInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RowStatusInsert];
GO

CREATE PROCEDURE [proc_RowStatusInsert]
(
	@RowStatusID tinyint,
	@StatusName nvarchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RowStatus]
	(
		[RowStatusID],
		[StatusName]
	)
	VALUES
	(
		@RowStatusID,
		@StatusName
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RowStatusInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RowStatusInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RowStatusDelete]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RowStatusDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RowStatusDelete];
GO

CREATE PROCEDURE [proc_RowStatusDelete]
(
	@RowStatusID tinyint
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RowStatus]
	WHERE
		[RowStatusID] = @RowStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RowStatusDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RowStatusDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubCategoryLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubCategoryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubCategoryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_SubCategoryLoadByPrimaryKey]
(
	@SubCategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[SubCategoryID],
		[CategoryID],
		[Name],
		[IconPath]
	FROM [SubCategory]
	WHERE
		([SubCategoryID] = @SubCategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubCategoryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubCategoryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubCategoryLoadAll]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubCategoryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubCategoryLoadAll];
GO

CREATE PROCEDURE [proc_SubCategoryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[SubCategoryID],
		[CategoryID],
		[Name],
		[IconPath]
	FROM [SubCategory]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubCategoryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubCategoryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubCategoryUpdate]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubCategoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubCategoryUpdate];
GO

CREATE PROCEDURE [proc_SubCategoryUpdate]
(
	@SubCategoryID int,
	@CategoryID int,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [SubCategory]
	SET
		[CategoryID] = @CategoryID,
		[Name] = @Name,
		[IconPath] = @IconPath
	WHERE
		[SubCategoryID] = @SubCategoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubCategoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubCategoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_SubCategoryInsert]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubCategoryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubCategoryInsert];
GO

CREATE PROCEDURE [proc_SubCategoryInsert]
(
	@SubCategoryID int = NULL output,
	@CategoryID int,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [SubCategory]
	(
		[CategoryID],
		[Name],
		[IconPath]
	)
	VALUES
	(
		@CategoryID,
		@Name,
		@IconPath
	)

	SET @Err = @@Error

	SELECT @SubCategoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubCategoryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubCategoryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubCategoryDelete]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubCategoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubCategoryDelete];
GO

CREATE PROCEDURE [proc_SubCategoryDelete]
(
	@SubCategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [SubCategory]
	WHERE
		[SubCategoryID] = @SubCategoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubCategoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubCategoryDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserTransLogLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserTransLogLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserTransLogLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_UserTransLogLoadByPrimaryKey]
(
	@UserTransLogID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserTransLogID],
		[MemberID],
		[TransDate],
		[TransType],
		[AddedBy],
		[PaymentMethod],
		[Value],
		[Notes],
		[AddedFrom],
		[AddedTo]
	FROM [UserTransLog]
	WHERE
		([UserTransLogID] = @UserTransLogID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserTransLogLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserTransLogLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserTransLogLoadAll]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserTransLogLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserTransLogLoadAll];
GO

CREATE PROCEDURE [proc_UserTransLogLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserTransLogID],
		[MemberID],
		[TransDate],
		[TransType],
		[AddedBy],
		[PaymentMethod],
		[Value],
		[Notes],
		[AddedFrom],
		[AddedTo]
	FROM [UserTransLog]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserTransLogLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserTransLogLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserTransLogUpdate]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserTransLogUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserTransLogUpdate];
GO

CREATE PROCEDURE [proc_UserTransLogUpdate]
(
	@UserTransLogID int,
	@MemberID int = NULL,
	@TransDate datetime = NULL,
	@TransType smallint = NULL,
	@AddedBy nvarchar(100) = NULL,
	@PaymentMethod nvarchar(100) = NULL,
	@Value decimal(10,4) = NULL,
	@Notes nvarchar(1000) = NULL,
	@AddedFrom int = NULL,
	@AddedTo int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [UserTransLog]
	SET
		[MemberID] = @MemberID,
		[TransDate] = @TransDate,
		[TransType] = @TransType,
		[AddedBy] = @AddedBy,
		[PaymentMethod] = @PaymentMethod,
		[Value] = @Value,
		[Notes] = @Notes,
		[AddedFrom] = @AddedFrom,
		[AddedTo] = @AddedTo
	WHERE
		[UserTransLogID] = @UserTransLogID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserTransLogUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserTransLogUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_UserTransLogInsert]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserTransLogInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserTransLogInsert];
GO

CREATE PROCEDURE [proc_UserTransLogInsert]
(
	@UserTransLogID int = NULL output,
	@MemberID int = NULL,
	@TransDate datetime = NULL,
	@TransType smallint = NULL,
	@AddedBy nvarchar(100) = NULL,
	@PaymentMethod nvarchar(100) = NULL,
	@Value decimal(10,4) = NULL,
	@Notes nvarchar(1000) = NULL,
	@AddedFrom int = NULL,
	@AddedTo int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [UserTransLog]
	(
		[MemberID],
		[TransDate],
		[TransType],
		[AddedBy],
		[PaymentMethod],
		[Value],
		[Notes],
		[AddedFrom],
		[AddedTo]
	)
	VALUES
	(
		@MemberID,
		@TransDate,
		@TransType,
		@AddedBy,
		@PaymentMethod,
		@Value,
		@Notes,
		@AddedFrom,
		@AddedTo
	)

	SET @Err = @@Error

	SELECT @UserTransLogID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserTransLogInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserTransLogInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserTransLogDelete]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserTransLogDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserTransLogDelete];
GO

CREATE PROCEDURE [proc_UserTransLogDelete]
(
	@UserTransLogID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [UserTransLog]
	WHERE
		[UserTransLogID] = @UserTransLogID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserTransLogDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserTransLogDelete Error on Creation'
GO
