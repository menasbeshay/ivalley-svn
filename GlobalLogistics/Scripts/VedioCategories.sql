
USE [GlobalLogistics]
GO

/****** Object:  StoredProcedure [proc_VedioCategoriesLoadByPrimaryKey]    Script Date: 2/6/2013 4:12:52 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_VedioCategoriesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_VedioCategoriesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_VedioCategoriesLoadByPrimaryKey]
(
	@CategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[EnName],
		[ArName],
		[EnDescription],
		[ArDescription],
		[IconPath]
	FROM [VedioCategories]
	WHERE
		([CategoryID] = @CategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_VedioCategoriesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_VedioCategoriesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_VedioCategoriesLoadAll]    Script Date: 2/6/2013 4:12:53 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_VedioCategoriesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_VedioCategoriesLoadAll];
GO

CREATE PROCEDURE [proc_VedioCategoriesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[EnName],
		[ArName],
		[EnDescription],
		[ArDescription],
		[IconPath]
	FROM [VedioCategories]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_VedioCategoriesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_VedioCategoriesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_VedioCategoriesUpdate]    Script Date: 2/6/2013 4:12:53 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_VedioCategoriesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_VedioCategoriesUpdate];
GO

CREATE PROCEDURE [proc_VedioCategoriesUpdate]
(
	@CategoryID int,
	@EnName nvarchar(200) = NULL,
	@ArName nvarchar(200) = NULL,
	@EnDescription nvarchar(500) = NULL,
	@ArDescription nvarchar(500) = NULL,
	@IconPath nvarchar(250) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [VedioCategories]
	SET
		[EnName] = @EnName,
		[ArName] = @ArName,
		[EnDescription] = @EnDescription,
		[ArDescription] = @ArDescription,
		[IconPath] = @IconPath
	WHERE
		[CategoryID] = @CategoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_VedioCategoriesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_VedioCategoriesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_VedioCategoriesInsert]    Script Date: 2/6/2013 4:12:53 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_VedioCategoriesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_VedioCategoriesInsert];
GO

CREATE PROCEDURE [proc_VedioCategoriesInsert]
(
	@CategoryID int = NULL output,
	@EnName nvarchar(200) = NULL,
	@ArName nvarchar(200) = NULL,
	@EnDescription nvarchar(500) = NULL,
	@ArDescription nvarchar(500) = NULL,
	@IconPath nvarchar(250) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [VedioCategories]
	(
		[EnName],
		[ArName],
		[EnDescription],
		[ArDescription],
		[IconPath]
	)
	VALUES
	(
		@EnName,
		@ArName,
		@EnDescription,
		@ArDescription,
		@IconPath
	)

	SET @Err = @@Error

	SELECT @CategoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_VedioCategoriesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_VedioCategoriesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_VedioCategoriesDelete]    Script Date: 2/6/2013 4:12:53 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_VedioCategoriesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_VedioCategoriesDelete];
GO

CREATE PROCEDURE [proc_VedioCategoriesDelete]
(
	@CategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [VedioCategories]
	WHERE
		[CategoryID] = @CategoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_VedioCategoriesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_VedioCategoriesDelete Error on Creation'
GO
