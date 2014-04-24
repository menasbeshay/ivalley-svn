
/****** Object:  StoredProcedure [proc_MemberLoadByPrimaryKey]    Script Date: 4/24/2014 3:42:33 PM ******/
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

/****** Object:  StoredProcedure [proc_MemberLoadAll]    Script Date: 4/24/2014 3:42:33 PM ******/
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

/****** Object:  StoredProcedure [proc_MemberUpdate]    Script Date: 4/24/2014 3:42:33 PM ******/
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




/****** Object:  StoredProcedure [proc_MemberInsert]    Script Date: 4/24/2014 3:42:33 PM ******/
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

/****** Object:  StoredProcedure [proc_MemberDelete]    Script Date: 4/24/2014 3:42:33 PM ******/
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
