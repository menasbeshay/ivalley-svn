
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
