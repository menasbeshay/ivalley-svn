
/****** Object:  StoredProcedure [proc_SUBSTANCE_SUPPLIERLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SUBSTANCE_SUPPLIERLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SUBSTANCE_SUPPLIERLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_SUBSTANCE_SUPPLIERLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[DRUG_REQUEST_SUBSTANCE_ID],
		[UNIT_ID],
		[QUANTITY],
		[EQUI_NAME_SUBSTANCE],
		[EQUI_QUANTITY],
		[EQUI_UNIT],
		[OVER_QUANTITY],
		[OVER_UNIT_ID],
		[OVER_EQUI_QUANTITY],
		[OVER_EQUI_UNIT],
		[SPECIFICATION],
		[FUNCTION_],
		[EQUE_SPECIFICATION],
		[EQUE_FUNCTION],
		[PHONE],
		[FAX],
		[EMAIL],
		[ADDRESS],
		[MANUFACTURE],
		[INSPECTED_FOR_GMP],
		[PHONE_EQ],
		[EMAIL_EQ],
		[ADDRESS_EQ],
		[MANUFACTURE_EQ],
		[FAX_EQ],
		[INSPECTED_FOR_GMP_EQ],
		[Equiv_Substance_ID]
	FROM [SUBSTANCE_SUPPLIER]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SUBSTANCE_SUPPLIERLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SUBSTANCE_SUPPLIERLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SUBSTANCE_SUPPLIERLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SUBSTANCE_SUPPLIERLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SUBSTANCE_SUPPLIERLoadAll];
GO

CREATE PROCEDURE [proc_SUBSTANCE_SUPPLIERLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[DRUG_REQUEST_SUBSTANCE_ID],
		[UNIT_ID],
		[QUANTITY],
		[EQUI_NAME_SUBSTANCE],
		[EQUI_QUANTITY],
		[EQUI_UNIT],
		[OVER_QUANTITY],
		[OVER_UNIT_ID],
		[OVER_EQUI_QUANTITY],
		[OVER_EQUI_UNIT],
		[SPECIFICATION],
		[FUNCTION_],
		[EQUE_SPECIFICATION],
		[EQUE_FUNCTION],
		[PHONE],
		[FAX],
		[EMAIL],
		[ADDRESS],
		[MANUFACTURE],
		[INSPECTED_FOR_GMP],
		[PHONE_EQ],
		[EMAIL_EQ],
		[ADDRESS_EQ],
		[MANUFACTURE_EQ],
		[FAX_EQ],
		[INSPECTED_FOR_GMP_EQ],
		[Equiv_Substance_ID]
	FROM [SUBSTANCE_SUPPLIER]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SUBSTANCE_SUPPLIERLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SUBSTANCE_SUPPLIERLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SUBSTANCE_SUPPLIERUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SUBSTANCE_SUPPLIERUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SUBSTANCE_SUPPLIERUpdate];
GO

CREATE PROCEDURE [proc_SUBSTANCE_SUPPLIERUpdate]
(
	@ID int,
	@DRUG_REQUEST_SUBSTANCE_ID int = NULL,
	@UNIT_ID int = NULL,
	@QUANTITY float = NULL,
	@EQUI_NAME_SUBSTANCE int = NULL,
	@EQUI_QUANTITY float = NULL,
	@EQUI_UNIT int = NULL,
	@OVER_QUANTITY float = NULL,
	@OVER_UNIT_ID int = NULL,
	@OVER_EQUI_QUANTITY float = NULL,
	@OVER_EQUI_UNIT int = NULL,
	@SPECIFICATION nvarchar(255) = NULL,
	@FUNCTION_ nvarchar(255) = NULL,
	@EQUE_SPECIFICATION nvarchar(255) = NULL,
	@EQUE_FUNCTION nvarchar(255) = NULL,
	@PHONE nvarchar(255) = NULL,
	@FAX nvarchar(255) = NULL,
	@EMAIL nvarchar(255) = NULL,
	@ADDRESS nvarchar(255) = NULL,
	@MANUFACTURE nvarchar(255) = NULL,
	@INSPECTED_FOR_GMP float = NULL,
	@PHONE_EQ nvarchar(255) = NULL,
	@EMAIL_EQ nvarchar(255) = NULL,
	@ADDRESS_EQ nvarchar(255) = NULL,
	@MANUFACTURE_EQ nvarchar(255) = NULL,
	@FAX_EQ nvarchar(255) = NULL,
	@INSPECTED_FOR_GMP_EQ float = NULL,
	@Equiv_Substance_ID float = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [SUBSTANCE_SUPPLIER]
	SET
		[DRUG_REQUEST_SUBSTANCE_ID] = @DRUG_REQUEST_SUBSTANCE_ID,
		[UNIT_ID] = @UNIT_ID,
		[QUANTITY] = @QUANTITY,
		[EQUI_NAME_SUBSTANCE] = @EQUI_NAME_SUBSTANCE,
		[EQUI_QUANTITY] = @EQUI_QUANTITY,
		[EQUI_UNIT] = @EQUI_UNIT,
		[OVER_QUANTITY] = @OVER_QUANTITY,
		[OVER_UNIT_ID] = @OVER_UNIT_ID,
		[OVER_EQUI_QUANTITY] = @OVER_EQUI_QUANTITY,
		[OVER_EQUI_UNIT] = @OVER_EQUI_UNIT,
		[SPECIFICATION] = @SPECIFICATION,
		[FUNCTION_] = @FUNCTION_,
		[EQUE_SPECIFICATION] = @EQUE_SPECIFICATION,
		[EQUE_FUNCTION] = @EQUE_FUNCTION,
		[PHONE] = @PHONE,
		[FAX] = @FAX,
		[EMAIL] = @EMAIL,
		[ADDRESS] = @ADDRESS,
		[MANUFACTURE] = @MANUFACTURE,
		[INSPECTED_FOR_GMP] = @INSPECTED_FOR_GMP,
		[PHONE_EQ] = @PHONE_EQ,
		[EMAIL_EQ] = @EMAIL_EQ,
		[ADDRESS_EQ] = @ADDRESS_EQ,
		[MANUFACTURE_EQ] = @MANUFACTURE_EQ,
		[FAX_EQ] = @FAX_EQ,
		[INSPECTED_FOR_GMP_EQ] = @INSPECTED_FOR_GMP_EQ,
		[Equiv_Substance_ID] = @Equiv_Substance_ID
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SUBSTANCE_SUPPLIERUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SUBSTANCE_SUPPLIERUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_SUBSTANCE_SUPPLIERInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SUBSTANCE_SUPPLIERInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SUBSTANCE_SUPPLIERInsert];
GO

CREATE PROCEDURE [proc_SUBSTANCE_SUPPLIERInsert]
(
	@ID int = NULL output,
	@DRUG_REQUEST_SUBSTANCE_ID int = NULL,
	@UNIT_ID int = NULL,
	@QUANTITY float = NULL,
	@EQUI_NAME_SUBSTANCE int = NULL,
	@EQUI_QUANTITY float = NULL,
	@EQUI_UNIT int = NULL,
	@OVER_QUANTITY float = NULL,
	@OVER_UNIT_ID int = NULL,
	@OVER_EQUI_QUANTITY float = NULL,
	@OVER_EQUI_UNIT int = NULL,
	@SPECIFICATION nvarchar(255) = NULL,
	@FUNCTION_ nvarchar(255) = NULL,
	@EQUE_SPECIFICATION nvarchar(255) = NULL,
	@EQUE_FUNCTION nvarchar(255) = NULL,
	@PHONE nvarchar(255) = NULL,
	@FAX nvarchar(255) = NULL,
	@EMAIL nvarchar(255) = NULL,
	@ADDRESS nvarchar(255) = NULL,
	@MANUFACTURE nvarchar(255) = NULL,
	@INSPECTED_FOR_GMP float = NULL,
	@PHONE_EQ nvarchar(255) = NULL,
	@EMAIL_EQ nvarchar(255) = NULL,
	@ADDRESS_EQ nvarchar(255) = NULL,
	@MANUFACTURE_EQ nvarchar(255) = NULL,
	@FAX_EQ nvarchar(255) = NULL,
	@INSPECTED_FOR_GMP_EQ float = NULL,
	@Equiv_Substance_ID float = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [SUBSTANCE_SUPPLIER]
	(
		[DRUG_REQUEST_SUBSTANCE_ID],
		[UNIT_ID],
		[QUANTITY],
		[EQUI_NAME_SUBSTANCE],
		[EQUI_QUANTITY],
		[EQUI_UNIT],
		[OVER_QUANTITY],
		[OVER_UNIT_ID],
		[OVER_EQUI_QUANTITY],
		[OVER_EQUI_UNIT],
		[SPECIFICATION],
		[FUNCTION_],
		[EQUE_SPECIFICATION],
		[EQUE_FUNCTION],
		[PHONE],
		[FAX],
		[EMAIL],
		[ADDRESS],
		[MANUFACTURE],
		[INSPECTED_FOR_GMP],
		[PHONE_EQ],
		[EMAIL_EQ],
		[ADDRESS_EQ],
		[MANUFACTURE_EQ],
		[FAX_EQ],
		[INSPECTED_FOR_GMP_EQ],
		[Equiv_Substance_ID]
	)
	VALUES
	(
		@DRUG_REQUEST_SUBSTANCE_ID,
		@UNIT_ID,
		@QUANTITY,
		@EQUI_NAME_SUBSTANCE,
		@EQUI_QUANTITY,
		@EQUI_UNIT,
		@OVER_QUANTITY,
		@OVER_UNIT_ID,
		@OVER_EQUI_QUANTITY,
		@OVER_EQUI_UNIT,
		@SPECIFICATION,
		@FUNCTION_,
		@EQUE_SPECIFICATION,
		@EQUE_FUNCTION,
		@PHONE,
		@FAX,
		@EMAIL,
		@ADDRESS,
		@MANUFACTURE,
		@INSPECTED_FOR_GMP,
		@PHONE_EQ,
		@EMAIL_EQ,
		@ADDRESS_EQ,
		@MANUFACTURE_EQ,
		@FAX_EQ,
		@INSPECTED_FOR_GMP_EQ,
		@Equiv_Substance_ID
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SUBSTANCE_SUPPLIERInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SUBSTANCE_SUPPLIERInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SUBSTANCE_SUPPLIERDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SUBSTANCE_SUPPLIERDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SUBSTANCE_SUPPLIERDelete];
GO

CREATE PROCEDURE [proc_SUBSTANCE_SUPPLIERDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [SUBSTANCE_SUPPLIER]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SUBSTANCE_SUPPLIERDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SUBSTANCE_SUPPLIERDelete Error on Creation'
GO
