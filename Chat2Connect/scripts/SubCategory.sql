
/****** Object:  StoredProcedure [proc_SubCategoryLoadByPrimaryKey]    Script Date: 4/29/2014 2:20:17 PM ******/
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

/****** Object:  StoredProcedure [proc_SubCategoryLoadAll]    Script Date: 4/29/2014 2:20:17 PM ******/
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

/****** Object:  StoredProcedure [proc_SubCategoryUpdate]    Script Date: 4/29/2014 2:20:17 PM ******/
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




/****** Object:  StoredProcedure [proc_SubCategoryInsert]    Script Date: 4/29/2014 2:20:17 PM ******/
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

/****** Object:  StoredProcedure [proc_SubCategoryDelete]    Script Date: 4/29/2014 2:20:17 PM ******/
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
