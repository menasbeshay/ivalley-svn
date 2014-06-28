
/****** Object:  StoredProcedure [proc_SitePagesLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SitePagesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SitePagesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_SitePagesLoadByPrimaryKey]
(
	@PageID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PageID],
		[PageTitleAr],
		[PageTitleEng],
		[PageTextAr],
		[PageTextEng]
	FROM [SitePages]
	WHERE
		([PageID] = @PageID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SitePagesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SitePagesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SitePagesLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SitePagesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SitePagesLoadAll];
GO

CREATE PROCEDURE [proc_SitePagesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PageID],
		[PageTitleAr],
		[PageTitleEng],
		[PageTextAr],
		[PageTextEng]
	FROM [SitePages]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SitePagesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SitePagesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SitePagesUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SitePagesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SitePagesUpdate];
GO

CREATE PROCEDURE [proc_SitePagesUpdate]
(
	@PageID int,
	@PageTitleAr nvarchar(250) = NULL,
	@PageTitleEng nvarchar(250) = NULL,
	@PageTextAr nvarchar(MAX) = NULL,
	@PageTextEng nvarchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [SitePages]
	SET
		[PageTitleAr] = @PageTitleAr,
		[PageTitleEng] = @PageTitleEng,
		[PageTextAr] = @PageTextAr,
		[PageTextEng] = @PageTextEng
	WHERE
		[PageID] = @PageID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SitePagesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SitePagesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_SitePagesInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SitePagesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SitePagesInsert];
GO

CREATE PROCEDURE [proc_SitePagesInsert]
(
	@PageID int = NULL output,
	@PageTitleAr nvarchar(250) = NULL,
	@PageTitleEng nvarchar(250) = NULL,
	@PageTextAr nvarchar(MAX) = NULL,
	@PageTextEng nvarchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [SitePages]
	(
		[PageTitleAr],
		[PageTitleEng],
		[PageTextAr],
		[PageTextEng]
	)
	VALUES
	(
		@PageTitleAr,
		@PageTitleEng,
		@PageTextAr,
		@PageTextEng
	)

	SET @Err = @@Error

	SELECT @PageID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SitePagesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SitePagesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SitePagesDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SitePagesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SitePagesDelete];
GO

CREATE PROCEDURE [proc_SitePagesDelete]
(
	@PageID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [SitePages]
	WHERE
		[PageID] = @PageID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SitePagesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SitePagesDelete Error on Creation'
GO
