
/****** Object:  StoredProcedure [proc_CompaniesLoadByPrimaryKey]    Script Date: 2/1/2013 4:25:35 PM ******/
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
		[EnName],
		[ArName],
		[EnAddress],
		[ArAddress],
		[UserName],
		[password],
		[CityID],
		[CategoryID],
		[SubCategoryID],
		[Tele],
		[Fax],
		[WebSite],
		[LogoPath],
		[EnBranches],
		[ArBranches],
		[MapPath],
		[EnAbout],
		[ArAbout],
		[EnContact],
		[ArContact],
		[PackageTypeID],
		[SchedulePath],
		[Rank]
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

/****** Object:  StoredProcedure [proc_CompaniesLoadAll]    Script Date: 2/1/2013 4:25:35 PM ******/
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
		[EnName],
		[ArName],
		[EnAddress],
		[ArAddress],
		[UserName],
		[password],
		[CityID],
		[CategoryID],
		[SubCategoryID],
		[Tele],
		[Fax],
		[WebSite],
		[LogoPath],
		[EnBranches],
		[ArBranches],
		[MapPath],
		[EnAbout],
		[ArAbout],
		[EnContact],
		[ArContact],
		[PackageTypeID],
		[SchedulePath],
		[Rank]
	FROM [Companies]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompaniesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompaniesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CompaniesUpdate]    Script Date: 2/1/2013 4:25:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompaniesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompaniesUpdate];
GO

CREATE PROCEDURE [proc_CompaniesUpdate]
(
	@CompanyID int,
	@EnName nvarchar(200) = NULL,
	@ArName nvarchar(200) = NULL,
	@EnAddress nvarchar(500) = NULL,
	@ArAddress nvarchar(500) = NULL,
	@UserName nvarchar(50) = NULL,
	@password nvarchar(50) = NULL,
	@CityID int = NULL,
	@CategoryID int = NULL,
	@SubCategoryID int = NULL,
	@Tele nvarchar(120) = NULL,
	@Fax nvarchar(120) = NULL,
	@WebSite nvarchar(200) = NULL,
	@LogoPath nvarchar(300) = NULL,
	@EnBranches nvarchar(MAX) = NULL,
	@ArBranches nvarchar(MAX) = NULL,
	@MapPath nvarchar(MAX) = NULL,
	@EnAbout nvarchar(MAX) = NULL,
	@ArAbout nvarchar(MAX) = NULL,
	@EnContact nvarchar(1000) = NULL,
	@ArContact nvarchar(1000) = NULL,
	@PackageTypeID int = NULL,
	@SchedulePath nvarchar(300) = NULL,
	@Rank int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Companies]
	SET
		[EnName] = @EnName,
		[ArName] = @ArName,
		[EnAddress] = @EnAddress,
		[ArAddress] = @ArAddress,
		[UserName] = @UserName,
		[password] = @password,
		[CityID] = @CityID,
		[CategoryID] = @CategoryID,
		[SubCategoryID] = @SubCategoryID,
		[Tele] = @Tele,
		[Fax] = @Fax,
		[WebSite] = @WebSite,
		[LogoPath] = @LogoPath,
		[EnBranches] = @EnBranches,
		[ArBranches] = @ArBranches,
		[MapPath] = @MapPath,
		[EnAbout] = @EnAbout,
		[ArAbout] = @ArAbout,
		[EnContact] = @EnContact,
		[ArContact] = @ArContact,
		[PackageTypeID] = @PackageTypeID,
		[SchedulePath] = @SchedulePath,
		[Rank] = @Rank
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




/****** Object:  StoredProcedure [proc_CompaniesInsert]    Script Date: 2/1/2013 4:25:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompaniesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompaniesInsert];
GO

CREATE PROCEDURE [proc_CompaniesInsert]
(
	@CompanyID int = NULL output,
	@EnName nvarchar(200) = NULL,
	@ArName nvarchar(200) = NULL,
	@EnAddress nvarchar(500) = NULL,
	@ArAddress nvarchar(500) = NULL,
	@UserName nvarchar(50) = NULL,
	@password nvarchar(50) = NULL,
	@CityID int = NULL,
	@CategoryID int = NULL,
	@SubCategoryID int = NULL,
	@Tele nvarchar(120) = NULL,
	@Fax nvarchar(120) = NULL,
	@WebSite nvarchar(200) = NULL,
	@LogoPath nvarchar(300) = NULL,
	@EnBranches nvarchar(MAX) = NULL,
	@ArBranches nvarchar(MAX) = NULL,
	@MapPath nvarchar(MAX) = NULL,
	@EnAbout nvarchar(MAX) = NULL,
	@ArAbout nvarchar(MAX) = NULL,
	@EnContact nvarchar(1000) = NULL,
	@ArContact nvarchar(1000) = NULL,
	@PackageTypeID int = NULL,
	@SchedulePath nvarchar(300) = NULL,
	@Rank int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Companies]
	(
		[EnName],
		[ArName],
		[EnAddress],
		[ArAddress],
		[UserName],
		[password],
		[CityID],
		[CategoryID],
		[SubCategoryID],
		[Tele],
		[Fax],
		[WebSite],
		[LogoPath],
		[EnBranches],
		[ArBranches],
		[MapPath],
		[EnAbout],
		[ArAbout],
		[EnContact],
		[ArContact],
		[PackageTypeID],
		[SchedulePath],
		[Rank]
	)
	VALUES
	(
		@EnName,
		@ArName,
		@EnAddress,
		@ArAddress,
		@UserName,
		@password,
		@CityID,
		@CategoryID,
		@SubCategoryID,
		@Tele,
		@Fax,
		@WebSite,
		@LogoPath,
		@EnBranches,
		@ArBranches,
		@MapPath,
		@EnAbout,
		@ArAbout,
		@EnContact,
		@ArContact,
		@PackageTypeID,
		@SchedulePath,
		@Rank
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

/****** Object:  StoredProcedure [proc_CompaniesDelete]    Script Date: 2/1/2013 4:25:35 PM ******/
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
