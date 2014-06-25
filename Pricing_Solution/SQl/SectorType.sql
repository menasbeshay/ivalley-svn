
/****** Object:  StoredProcedure [proc_SectorTypeLoadByPrimaryKey]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_SectorTypeLoadByPrimaryKey]
(
	@SectorTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[SectorTypeID],
		[Name]
	FROM [SectorType]
	WHERE
		([SectorTypeID] = @SectorTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorTypeLoadAll]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorTypeLoadAll];
GO

CREATE PROCEDURE [proc_SectorTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[SectorTypeID],
		[Name]
	FROM [SectorType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorTypeUpdate]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorTypeUpdate];
GO

CREATE PROCEDURE [proc_SectorTypeUpdate]
(
	@SectorTypeID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [SectorType]
	SET
		[Name] = @Name
	WHERE
		[SectorTypeID] = @SectorTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_SectorTypeInsert]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorTypeInsert];
GO

CREATE PROCEDURE [proc_SectorTypeInsert]
(
	@SectorTypeID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [SectorType]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @SectorTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorTypeDelete]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorTypeDelete];
GO

CREATE PROCEDURE [proc_SectorTypeDelete]
(
	@SectorTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [SectorType]
	WHERE
		[SectorTypeID] = @SectorTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorTypeDelete Error on Creation'
GO
