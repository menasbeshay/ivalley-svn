
/****** Object:  StoredProcedure [proc_CardLayoutsLoadByPrimaryKey]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardLayoutsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardLayoutsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CardLayoutsLoadByPrimaryKey]
(
	@CardLayoutID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CardLayoutID],
		[CardID],
		[LayoutImage],
		[LayeoutBackImage],
		[ColorID]
	FROM [CardLayouts]
	WHERE
		([CardLayoutID] = @CardLayoutID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardLayoutsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardLayoutsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardLayoutsLoadAll]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardLayoutsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardLayoutsLoadAll];
GO

CREATE PROCEDURE [proc_CardLayoutsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CardLayoutID],
		[CardID],
		[LayoutImage],
		[LayeoutBackImage],
		[ColorID]
	FROM [CardLayouts]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardLayoutsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardLayoutsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardLayoutsUpdate]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardLayoutsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardLayoutsUpdate];
GO

CREATE PROCEDURE [proc_CardLayoutsUpdate]
(
	@CardLayoutID int,
	@CardID int = NULL,
	@LayoutImage nvarchar(250) = NULL,
	@LayeoutBackImage nvarchar(250) = NULL,
	@ColorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CardLayouts]
	SET
		[CardID] = @CardID,
		[LayoutImage] = @LayoutImage,
		[LayeoutBackImage] = @LayeoutBackImage,
		[ColorID] = @ColorID
	WHERE
		[CardLayoutID] = @CardLayoutID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardLayoutsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardLayoutsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CardLayoutsInsert]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardLayoutsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardLayoutsInsert];
GO

CREATE PROCEDURE [proc_CardLayoutsInsert]
(
	@CardLayoutID int = NULL output,
	@CardID int = NULL,
	@LayoutImage nvarchar(250) = NULL,
	@LayeoutBackImage nvarchar(250) = NULL,
	@ColorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CardLayouts]
	(
		[CardID],
		[LayoutImage],
		[LayeoutBackImage],
		[ColorID]
	)
	VALUES
	(
		@CardID,
		@LayoutImage,
		@LayeoutBackImage,
		@ColorID
	)

	SET @Err = @@Error

	SELECT @CardLayoutID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardLayoutsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardLayoutsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardLayoutsDelete]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardLayoutsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardLayoutsDelete];
GO

CREATE PROCEDURE [proc_CardLayoutsDelete]
(
	@CardLayoutID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CardLayouts]
	WHERE
		[CardLayoutID] = @CardLayoutID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardLayoutsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardLayoutsDelete Error on Creation'
GO
