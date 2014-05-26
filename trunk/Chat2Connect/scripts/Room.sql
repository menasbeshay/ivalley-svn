
ALTER TABLE Room ADD fbURL nvarchar(500),tURL nvarchar(500), utURL nvarchar(500)
GO


/****** Object:  StoredProcedure [proc_RoomLoadByPrimaryKey]    Script Date: 26/5/2014 2:03:00 PM ******/
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
		[OpenCams],
		[fbURL],
		[tURL],
		[utURL],
		[RoomTopic]
	FROM [Room]
	WHERE
		([RoomID] = @RoomID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomLoadAll]    Script Date: 26/5/2014 2:03:00 PM ******/
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
		[OpenCams],
		[fbURL],
		[tURL],
		[utURL],
		[RoomTopic]
	FROM [Room]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomUpdate]    Script Date: 26/5/2014 2:03:00 PM ******/
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
	@OpenCams smallint = NULL,
	@fbURL nvarchar(500) = NULL,
	@tURL nvarchar(500) = NULL,
	@utURL nvarchar(500) = NULL,
	@RoomTopic nvarchar(500) = NULL
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
		[OpenCams] = @OpenCams,
		[fbURL] = @fbURL,
		[tURL] = @tURL,
		[utURL] = @utURL,
		[RoomTopic] = @RoomTopic
	WHERE
		[RoomID] = @RoomID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_RoomInsert]    Script Date: 26/5/2014 2:03:00 PM ******/
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
	@OpenCams smallint = NULL,
	@fbURL nvarchar(500) = NULL,
	@tURL nvarchar(500) = NULL,
	@utURL nvarchar(500) = NULL,
	@RoomTopic nvarchar(500) = NULL
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
		[OpenCams],
		[fbURL],
		[tURL],
		[utURL],
		[RoomTopic]
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
		@OpenCams,
		@fbURL,
		@tURL,
		@utURL,
		@RoomTopic
	)

	SET @Err = @@Error

	SELECT @RoomID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomDelete]    Script Date: 26/5/2014 2:03:00 PM ******/
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

