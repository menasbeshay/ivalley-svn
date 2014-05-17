
USE [chat2connect]
GO

/****** Object:  StoredProcedure [proc_MemberLoadByPrimaryKey]    Script Date: 17/5/2014 6:45:12 PM ******/
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


/****** Object:  StoredProcedure [proc_MemberLoadAll]    Script Date: 17/5/2014 6:45:12 PM ******/
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


/****** Object:  StoredProcedure [proc_MemberUpdate]    Script Date: 17/5/2014 6:45:12 PM ******/
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




/****** Object:  StoredProcedure [proc_MemberInsert]    Script Date: 17/5/2014 6:45:12 PM ******/
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


/****** Object:  StoredProcedure [proc_MemberDelete]    Script Date: 17/5/2014 6:45:12 PM ******/
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


/****** Object:  StoredProcedure [proc_MemberTypeLoadByPrimaryKey]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberTypeLoadByPrimaryKey]
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
		[MemberTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy]
	FROM [MemberType]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeLoadAll]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeLoadAll];
GO

CREATE PROCEDURE [proc_MemberTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberID],
		[MemberTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy]
	FROM [MemberType]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeUpdate]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeUpdate];
GO

CREATE PROCEDURE [proc_MemberTypeUpdate]
(
	@ID int,
	@MemberID int,
	@MemberTypeSpecDurationID int,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@CreateBy int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberType]
	SET
		[MemberID] = @MemberID,
		[MemberTypeSpecDurationID] = @MemberTypeSpecDurationID,
		[StartDate] = @StartDate,
		[EndDate] = @EndDate,
		[CreateBy] = @CreateBy
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_MemberTypeInsert]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeInsert];
GO

CREATE PROCEDURE [proc_MemberTypeInsert]
(
	@ID int,
	@MemberID int,
	@MemberTypeSpecDurationID int,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@CreateBy int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberType]
	(
		[ID],
		[MemberID],
		[MemberTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy]
	)
	VALUES
	(
		@ID,
		@MemberID,
		@MemberTypeSpecDurationID,
		@StartDate,
		@EndDate,
		@CreateBy
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeDelete]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeDelete];
GO

CREATE PROCEDURE [proc_MemberTypeDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberType]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeSpecLoadByPrimaryKey]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeSpecLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeSpecLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberTypeSpecLoadByPrimaryKey]
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
		[Color],
		[OpenRoomCount],
		[OpenedCamCount],
		[FriendsCount],
		[MailSize],
		[CreatePrivateRoomCount],
		[CreateTempRoomCount],
		[CanOpenFullRoom],
		[IsMemberOfConnectionClup]
	FROM [MemberTypeSpec]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeSpecLoadAll]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeSpecLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeSpecLoadAll];
GO

CREATE PROCEDURE [proc_MemberTypeSpecLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[Name],
		[Color],
		[OpenRoomCount],
		[OpenedCamCount],
		[FriendsCount],
		[MailSize],
		[CreatePrivateRoomCount],
		[CreateTempRoomCount],
		[CanOpenFullRoom],
		[IsMemberOfConnectionClup]
	FROM [MemberTypeSpec]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeSpecUpdate]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeSpecUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeSpecUpdate];
GO

CREATE PROCEDURE [proc_MemberTypeSpecUpdate]
(
	@ID int,
	@Name nvarchar(250),
	@Color varchar(50),
	@OpenRoomCount int,
	@OpenedCamCount int = NULL,
	@FriendsCount int,
	@MailSize int = NULL,
	@CreatePrivateRoomCount int,
	@CreateTempRoomCount int,
	@CanOpenFullRoom bit,
	@IsMemberOfConnectionClup bit
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberTypeSpec]
	SET
		[Name] = @Name,
		[Color] = @Color,
		[OpenRoomCount] = @OpenRoomCount,
		[OpenedCamCount] = @OpenedCamCount,
		[FriendsCount] = @FriendsCount,
		[MailSize] = @MailSize,
		[CreatePrivateRoomCount] = @CreatePrivateRoomCount,
		[CreateTempRoomCount] = @CreateTempRoomCount,
		[CanOpenFullRoom] = @CanOpenFullRoom,
		[IsMemberOfConnectionClup] = @IsMemberOfConnectionClup
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_MemberTypeSpecInsert]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeSpecInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeSpecInsert];
GO

CREATE PROCEDURE [proc_MemberTypeSpecInsert]
(
	@ID int = NULL output,
	@Name nvarchar(250),
	@Color varchar(50),
	@OpenRoomCount int,
	@OpenedCamCount int = NULL,
	@FriendsCount int,
	@MailSize int = NULL,
	@CreatePrivateRoomCount int,
	@CreateTempRoomCount int,
	@CanOpenFullRoom bit,
	@IsMemberOfConnectionClup bit
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberTypeSpec]
	(
		[Name],
		[Color],
		[OpenRoomCount],
		[OpenedCamCount],
		[FriendsCount],
		[MailSize],
		[CreatePrivateRoomCount],
		[CreateTempRoomCount],
		[CanOpenFullRoom],
		[IsMemberOfConnectionClup]
	)
	VALUES
	(
		@Name,
		@Color,
		@OpenRoomCount,
		@OpenedCamCount,
		@FriendsCount,
		@MailSize,
		@CreatePrivateRoomCount,
		@CreateTempRoomCount,
		@CanOpenFullRoom,
		@IsMemberOfConnectionClup
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeSpecDelete]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeSpecDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeSpecDelete];
GO

CREATE PROCEDURE [proc_MemberTypeSpecDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberTypeSpec]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeSpecDurationLoadByPrimaryKey]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeSpecDurationLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeSpecDurationLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberTypeSpecDurationLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberTypeSpecID],
		[TypeDurationID],
		[Price]
	FROM [MemberTypeSpecDuration]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeSpecDurationLoadAll]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeSpecDurationLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeSpecDurationLoadAll];
GO

CREATE PROCEDURE [proc_MemberTypeSpecDurationLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberTypeSpecID],
		[TypeDurationID],
		[Price]
	FROM [MemberTypeSpecDuration]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeSpecDurationUpdate]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeSpecDurationUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeSpecDurationUpdate];
GO

CREATE PROCEDURE [proc_MemberTypeSpecDurationUpdate]
(
	@ID int,
	@MemberTypeSpecID int,
	@TypeDurationID int = NULL,
	@Price decimal(8,4)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberTypeSpecDuration]
	SET
		[MemberTypeSpecID] = @MemberTypeSpecID,
		[TypeDurationID] = @TypeDurationID,
		[Price] = @Price
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_MemberTypeSpecDurationInsert]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeSpecDurationInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeSpecDurationInsert];
GO

CREATE PROCEDURE [proc_MemberTypeSpecDurationInsert]
(
	@ID int = NULL output,
	@MemberTypeSpecID int,
	@TypeDurationID int = NULL,
	@Price decimal(8,4)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberTypeSpecDuration]
	(
		[MemberTypeSpecID],
		[TypeDurationID],
		[Price]
	)
	VALUES
	(
		@MemberTypeSpecID,
		@TypeDurationID,
		@Price
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeSpecDurationDelete]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeSpecDurationDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeSpecDurationDelete];
GO

CREATE PROCEDURE [proc_MemberTypeSpecDurationDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberTypeSpecDuration]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomLoadByPrimaryKey]    Script Date: 17/5/2014 6:45:12 PM ******/
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


