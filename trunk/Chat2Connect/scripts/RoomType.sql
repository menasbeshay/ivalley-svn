
/****** Object:  StoredProcedure [proc_RoomTypeLoadByPrimaryKey]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomTypeLoadByPrimaryKey]
(
	@RoomTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomTypeID],
		[Name],
		[IconPath],
		[Price_Money],
		[Price_Point],
		[Color]
	FROM [RoomType]
	WHERE
		([RoomTypeID] = @RoomTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomTypeLoadAll]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeLoadAll];
GO

CREATE PROCEDURE [proc_RoomTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomTypeID],
		[Name],
		[IconPath],
		[Price_Money],
		[Price_Point],
		[Color]
	FROM [RoomType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomTypeUpdate]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeUpdate];
GO

CREATE PROCEDURE [proc_RoomTypeUpdate]
(
	@RoomTypeID int,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL,
	@Price_Money decimal(8,4) = NULL,
	@Price_Point int = NULL,
	@Color nvarchar(7) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomType]
	SET
		[Name] = @Name,
		[IconPath] = @IconPath,
		[Price_Money] = @Price_Money,
		[Price_Point] = @Price_Point,
		[Color] = @Color
	WHERE
		[RoomTypeID] = @RoomTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RoomTypeInsert]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeInsert];
GO

CREATE PROCEDURE [proc_RoomTypeInsert]
(
	@RoomTypeID int = NULL output,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL,
	@Price_Money decimal(8,4) = NULL,
	@Price_Point int = NULL,
	@Color nvarchar(7) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomType]
	(
		[Name],
		[IconPath],
		[Price_Money],
		[Price_Point],
		[Color]
	)
	VALUES
	(
		@Name,
		@IconPath,
		@Price_Money,
		@Price_Point,
		@Color
	)

	SET @Err = @@Error

	SELECT @RoomTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomTypeDelete]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeDelete];
GO

CREATE PROCEDURE [proc_RoomTypeDelete]
(
	@RoomTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomType]
	WHERE
		[RoomTypeID] = @RoomTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomTypeDelete Error on Creation'
GO
