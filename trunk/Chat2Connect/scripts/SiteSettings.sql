
USE [chat2connect]
GO

/****** Object:  StoredProcedure [proc_SiteSettingsLoadByPrimaryKey]    Script Date: 9/2/2014 11:44:16 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SiteSettingsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SiteSettingsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_SiteSettingsLoadByPrimaryKey]
(
	@SiteSettingsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[SiteSettingsID],
		[Name],
		[IconPath],
		[Content],
		[URL]
	FROM [SiteSettings]
	WHERE
		([SiteSettingsID] = @SiteSettingsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SiteSettingsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SiteSettingsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SiteSettingsLoadAll]    Script Date: 9/2/2014 11:44:16 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SiteSettingsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SiteSettingsLoadAll];
GO

CREATE PROCEDURE [proc_SiteSettingsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[SiteSettingsID],
		[Name],
		[IconPath],
		[Content],
		[URL]
	FROM [SiteSettings]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SiteSettingsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SiteSettingsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SiteSettingsUpdate]    Script Date: 9/2/2014 11:44:16 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SiteSettingsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SiteSettingsUpdate];
GO

CREATE PROCEDURE [proc_SiteSettingsUpdate]
(
	@SiteSettingsID int,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL,
	@Content nvarchar(MAX) = NULL,
	@URL nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [SiteSettings]
	SET
		[Name] = @Name,
		[IconPath] = @IconPath,
		[Content] = @Content,
		[URL] = @URL
	WHERE
		[SiteSettingsID] = @SiteSettingsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SiteSettingsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SiteSettingsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_SiteSettingsInsert]    Script Date: 9/2/2014 11:44:16 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SiteSettingsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SiteSettingsInsert];
GO

CREATE PROCEDURE [proc_SiteSettingsInsert]
(
	@SiteSettingsID int = NULL output,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL,
	@Content nvarchar(MAX) = NULL,
	@URL nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [SiteSettings]
	(
		[Name],
		[IconPath],
		[Content],
		[URL]
	)
	VALUES
	(
		@Name,
		@IconPath,
		@Content,
		@URL
	)

	SET @Err = @@Error

	SELECT @SiteSettingsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SiteSettingsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SiteSettingsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SiteSettingsDelete]    Script Date: 9/2/2014 11:44:16 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SiteSettingsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SiteSettingsDelete];
GO

CREATE PROCEDURE [proc_SiteSettingsDelete]
(
	@SiteSettingsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [SiteSettings]
	WHERE
		[SiteSettingsID] = @SiteSettingsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SiteSettingsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SiteSettingsDelete Error on Creation'
GO
