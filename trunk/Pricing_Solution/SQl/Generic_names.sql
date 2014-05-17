
/****** Object:  StoredProcedure [proc_Generic_namesLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Generic_namesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Generic_namesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_Generic_namesLoadByPrimaryKey]
(
	@GenericID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GenericID],
		[Generic_name]
	FROM [Generic_names]
	WHERE
		([GenericID] = @GenericID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Generic_namesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_Generic_namesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Generic_namesLoadAll]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Generic_namesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Generic_namesLoadAll];
GO

CREATE PROCEDURE [proc_Generic_namesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GenericID],
		[Generic_name]
	FROM [Generic_names]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Generic_namesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_Generic_namesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Generic_namesUpdate]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Generic_namesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Generic_namesUpdate];
GO

CREATE PROCEDURE [proc_Generic_namesUpdate]
(
	@GenericID int,
	@Generic_name nvarchar(255) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Generic_names]
	SET
		[Generic_name] = @Generic_name
	WHERE
		[GenericID] = @GenericID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Generic_namesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_Generic_namesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_Generic_namesInsert]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Generic_namesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Generic_namesInsert];
GO

CREATE PROCEDURE [proc_Generic_namesInsert]
(
	@GenericID int = NULL output,
	@Generic_name nvarchar(255) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Generic_names]
	(
		[Generic_name]
	)
	VALUES
	(
		@Generic_name
	)

	SET @Err = @@Error

	SELECT @GenericID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Generic_namesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_Generic_namesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Generic_namesDelete]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Generic_namesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Generic_namesDelete];
GO

CREATE PROCEDURE [proc_Generic_namesDelete]
(
	@GenericID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Generic_names]
	WHERE
		[GenericID] = @GenericID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Generic_namesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_Generic_namesDelete Error on Creation'
GO
