
/****** Object:  StoredProcedure [proc_ReligionLoadByPrimaryKey]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReligionLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReligionLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ReligionLoadByPrimaryKey]
(
	@ReligionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReligionID],
		[Name]
	FROM [Religion]
	WHERE
		([ReligionID] = @ReligionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReligionLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReligionLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ReligionLoadAll]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReligionLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReligionLoadAll];
GO

CREATE PROCEDURE [proc_ReligionLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReligionID],
		[Name]
	FROM [Religion]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReligionLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReligionLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ReligionUpdate]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReligionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReligionUpdate];
GO

CREATE PROCEDURE [proc_ReligionUpdate]
(
	@ReligionID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Religion]
	SET
		[Name] = @Name
	WHERE
		[ReligionID] = @ReligionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReligionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReligionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ReligionInsert]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReligionInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReligionInsert];
GO

CREATE PROCEDURE [proc_ReligionInsert]
(
	@ReligionID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Religion]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @ReligionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReligionInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReligionInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ReligionDelete]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReligionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReligionDelete];
GO

CREATE PROCEDURE [proc_ReligionDelete]
(
	@ReligionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Religion]
	WHERE
		[ReligionID] = @ReligionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReligionDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReligionDelete Error on Creation'
GO
