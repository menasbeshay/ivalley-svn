
/****** Object:  StoredProcedure [proc_MemberSettingLoadByPrimaryKey]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberSettingLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberSettingLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberSettingLoadByPrimaryKey]
(
	@MemberSettingID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberSettingID],
		[MemberID],
		[HidePics],
		[HideRoomPics],
		[HideProfile],
		[NotifyOnPrivateChat],
		[NotifyOnFriendsOnOff],
		[NotifyOnFriendChangeStatus],
		[NotifyOnGetMsg],
		[NotifyOnVoiceMail],
		[SearchMeByMail],
		[VoiceNotfication],
		[AcceptPM],
		[AcceptSMS],
		[AcceptMSG],
		[AcceptVoiceMail],
		[AcceptFiles],
		[AcceptInvitations],
		[ChangeMyStatus],
		[ChangeMyStatusMin]
	FROM [MemberSetting]
	WHERE
		([MemberSettingID] = @MemberSettingID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberSettingLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberSettingLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberSettingLoadAll]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberSettingLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberSettingLoadAll];
GO

CREATE PROCEDURE [proc_MemberSettingLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberSettingID],
		[MemberID],
		[HidePics],
		[HideRoomPics],
		[HideProfile],
		[NotifyOnPrivateChat],
		[NotifyOnFriendsOnOff],
		[NotifyOnFriendChangeStatus],
		[NotifyOnGetMsg],
		[NotifyOnVoiceMail],
		[SearchMeByMail],
		[VoiceNotfication],
		[AcceptPM],
		[AcceptSMS],
		[AcceptMSG],
		[AcceptVoiceMail],
		[AcceptFiles],
		[AcceptInvitations],
		[ChangeMyStatus],
		[ChangeMyStatusMin]
	FROM [MemberSetting]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberSettingLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberSettingLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberSettingUpdate]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberSettingUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberSettingUpdate];
GO

CREATE PROCEDURE [proc_MemberSettingUpdate]
(
	@MemberSettingID int,
	@MemberID int = NULL,
	@HidePics bit = NULL,
	@HideRoomPics bit = NULL,
	@HideProfile bit = NULL,
	@NotifyOnPrivateChat bit = NULL,
	@NotifyOnFriendsOnOff bit = NULL,
	@NotifyOnFriendChangeStatus bit = NULL,
	@NotifyOnGetMsg bit = NULL,
	@NotifyOnVoiceMail bit = NULL,
	@SearchMeByMail bit = NULL,
	@VoiceNotfication bit = NULL,
	@AcceptPM bit = NULL,
	@AcceptSMS bit = NULL,
	@AcceptMSG bit = NULL,
	@AcceptVoiceMail bit = NULL,
	@AcceptFiles bit = NULL,
	@AcceptInvitations bit = NULL,
	@ChangeMyStatus bit = NULL,
	@ChangeMyStatusMin int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberSetting]
	SET
		[MemberID] = @MemberID,
		[HidePics] = @HidePics,
		[HideRoomPics] = @HideRoomPics,
		[HideProfile] = @HideProfile,
		[NotifyOnPrivateChat] = @NotifyOnPrivateChat,
		[NotifyOnFriendsOnOff] = @NotifyOnFriendsOnOff,
		[NotifyOnFriendChangeStatus] = @NotifyOnFriendChangeStatus,
		[NotifyOnGetMsg] = @NotifyOnGetMsg,
		[NotifyOnVoiceMail] = @NotifyOnVoiceMail,
		[SearchMeByMail] = @SearchMeByMail,
		[VoiceNotfication] = @VoiceNotfication,
		[AcceptPM] = @AcceptPM,
		[AcceptSMS] = @AcceptSMS,
		[AcceptMSG] = @AcceptMSG,
		[AcceptVoiceMail] = @AcceptVoiceMail,
		[AcceptFiles] = @AcceptFiles,
		[AcceptInvitations] = @AcceptInvitations,
		[ChangeMyStatus] = @ChangeMyStatus,
		[ChangeMyStatusMin] = @ChangeMyStatusMin
	WHERE
		[MemberSettingID] = @MemberSettingID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberSettingUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberSettingUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberSettingInsert]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberSettingInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberSettingInsert];
GO

CREATE PROCEDURE [proc_MemberSettingInsert]
(
	@MemberSettingID int = NULL output,
	@MemberID int = NULL,
	@HidePics bit = NULL,
	@HideRoomPics bit = NULL,
	@HideProfile bit = NULL,
	@NotifyOnPrivateChat bit = NULL,
	@NotifyOnFriendsOnOff bit = NULL,
	@NotifyOnFriendChangeStatus bit = NULL,
	@NotifyOnGetMsg bit = NULL,
	@NotifyOnVoiceMail bit = NULL,
	@SearchMeByMail bit = NULL,
	@VoiceNotfication bit = NULL,
	@AcceptPM bit = NULL,
	@AcceptSMS bit = NULL,
	@AcceptMSG bit = NULL,
	@AcceptVoiceMail bit = NULL,
	@AcceptFiles bit = NULL,
	@AcceptInvitations bit = NULL,
	@ChangeMyStatus bit = NULL,
	@ChangeMyStatusMin int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberSetting]
	(
		[MemberID],
		[HidePics],
		[HideRoomPics],
		[HideProfile],
		[NotifyOnPrivateChat],
		[NotifyOnFriendsOnOff],
		[NotifyOnFriendChangeStatus],
		[NotifyOnGetMsg],
		[NotifyOnVoiceMail],
		[SearchMeByMail],
		[VoiceNotfication],
		[AcceptPM],
		[AcceptSMS],
		[AcceptMSG],
		[AcceptVoiceMail],
		[AcceptFiles],
		[AcceptInvitations],
		[ChangeMyStatus],
		[ChangeMyStatusMin]
	)
	VALUES
	(
		@MemberID,
		@HidePics,
		@HideRoomPics,
		@HideProfile,
		@NotifyOnPrivateChat,
		@NotifyOnFriendsOnOff,
		@NotifyOnFriendChangeStatus,
		@NotifyOnGetMsg,
		@NotifyOnVoiceMail,
		@SearchMeByMail,
		@VoiceNotfication,
		@AcceptPM,
		@AcceptSMS,
		@AcceptMSG,
		@AcceptVoiceMail,
		@AcceptFiles,
		@AcceptInvitations,
		@ChangeMyStatus,
		@ChangeMyStatusMin
	)

	SET @Err = @@Error

	SELECT @MemberSettingID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberSettingInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberSettingInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberSettingDelete]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberSettingDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberSettingDelete];
GO

CREATE PROCEDURE [proc_MemberSettingDelete]
(
	@MemberSettingID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberSetting]
	WHERE
		[MemberSettingID] = @MemberSettingID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberSettingDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberSettingDelete Error on Creation'
GO
