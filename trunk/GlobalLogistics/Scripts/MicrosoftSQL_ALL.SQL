
USE [GlobalLogistics]
GO

/****** Object:  StoredProcedure [proc_VedioLibLoadByPrimaryKey]    Script Date: 2/7/2013 1:04:05 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_VedioLibLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_VedioLibLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_VedioLibLoadByPrimaryKey]
(
	@VedioID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[VedioID],
		[EnTitle],
		[ArTitle],
		[URL],
		[CategoryID],
		[CreatedDate],
		[IconPath],
		[EnDescription],
		[ArDescription]
	FROM [VedioLib]
	WHERE
		([VedioID] = @VedioID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_VedioLibLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_VedioLibLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_VedioLibLoadAll]    Script Date: 2/7/2013 1:04:05 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_VedioLibLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_VedioLibLoadAll];
GO

CREATE PROCEDURE [proc_VedioLibLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[VedioID],
		[EnTitle],
		[ArTitle],
		[URL],
		[CategoryID],
		[CreatedDate],
		[IconPath],
		[EnDescription],
		[ArDescription]
	FROM [VedioLib]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_VedioLibLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_VedioLibLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_VedioLibUpdate]    Script Date: 2/7/2013 1:04:05 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_VedioLibUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_VedioLibUpdate];
GO

CREATE PROCEDURE [proc_VedioLibUpdate]
(
	@VedioID int,
	@EnTitle nvarchar(200) = NULL,
	@ArTitle nvarchar(200) = NULL,
	@URL nvarchar(500) = NULL,
	@CategoryID int = NULL,
	@CreatedDate datetime = NULL,
	@IconPath nvarchar(250) = NULL,
	@EnDescription nvarchar(500) = NULL,
	@ArDescription nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [VedioLib]
	SET
		[EnTitle] = @EnTitle,
		[ArTitle] = @ArTitle,
		[URL] = @URL,
		[CategoryID] = @CategoryID,
		[CreatedDate] = @CreatedDate,
		[IconPath] = @IconPath,
		[EnDescription] = @EnDescription,
		[ArDescription] = @ArDescription
	WHERE
		[VedioID] = @VedioID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_VedioLibUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_VedioLibUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_VedioLibInsert]    Script Date: 2/7/2013 1:04:05 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_VedioLibInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_VedioLibInsert];
GO

CREATE PROCEDURE [proc_VedioLibInsert]
(
	@VedioID int = NULL output,
	@EnTitle nvarchar(200) = NULL,
	@ArTitle nvarchar(200) = NULL,
	@URL nvarchar(500) = NULL,
	@CategoryID int = NULL,
	@CreatedDate datetime = NULL,
	@IconPath nvarchar(250) = NULL,
	@EnDescription nvarchar(500) = NULL,
	@ArDescription nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [VedioLib]
	(
		[EnTitle],
		[ArTitle],
		[URL],
		[CategoryID],
		[CreatedDate],
		[IconPath],
		[EnDescription],
		[ArDescription]
	)
	VALUES
	(
		@EnTitle,
		@ArTitle,
		@URL,
		@CategoryID,
		@CreatedDate,
		@IconPath,
		@EnDescription,
		@ArDescription
	)

	SET @Err = @@Error

	SELECT @VedioID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_VedioLibInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_VedioLibInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_VedioLibDelete]    Script Date: 2/7/2013 1:04:05 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_VedioLibDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_VedioLibDelete];
GO

CREATE PROCEDURE [proc_VedioLibDelete]
(
	@VedioID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [VedioLib]
	WHERE
		[VedioID] = @VedioID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_VedioLibDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_VedioLibDelete Error on Creation'
GO
