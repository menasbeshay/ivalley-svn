
/****** Object:  StoredProcedure [proc_DepartmentLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DepartmentLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DepartmentLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DepartmentLoadByPrimaryKey]
(
	@DepartmentID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DepartmentID],
		[DepartmentName]
	FROM [Department]
	WHERE
		([DepartmentID] = @DepartmentID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DepartmentLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DepartmentLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DepartmentLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DepartmentLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DepartmentLoadAll];
GO

CREATE PROCEDURE [proc_DepartmentLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DepartmentID],
		[DepartmentName]
	FROM [Department]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DepartmentLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DepartmentLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DepartmentUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DepartmentUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DepartmentUpdate];
GO

CREATE PROCEDURE [proc_DepartmentUpdate]
(
	@DepartmentID int,
	@DepartmentName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Department]
	SET
		[DepartmentName] = @DepartmentName
	WHERE
		[DepartmentID] = @DepartmentID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DepartmentUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DepartmentUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DepartmentInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DepartmentInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DepartmentInsert];
GO

CREATE PROCEDURE [proc_DepartmentInsert]
(
	@DepartmentID int = NULL output,
	@DepartmentName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Department]
	(
		[DepartmentName]
	)
	VALUES
	(
		@DepartmentName
	)

	SET @Err = @@Error

	SELECT @DepartmentID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DepartmentInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DepartmentInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DepartmentDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DepartmentDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DepartmentDelete];
GO

CREATE PROCEDURE [proc_DepartmentDelete]
(
	@DepartmentID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Department]
	WHERE
		[DepartmentID] = @DepartmentID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DepartmentDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DepartmentDelete Error on Creation'
GO
