
/****** Object:  StoredProcedure [proc_RoomLoadByPrimaryKey]    Script Date: 12/9/2013 11:26:17 AM ******/
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
		[CreatedBy]
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

/****** Object:  StoredProcedure [proc_RoomLoadAll]    Script Date: 12/9/2013 11:26:17 AM ******/
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
		[CreatedBy]
	FROM [Room]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomUpdate]    Script Date: 12/9/2013 11:26:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomUpdate];
GO

CREATE PROCEDURE [proc_RoomUpdate]
(
	@RoomID int,
	@CategoryID int,
	@SubCategoryID int,
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
	@CreatedBy int
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
		[CreatedBy] = @CreatedBy
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




/****** Object:  StoredProcedure [proc_RoomInsert]    Script Date: 12/9/2013 11:26:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomInsert];
GO

CREATE PROCEDURE [proc_RoomInsert]
(
	@RoomID int = NULL output,
	@CategoryID int,
	@SubCategoryID int,
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
	@CreatedBy int
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
		[CreatedBy]
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
		@CreatedBy
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

/****** Object:  StoredProcedure [proc_RoomDelete]    Script Date: 12/9/2013 11:26:17 AM ******/
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
