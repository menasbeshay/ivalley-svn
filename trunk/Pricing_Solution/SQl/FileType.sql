
/****** Object:  StoredProcedure [proc_FileTypeLoadByPrimaryKey]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FileTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FileTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_FileTypeLoadByPrimaryKey]
(
	@FileTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[FileTypeID],
		[FileType]
	FROM [FileType]
	WHERE
		([FileTypeID] = @FileTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FileTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_FileTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FileTypeLoadAll]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FileTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FileTypeLoadAll];
GO

CREATE PROCEDURE [proc_FileTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[FileTypeID],
		[FileType]
	FROM [FileType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FileTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_FileTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FileTypeUpdate]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FileTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FileTypeUpdate];
GO

CREATE PROCEDURE [proc_FileTypeUpdate]
(
	@FileTypeID int,
	@FileType nvarchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [FileType]
	SET
		[FileType] = @FileType
	WHERE
		[FileTypeID] = @FileTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FileTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_FileTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_FileTypeInsert]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FileTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FileTypeInsert];
GO

CREATE PROCEDURE [proc_FileTypeInsert]
(
	@FileTypeID int = NULL output,
	@FileType nvarchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [FileType]
	(
		[FileType]
	)
	VALUES
	(
		@FileType
	)

	SET @Err = @@Error

	SELECT @FileTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FileTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_FileTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FileTypeDelete]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FileTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FileTypeDelete];
GO

CREATE PROCEDURE [proc_FileTypeDelete]
(
	@FileTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [FileType]
	WHERE
		[FileTypeID] = @FileTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FileTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_FileTypeDelete Error on Creation'
GO
