
USE [Intranetdb]
GO

/****** Object:  StoredProcedure [proc_AnnouncementLoadByPrimaryKey]    Script Date: 24/06/2015 4:37:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AnnouncementLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AnnouncementLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_AnnouncementLoadByPrimaryKey]
(
	@AnnouncementID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AnnouncementID],
		[Title],
		[Content],
		[CreatedBy],
		[createdDate],
		[MainPic],
		[Brief],
		[IsBulletin],
		[IsBlog],
		[UploadedFile],
		[GroupID]
	FROM [Announcement]
	WHERE
		([AnnouncementID] = @AnnouncementID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AnnouncementLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_AnnouncementLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AnnouncementLoadAll]    Script Date: 24/06/2015 4:37:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AnnouncementLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AnnouncementLoadAll];
GO

CREATE PROCEDURE [proc_AnnouncementLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AnnouncementID],
		[Title],
		[Content],
		[CreatedBy],
		[createdDate],
		[MainPic],
		[Brief],
		[IsBulletin],
		[IsBlog],
		[UploadedFile],
		[GroupID]
	FROM [Announcement]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AnnouncementLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_AnnouncementLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AnnouncementUpdate]    Script Date: 24/06/2015 4:37:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AnnouncementUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AnnouncementUpdate];
GO

CREATE PROCEDURE [proc_AnnouncementUpdate]
(
	@AnnouncementID int,
	@Title nvarchar(500) = NULL,
	@Content nvarchar(MAX) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@createdDate datetime = NULL,
	@MainPic nvarchar(500) = NULL,
	@Brief nvarchar(1000) = NULL,
	@IsBulletin bit = NULL,
	@IsBlog bit = NULL,
	@UploadedFile nvarchar(500) = NULL,
	@GroupID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Announcement]
	SET
		[Title] = @Title,
		[Content] = @Content,
		[CreatedBy] = @CreatedBy,
		[createdDate] = @createdDate,
		[MainPic] = @MainPic,
		[Brief] = @Brief,
		[IsBulletin] = @IsBulletin,
		[IsBlog] = @IsBlog,
		[UploadedFile] = @UploadedFile,
		[GroupID] = @GroupID
	WHERE
		[AnnouncementID] = @AnnouncementID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AnnouncementUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_AnnouncementUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_AnnouncementInsert]    Script Date: 24/06/2015 4:37:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AnnouncementInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AnnouncementInsert];
GO

CREATE PROCEDURE [proc_AnnouncementInsert]
(
	@AnnouncementID int = NULL output,
	@Title nvarchar(500) = NULL,
	@Content nvarchar(MAX) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@createdDate datetime = NULL,
	@MainPic nvarchar(500) = NULL,
	@Brief nvarchar(1000) = NULL,
	@IsBulletin bit = NULL,
	@IsBlog bit = NULL,
	@UploadedFile nvarchar(500) = NULL,
	@GroupID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Announcement]
	(
		[Title],
		[Content],
		[CreatedBy],
		[createdDate],
		[MainPic],
		[Brief],
		[IsBulletin],
		[IsBlog],
		[UploadedFile],
		[GroupID]
	)
	VALUES
	(
		@Title,
		@Content,
		@CreatedBy,
		@createdDate,
		@MainPic,
		@Brief,
		@IsBulletin,
		@IsBlog,
		@UploadedFile,
		@GroupID
	)

	SET @Err = @@Error

	SELECT @AnnouncementID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AnnouncementInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_AnnouncementInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AnnouncementDelete]    Script Date: 24/06/2015 4:37:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AnnouncementDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AnnouncementDelete];
GO

CREATE PROCEDURE [proc_AnnouncementDelete]
(
	@AnnouncementID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Announcement]
	WHERE
		[AnnouncementID] = @AnnouncementID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AnnouncementDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_AnnouncementDelete Error on Creation'
GO
