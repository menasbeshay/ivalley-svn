
/****** Object:  StoredProcedure [proc_MemberTypeLoadByPrimaryKey]    Script Date: 12/9/2013 11:26:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberTypeLoadByPrimaryKey]
(
	@MemberTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberTypeID],
		[Name],
		[IconPath],
		[Price_Money],
		[Price_Point],
		[Color]
	FROM [MemberType]
	WHERE
		([MemberTypeID] = @MemberTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberTypeLoadAll]    Script Date: 12/9/2013 11:26:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeLoadAll];
GO

CREATE PROCEDURE [proc_MemberTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberTypeID],
		[Name],
		[IconPath],
		[Price_Money],
		[Price_Point],
		[Color]
	FROM [MemberType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberTypeUpdate]    Script Date: 12/9/2013 11:26:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeUpdate];
GO

CREATE PROCEDURE [proc_MemberTypeUpdate]
(
	@MemberTypeID int,
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

	UPDATE [MemberType]
	SET
		[Name] = @Name,
		[IconPath] = @IconPath,
		[Price_Money] = @Price_Money,
		[Price_Point] = @Price_Point,
		[Color] = @Color
	WHERE
		[MemberTypeID] = @MemberTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberTypeInsert]    Script Date: 12/9/2013 11:26:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeInsert];
GO

CREATE PROCEDURE [proc_MemberTypeInsert]
(
	@MemberTypeID int = NULL output,
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
	INTO [MemberType]
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

	SELECT @MemberTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberTypeDelete]    Script Date: 12/9/2013 11:26:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeDelete];
GO

CREATE PROCEDURE [proc_MemberTypeDelete]
(
	@MemberTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberType]
	WHERE
		[MemberTypeID] = @MemberTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeDelete Error on Creation'
GO
