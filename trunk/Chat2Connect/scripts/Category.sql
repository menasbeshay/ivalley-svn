
/****** Object:  StoredProcedure [proc_CategoryLoadByPrimaryKey]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CategoryLoadByPrimaryKey]
(
	@CategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[Name],
		[IconPath]
	FROM [Category]
	WHERE
		([CategoryID] = @CategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoryLoadAll]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryLoadAll];
GO

CREATE PROCEDURE [proc_CategoryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[Name],
		[IconPath]
	FROM [Category]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoryUpdate]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryUpdate];
GO

CREATE PROCEDURE [proc_CategoryUpdate]
(
	@CategoryID int,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Category]
	SET
		[Name] = @Name,
		[IconPath] = @IconPath
	WHERE
		[CategoryID] = @CategoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CategoryInsert]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryInsert];
GO

CREATE PROCEDURE [proc_CategoryInsert]
(
	@CategoryID int = NULL output,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Category]
	(
		[Name],
		[IconPath]
	)
	VALUES
	(
		@Name,
		@IconPath
	)

	SET @Err = @@Error

	SELECT @CategoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoryDelete]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryDelete];
GO

CREATE PROCEDURE [proc_CategoryDelete]
(
	@CategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Category]
	WHERE
		[CategoryID] = @CategoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryDelete Error on Creation'
GO
