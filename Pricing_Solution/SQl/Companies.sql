
/****** Object:  StoredProcedure [proc_CompaniesLoadByPrimaryKey]    Script Date: 6/25/2014 1:38:25 PM ******/
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

/****** Object:  StoredProcedure [proc_CompaniesLoadAll]    Script Date: 6/25/2014 1:38:25 PM ******/
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

/****** Object:  StoredProcedure [proc_CompaniesUpdate]    Script Date: 6/25/2014 1:38:25 PM ******/
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




/****** Object:  StoredProcedure [proc_CompaniesInsert]    Script Date: 6/25/2014 1:38:25 PM ******/
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

/****** Object:  StoredProcedure [proc_CompaniesDelete]    Script Date: 6/25/2014 1:38:25 PM ******/
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
