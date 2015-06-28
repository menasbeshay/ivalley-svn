
USE [Intranetdb_final]
GO

/****** Object:  StoredProcedure [proc_UsersNoficationsLoadByPrimaryKey]    Script Date: 28/06/2015 3:46:49 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UsersNoficationsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UsersNoficationsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_UsersNoficationsLoadByPrimaryKey]
(
	@UserNotificationID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserNotificationID],
		[UserID],
		[NotificationType],
		[IsRead],
		[CategoryID],
		[ManualID],
		[FormID],
		[ManualVersionID],
		[FromVersionID],
		[ScheduleID],
		[ScheduleVersionID]
	FROM [UsersNofications]
	WHERE
		([UserNotificationID] = @UserNotificationID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UsersNoficationsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_UsersNoficationsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UsersNoficationsLoadAll]    Script Date: 28/06/2015 3:46:49 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UsersNoficationsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UsersNoficationsLoadAll];
GO

CREATE PROCEDURE [proc_UsersNoficationsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserNotificationID],
		[UserID],
		[NotificationType],
		[IsRead],
		[CategoryID],
		[ManualID],
		[FormID],
		[ManualVersionID],
		[FromVersionID],
		[ScheduleID],
		[ScheduleVersionID]
	FROM [UsersNofications]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UsersNoficationsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_UsersNoficationsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UsersNoficationsUpdate]    Script Date: 28/06/2015 3:46:49 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UsersNoficationsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UsersNoficationsUpdate];
GO

CREATE PROCEDURE [proc_UsersNoficationsUpdate]
(
	@UserNotificationID int,
	@UserID uniqueidentifier = NULL,
	@NotificationType int = NULL,
	@IsRead bit = NULL,
	@CategoryID int = NULL,
	@ManualID int = NULL,
	@FormID int = NULL,
	@ManualVersionID int = NULL,
	@FromVersionID int = NULL,
	@ScheduleID int = NULL,
	@ScheduleVersionID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [UsersNofications]
	SET
		[UserID] = @UserID,
		[NotificationType] = @NotificationType,
		[IsRead] = @IsRead,
		[CategoryID] = @CategoryID,
		[ManualID] = @ManualID,
		[FormID] = @FormID,
		[ManualVersionID] = @ManualVersionID,
		[FromVersionID] = @FromVersionID,
		[ScheduleID] = @ScheduleID,
		[ScheduleVersionID] = @ScheduleVersionID
	WHERE
		[UserNotificationID] = @UserNotificationID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UsersNoficationsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_UsersNoficationsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_UsersNoficationsInsert]    Script Date: 28/06/2015 3:46:49 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UsersNoficationsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UsersNoficationsInsert];
GO

CREATE PROCEDURE [proc_UsersNoficationsInsert]
(
	@UserNotificationID int = NULL output,
	@UserID uniqueidentifier = NULL,
	@NotificationType int = NULL,
	@IsRead bit = NULL,
	@CategoryID int = NULL,
	@ManualID int = NULL,
	@FormID int = NULL,
	@ManualVersionID int = NULL,
	@FromVersionID int = NULL,
	@ScheduleID int = NULL,
	@ScheduleVersionID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [UsersNofications]
	(
		[UserID],
		[NotificationType],
		[IsRead],
		[CategoryID],
		[ManualID],
		[FormID],
		[ManualVersionID],
		[FromVersionID],
		[ScheduleID],
		[ScheduleVersionID]
	)
	VALUES
	(
		@UserID,
		@NotificationType,
		@IsRead,
		@CategoryID,
		@ManualID,
		@FormID,
		@ManualVersionID,
		@FromVersionID,
		@ScheduleID,
		@ScheduleVersionID
	)

	SET @Err = @@Error

	SELECT @UserNotificationID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UsersNoficationsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_UsersNoficationsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UsersNoficationsDelete]    Script Date: 28/06/2015 3:46:49 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UsersNoficationsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UsersNoficationsDelete];
GO

CREATE PROCEDURE [proc_UsersNoficationsDelete]
(
	@UserNotificationID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [UsersNofications]
	WHERE
		[UserNotificationID] = @UserNotificationID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UsersNoficationsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_UsersNoficationsDelete Error on Creation'
GO
