-- ERROR: Table 'userLogin' must have a primary key

USE [PricingAppointment]
GO

/****** Object:  StoredProcedure [proc_CommitteeDescisionLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteeDescisionLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteeDescisionLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CommitteeDescisionLoadByPrimaryKey]
(
	@CommitteeDescisionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CommitteeDescisionID],
		[DescisionText],
		[Notice]
	FROM [CommitteeDescision]
	WHERE
		([CommitteeDescisionID] = @CommitteeDescisionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteeDescisionLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteeDescisionLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CommitteeDescisionLoadAll]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteeDescisionLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteeDescisionLoadAll];
GO

CREATE PROCEDURE [proc_CommitteeDescisionLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CommitteeDescisionID],
		[DescisionText],
		[Notice]
	FROM [CommitteeDescision]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteeDescisionLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteeDescisionLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CommitteeDescisionUpdate]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteeDescisionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteeDescisionUpdate];
GO

CREATE PROCEDURE [proc_CommitteeDescisionUpdate]
(
	@CommitteeDescisionID int,
	@DescisionText nvarchar(450) = NULL,
	@Notice nvarchar(1500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CommitteeDescision]
	SET
		[DescisionText] = @DescisionText,
		[Notice] = @Notice
	WHERE
		[CommitteeDescisionID] = @CommitteeDescisionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteeDescisionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteeDescisionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CommitteeDescisionInsert]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteeDescisionInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteeDescisionInsert];
GO

CREATE PROCEDURE [proc_CommitteeDescisionInsert]
(
	@CommitteeDescisionID int = NULL output,
	@DescisionText nvarchar(450) = NULL,
	@Notice nvarchar(1500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CommitteeDescision]
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

	SELECT @CommitteeDescisionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteeDescisionInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteeDescisionInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CommitteeDescisionDelete]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteeDescisionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteeDescisionDelete];
GO

CREATE PROCEDURE [proc_CommitteeDescisionDelete]
(
	@CommitteeDescisionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CommitteeDescision]
	WHERE
		[CommitteeDescisionID] = @CommitteeDescisionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteeDescisionDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteeDescisionDelete Error on Creation'
GO

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

/****** Object:  StoredProcedure [proc_CompaniesLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompaniesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompaniesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CompaniesLoadByPrimaryKey]
(
	@CompanyID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CompanyID],
		[Login_Code],
		[Login_Password],
		[CompNameEng],
		[CompNameAr],
		[Comp_Code],
		[OLD_EMAIL],
		[Doctor_Name],
		[New_Email],
		[Phone_Number],
		[Doctor_Name_2],
		[New_Email_2],
		[Phone_Number2],
		[checked]
	FROM [Companies]
	WHERE
		([CompanyID] = @CompanyID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompaniesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompaniesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CompaniesLoadAll]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompaniesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompaniesLoadAll];
GO

CREATE PROCEDURE [proc_CompaniesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CompanyID],
		[Login_Code],
		[Login_Password],
		[CompNameEng],
		[CompNameAr],
		[Comp_Code],
		[OLD_EMAIL],
		[Doctor_Name],
		[New_Email],
		[Phone_Number],
		[Doctor_Name_2],
		[New_Email_2],
		[Phone_Number2],
		[checked]
	FROM [Companies]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompaniesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompaniesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CompaniesUpdate]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompaniesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompaniesUpdate];
GO

CREATE PROCEDURE [proc_CompaniesUpdate]
(
	@CompanyID int,
	@Login_Code nvarchar(50) = NULL,
	@Login_Password nvarchar(50) = NULL,
	@CompNameEng nvarchar(255) = NULL,
	@CompNameAr nvarchar(255) = NULL,
	@Comp_Code nvarchar(255) = NULL,
	@OLD_EMAIL nvarchar(255) = NULL,
	@Doctor_Name nvarchar(255) = NULL,
	@New_Email nvarchar(255) = NULL,
	@Phone_Number nvarchar(255) = NULL,
	@Doctor_Name_2 nvarchar(255) = NULL,
	@New_Email_2 nvarchar(255) = NULL,
	@Phone_Number2 nvarchar(255) = NULL,
	@checked bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Companies]
	SET
		[Login_Code] = @Login_Code,
		[Login_Password] = @Login_Password,
		[CompNameEng] = @CompNameEng,
		[CompNameAr] = @CompNameAr,
		[Comp_Code] = @Comp_Code,
		[OLD_EMAIL] = @OLD_EMAIL,
		[Doctor_Name] = @Doctor_Name,
		[New_Email] = @New_Email,
		[Phone_Number] = @Phone_Number,
		[Doctor_Name_2] = @Doctor_Name_2,
		[New_Email_2] = @New_Email_2,
		[Phone_Number2] = @Phone_Number2,
		[checked] = @checked
	WHERE
		[CompanyID] = @CompanyID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompaniesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompaniesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CompaniesInsert]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompaniesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompaniesInsert];
GO

CREATE PROCEDURE [proc_CompaniesInsert]
(
	@CompanyID int = NULL output,
	@Login_Code nvarchar(50) = NULL,
	@Login_Password nvarchar(50) = NULL,
	@CompNameEng nvarchar(255) = NULL,
	@CompNameAr nvarchar(255) = NULL,
	@Comp_Code nvarchar(255) = NULL,
	@OLD_EMAIL nvarchar(255) = NULL,
	@Doctor_Name nvarchar(255) = NULL,
	@New_Email nvarchar(255) = NULL,
	@Phone_Number nvarchar(255) = NULL,
	@Doctor_Name_2 nvarchar(255) = NULL,
	@New_Email_2 nvarchar(255) = NULL,
	@Phone_Number2 nvarchar(255) = NULL,
	@checked bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Companies]
	(
		[Login_Code],
		[Login_Password],
		[CompNameEng],
		[CompNameAr],
		[Comp_Code],
		[OLD_EMAIL],
		[Doctor_Name],
		[New_Email],
		[Phone_Number],
		[Doctor_Name_2],
		[New_Email_2],
		[Phone_Number2],
		[checked]
	)
	VALUES
	(
		@Login_Code,
		@Login_Password,
		@CompNameEng,
		@CompNameAr,
		@Comp_Code,
		@OLD_EMAIL,
		@Doctor_Name,
		@New_Email,
		@Phone_Number,
		@Doctor_Name_2,
		@New_Email_2,
		@Phone_Number2,
		@checked
	)

	SET @Err = @@Error

	SELECT @CompanyID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompaniesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompaniesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CompaniesDelete]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompaniesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompaniesDelete];
GO

CREATE PROCEDURE [proc_CompaniesDelete]
(
	@CompanyID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Companies]
	WHERE
		[CompanyID] = @CompanyID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompaniesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompaniesDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CompanyDescisionLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:56 PM ******/
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

