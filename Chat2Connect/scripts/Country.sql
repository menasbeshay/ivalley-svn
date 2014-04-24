
/****** Object:  StoredProcedure [proc_CountryLoadByPrimaryKey]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CountryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CountryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CountryLoadByPrimaryKey]
(
	@CountryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CountryID],
		[Name]
	FROM [Country]
	WHERE
		([CountryID] = @CountryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CountryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CountryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CountryLoadAll]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CountryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CountryLoadAll];
GO

CREATE PROCEDURE [proc_CountryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CountryID],
		[Name]
	FROM [Country]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CountryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CountryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CountryUpdate]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CountryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CountryUpdate];
GO

CREATE PROCEDURE [proc_CountryUpdate]
(
	@CountryID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Country]
	SET
		[Name] = @Name
	WHERE
		[CountryID] = @CountryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CountryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CountryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CountryInsert]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CountryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CountryInsert];
GO

CREATE PROCEDURE [proc_CountryInsert]
(
	@CountryID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Country]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @CountryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CountryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CountryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CountryDelete]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CountryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CountryDelete];
GO

CREATE PROCEDURE [proc_CountryDelete]
(
	@CountryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Country]
	WHERE
		[CountryID] = @CountryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CountryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CountryDelete Error on Creation'
GO
