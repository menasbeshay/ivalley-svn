
/****** Object:  StoredProcedure [proc_Dosage_formLoadByPrimaryKey]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Dosage_formLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Dosage_formLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_Dosage_formLoadByPrimaryKey]
(
	@DosageFormID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DosageFormID],
		[Dosage_form_code],
		[Dosage_form]
	FROM [Dosage_form]
	WHERE
		([DosageFormID] = @DosageFormID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Dosage_formLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_Dosage_formLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Dosage_formLoadAll]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Dosage_formLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Dosage_formLoadAll];
GO

CREATE PROCEDURE [proc_Dosage_formLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DosageFormID],
		[Dosage_form_code],
		[Dosage_form]
	FROM [Dosage_form]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Dosage_formLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_Dosage_formLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Dosage_formUpdate]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Dosage_formUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Dosage_formUpdate];
GO

CREATE PROCEDURE [proc_Dosage_formUpdate]
(
	@DosageFormID int,
	@Dosage_form_code nvarchar(255) = NULL,
	@Dosage_form nvarchar(255) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Dosage_form]
	SET
		[Dosage_form_code] = @Dosage_form_code,
		[Dosage_form] = @Dosage_form
	WHERE
		[DosageFormID] = @DosageFormID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Dosage_formUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_Dosage_formUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_Dosage_formInsert]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Dosage_formInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Dosage_formInsert];
GO

CREATE PROCEDURE [proc_Dosage_formInsert]
(
	@DosageFormID int = NULL output,
	@Dosage_form_code nvarchar(255) = NULL,
	@Dosage_form nvarchar(255) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Dosage_form]
	(
		[Dosage_form_code],
		[Dosage_form]
	)
	VALUES
	(
		@Dosage_form_code,
		@Dosage_form
	)

	SET @Err = @@Error

	SELECT @DosageFormID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Dosage_formInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_Dosage_formInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Dosage_formDelete]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Dosage_formDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Dosage_formDelete];
GO

CREATE PROCEDURE [proc_Dosage_formDelete]
(
	@DosageFormID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Dosage_form]
	WHERE
		[DosageFormID] = @DosageFormID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Dosage_formDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_Dosage_formDelete Error on Creation'
GO
