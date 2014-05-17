
/****** Object:  StoredProcedure [proc_Drug_Reguest_SubstancesLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Drug_Reguest_SubstancesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Drug_Reguest_SubstancesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_Drug_Reguest_SubstancesLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[DRUG_REQUEST_ID],
		[SUBSTANCE_ID],
		[TYPE],
		[SubstancesReferenceID],
		[Approved]
	FROM [Drug_Reguest_Substances]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Drug_Reguest_SubstancesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_Drug_Reguest_SubstancesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Drug_Reguest_SubstancesLoadAll]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Drug_Reguest_SubstancesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Drug_Reguest_SubstancesLoadAll];
GO

CREATE PROCEDURE [proc_Drug_Reguest_SubstancesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[DRUG_REQUEST_ID],
		[SUBSTANCE_ID],
		[TYPE],
		[SubstancesReferenceID],
		[Approved]
	FROM [Drug_Reguest_Substances]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Drug_Reguest_SubstancesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_Drug_Reguest_SubstancesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Drug_Reguest_SubstancesUpdate]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Drug_Reguest_SubstancesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Drug_Reguest_SubstancesUpdate];
GO

CREATE PROCEDURE [proc_Drug_Reguest_SubstancesUpdate]
(
	@ID int,
	@DRUG_REQUEST_ID int = NULL,
	@SUBSTANCE_ID int = NULL,
	@TYPE nvarchar(255) = NULL,
	@SubstancesReferenceID int = NULL,
	@Approved bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Drug_Reguest_Substances]
	SET
		[DRUG_REQUEST_ID] = @DRUG_REQUEST_ID,
		[SUBSTANCE_ID] = @SUBSTANCE_ID,
		[TYPE] = @TYPE,
		[SubstancesReferenceID] = @SubstancesReferenceID,
		[Approved] = @Approved
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Drug_Reguest_SubstancesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_Drug_Reguest_SubstancesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_Drug_Reguest_SubstancesInsert]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Drug_Reguest_SubstancesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Drug_Reguest_SubstancesInsert];
GO

CREATE PROCEDURE [proc_Drug_Reguest_SubstancesInsert]
(
	@ID int = NULL output,
	@DRUG_REQUEST_ID int = NULL,
	@SUBSTANCE_ID int = NULL,
	@TYPE nvarchar(255) = NULL,
	@SubstancesReferenceID int = NULL,
	@Approved bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Drug_Reguest_Substances]
	(
		[DRUG_REQUEST_ID],
		[SUBSTANCE_ID],
		[TYPE],
		[SubstancesReferenceID],
		[Approved]
	)
	VALUES
	(
		@DRUG_REQUEST_ID,
		@SUBSTANCE_ID,
		@TYPE,
		@SubstancesReferenceID,
		@Approved
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Drug_Reguest_SubstancesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_Drug_Reguest_SubstancesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Drug_Reguest_SubstancesDelete]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Drug_Reguest_SubstancesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Drug_Reguest_SubstancesDelete];
GO

CREATE PROCEDURE [proc_Drug_Reguest_SubstancesDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Drug_Reguest_Substances]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Drug_Reguest_SubstancesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_Drug_Reguest_SubstancesDelete Error on Creation'
GO
