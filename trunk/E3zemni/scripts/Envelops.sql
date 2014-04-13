
/****** Object:  StoredProcedure [proc_EnvelopsLoadByPrimaryKey]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EnvelopsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EnvelopsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_EnvelopsLoadByPrimaryKey]
(
	@EnvelopID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[EnvelopID],
		[ImagePath],
		[Price],
		[UploadDate],
		[DimensionID],
		[ColorID]
	FROM [Envelops]
	WHERE
		([EnvelopID] = @EnvelopID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EnvelopsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_EnvelopsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_EnvelopsLoadAll]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EnvelopsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EnvelopsLoadAll];
GO

CREATE PROCEDURE [proc_EnvelopsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[EnvelopID],
		[ImagePath],
		[Price],
		[UploadDate],
		[DimensionID],
		[ColorID]
	FROM [Envelops]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EnvelopsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_EnvelopsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_EnvelopsUpdate]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EnvelopsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EnvelopsUpdate];
GO

CREATE PROCEDURE [proc_EnvelopsUpdate]
(
	@EnvelopID int,
	@ImagePath nvarchar(150) = NULL,
	@Price float = NULL,
	@UploadDate datetime = NULL,
	@DimensionID int = NULL,
	@ColorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Envelops]
	SET
		[ImagePath] = @ImagePath,
		[Price] = @Price,
		[UploadDate] = @UploadDate,
		[DimensionID] = @DimensionID,
		[ColorID] = @ColorID
	WHERE
		[EnvelopID] = @EnvelopID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EnvelopsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_EnvelopsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_EnvelopsInsert]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EnvelopsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EnvelopsInsert];
GO

CREATE PROCEDURE [proc_EnvelopsInsert]
(
	@EnvelopID int = NULL output,
	@ImagePath nvarchar(150) = NULL,
	@Price float = NULL,
	@UploadDate datetime = NULL,
	@DimensionID int = NULL,
	@ColorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Envelops]
	(
		[ImagePath],
		[Price],
		[UploadDate],
		[DimensionID],
		[ColorID]
	)
	VALUES
	(
		@ImagePath,
		@Price,
		@UploadDate,
		@DimensionID,
		@ColorID
	)

	SET @Err = @@Error

	SELECT @EnvelopID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EnvelopsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_EnvelopsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_EnvelopsDelete]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EnvelopsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EnvelopsDelete];
GO

CREATE PROCEDURE [proc_EnvelopsDelete]
(
	@EnvelopID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Envelops]
	WHERE
		[EnvelopID] = @EnvelopID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EnvelopsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_EnvelopsDelete Error on Creation'
GO
