
/****** Object:  StoredProcedure [proc_SubCategoriesLoadByPrimaryKey]    Script Date: 2/1/2013 4:25:36 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubCategoriesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubCategoriesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_SubCategoriesLoadByPrimaryKey]
(
	@SubCategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[SubCategoryID],
		[EnName],
		[ArName],
		[EnDescription],
		[ArDescription],
		[CategoryID],
		[IconPath]
	FROM [SubCategories]
	WHERE
		([SubCategoryID] = @SubCategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubCategoriesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubCategoriesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubCategoriesLoadAll]    Script Date: 2/1/2013 4:25:36 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubCategoriesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubCategoriesLoadAll];
GO

CREATE PROCEDURE [proc_SubCategoriesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[SubCategoryID],
		[EnName],
		[ArName],
		[EnDescription],
		[ArDescription],
		[CategoryID],
		[IconPath]
	FROM [SubCategories]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubCategoriesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubCategoriesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubCategoriesUpdate]    Script Date: 2/1/2013 4:25:36 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubCategoriesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubCategoriesUpdate];
GO

CREATE PROCEDURE [proc_SubCategoriesUpdate]
(
	@SubCategoryID int,
	@EnName nvarchar(200) = NULL,
	@ArName nvarchar(200) = NULL,
	@EnDescription nvarchar(500) = NULL,
	@ArDescription nvarchar(500) = NULL,
	@CategoryID int,
	@IconPath nvarchar(250) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [SubCategories]
	SET
		[EnName] = @EnName,
		[ArName] = @ArName,
		[EnDescription] = @EnDescription,
		[ArDescription] = @ArDescription,
		[CategoryID] = @CategoryID,
		[IconPath] = @IconPath
	WHERE
		[SubCategoryID] = @SubCategoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubCategoriesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubCategoriesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_SubCategoriesInsert]    Script Date: 2/1/2013 4:25:36 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubCategoriesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubCategoriesInsert];
GO

CREATE PROCEDURE [proc_SubCategoriesInsert]
(
	@SubCategoryID int = NULL output,
	@EnName nvarchar(200) = NULL,
	@ArName nvarchar(200) = NULL,
	@EnDescription nvarchar(500) = NULL,
	@ArDescription nvarchar(500) = NULL,
	@CategoryID int,
	@IconPath nvarchar(250) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [SubCategories]
	(
		[EnName],
		[ArName],
		[EnDescription],
		[ArDescription],
		[CategoryID],
		[IconPath]
	)
	VALUES
	(
		@EnName,
		@ArName,
		@EnDescription,
		@ArDescription,
		@CategoryID,
		@IconPath
	)

	SET @Err = @@Error

	SELECT @SubCategoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubCategoriesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubCategoriesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubCategoriesDelete]    Script Date: 2/1/2013 4:25:36 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubCategoriesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubCategoriesDelete];
GO

CREATE PROCEDURE [proc_SubCategoriesDelete]
(
	@SubCategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [SubCategories]
	WHERE
		[SubCategoryID] = @SubCategoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubCategoriesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubCategoriesDelete Error on Creation'
GO
