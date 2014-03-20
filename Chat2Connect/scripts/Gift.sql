
/****** Object:  StoredProcedure [proc_GiftLoadByPrimaryKey]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiftLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiftLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_GiftLoadByPrimaryKey]
(
	@GiftID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GiftID],
		[Name],
		[Price_Point],
		[PicPath]
	FROM [Gift]
	WHERE
		([GiftID] = @GiftID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiftLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiftLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiftLoadAll]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiftLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiftLoadAll];
GO

CREATE PROCEDURE [proc_GiftLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GiftID],
		[Name],
		[Price_Point],
		[PicPath]
	FROM [Gift]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiftLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiftLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiftUpdate]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiftUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiftUpdate];
GO

CREATE PROCEDURE [proc_GiftUpdate]
(
	@GiftID int,
	@Name nvarchar(200) = NULL,
	@Price_Point int = NULL,
	@PicPath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Gift]
	SET
		[Name] = @Name,
		[Price_Point] = @Price_Point,
		[PicPath] = @PicPath
	WHERE
		[GiftID] = @GiftID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiftUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiftUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_GiftInsert]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiftInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiftInsert];
GO

CREATE PROCEDURE [proc_GiftInsert]
(
	@GiftID int = NULL output,
	@Name nvarchar(200) = NULL,
	@Price_Point int = NULL,
	@PicPath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Gift]
	(
		[Name],
		[Price_Point],
		[PicPath]
	)
	VALUES
	(
		@Name,
		@Price_Point,
		@PicPath
	)

	SET @Err = @@Error

	SELECT @GiftID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiftInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiftInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiftDelete]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiftDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiftDelete];
GO

CREATE PROCEDURE [proc_GiftDelete]
(
	@GiftID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Gift]
	WHERE
		[GiftID] = @GiftID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiftDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiftDelete Error on Creation'
GO
