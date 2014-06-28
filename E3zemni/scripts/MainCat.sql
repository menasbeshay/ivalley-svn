
/****** Object:  StoredProcedure [proc_MainCatLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MainCatLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MainCatLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MainCatLoadByPrimaryKey]
(
	@MainCatID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MainCatID],
		[NameEng],
		[NameAr],
		[TopLevelCatID],
		[ImagePath],
		[HoverImage],
		[IsPartySupplier]
	FROM [MainCat]
	WHERE
		([MainCatID] = @MainCatID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MainCatLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MainCatLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MainCatLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MainCatLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MainCatLoadAll];
GO

CREATE PROCEDURE [proc_MainCatLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MainCatID],
		[NameEng],
		[NameAr],
		[TopLevelCatID],
		[ImagePath],
		[HoverImage],
		[IsPartySupplier]
	FROM [MainCat]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MainCatLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MainCatLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MainCatUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MainCatUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MainCatUpdate];
GO

CREATE PROCEDURE [proc_MainCatUpdate]
(
	@MainCatID int,
	@NameEng nvarchar(30) = NULL,
	@NameAr nvarchar(30) = NULL,
	@TopLevelCatID int = NULL,
	@ImagePath nvarchar(200) = NULL,
	@HoverImage nvarchar(200) = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MainCat]
	SET
		[NameEng] = @NameEng,
		[NameAr] = @NameAr,
		[TopLevelCatID] = @TopLevelCatID,
		[ImagePath] = @ImagePath,
		[HoverImage] = @HoverImage,
		[IsPartySupplier] = @IsPartySupplier
	WHERE
		[MainCatID] = @MainCatID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MainCatUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MainCatUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MainCatInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MainCatInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MainCatInsert];
GO

CREATE PROCEDURE [proc_MainCatInsert]
(
	@MainCatID int = NULL output,
	@NameEng nvarchar(30) = NULL,
	@NameAr nvarchar(30) = NULL,
	@TopLevelCatID int = NULL,
	@ImagePath nvarchar(200) = NULL,
	@HoverImage nvarchar(200) = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MainCat]
	(
		[NameEng],
		[NameAr],
		[TopLevelCatID],
		[ImagePath],
		[HoverImage],
		[IsPartySupplier]
	)
	VALUES
	(
		@NameEng,
		@NameAr,
		@TopLevelCatID,
		@ImagePath,
		@HoverImage,
		@IsPartySupplier
	)

	SET @Err = @@Error

	SELECT @MainCatID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MainCatInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MainCatInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MainCatDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MainCatDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MainCatDelete];
GO

CREATE PROCEDURE [proc_MainCatDelete]
(
	@MainCatID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MainCat]
	WHERE
		[MainCatID] = @MainCatID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MainCatDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MainCatDelete Error on Creation'
GO