/****** Object:  StoredProcedure [proc_CompanyDescisionLoadAll]    Script Date: 5/17/2014 5:05:56 PM ******/
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

/****** Object:  StoredProcedure [proc_CompanyDescisionUpdate]    Script Date: 5/17/2014 5:05:56 PM ******/
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




/****** Object:  StoredProcedure [proc_CompanyDescisionInsert]    Script Date: 5/17/2014 5:05:56 PM ******/
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

/****** Object:  StoredProcedure [proc_CompanyDescisionDelete]    Script Date: 5/17/2014 5:05:56 PM ******/
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

/****** Object:  StoredProcedure [proc_Dosage_formLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:56 PM ******/
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

/****** Object:  StoredProcedure [proc_Dosage_formLoadAll]    Script Date: 5/17/2014 5:05:56 PM ******/
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

/****** Object:  StoredProcedure [proc_Dosage_formUpdate]    Script Date: 5/17/2014 5:05:56 PM ******/
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




/****** Object:  StoredProcedure [proc_Dosage_formInsert]    Script Date: 5/17/2014 5:05:56 PM ******/
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

/****** Object:  StoredProcedure [proc_Dosage_formDelete]    Script Date: 5/17/2014 5:05:56 PM ******/
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

/****** Object:  StoredProcedure [proc_FileTypeLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FileTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FileTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_FileTypeLoadByPrimaryKey]
(
	@FileTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[FileTypeID],
		[FileType]
	FROM [FileType]
	WHERE
		([FileTypeID] = @FileTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FileTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_FileTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FileTypeLoadAll]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FileTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FileTypeLoadAll];
GO

CREATE PROCEDURE [proc_FileTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[FileTypeID],
		[FileType]
	FROM [FileType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FileTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_FileTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FileTypeUpdate]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FileTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FileTypeUpdate];
GO

CREATE PROCEDURE [proc_FileTypeUpdate]
(
	@FileTypeID int,
	@FileType nvarchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [FileType]
	SET
		[FileType] = @FileType
	WHERE
		[FileTypeID] = @FileTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FileTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_FileTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_FileTypeInsert]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FileTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FileTypeInsert];
GO

CREATE PROCEDURE [proc_FileTypeInsert]
(
	@FileTypeID int = NULL output,
	@FileType nvarchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [FileType]
	(
		[FileType]
	)
	VALUES
	(
		@FileType
	)

	SET @Err = @@Error

	SELECT @FileTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FileTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_FileTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FileTypeDelete]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FileTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FileTypeDelete];
GO

CREATE PROCEDURE [proc_FileTypeDelete]
(
	@FileTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [FileType]
	WHERE
		[FileTypeID] = @FileTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FileTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_FileTypeDelete Error on Creation'
GO

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

/****** Object:  StoredProcedure [proc_MailTemplatesLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MailTemplatesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MailTemplatesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MailTemplatesLoadByPrimaryKey]
(
	@MailTemplateID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MailTemplateID],
		[PricingStatusID],
		[TemplateText],
		[MailSubject]
	FROM [MailTemplates]
	WHERE
		([MailTemplateID] = @MailTemplateID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MailTemplatesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MailTemplatesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MailTemplatesLoadAll]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MailTemplatesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MailTemplatesLoadAll];
GO

CREATE PROCEDURE [proc_MailTemplatesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MailTemplateID],
		[PricingStatusID],
		[TemplateText],
		[MailSubject]
	FROM [MailTemplates]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MailTemplatesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MailTemplatesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MailTemplatesUpdate]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MailTemplatesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MailTemplatesUpdate];
GO

CREATE PROCEDURE [proc_MailTemplatesUpdate]
(
	@MailTemplateID int,
	@PricingStatusID int = NULL,
	@TemplateText text = NULL,
	@MailSubject nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MailTemplates]
	SET
		[PricingStatusID] = @PricingStatusID,
		[TemplateText] = @TemplateText,
		[MailSubject] = @MailSubject
	WHERE
		[MailTemplateID] = @MailTemplateID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MailTemplatesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MailTemplatesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MailTemplatesInsert]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MailTemplatesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MailTemplatesInsert];
GO

CREATE PROCEDURE [proc_MailTemplatesInsert]
(
	@MailTemplateID int = NULL output,
	@PricingStatusID int = NULL,
	@TemplateText text = NULL,
	@MailSubject nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MailTemplates]
	(
		[PricingStatusID],
		[TemplateText],
		[MailSubject]
	)
	VALUES
	(
		@PricingStatusID,
		@TemplateText,
		@MailSubject
	)

	SET @Err = @@Error

	SELECT @MailTemplateID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MailTemplatesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MailTemplatesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MailTemplatesDelete]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MailTemplatesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MailTemplatesDelete];
GO

CREATE PROCEDURE [proc_MailTemplatesDelete]
(
	@MailTemplateID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MailTemplates]
	WHERE
		[MailTemplateID] = @MailTemplateID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MailTemplatesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MailTemplatesDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_NotificationsLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_NotificationsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_NotificationsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_NotificationsLoadByPrimaryKey]
(
	@NotificationID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[NotificationID],
		[NotifierID],
		[NotificationText],
		[FilePath],
		[Subject],
		[CompanyID],
		[NotifyDate]
	FROM [Notifications]
	WHERE
		([NotificationID] = @NotificationID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_NotificationsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_NotificationsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_NotificationsLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_NotificationsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_NotificationsLoadAll];
GO

CREATE PROCEDURE [proc_NotificationsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[NotificationID],
		[NotifierID],
		[NotificationText],
		[FilePath],
		[Subject],
		[CompanyID],
		[NotifyDate]
	FROM [Notifications]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_NotificationsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_NotificationsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_NotificationsUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_NotificationsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_NotificationsUpdate];
GO

CREATE PROCEDURE [proc_NotificationsUpdate]
(
	@NotificationID int,
	@NotifierID int = NULL,
	@NotificationText nvarchar(2500) = NULL,
	@FilePath nvarchar(250) = NULL,
	@Subject nvarchar(250) = NULL,
	@CompanyID int = NULL,
	@NotifyDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Notifications]
	SET
		[NotifierID] = @NotifierID,
		[NotificationText] = @NotificationText,
		[FilePath] = @FilePath,
		[Subject] = @Subject,
		[CompanyID] = @CompanyID,
		[NotifyDate] = @NotifyDate
	WHERE
		[NotificationID] = @NotificationID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_NotificationsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_NotificationsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_NotificationsInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_NotificationsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_NotificationsInsert];
GO

CREATE PROCEDURE [proc_NotificationsInsert]
(
	@NotificationID int = NULL output,
	@NotifierID int = NULL,
	@NotificationText nvarchar(2500) = NULL,
	@FilePath nvarchar(250) = NULL,
	@Subject nvarchar(250) = NULL,
	@CompanyID int = NULL,
	@NotifyDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Notifications]
	(
		[NotifierID],
		[NotificationText],
		[FilePath],
		[Subject],
		[CompanyID],
		[NotifyDate]
	)
	VALUES
	(
		@NotifierID,
		@NotificationText,
		@FilePath,
		@Subject,
		@CompanyID,
		@NotifyDate
	)

	SET @Err = @@Error

	SELECT @NotificationID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_NotificationsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_NotificationsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_NotificationsDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_NotificationsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_NotificationsDelete];
GO

CREATE PROCEDURE [proc_NotificationsDelete]
(
	@NotificationID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Notifications]
	WHERE
		[NotificationID] = @NotificationID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_NotificationsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_NotificationsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PricingStatusLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PricingStatusLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PricingStatusLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PricingStatusLoadByPrimaryKey]
(
	@PricingStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PricingStatusID],
		[Status],
		[Description]
	FROM [PricingStatus]
	WHERE
		([PricingStatusID] = @PricingStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PricingStatusLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PricingStatusLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PricingStatusLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PricingStatusLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PricingStatusLoadAll];
GO

CREATE PROCEDURE [proc_PricingStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PricingStatusID],
		[Status],
		[Description]
	FROM [PricingStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PricingStatusLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PricingStatusLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PricingStatusUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PricingStatusUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PricingStatusUpdate];
GO

CREATE PROCEDURE [proc_PricingStatusUpdate]
(
	@PricingStatusID int,
	@Status nvarchar(50) = NULL,
	@Description nvarchar(250) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PricingStatus]
	SET
		[Status] = @Status,
		[Description] = @Description
	WHERE
		[PricingStatusID] = @PricingStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PricingStatusUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PricingStatusUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PricingStatusInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PricingStatusInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PricingStatusInsert];
GO

CREATE PROCEDURE [proc_PricingStatusInsert]
(
	@PricingStatusID int = NULL output,
	@Status nvarchar(50) = NULL,
	@Description nvarchar(250) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PricingStatus]
	(
		[Status],
		[Description]
	)
	VALUES
	(
		@Status,
		@Description
	)

	SET @Err = @@Error

	SELECT @PricingStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PricingStatusInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PricingStatusInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PricingStatusDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PricingStatusDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PricingStatusDelete];
GO

CREATE PROCEDURE [proc_PricingStatusDelete]
(
	@PricingStatusID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PricingStatus]
	WHERE
		[PricingStatusID] = @PricingStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PricingStatusDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PricingStatusDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Registeration_Committee_TypeLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Registeration_Committee_TypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Registeration_Committee_TypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_Registeration_Committee_TypeLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[CommitteType],
		[Details],
		[Description]
	FROM [Registeration_Committee_Type]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Registeration_Committee_TypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_Registeration_Committee_TypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Registeration_Committee_TypeLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Registeration_Committee_TypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Registeration_Committee_TypeLoadAll];
GO

CREATE PROCEDURE [proc_Registeration_Committee_TypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[CommitteType],
		[Details],
		[Description]
	FROM [Registeration_Committee_Type]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Registeration_Committee_TypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_Registeration_Committee_TypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Registeration_Committee_TypeUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Registeration_Committee_TypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Registeration_Committee_TypeUpdate];
GO

CREATE PROCEDURE [proc_Registeration_Committee_TypeUpdate]
(
	@ID int,
	@CommitteType nvarchar(255) = NULL,
	@Details int = NULL,
	@Description nvarchar(255) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Registeration_Committee_Type]
	SET
		[CommitteType] = @CommitteType,
		[Details] = @Details,
		[Description] = @Description
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Registeration_Committee_TypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_Registeration_Committee_TypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_Registeration_Committee_TypeInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Registeration_Committee_TypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Registeration_Committee_TypeInsert];
GO

CREATE PROCEDURE [proc_Registeration_Committee_TypeInsert]
(
	@ID int = NULL output,
	@CommitteType nvarchar(255) = NULL,
	@Details int = NULL,
	@Description nvarchar(255) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Registeration_Committee_Type]
	(
		[CommitteType],
		[Details],
		[Description]
	)
	VALUES
	(
		@CommitteType,
		@Details,
		@Description
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Registeration_Committee_TypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_Registeration_Committee_TypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Registeration_Committee_TypeDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Registeration_Committee_TypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Registeration_Committee_TypeDelete];
GO

CREATE PROCEDURE [proc_Registeration_Committee_TypeDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Registeration_Committee_Type]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Registeration_Committee_TypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_Registeration_Committee_TypeDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_StatusHistoryLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_StatusHistoryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_StatusHistoryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_StatusHistoryLoadByPrimaryKey]
(
	@StatusHistoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[StatusHistoryID],
		[TradePricingID],
		[CommitteeTypeID],
		[CommitteeDescisionID],
		[CompanyDescisionID],
		[PricingStatusID],
		[CommitteDate],
		[CurrentPrice],
		[Comment],
		[AttachementPath]
	FROM [StatusHistory]
	WHERE
		([StatusHistoryID] = @StatusHistoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_StatusHistoryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_StatusHistoryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_StatusHistoryLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_StatusHistoryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_StatusHistoryLoadAll];
GO

CREATE PROCEDURE [proc_StatusHistoryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[StatusHistoryID],
		[TradePricingID],
		[CommitteeTypeID],
		[CommitteeDescisionID],
		[CompanyDescisionID],
		[PricingStatusID],
		[CommitteDate],
		[CurrentPrice],
		[Comment],
		[AttachementPath]
	FROM [StatusHistory]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_StatusHistoryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_StatusHistoryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_StatusHistoryUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_StatusHistoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_StatusHistoryUpdate];
GO

CREATE PROCEDURE [proc_StatusHistoryUpdate]
(
	@StatusHistoryID int,
	@TradePricingID int = NULL,
	@CommitteeTypeID int = NULL,
	@CommitteeDescisionID int = NULL,
	@CompanyDescisionID int = NULL,
	@PricingStatusID int = NULL,
	@CommitteDate datetime = NULL,
	@CurrentPrice float = NULL,
	@Comment nvarchar(2500) = NULL,
	@AttachementPath nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [StatusHistory]
	SET
		[TradePricingID] = @TradePricingID,
		[CommitteeTypeID] = @CommitteeTypeID,
		[CommitteeDescisionID] = @CommitteeDescisionID,
		[CompanyDescisionID] = @CompanyDescisionID,
		[PricingStatusID] = @PricingStatusID,
		[CommitteDate] = @CommitteDate,
		[CurrentPrice] = @CurrentPrice,
		[Comment] = @Comment,
		[AttachementPath] = @AttachementPath
	WHERE
		[StatusHistoryID] = @StatusHistoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_StatusHistoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_StatusHistoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_StatusHistoryInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_StatusHistoryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_StatusHistoryInsert];
GO

CREATE PROCEDURE [proc_StatusHistoryInsert]
(
	@StatusHistoryID int = NULL output,
	@TradePricingID int = NULL,
	@CommitteeTypeID int = NULL,
	@CommitteeDescisionID int = NULL,
	@CompanyDescisionID int = NULL,
	@PricingStatusID int = NULL,
	@CommitteDate datetime = NULL,
	@CurrentPrice float = NULL,
	@Comment nvarchar(2500) = NULL,
	@AttachementPath nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [StatusHistory]
	(
		[TradePricingID],
		[CommitteeTypeID],
		[CommitteeDescisionID],
		[CompanyDescisionID],
		[PricingStatusID],
		[CommitteDate],
		[CurrentPrice],
		[Comment],
		[AttachementPath]
	)
	VALUES
	(
		@TradePricingID,
		@CommitteeTypeID,
		@CommitteeDescisionID,
		@CompanyDescisionID,
		@PricingStatusID,
		@CommitteDate,
		@CurrentPrice,
		@Comment,
		@AttachementPath
	)

	SET @Err = @@Error

	SELECT @StatusHistoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_StatusHistoryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_StatusHistoryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_StatusHistoryDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_StatusHistoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_StatusHistoryDelete];
GO

CREATE PROCEDURE [proc_StatusHistoryDelete]
(
	@StatusHistoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [StatusHistory]
	WHERE
		[StatusHistoryID] = @StatusHistoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_StatusHistoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_StatusHistoryDelete Error on Creation'
GO

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

/****** Object:  StoredProcedure [proc_SubstancesLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
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

/****** Object:  StoredProcedure [proc_SubstancesLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
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

/****** Object:  StoredProcedure [proc_SubstancesUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
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




/****** Object:  StoredProcedure [proc_SubstancesInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
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

/****** Object:  StoredProcedure [proc_SubstancesDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
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

/****** Object:  StoredProcedure [proc_SubstancesReferenceLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
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

/****** Object:  StoredProcedure [proc_SubstancesReferenceLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
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

/****** Object:  StoredProcedure [proc_SubstancesReferenceUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
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




/****** Object:  StoredProcedure [proc_SubstancesReferenceInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
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

/****** Object:  StoredProcedure [proc_SubstancesReferenceDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
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

/****** Object:  StoredProcedure [proc_TicketHistoryLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketHistoryLoadByPrimaryKey]
(
	@TicketHistoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketHistoryID],
		[TicketID],
		[ResponseText],
		[ResponseDate],
		[CAPA_ResponderID],
		[TicketStatusID]
	FROM [TicketHistory]
	WHERE
		([TicketHistoryID] = @TicketHistoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryLoadAll];
GO

CREATE PROCEDURE [proc_TicketHistoryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketHistoryID],
		[TicketID],
		[ResponseText],
		[ResponseDate],
		[CAPA_ResponderID],
		[TicketStatusID]
	FROM [TicketHistory]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryUpdate];
GO

CREATE PROCEDURE [proc_TicketHistoryUpdate]
(
	@TicketHistoryID int,
	@TicketID int = NULL,
	@ResponseText nvarchar(500) = NULL,
	@ResponseDate datetime = NULL,
	@CAPA_ResponderID int = NULL,
	@TicketStatusID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TicketHistory]
	SET
		[TicketID] = @TicketID,
		[ResponseText] = @ResponseText,
		[ResponseDate] = @ResponseDate,
		[CAPA_ResponderID] = @CAPA_ResponderID,
		[TicketStatusID] = @TicketStatusID
	WHERE
		[TicketHistoryID] = @TicketHistoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketHistoryInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryInsert];
GO

CREATE PROCEDURE [proc_TicketHistoryInsert]
(
	@TicketHistoryID int = NULL output,
	@TicketID int = NULL,
	@ResponseText nvarchar(500) = NULL,
	@ResponseDate datetime = NULL,
	@CAPA_ResponderID int = NULL,
	@TicketStatusID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TicketHistory]
	(
		[TicketID],
		[ResponseText],
		[ResponseDate],
		[CAPA_ResponderID],
		[TicketStatusID]
	)
	VALUES
	(
		@TicketID,
		@ResponseText,
		@ResponseDate,
		@CAPA_ResponderID,
		@TicketStatusID
	)

	SET @Err = @@Error

	SELECT @TicketHistoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryDelete];
GO

CREATE PROCEDURE [proc_TicketHistoryDelete]
(
	@TicketHistoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TicketHistory]
	WHERE
		[TicketHistoryID] = @TicketHistoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketsLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketsLoadByPrimaryKey]
(
	@TicketID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketID],
		[TicketTypeID],
		[CompanyID],
		[TradePricingID],
		[CommitteeHistoryID],
		[LastCommitteeDate],
		[LastDescision],
		[CurrentPrice],
		[SuggestedPrice],
		[TextRequest],
		[FileAttachement],
		[InitiateDate],
		[TicketStatusID],
		[TradeName]
	FROM [Tickets]
	WHERE
		([TicketID] = @TicketID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketsLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketsLoadAll];
GO

CREATE PROCEDURE [proc_TicketsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketID],
		[TicketTypeID],
		[CompanyID],
		[TradePricingID],
		[CommitteeHistoryID],
		[LastCommitteeDate],
		[LastDescision],
		[CurrentPrice],
		[SuggestedPrice],
		[TextRequest],
		[FileAttachement],
		[InitiateDate],
		[TicketStatusID],
		[TradeName]
	FROM [Tickets]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketsUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketsUpdate];
GO

CREATE PROCEDURE [proc_TicketsUpdate]
(
	@TicketID int,
	@TicketTypeID int = NULL,
	@CompanyID int = NULL,
	@TradePricingID int = NULL,
	@CommitteeHistoryID int = NULL,
	@LastCommitteeDate datetime = NULL,
	@LastDescision nvarchar(2500) = NULL,
	@CurrentPrice float = NULL,
	@SuggestedPrice float = NULL,
	@TextRequest nvarchar(2500) = NULL,
	@FileAttachement nvarchar(350) = NULL,
	@InitiateDate datetime = NULL,
	@TicketStatusID int = NULL,
	@TradeName nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Tickets]
	SET
		[TicketTypeID] = @TicketTypeID,
		[CompanyID] = @CompanyID,
		[TradePricingID] = @TradePricingID,
		[CommitteeHistoryID] = @CommitteeHistoryID,
		[LastCommitteeDate] = @LastCommitteeDate,
		[LastDescision] = @LastDescision,
		[CurrentPrice] = @CurrentPrice,
		[SuggestedPrice] = @SuggestedPrice,
		[TextRequest] = @TextRequest,
		[FileAttachement] = @FileAttachement,
		[InitiateDate] = @InitiateDate,
		[TicketStatusID] = @TicketStatusID,
		[TradeName] = @TradeName
	WHERE
		[TicketID] = @TicketID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketsInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketsInsert];
GO

CREATE PROCEDURE [proc_TicketsInsert]
(
	@TicketID int = NULL output,
	@TicketTypeID int = NULL,
	@CompanyID int = NULL,
	@TradePricingID int = NULL,
	@CommitteeHistoryID int = NULL,
	@LastCommitteeDate datetime = NULL,
	@LastDescision nvarchar(2500) = NULL,
	@CurrentPrice float = NULL,
	@SuggestedPrice float = NULL,
	@TextRequest nvarchar(2500) = NULL,
	@FileAttachement nvarchar(350) = NULL,
	@InitiateDate datetime = NULL,
	@TicketStatusID int = NULL,
	@TradeName nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Tickets]
	(
		[TicketTypeID],
		[CompanyID],
		[TradePricingID],
		[CommitteeHistoryID],
		[LastCommitteeDate],
		[LastDescision],
		[CurrentPrice],
		[SuggestedPrice],
		[TextRequest],
		[FileAttachement],
		[InitiateDate],
		[TicketStatusID],
		[TradeName]
	)
	VALUES
	(
		@TicketTypeID,
		@CompanyID,
		@TradePricingID,
		@CommitteeHistoryID,
		@LastCommitteeDate,
		@LastDescision,
		@CurrentPrice,
		@SuggestedPrice,
		@TextRequest,
		@FileAttachement,
		@InitiateDate,
		@TicketStatusID,
		@TradeName
	)

	SET @Err = @@Error

	SELECT @TicketID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketsDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketsDelete];
GO

CREATE PROCEDURE [proc_TicketsDelete]
(
	@TicketID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Tickets]
	WHERE
		[TicketID] = @TicketID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketStatusLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketStatusLoadByPrimaryKey]
(
	@TicketStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketStatusID],
		[Name]
	FROM [TicketStatus]
	WHERE
		([TicketStatusID] = @TicketStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketStatusLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusLoadAll];
GO

CREATE PROCEDURE [proc_TicketStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketStatusID],
		[Name]
	FROM [TicketStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketStatusUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusUpdate];
GO

CREATE PROCEDURE [proc_TicketStatusUpdate]
(
	@TicketStatusID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TicketStatus]
	SET
		[Name] = @Name
	WHERE
		[TicketStatusID] = @TicketStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketStatusInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusInsert];
GO

CREATE PROCEDURE [proc_TicketStatusInsert]
(
	@TicketStatusID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TicketStatus]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @TicketStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketStatusDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusDelete];
GO

CREATE PROCEDURE [proc_TicketStatusDelete]
(
	@TicketStatusID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TicketStatus]
	WHERE
		[TicketStatusID] = @TicketStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketTypeLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketTypeLoadByPrimaryKey]
(
	@TicketTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketTypeID],
		[Name]
	FROM [TicketType]
	WHERE
		([TicketTypeID] = @TicketTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketTypeLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketTypeLoadAll];
GO

CREATE PROCEDURE [proc_TicketTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketTypeID],
		[Name]
	FROM [TicketType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketTypeUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketTypeUpdate];
GO

CREATE PROCEDURE [proc_TicketTypeUpdate]
(
	@TicketTypeID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TicketType]
	SET
		[Name] = @Name
	WHERE
		[TicketTypeID] = @TicketTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketTypeInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketTypeInsert];
GO

CREATE PROCEDURE [proc_TicketTypeInsert]
(
	@TicketTypeID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TicketType]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @TicketTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketTypeDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketTypeDelete];
GO

CREATE PROCEDURE [proc_TicketTypeDelete]
(
	@TicketTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TicketType]
	WHERE
		[TicketTypeID] = @TicketTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketTypeDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TradePricingLoadByPrimaryKey]
(
	@TradePricingID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TradePricingID],
		[CompanyID],
		[PricingStatusID],
		[RegistrationCommitteTypeID],
		[DosageFormID],
		[FileTypeID],
		[ManufactureID],
		[TradeName],
		[Generics],
		[CompanyPrice],
		[CommittePrice],
		[CommitteDate],
		[DiscussionDate],
		[SubmissionDate],
		[Pack],
		[FileNo],
		[FilePath],
		[Generic],
		[GenericStrength],
		[ImportedManufacture]
	FROM [TradePricing]
	WHERE
		([TradePricingID] = @TradePricingID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingLoadAll];
GO

CREATE PROCEDURE [proc_TradePricingLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TradePricingID],
		[CompanyID],
		[PricingStatusID],
		[RegistrationCommitteTypeID],
		[DosageFormID],
		[FileTypeID],
		[ManufactureID],
		[TradeName],
		[Generics],
		[CompanyPrice],
		[CommittePrice],
		[CommitteDate],
		[DiscussionDate],
		[SubmissionDate],
		[Pack],
		[FileNo],
		[FilePath],
		[Generic],
		[GenericStrength],
		[ImportedManufacture]
	FROM [TradePricing]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingUpdate];
GO

CREATE PROCEDURE [proc_TradePricingUpdate]
(
	@TradePricingID int,
	@CompanyID int = NULL,
	@PricingStatusID int = NULL,
	@RegistrationCommitteTypeID int = NULL,
	@DosageFormID int = NULL,
	@FileTypeID int = NULL,
	@ManufactureID int = NULL,
	@TradeName nvarchar(150) = NULL,
	@Generics nvarchar(250) = NULL,
	@CompanyPrice float = NULL,
	@CommittePrice float = NULL,
	@CommitteDate nvarchar(50) = NULL,
	@DiscussionDate nvarchar(50) = NULL,
	@SubmissionDate nvarchar(50) = NULL,
	@Pack nvarchar(250) = NULL,
	@FileNo nvarchar(10) = NULL,
	@FilePath nvarchar(250) = NULL,
	@Generic nvarchar(250) = NULL,
	@GenericStrength nvarchar(50) = NULL,
	@ImportedManufacture nvarchar(1500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TradePricing]
	SET
		[CompanyID] = @CompanyID,
		[PricingStatusID] = @PricingStatusID,
		[RegistrationCommitteTypeID] = @RegistrationCommitteTypeID,
		[DosageFormID] = @DosageFormID,
		[FileTypeID] = @FileTypeID,
		[ManufactureID] = @ManufactureID,
		[TradeName] = @TradeName,
		[Generics] = @Generics,
		[CompanyPrice] = @CompanyPrice,
		[CommittePrice] = @CommittePrice,
		[CommitteDate] = @CommitteDate,
		[DiscussionDate] = @DiscussionDate,
		[SubmissionDate] = @SubmissionDate,
		[Pack] = @Pack,
		[FileNo] = @FileNo,
		[FilePath] = @FilePath,
		[Generic] = @Generic,
		[GenericStrength] = @GenericStrength,
		[ImportedManufacture] = @ImportedManufacture
	WHERE
		[TradePricingID] = @TradePricingID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TradePricingInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingInsert];
GO

CREATE PROCEDURE [proc_TradePricingInsert]
(
	@TradePricingID int = NULL output,
	@CompanyID int = NULL,
	@PricingStatusID int = NULL,
	@RegistrationCommitteTypeID int = NULL,
	@DosageFormID int = NULL,
	@FileTypeID int = NULL,
	@ManufactureID int = NULL,
	@TradeName nvarchar(150) = NULL,
	@Generics nvarchar(250) = NULL,
	@CompanyPrice float = NULL,
	@CommittePrice float = NULL,
	@CommitteDate nvarchar(50) = NULL,
	@DiscussionDate nvarchar(50) = NULL,
	@SubmissionDate nvarchar(50) = NULL,
	@Pack nvarchar(250) = NULL,
	@FileNo nvarchar(10) = NULL,
	@FilePath nvarchar(250) = NULL,
	@Generic nvarchar(250) = NULL,
	@GenericStrength nvarchar(50) = NULL,
	@ImportedManufacture nvarchar(1500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TradePricing]
	(
		[CompanyID],
		[PricingStatusID],
		[RegistrationCommitteTypeID],
		[DosageFormID],
		[FileTypeID],
		[ManufactureID],
		[TradeName],
		[Generics],
		[CompanyPrice],
		[CommittePrice],
		[CommitteDate],
		[DiscussionDate],
		[SubmissionDate],
		[Pack],
		[FileNo],
		[FilePath],
		[Generic],
		[GenericStrength],
		[ImportedManufacture]
	)
	VALUES
	(
		@CompanyID,
		@PricingStatusID,
		@RegistrationCommitteTypeID,
		@DosageFormID,
		@FileTypeID,
		@ManufactureID,
		@TradeName,
		@Generics,
		@CompanyPrice,
		@CommittePrice,
		@CommitteDate,
		@DiscussionDate,
		@SubmissionDate,
		@Pack,
		@FileNo,
		@FilePath,
		@Generic,
		@GenericStrength,
		@ImportedManufacture
	)

	SET @Err = @@Error

	SELECT @TradePricingID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingDelete];
GO

CREATE PROCEDURE [proc_TradePricingDelete]
(
	@TradePricingID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TradePricing]
	WHERE
		[TradePricingID] = @TradePricingID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UnitLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UnitLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UnitLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_UnitLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[NAME]
	FROM [Unit]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UnitLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_UnitLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UnitLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UnitLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UnitLoadAll];
GO

CREATE PROCEDURE [proc_UnitLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[NAME]
	FROM [Unit]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UnitLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_UnitLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UnitUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UnitUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UnitUpdate];
GO

CREATE PROCEDURE [proc_UnitUpdate]
(
	@ID int,
	@NAME nvarchar(1000) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Unit]
	SET
		[NAME] = @NAME
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UnitUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_UnitUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_UnitInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UnitInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UnitInsert];
GO

CREATE PROCEDURE [proc_UnitInsert]
(
	@ID int = NULL output,
	@NAME nvarchar(1000) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Unit]
	(
		[NAME]
	)
	VALUES
	(
		@NAME
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UnitInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_UnitInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UnitDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UnitDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UnitDelete];
GO

CREATE PROCEDURE [proc_UnitDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Unit]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UnitDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_UnitDelete Error on Creation'
GO
