
/****** Object:  StoredProcedure [proc_RoomMemberSettingLoadByPrimaryKey]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberSettingLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberSettingLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomMemberSettingLoadByPrimaryKey]
(
	@RoomID int,
	@MemberID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomID],
		[MemberID],
		[NotifyOnFriendsLogOn],
		[NotifyOnFriendsLogOff],
		[NotifyOnMicOn],
		[NotifyOnMicOff],
		[NotifyOnOpenCam],
		[NotifyOnCloseCam]
	FROM [RoomMemberSetting]
	WHERE
		([RoomID] = @RoomID) AND
		([MemberID] = @MemberID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberSettingLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberSettingLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMemberSettingLoadAll]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberSettingLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberSettingLoadAll];
GO

CREATE PROCEDURE [proc_RoomMemberSettingLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomID],
		[MemberID],
		[NotifyOnFriendsLogOn],
		[NotifyOnFriendsLogOff],
		[NotifyOnMicOn],
		[NotifyOnMicOff],
		[NotifyOnOpenCam],
		[NotifyOnCloseCam]
	FROM [RoomMemberSetting]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberSettingLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberSettingLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMemberSettingUpdate]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberSettingUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberSettingUpdate];
GO

CREATE PROCEDURE [proc_RoomMemberSettingUpdate]
(
	@RoomID int,
	@MemberID int,
	@NotifyOnFriendsLogOn bit = NULL,
	@NotifyOnFriendsLogOff bit = NULL,
	@NotifyOnMicOn bit = NULL,
	@NotifyOnMicOff bit = NULL,
	@NotifyOnOpenCam bit = NULL,
	@NotifyOnCloseCam bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomMemberSetting]
	SET
		[NotifyOnFriendsLogOn] = @NotifyOnFriendsLogOn,
		[NotifyOnFriendsLogOff] = @NotifyOnFriendsLogOff,
		[NotifyOnMicOn] = @NotifyOnMicOn,
		[NotifyOnMicOff] = @NotifyOnMicOff,
		[NotifyOnOpenCam] = @NotifyOnOpenCam,
		[NotifyOnCloseCam] = @NotifyOnCloseCam
	WHERE
		[RoomID] = @RoomID
	AND	[MemberID] = @MemberID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberSettingUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberSettingUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RoomMemberSettingInsert]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberSettingInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberSettingInsert];
GO

CREATE PROCEDURE [proc_RoomMemberSettingInsert]
(
	@RoomID int,
	@MemberID int,
	@NotifyOnFriendsLogOn bit = NULL,
	@NotifyOnFriendsLogOff bit = NULL,
	@NotifyOnMicOn bit = NULL,
	@NotifyOnMicOff bit = NULL,
	@NotifyOnOpenCam bit = NULL,
	@NotifyOnCloseCam bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomMemberSetting]
	(
		[RoomID],
		[MemberID],
		[NotifyOnFriendsLogOn],
		[NotifyOnFriendsLogOff],
		[NotifyOnMicOn],
		[NotifyOnMicOff],
		[NotifyOnOpenCam],
		[NotifyOnCloseCam]
	)
	VALUES
	(
		@RoomID,
		@MemberID,
		@NotifyOnFriendsLogOn,
		@NotifyOnFriendsLogOff,
		@NotifyOnMicOn,
		@NotifyOnMicOff,
		@NotifyOnOpenCam,
		@NotifyOnCloseCam
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberSettingInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberSettingInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomMemberSettingDelete]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberSettingDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberSettingDelete];
GO

CREATE PROCEDURE [proc_RoomMemberSettingDelete]
(
	@RoomID int,
	@MemberID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomMemberSetting]
	WHERE
		[RoomID] = @RoomID AND
		[MemberID] = @MemberID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomMemberSettingDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomMemberSettingDelete Error on Creation'
GO
