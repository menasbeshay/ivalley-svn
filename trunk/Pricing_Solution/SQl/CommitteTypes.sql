
/****** Object:  StoredProcedure [proc_CommitteTypesLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteTypesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteTypesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CommitteTypesLoadByPrimaryKey]
(
	@CommiteeTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CommiteeTypeID],
		[TypeText],
		[Description]
	FROM [CommitteTypes]
	WHERE
		([CommiteeTypeID] = @CommiteeTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteTypesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteTypesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CommitteTypesLoadAll]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteTypesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteTypesLoadAll];
GO

CREATE PROCEDURE [proc_CommitteTypesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CommiteeTypeID],
		[TypeText],
		[Description]
	FROM [CommitteTypes]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteTypesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteTypesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CommitteTypesUpdate]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteTypesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteTypesUpdate];
GO

CREATE PROCEDURE [proc_CommitteTypesUpdate]
(
	@CommiteeTypeID int,
	@TypeText nvarchar(250) = NULL,
	@Description nvarchar(1500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CommitteTypes]
	SET
		[TypeText] = @TypeText,
		[Description] = @Description
	WHERE
		[CommiteeTypeID] = @CommiteeTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteTypesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteTypesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CommitteTypesInsert]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteTypesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteTypesInsert];
GO

CREATE PROCEDURE [proc_CommitteTypesInsert]
(
	@CommiteeTypeID int = NULL output,
	@TypeText nvarchar(250) = NULL,
	@Description nvarchar(1500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CommitteTypes]
	(
		[TypeText],
		[Description]
	)
	VALUES
	(
		@TypeText,
		@Description
	)

	SET @Err = @@Error

	SELECT @CommiteeTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteTypesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteTypesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CommitteTypesDelete]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteTypesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteTypesDelete];
GO

CREATE PROCEDURE [proc_CommitteTypesDelete]
(
	@CommiteeTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CommitteTypes]
	WHERE
		[CommiteeTypeID] = @CommiteeTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteTypesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteTypesDelete Error on Creation'
GO
