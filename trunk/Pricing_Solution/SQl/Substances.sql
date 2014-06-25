
/****** Object:  StoredProcedure [proc_SubstancesLoadByPrimaryKey]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubstancesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubstancesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_SubstancesLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[NAME],
		[Approved]
	FROM [Substances]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubstancesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubstancesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubstancesLoadAll]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubstancesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubstancesLoadAll];
GO

CREATE PROCEDURE [proc_SubstancesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[NAME],
		[Approved]
	FROM [Substances]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubstancesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubstancesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubstancesUpdate]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubstancesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubstancesUpdate];
GO

CREATE PROCEDURE [proc_SubstancesUpdate]
(
	@ID int,
	@NAME nvarchar(500) = NULL,
	@Approved bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Substances]
	SET
		[NAME] = @NAME,
		[Approved] = @Approved
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubstancesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubstancesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_SubstancesInsert]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubstancesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubstancesInsert];
GO

CREATE PROCEDURE [proc_SubstancesInsert]
(
	@ID int = NULL output,
	@NAME nvarchar(500) = NULL,
	@Approved bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Substances]
	(
		[NAME],
		[Approved]
	)
	VALUES
	(
		@NAME,
		@Approved
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubstancesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubstancesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SubstancesDelete]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SubstancesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SubstancesDelete];
GO

CREATE PROCEDURE [proc_SubstancesDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Substances]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SubstancesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SubstancesDelete Error on Creation'
GO
