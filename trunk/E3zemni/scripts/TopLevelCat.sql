
/****** Object:  StoredProcedure [proc_TopLevelCatLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TopLevelCatLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TopLevelCatLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TopLevelCatLoadByPrimaryKey]
(
	@TopLevelCatID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TopLevelCatID],
		[NameEng],
		[NameAr],
		[ImagePath],
		[HoverImage],
		[IsPartySupplier]
	FROM [TopLevelCat]
	WHERE
		([TopLevelCatID] = @TopLevelCatID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TopLevelCatLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TopLevelCatLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TopLevelCatLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TopLevelCatLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TopLevelCatLoadAll];
GO

CREATE PROCEDURE [proc_TopLevelCatLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TopLevelCatID],
		[NameEng],
		[NameAr],
		[ImagePath],
		[HoverImage],
		[IsPartySupplier]
	FROM [TopLevelCat]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TopLevelCatLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TopLevelCatLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TopLevelCatUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TopLevelCatUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TopLevelCatUpdate];
GO

CREATE PROCEDURE [proc_TopLevelCatUpdate]
(
	@TopLevelCatID int,
	@NameEng nvarchar(30) = NULL,
	@NameAr nvarchar(30) = NULL,
	@ImagePath nvarchar(200) = NULL,
	@HoverImage nvarchar(200) = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TopLevelCat]
	SET
		[NameEng] = @NameEng,
		[NameAr] = @NameAr,
		[ImagePath] = @ImagePath,
		[HoverImage] = @HoverImage,
		[IsPartySupplier] = @IsPartySupplier
	WHERE
		[TopLevelCatID] = @TopLevelCatID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TopLevelCatUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TopLevelCatUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TopLevelCatInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TopLevelCatInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TopLevelCatInsert];
GO

CREATE PROCEDURE [proc_TopLevelCatInsert]
(
	@TopLevelCatID int = NULL output,
	@NameEng nvarchar(30) = NULL,
	@NameAr nvarchar(30) = NULL,
	@ImagePath nvarchar(200) = NULL,
	@HoverImage nvarchar(200) = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TopLevelCat]
	(
		[NameEng],
		[NameAr],
		[ImagePath],
		[HoverImage],
		[IsPartySupplier]
	)
	VALUES
	(
		@NameEng,
		@NameAr,
		@ImagePath,
		@HoverImage,
		@IsPartySupplier
	)

	SET @Err = @@Error

	SELECT @TopLevelCatID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TopLevelCatInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TopLevelCatInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TopLevelCatDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TopLevelCatDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TopLevelCatDelete];
GO

CREATE PROCEDURE [proc_TopLevelCatDelete]
(
	@TopLevelCatID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TopLevelCat]
	WHERE
		[TopLevelCatID] = @TopLevelCatID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TopLevelCatDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TopLevelCatDelete Error on Creation'
GO
