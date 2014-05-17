
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
