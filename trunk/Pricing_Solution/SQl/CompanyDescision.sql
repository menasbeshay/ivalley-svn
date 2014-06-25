
/****** Object:  StoredProcedure [proc_CompanyDescisionLoadByPrimaryKey]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompanyDescisionLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompanyDescisionLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CompanyDescisionLoadByPrimaryKey]
(
	@CompanyDescisionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CompanyDescisionID],
		[DescisionText],
		[Notice]
	FROM [CompanyDescision]
	WHERE
		([CompanyDescisionID] = @CompanyDescisionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompanyDescisionLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompanyDescisionLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CompanyDescisionLoadAll]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompanyDescisionLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompanyDescisionLoadAll];
GO

CREATE PROCEDURE [proc_CompanyDescisionLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CompanyDescisionID],
		[DescisionText],
		[Notice]
	FROM [CompanyDescision]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompanyDescisionLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompanyDescisionLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CompanyDescisionUpdate]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompanyDescisionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompanyDescisionUpdate];
GO

CREATE PROCEDURE [proc_CompanyDescisionUpdate]
(
	@CompanyDescisionID int,
	@DescisionText nvarchar(450) = NULL,
	@Notice nvarchar(1500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CompanyDescision]
	SET
		[DescisionText] = @DescisionText,
		[Notice] = @Notice
	WHERE
		[CompanyDescisionID] = @CompanyDescisionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompanyDescisionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompanyDescisionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CompanyDescisionInsert]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompanyDescisionInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompanyDescisionInsert];
GO

CREATE PROCEDURE [proc_CompanyDescisionInsert]
(
	@CompanyDescisionID int = NULL output,
	@DescisionText nvarchar(450) = NULL,
	@Notice nvarchar(1500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CompanyDescision]
	(
		[DescisionText],
		[Notice]
	)
	VALUES
	(
		@DescisionText,
		@Notice
	)

	SET @Err = @@Error

	SELECT @CompanyDescisionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompanyDescisionInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompanyDescisionInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CompanyDescisionDelete]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompanyDescisionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompanyDescisionDelete];
GO

CREATE PROCEDURE [proc_CompanyDescisionDelete]
(
	@CompanyDescisionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CompanyDescision]
	WHERE
		[CompanyDescisionID] = @CompanyDescisionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompanyDescisionDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompanyDescisionDelete Error on Creation'
GO