/****** Object:  StoredProcedure [proc_RoomLoadAll]    Script Date: 17/5/2014 6:45:12 PM ******/
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


/****** Object:  StoredProcedure [proc_RoomUpdate]    Script Date: 17/5/2014 6:45:12 PM ******/
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




/****** Object:  StoredProcedure [proc_RoomInsert]    Script Date: 17/5/2014 6:45:12 PM ******/
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


/****** Object:  StoredProcedure [proc_RoomDelete]    Script Date: 17/5/2014 6:45:12 PM ******/
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


/****** Object:  StoredProcedure [proc_RoomTypeLoadByPrimaryKey]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomTypeLoadByPrimaryKey]
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
		[RoomTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy]
	FROM [RoomType]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeLoadAll]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeLoadAll];
GO

CREATE PROCEDURE [proc_RoomTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomID],
		[RoomTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy]
	FROM [RoomType]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeUpdate]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeUpdate];
GO

CREATE PROCEDURE [proc_RoomTypeUpdate]
(
	@ID int,
	@RoomID int,
	@RoomTypeSpecDurationID int,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@CreateBy int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomType]
	SET
		[RoomID] = @RoomID,
		[RoomTypeSpecDurationID] = @RoomTypeSpecDurationID,
		[StartDate] = @StartDate,
		[EndDate] = @EndDate,
		[CreateBy] = @CreateBy
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_RoomTypeInsert]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeInsert];
GO

CREATE PROCEDURE [proc_RoomTypeInsert]
(
	@ID int = NULL output,
	@RoomID int,
	@RoomTypeSpecDurationID int,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@CreateBy int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomType]
	(
		[RoomID],
		[RoomTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy]
	)
	VALUES
	(
		@RoomID,
		@RoomTypeSpecDurationID,
		@StartDate,
		@EndDate,
		@CreateBy
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeDelete]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeDelete];
GO

CREATE PROCEDURE [proc_RoomTypeDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomType]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeSpecLoadByPrimaryKey]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomTypeSpecLoadByPrimaryKey]
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
		[Color],
		[OrderInRoomList],
		[MicCount]
	FROM [RoomTypeSpec]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeSpecLoadAll]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecLoadAll];
GO

CREATE PROCEDURE [proc_RoomTypeSpecLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[Name],
		[Color],
		[OrderInRoomList],
		[MicCount]
	FROM [RoomTypeSpec]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeSpecUpdate]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecUpdate];
GO

CREATE PROCEDURE [proc_RoomTypeSpecUpdate]
(
	@ID int,
	@Name nvarchar(50),
	@Color varchar(50) = NULL,
	@OrderInRoomList int,
	@MicCount int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomTypeSpec]
	SET
		[Name] = @Name,
		[Color] = @Color,
		[OrderInRoomList] = @OrderInRoomList,
		[MicCount] = @MicCount
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_RoomTypeSpecInsert]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecInsert];
GO

CREATE PROCEDURE [proc_RoomTypeSpecInsert]
(
	@ID int = NULL output,
	@Name nvarchar(50),
	@Color varchar(50) = NULL,
	@OrderInRoomList int,
	@MicCount int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomTypeSpec]
	(
		[Name],
		[Color],
		[OrderInRoomList],
		[MicCount]
	)
	VALUES
	(
		@Name,
		@Color,
		@OrderInRoomList,
		@MicCount
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeSpecDelete]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecDelete];
GO

CREATE PROCEDURE [proc_RoomTypeSpecDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomTypeSpec]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeSpecDurationLoadByPrimaryKey]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecDurationLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecDurationLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomTypeSpecDurationLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomTypeSpecID],
		[TypeDurationID],
		[Price],
		[OpenMemberCount]
	FROM [RoomTypeSpecDuration]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeSpecDurationLoadAll]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecDurationLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecDurationLoadAll];
GO

CREATE PROCEDURE [proc_RoomTypeSpecDurationLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomTypeSpecID],
		[TypeDurationID],
		[Price],
		[OpenMemberCount]
	FROM [RoomTypeSpecDuration]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeSpecDurationUpdate]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecDurationUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecDurationUpdate];
GO

CREATE PROCEDURE [proc_RoomTypeSpecDurationUpdate]
(
	@ID int,
	@RoomTypeSpecID int,
	@TypeDurationID int = NULL,
	@Price decimal(8,4),
	@OpenMemberCount int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomTypeSpecDuration]
	SET
		[RoomTypeSpecID] = @RoomTypeSpecID,
		[TypeDurationID] = @TypeDurationID,
		[Price] = @Price,
		[OpenMemberCount] = @OpenMemberCount
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_RoomTypeSpecDurationInsert]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecDurationInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecDurationInsert];
GO

CREATE PROCEDURE [proc_RoomTypeSpecDurationInsert]
(
	@ID int = NULL output,
	@RoomTypeSpecID int,
	@TypeDurationID int = NULL,
	@Price decimal(8,4),
	@OpenMemberCount int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomTypeSpecDuration]
	(
		[RoomTypeSpecID],
		[TypeDurationID],
		[Price],
		[OpenMemberCount]
	)
	VALUES
	(
		@RoomTypeSpecID,
		@TypeDurationID,
		@Price,
		@OpenMemberCount
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeSpecDurationDelete]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecDurationDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecDurationDelete];
GO

CREATE PROCEDURE [proc_RoomTypeSpecDurationDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomTypeSpecDuration]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_TypeDurationLoadByPrimaryKey]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TypeDurationLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TypeDurationLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TypeDurationLoadByPrimaryKey]
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
		[MonthesNumber]
	FROM [TypeDuration]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_TypeDurationLoadAll]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TypeDurationLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TypeDurationLoadAll];
GO

CREATE PROCEDURE [proc_TypeDurationLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[Name],
		[MonthesNumber]
	FROM [TypeDuration]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_TypeDurationUpdate]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TypeDurationUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TypeDurationUpdate];
GO

CREATE PROCEDURE [proc_TypeDurationUpdate]
(
	@ID int,
	@Name nvarchar(50),
	@MonthesNumber int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TypeDuration]
	SET
		[Name] = @Name,
		[MonthesNumber] = @MonthesNumber
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_TypeDurationInsert]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TypeDurationInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TypeDurationInsert];
GO

CREATE PROCEDURE [proc_TypeDurationInsert]
(
	@ID int,
	@Name nvarchar(50),
	@MonthesNumber int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TypeDuration]
	(
		[ID],
		[Name],
		[MonthesNumber]
	)
	VALUES
	(
		@ID,
		@Name,
		@MonthesNumber
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_TypeDurationDelete]    Script Date: 17/5/2014 6:45:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TypeDurationDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TypeDurationDelete];
GO

CREATE PROCEDURE [proc_TypeDurationDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TypeDuration]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO

