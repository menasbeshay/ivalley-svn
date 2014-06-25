
/****** Object:  StoredProcedure [proc_SubstancesReferenceLoadByPrimaryKey]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubstancesReferenceLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubstancesReferenceLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_SubstancesReferenceLoadByPrimaryKey]
(
	@SubstancesReferenceID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[SubstancesReferenceID],
		[name],
		[description]
	FROM [SubstancesReference]
	WHERE
		([SubstancesReferenceID] = @SubstancesReferenceID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubstancesReferenceLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubstancesReferenceLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubstancesReferenceLoadAll]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubstancesReferenceLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubstancesReferenceLoadAll];
GO

CREATE PROCEDURE [proc_SubstancesReferenceLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[SubstancesReferenceID],
		[name],
		[description]
	FROM [SubstancesReference]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubstancesReferenceLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubstancesReferenceLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubstancesReferenceUpdate]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubstancesReferenceUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubstancesReferenceUpdate];
GO

CREATE PROCEDURE [proc_SubstancesReferenceUpdate]
(
	@SubstancesReferenceID int,
	@name nvarchar(50) = NULL,
	@description nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [SubstancesReference]
	SET
		[name] = @name,
		[description] = @description
	WHERE
		[SubstancesReferenceID] = @SubstancesReferenceID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubstancesReferenceUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubstancesReferenceUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_SubstancesReferenceInsert]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubstancesReferenceInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubstancesReferenceInsert];
GO

CREATE PROCEDURE [proc_SubstancesReferenceInsert]
(
	@SubstancesReferenceID int = NULL output,
	@name nvarchar(50) = NULL,
	@description nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [SubstancesReference]
	(
		[name],
		[description]
	)
	VALUES
	(
		@name,
		@description
	)

	SET @Err = @@Error

	SELECT @SubstancesReferenceID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubstancesReferenceInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubstancesReferenceInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubstancesReferenceDelete]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubstancesReferenceDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubstancesReferenceDelete];
GO

CREATE PROCEDURE [proc_SubstancesReferenceDelete]
(
	@SubstancesReferenceID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [SubstancesReference]
	WHERE
		[SubstancesReferenceID] = @SubstancesReferenceID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubstancesReferenceDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubstancesReferenceDelete Error on Creation'
GO
