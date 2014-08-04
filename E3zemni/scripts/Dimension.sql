
/****** Object:  StoredProcedure [proc_DimensionLoadByPrimaryKey]    Script Date: 8/4/2014 1:27:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DimensionLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DimensionLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DimensionLoadByPrimaryKey]
(
	@DimensionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DimensionID],
		[Width],
		[Height]
	FROM [Dimension]
	WHERE
		([DimensionID] = @DimensionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DimensionLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DimensionLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DimensionLoadAll]    Script Date: 8/4/2014 1:27:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DimensionLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DimensionLoadAll];
GO

CREATE PROCEDURE [proc_DimensionLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DimensionID],
		[Width],
		[Height]
	FROM [Dimension]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DimensionLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DimensionLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DimensionUpdate]    Script Date: 8/4/2014 1:27:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DimensionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DimensionUpdate];
GO

CREATE PROCEDURE [proc_DimensionUpdate]
(
	@DimensionID int,
	@Width decimal(6,2) = NULL,
	@Height decimal(6,2) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Dimension]
	SET
		[Width] = @Width,
		[Height] = @Height
	WHERE
		[DimensionID] = @DimensionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DimensionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DimensionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DimensionInsert]    Script Date: 8/4/2014 1:27:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DimensionInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DimensionInsert];
GO

CREATE PROCEDURE [proc_DimensionInsert]
(
	@DimensionID int = NULL output,
	@Width decimal(6,2) = NULL,
	@Height decimal(6,2) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Dimension]
	(
		[Width],
		[Height]
	)
	VALUES
	(
		@Width,
		@Height
	)

	SET @Err = @@Error

	SELECT @DimensionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DimensionInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DimensionInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DimensionDelete]    Script Date: 8/4/2014 1:27:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DimensionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DimensionDelete];
GO

CREATE PROCEDURE [proc_DimensionDelete]
(
	@DimensionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Dimension]
	WHERE
		[DimensionID] = @DimensionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DimensionDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DimensionDelete Error on Creation'
GO
