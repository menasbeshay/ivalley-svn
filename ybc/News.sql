
USE [ymc]
GO

/****** Object:  StoredProcedure [proc_NewsLoadByPrimaryKey]    Script Date: 1/18/2013 2:50:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_NewsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_NewsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_NewsLoadByPrimaryKey]
(
	@NewsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[NewsID],
		[NewsDate],
		[Title],
		[Details],
		[CommiteeName],
		[Brief]
	FROM [News]
	WHERE
		([NewsID] = @NewsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_NewsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_NewsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_NewsLoadAll]    Script Date: 1/18/2013 2:50:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_NewsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_NewsLoadAll];
GO

CREATE PROCEDURE [proc_NewsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[NewsID],
		[NewsDate],
		[Title],
		[Details],
		[CommiteeName],
		[Brief]
	FROM [News]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_NewsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_NewsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_NewsUpdate]    Script Date: 1/18/2013 2:50:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_NewsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_NewsUpdate];
GO

CREATE PROCEDURE [proc_NewsUpdate]
(
	@NewsID int,
	@NewsDate datetime = NULL,
	@Title nvarchar(500) = NULL,
	@Details nvarchar(MAX) = NULL,
	@CommiteeName nvarchar(350) = NULL,
	@Brief nvarchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [News]
	SET
		[NewsDate] = @NewsDate,
		[Title] = @Title,
		[Details] = @Details,
		[CommiteeName] = @CommiteeName,
		[Brief] = @Brief
	WHERE
		[NewsID] = @NewsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_NewsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_NewsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_NewsInsert]    Script Date: 1/18/2013 2:50:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_NewsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_NewsInsert];
GO

CREATE PROCEDURE [proc_NewsInsert]
(
	@NewsID int = NULL output,
	@NewsDate datetime = NULL,
	@Title nvarchar(500) = NULL,
	@Details nvarchar(MAX) = NULL,
	@CommiteeName nvarchar(350) = NULL,
	@Brief nvarchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [News]
	(
		[NewsDate],
		[Title],
		[Details],
		[CommiteeName],
		[Brief]
	)
	VALUES
	(
		@NewsDate,
		@Title,
		@Details,
		@CommiteeName,
		@Brief
	)

	SET @Err = @@Error

	SELECT @NewsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_NewsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_NewsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_NewsDelete]    Script Date: 1/18/2013 2:50:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_NewsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_NewsDelete];
GO

CREATE PROCEDURE [proc_NewsDelete]
(
	@NewsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [News]
	WHERE
		[NewsID] = @NewsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_NewsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_NewsDelete Error on Creation'
GO
