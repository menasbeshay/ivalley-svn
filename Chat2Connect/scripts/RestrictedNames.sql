
/****** Object:  StoredProcedure [proc_RestrictedNamesLoadByPrimaryKey]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RestrictedNamesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RestrictedNamesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RestrictedNamesLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[Name]
	FROM [RestrictedNames]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RestrictedNamesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RestrictedNamesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RestrictedNamesLoadAll]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RestrictedNamesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RestrictedNamesLoadAll];
GO

CREATE PROCEDURE [proc_RestrictedNamesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[Name]
	FROM [RestrictedNames]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RestrictedNamesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RestrictedNamesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RestrictedNamesUpdate]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RestrictedNamesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RestrictedNamesUpdate];
GO

CREATE PROCEDURE [proc_RestrictedNamesUpdate]
(
	@ID int,
	@Name nvarchar(256)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RestrictedNames]
	SET
		[Name] = @Name
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RestrictedNamesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RestrictedNamesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RestrictedNamesInsert]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RestrictedNamesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RestrictedNamesInsert];
GO

CREATE PROCEDURE [proc_RestrictedNamesInsert]
(
	@ID int = NULL output,
	@Name nvarchar(256)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RestrictedNames]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RestrictedNamesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RestrictedNamesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RestrictedNamesDelete]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RestrictedNamesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RestrictedNamesDelete];
GO

CREATE PROCEDURE [proc_RestrictedNamesDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RestrictedNames]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RestrictedNamesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RestrictedNamesDelete Error on Creation'
GO
