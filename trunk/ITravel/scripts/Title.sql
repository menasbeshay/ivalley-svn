
/****** Object:  StoredProcedure [proc_TitleLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TitleLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TitleLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TitleLoadByPrimaryKey]
(
	@TitleID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TitleID],
		[Name]
	FROM [Title]
	WHERE
		([TitleID] = @TitleID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TitleLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TitleLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TitleLoadAll]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TitleLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TitleLoadAll];
GO

CREATE PROCEDURE [proc_TitleLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TitleID],
		[Name]
	FROM [Title]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TitleLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TitleLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TitleUpdate]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TitleUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TitleUpdate];
GO

CREATE PROCEDURE [proc_TitleUpdate]
(
	@TitleID int,
	@Name nvarchar(40) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Title]
	SET
		[Name] = @Name
	WHERE
		[TitleID] = @TitleID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TitleUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TitleUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TitleInsert]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TitleInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TitleInsert];
GO

CREATE PROCEDURE [proc_TitleInsert]
(
	@TitleID int = NULL output,
	@Name nvarchar(40) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Title]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @TitleID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TitleInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TitleInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TitleDelete]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TitleDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TitleDelete];
GO

CREATE PROCEDURE [proc_TitleDelete]
(
	@TitleID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Title]
	WHERE
		[TitleID] = @TitleID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TitleDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TitleDelete Error on Creation'
GO
