
/****** Object:  StoredProcedure [proc_ColorLoadByPrimaryKey]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ColorLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ColorLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ColorLoadByPrimaryKey]
(
	@ColorID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ColorID],
		[ColorCode],
		[ColorNameEng],
		[ColorNameAr]
	FROM [Color]
	WHERE
		([ColorID] = @ColorID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ColorLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ColorLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ColorLoadAll]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ColorLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ColorLoadAll];
GO

CREATE PROCEDURE [proc_ColorLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ColorID],
		[ColorCode],
		[ColorNameEng],
		[ColorNameAr]
	FROM [Color]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ColorLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ColorLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ColorUpdate]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ColorUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ColorUpdate];
GO

CREATE PROCEDURE [proc_ColorUpdate]
(
	@ColorID int,
	@ColorCode nvarchar(6) = NULL,
	@ColorNameEng nvarchar(30) = NULL,
	@ColorNameAr nvarchar(30) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Color]
	SET
		[ColorCode] = @ColorCode,
		[ColorNameEng] = @ColorNameEng,
		[ColorNameAr] = @ColorNameAr
	WHERE
		[ColorID] = @ColorID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ColorUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ColorUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ColorInsert]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ColorInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ColorInsert];
GO

CREATE PROCEDURE [proc_ColorInsert]
(
	@ColorID int = NULL output,
	@ColorCode nvarchar(6) = NULL,
	@ColorNameEng nvarchar(30) = NULL,
	@ColorNameAr nvarchar(30) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Color]
	(
		[ColorCode],
		[ColorNameEng],
		[ColorNameAr]
	)
	VALUES
	(
		@ColorCode,
		@ColorNameEng,
		@ColorNameAr
	)

	SET @Err = @@Error

	SELECT @ColorID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ColorInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ColorInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ColorDelete]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ColorDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ColorDelete];
GO

CREATE PROCEDURE [proc_ColorDelete]
(
	@ColorID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Color]
	WHERE
		[ColorID] = @ColorID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ColorDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ColorDelete Error on Creation'
GO
