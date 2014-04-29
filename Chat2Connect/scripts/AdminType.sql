
USE [Chat2Connect_db]
GO

/****** Object:  StoredProcedure [proc_AdminTypeLoadByPrimaryKey]    Script Date: 4/29/2014 2:20:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AdminTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AdminTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_AdminTypeLoadByPrimaryKey]
(
	@AdminTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AdminTypeID],
		[Name]
	FROM [AdminType]
	WHERE
		([AdminTypeID] = @AdminTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AdminTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_AdminTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AdminTypeLoadAll]    Script Date: 4/29/2014 2:20:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AdminTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AdminTypeLoadAll];
GO

CREATE PROCEDURE [proc_AdminTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AdminTypeID],
		[Name]
	FROM [AdminType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AdminTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_AdminTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AdminTypeUpdate]    Script Date: 4/29/2014 2:20:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AdminTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AdminTypeUpdate];
GO

CREATE PROCEDURE [proc_AdminTypeUpdate]
(
	@AdminTypeID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [AdminType]
	SET
		[Name] = @Name
	WHERE
		[AdminTypeID] = @AdminTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AdminTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_AdminTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_AdminTypeInsert]    Script Date: 4/29/2014 2:20:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AdminTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AdminTypeInsert];
GO

CREATE PROCEDURE [proc_AdminTypeInsert]
(
	@AdminTypeID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [AdminType]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @AdminTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AdminTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_AdminTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AdminTypeDelete]    Script Date: 4/29/2014 2:20:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AdminTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AdminTypeDelete];
GO

CREATE PROCEDURE [proc_AdminTypeDelete]
(
	@AdminTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [AdminType]
	WHERE
		[AdminTypeID] = @AdminTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AdminTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_AdminTypeDelete Error on Creation'
GO
