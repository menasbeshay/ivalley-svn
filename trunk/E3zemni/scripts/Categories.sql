
/****** Object:  StoredProcedure [proc_CategoriesLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CategoriesLoadByPrimaryKey]
(
	@CategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[CatNameAr],
		[CatNameEng],
		[CatImage],
		[MainCatId],
		[HoverImage],
		[IsPartySupplier]
	FROM [Categories]
	WHERE
		([CategoryID] = @CategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoriesLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesLoadAll];
GO

CREATE PROCEDURE [proc_CategoriesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[CatNameAr],
		[CatNameEng],
		[CatImage],
		[MainCatId],
		[HoverImage],
		[IsPartySupplier]
	FROM [Categories]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoriesUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesUpdate];
GO

CREATE PROCEDURE [proc_CategoriesUpdate]
(
	@CategoryID int,
	@CatNameAr nvarchar(250) = NULL,
	@CatNameEng nvarchar(250) = NULL,
	@CatImage nvarchar(500) = NULL,
	@MainCatId int = NULL,
	@HoverImage nvarchar(200) = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Categories]
	SET
		[CatNameAr] = @CatNameAr,
		[CatNameEng] = @CatNameEng,
		[CatImage] = @CatImage,
		[MainCatId] = @MainCatId,
		[HoverImage] = @HoverImage,
		[IsPartySupplier] = @IsPartySupplier
	WHERE
		[CategoryID] = @CategoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CategoriesInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesInsert];
GO

CREATE PROCEDURE [proc_CategoriesInsert]
(
	@CategoryID int = NULL output,
	@CatNameAr nvarchar(250) = NULL,
	@CatNameEng nvarchar(250) = NULL,
	@CatImage nvarchar(500) = NULL,
	@MainCatId int = NULL,
	@HoverImage nvarchar(200) = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Categories]
	(
		[CatNameAr],
		[CatNameEng],
		[CatImage],
		[MainCatId],
		[HoverImage],
		[IsPartySupplier]
	)
	VALUES
	(
		@CatNameAr,
		@CatNameEng,
		@CatImage,
		@MainCatId,
		@HoverImage,
		@IsPartySupplier
	)

	SET @Err = @@Error

	SELECT @CategoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoriesDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesDelete];
GO

CREATE PROCEDURE [proc_CategoriesDelete]
(
	@CategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Categories]
	WHERE
		[CategoryID] = @CategoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesDelete Error on Creation'
GO
