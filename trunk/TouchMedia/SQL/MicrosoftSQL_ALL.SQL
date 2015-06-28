
USE [tm_final]
GO

/****** Object:  StoredProcedure [proc_aspnet_ApplicationsLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_ApplicationsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_ApplicationsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_aspnet_ApplicationsLoadByPrimaryKey]
(
	@ApplicationId uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ApplicationName],
		[LoweredApplicationName],
		[ApplicationId],
		[Description]
	FROM [aspnet_Applications]
	WHERE
		([ApplicationId] = @ApplicationId)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_ApplicationsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_ApplicationsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_ApplicationsLoadAll]    Script Date: 6/28/2015 1:14:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_ApplicationsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_ApplicationsLoadAll];
GO

CREATE PROCEDURE [proc_aspnet_ApplicationsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ApplicationName],
		[LoweredApplicationName],
		[ApplicationId],
		[Description]
	FROM [aspnet_Applications]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_ApplicationsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_ApplicationsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_ApplicationsUpdate]    Script Date: 6/28/2015 1:14:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_ApplicationsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_ApplicationsUpdate];
GO

CREATE PROCEDURE [proc_aspnet_ApplicationsUpdate]
(
	@ApplicationName nvarchar(256),
	@LoweredApplicationName nvarchar(256),
	@ApplicationId uniqueidentifier,
	@Description nvarchar(256) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [aspnet_Applications]
	SET
		[ApplicationName] = @ApplicationName,
		[LoweredApplicationName] = @LoweredApplicationName,
		[Description] = @Description
	WHERE
		[ApplicationId] = @ApplicationId


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_ApplicationsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_ApplicationsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_aspnet_ApplicationsInsert]    Script Date: 6/28/2015 1:14:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_ApplicationsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_ApplicationsInsert];
GO

CREATE PROCEDURE [proc_aspnet_ApplicationsInsert]
(
	@ApplicationName nvarchar(256),
	@LoweredApplicationName nvarchar(256),
	@ApplicationId uniqueidentifier,
	@Description nvarchar(256) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	IF @ApplicationId IS NULL
		 SET @ApplicationId = NEWID()

	SET @Err = @@Error

	IF (@Err <> 0)
	    RETURN @Err


	INSERT
	INTO [aspnet_Applications]
	(
		[ApplicationName],
		[LoweredApplicationName],
		[ApplicationId],
		[Description]
	)
	VALUES
	(
		@ApplicationName,
		@LoweredApplicationName,
		@ApplicationId,
		@Description
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_ApplicationsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_ApplicationsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_ApplicationsDelete]    Script Date: 6/28/2015 1:14:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_ApplicationsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_ApplicationsDelete];
GO

CREATE PROCEDURE [proc_aspnet_ApplicationsDelete]
(
	@ApplicationId uniqueidentifier
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [aspnet_Applications]
	WHERE
		[ApplicationId] = @ApplicationId
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_ApplicationsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_ApplicationsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_MembershipLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_MembershipLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_MembershipLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_aspnet_MembershipLoadByPrimaryKey]
(
	@UserId uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ApplicationId],
		[UserId],
		[Password],
		[PasswordFormat],
		[PasswordSalt],
		[MobilePIN],
		[Email],
		[LoweredEmail],
		[PasswordQuestion],
		[PasswordAnswer],
		[IsApproved],
		[IsLockedOut],
		[CreateDate],
		[LastLoginDate],
		[LastPasswordChangedDate],
		[LastLockoutDate],
		[FailedPasswordAttemptCount],
		[FailedPasswordAttemptWindowStart],
		[FailedPasswordAnswerAttemptCount],
		[FailedPasswordAnswerAttemptWindowStart],
		[Comment]
	FROM [aspnet_Membership]
	WHERE
		([UserId] = @UserId)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_MembershipLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_MembershipLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_MembershipLoadAll]    Script Date: 6/28/2015 1:14:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_MembershipLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_MembershipLoadAll];
GO

CREATE PROCEDURE [proc_aspnet_MembershipLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ApplicationId],
		[UserId],
		[Password],
		[PasswordFormat],
		[PasswordSalt],
		[MobilePIN],
		[Email],
		[LoweredEmail],
		[PasswordQuestion],
		[PasswordAnswer],
		[IsApproved],
		[IsLockedOut],
		[CreateDate],
		[LastLoginDate],
		[LastPasswordChangedDate],
		[LastLockoutDate],
		[FailedPasswordAttemptCount],
		[FailedPasswordAttemptWindowStart],
		[FailedPasswordAnswerAttemptCount],
		[FailedPasswordAnswerAttemptWindowStart],
		[Comment]
	FROM [aspnet_Membership]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_MembershipLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_MembershipLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_MembershipUpdate]    Script Date: 6/28/2015 1:14:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_MembershipUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_MembershipUpdate];
GO

CREATE PROCEDURE [proc_aspnet_MembershipUpdate]
(
	@ApplicationId uniqueidentifier,
	@UserId uniqueidentifier,
	@Password nvarchar(128),
	@PasswordFormat int,
	@PasswordSalt nvarchar(128),
	@MobilePIN nvarchar(16) = NULL,
	@Email nvarchar(256) = NULL,
	@LoweredEmail nvarchar(256) = NULL,
	@PasswordQuestion nvarchar(256) = NULL,
	@PasswordAnswer nvarchar(128) = NULL,
	@IsApproved bit,
	@IsLockedOut bit,
	@CreateDate datetime,
	@LastLoginDate datetime,
	@LastPasswordChangedDate datetime,
	@LastLockoutDate datetime,
	@FailedPasswordAttemptCount int,
	@FailedPasswordAttemptWindowStart datetime,
	@FailedPasswordAnswerAttemptCount int,
	@FailedPasswordAnswerAttemptWindowStart datetime,
	@Comment ntext = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [aspnet_Membership]
	SET
		[ApplicationId] = @ApplicationId,
		[Password] = @Password,
		[PasswordFormat] = @PasswordFormat,
		[PasswordSalt] = @PasswordSalt,
		[MobilePIN] = @MobilePIN,
		[Email] = @Email,
		[LoweredEmail] = @LoweredEmail,
		[PasswordQuestion] = @PasswordQuestion,
		[PasswordAnswer] = @PasswordAnswer,
		[IsApproved] = @IsApproved,
		[IsLockedOut] = @IsLockedOut,
		[CreateDate] = @CreateDate,
		[LastLoginDate] = @LastLoginDate,
		[LastPasswordChangedDate] = @LastPasswordChangedDate,
		[LastLockoutDate] = @LastLockoutDate,
		[FailedPasswordAttemptCount] = @FailedPasswordAttemptCount,
		[FailedPasswordAttemptWindowStart] = @FailedPasswordAttemptWindowStart,
		[FailedPasswordAnswerAttemptCount] = @FailedPasswordAnswerAttemptCount,
		[FailedPasswordAnswerAttemptWindowStart] = @FailedPasswordAnswerAttemptWindowStart,
		[Comment] = @Comment
	WHERE
		[UserId] = @UserId


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_MembershipUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_MembershipUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_aspnet_MembershipInsert]    Script Date: 6/28/2015 1:14:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_MembershipInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_MembershipInsert];
GO

CREATE PROCEDURE [proc_aspnet_MembershipInsert]
(
	@ApplicationId uniqueidentifier,
	@UserId uniqueidentifier,
	@Password nvarchar(128),
	@PasswordFormat int,
	@PasswordSalt nvarchar(128),
	@MobilePIN nvarchar(16) = NULL,
	@Email nvarchar(256) = NULL,
	@LoweredEmail nvarchar(256) = NULL,
	@PasswordQuestion nvarchar(256) = NULL,
	@PasswordAnswer nvarchar(128) = NULL,
	@IsApproved bit,
	@IsLockedOut bit,
	@CreateDate datetime,
	@LastLoginDate datetime,
	@LastPasswordChangedDate datetime,
	@LastLockoutDate datetime,
	@FailedPasswordAttemptCount int,
	@FailedPasswordAttemptWindowStart datetime,
	@FailedPasswordAnswerAttemptCount int,
	@FailedPasswordAnswerAttemptWindowStart datetime,
	@Comment ntext = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	IF @UserId IS NULL
		 SET @UserId = NEWID()

	SET @Err = @@Error

	IF (@Err <> 0)
	    RETURN @Err


	INSERT
	INTO [aspnet_Membership]
	(
		[ApplicationId],
		[UserId],
		[Password],
		[PasswordFormat],
		[PasswordSalt],
		[MobilePIN],
		[Email],
		[LoweredEmail],
		[PasswordQuestion],
		[PasswordAnswer],
		[IsApproved],
		[IsLockedOut],
		[CreateDate],
		[LastLoginDate],
		[LastPasswordChangedDate],
		[LastLockoutDate],
		[FailedPasswordAttemptCount],
		[FailedPasswordAttemptWindowStart],
		[FailedPasswordAnswerAttemptCount],
		[FailedPasswordAnswerAttemptWindowStart],
		[Comment]
	)
	VALUES
	(
		@ApplicationId,
		@UserId,
		@Password,
		@PasswordFormat,
		@PasswordSalt,
		@MobilePIN,
		@Email,
		@LoweredEmail,
		@PasswordQuestion,
		@PasswordAnswer,
		@IsApproved,
		@IsLockedOut,
		@CreateDate,
		@LastLoginDate,
		@LastPasswordChangedDate,
		@LastLockoutDate,
		@FailedPasswordAttemptCount,
		@FailedPasswordAttemptWindowStart,
		@FailedPasswordAnswerAttemptCount,
		@FailedPasswordAnswerAttemptWindowStart,
		@Comment
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_MembershipInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_MembershipInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_MembershipDelete]    Script Date: 6/28/2015 1:14:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_MembershipDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_MembershipDelete];
GO

CREATE PROCEDURE [proc_aspnet_MembershipDelete]
(
	@UserId uniqueidentifier
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [aspnet_Membership]
	WHERE
		[UserId] = @UserId
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_MembershipDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_MembershipDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_PathsLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PathsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PathsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_aspnet_PathsLoadByPrimaryKey]
(
	@PathId uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ApplicationId],
		[PathId],
		[Path],
		[LoweredPath]
	FROM [aspnet_Paths]
	WHERE
		([PathId] = @PathId)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PathsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PathsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_PathsLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PathsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PathsLoadAll];
GO

CREATE PROCEDURE [proc_aspnet_PathsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ApplicationId],
		[PathId],
		[Path],
		[LoweredPath]
	FROM [aspnet_Paths]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PathsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PathsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_PathsUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PathsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PathsUpdate];
GO

CREATE PROCEDURE [proc_aspnet_PathsUpdate]
(
	@ApplicationId uniqueidentifier,
	@PathId uniqueidentifier,
	@Path nvarchar(256),
	@LoweredPath nvarchar(256)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [aspnet_Paths]
	SET
		[ApplicationId] = @ApplicationId,
		[Path] = @Path,
		[LoweredPath] = @LoweredPath
	WHERE
		[PathId] = @PathId


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PathsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PathsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_aspnet_PathsInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PathsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PathsInsert];
GO

CREATE PROCEDURE [proc_aspnet_PathsInsert]
(
	@ApplicationId uniqueidentifier,
	@PathId uniqueidentifier,
	@Path nvarchar(256),
	@LoweredPath nvarchar(256)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	IF @PathId IS NULL
		 SET @PathId = NEWID()

	SET @Err = @@Error

	IF (@Err <> 0)
	    RETURN @Err


	INSERT
	INTO [aspnet_Paths]
	(
		[ApplicationId],
		[PathId],
		[Path],
		[LoweredPath]
	)
	VALUES
	(
		@ApplicationId,
		@PathId,
		@Path,
		@LoweredPath
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PathsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PathsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_PathsDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PathsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PathsDelete];
GO

CREATE PROCEDURE [proc_aspnet_PathsDelete]
(
	@PathId uniqueidentifier
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [aspnet_Paths]
	WHERE
		[PathId] = @PathId
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PathsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PathsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_PersonalizationAllUsersLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PersonalizationAllUsersLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PersonalizationAllUsersLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_aspnet_PersonalizationAllUsersLoadByPrimaryKey]
(
	@PathId uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PathId],
		[PageSettings],
		[LastUpdatedDate]
	FROM [aspnet_PersonalizationAllUsers]
	WHERE
		([PathId] = @PathId)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PersonalizationAllUsersLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PersonalizationAllUsersLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_PersonalizationAllUsersLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PersonalizationAllUsersLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PersonalizationAllUsersLoadAll];
GO

CREATE PROCEDURE [proc_aspnet_PersonalizationAllUsersLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PathId],
		[PageSettings],
		[LastUpdatedDate]
	FROM [aspnet_PersonalizationAllUsers]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PersonalizationAllUsersLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PersonalizationAllUsersLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_PersonalizationAllUsersUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PersonalizationAllUsersUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PersonalizationAllUsersUpdate];
GO

CREATE PROCEDURE [proc_aspnet_PersonalizationAllUsersUpdate]
(
	@PathId uniqueidentifier,
	@PageSettings image,
	@LastUpdatedDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [aspnet_PersonalizationAllUsers]
	SET
		[PageSettings] = @PageSettings,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[PathId] = @PathId


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PersonalizationAllUsersUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PersonalizationAllUsersUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_aspnet_PersonalizationAllUsersInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PersonalizationAllUsersInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PersonalizationAllUsersInsert];
GO

CREATE PROCEDURE [proc_aspnet_PersonalizationAllUsersInsert]
(
	@PathId uniqueidentifier,
	@PageSettings image,
	@LastUpdatedDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	IF @PathId IS NULL
		 SET @PathId = NEWID()

	SET @Err = @@Error

	IF (@Err <> 0)
	    RETURN @Err


	INSERT
	INTO [aspnet_PersonalizationAllUsers]
	(
		[PathId],
		[PageSettings],
		[LastUpdatedDate]
	)
	VALUES
	(
		@PathId,
		@PageSettings,
		@LastUpdatedDate
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PersonalizationAllUsersInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PersonalizationAllUsersInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_PersonalizationAllUsersDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PersonalizationAllUsersDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PersonalizationAllUsersDelete];
GO

CREATE PROCEDURE [proc_aspnet_PersonalizationAllUsersDelete]
(
	@PathId uniqueidentifier
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [aspnet_PersonalizationAllUsers]
	WHERE
		[PathId] = @PathId
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PersonalizationAllUsersDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PersonalizationAllUsersDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_PersonalizationPerUserLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PersonalizationPerUserLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PersonalizationPerUserLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_aspnet_PersonalizationPerUserLoadByPrimaryKey]
(
	@Id uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[Id],
		[PathId],
		[UserId],
		[PageSettings],
		[LastUpdatedDate]
	FROM [aspnet_PersonalizationPerUser]
	WHERE
		([Id] = @Id)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PersonalizationPerUserLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PersonalizationPerUserLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_PersonalizationPerUserLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PersonalizationPerUserLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PersonalizationPerUserLoadAll];
GO

CREATE PROCEDURE [proc_aspnet_PersonalizationPerUserLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[Id],
		[PathId],
		[UserId],
		[PageSettings],
		[LastUpdatedDate]
	FROM [aspnet_PersonalizationPerUser]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PersonalizationPerUserLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PersonalizationPerUserLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_PersonalizationPerUserUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PersonalizationPerUserUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PersonalizationPerUserUpdate];
GO

CREATE PROCEDURE [proc_aspnet_PersonalizationPerUserUpdate]
(
	@Id uniqueidentifier,
	@PathId uniqueidentifier = NULL,
	@UserId uniqueidentifier = NULL,
	@PageSettings image,
	@LastUpdatedDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [aspnet_PersonalizationPerUser]
	SET
		[PathId] = @PathId,
		[UserId] = @UserId,
		[PageSettings] = @PageSettings,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[Id] = @Id


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PersonalizationPerUserUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PersonalizationPerUserUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_aspnet_PersonalizationPerUserInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PersonalizationPerUserInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PersonalizationPerUserInsert];
GO

CREATE PROCEDURE [proc_aspnet_PersonalizationPerUserInsert]
(
	@Id uniqueidentifier,
	@PathId uniqueidentifier = NULL,
	@UserId uniqueidentifier = NULL,
	@PageSettings image,
	@LastUpdatedDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	IF @Id IS NULL
		 SET @Id = NEWID()

	SET @Err = @@Error

	IF (@Err <> 0)
	    RETURN @Err


	INSERT
	INTO [aspnet_PersonalizationPerUser]
	(
		[Id],
		[PathId],
		[UserId],
		[PageSettings],
		[LastUpdatedDate]
	)
	VALUES
	(
		@Id,
		@PathId,
		@UserId,
		@PageSettings,
		@LastUpdatedDate
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PersonalizationPerUserInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PersonalizationPerUserInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_PersonalizationPerUserDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_PersonalizationPerUserDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_PersonalizationPerUserDelete];
GO

CREATE PROCEDURE [proc_aspnet_PersonalizationPerUserDelete]
(
	@Id uniqueidentifier
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [aspnet_PersonalizationPerUser]
	WHERE
		[Id] = @Id
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_PersonalizationPerUserDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_PersonalizationPerUserDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_ProfileLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_ProfileLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_ProfileLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_aspnet_ProfileLoadByPrimaryKey]
(
	@UserId uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserId],
		[PropertyNames],
		[PropertyValuesString],
		[PropertyValuesBinary],
		[LastUpdatedDate]
	FROM [aspnet_Profile]
	WHERE
		([UserId] = @UserId)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_ProfileLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_ProfileLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_ProfileLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_ProfileLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_ProfileLoadAll];
GO

CREATE PROCEDURE [proc_aspnet_ProfileLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserId],
		[PropertyNames],
		[PropertyValuesString],
		[PropertyValuesBinary],
		[LastUpdatedDate]
	FROM [aspnet_Profile]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_ProfileLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_ProfileLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_ProfileUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_ProfileUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_ProfileUpdate];
GO

CREATE PROCEDURE [proc_aspnet_ProfileUpdate]
(
	@UserId uniqueidentifier,
	@PropertyNames ntext,
	@PropertyValuesString ntext,
	@PropertyValuesBinary image,
	@LastUpdatedDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [aspnet_Profile]
	SET
		[PropertyNames] = @PropertyNames,
		[PropertyValuesString] = @PropertyValuesString,
		[PropertyValuesBinary] = @PropertyValuesBinary,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[UserId] = @UserId


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_ProfileUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_ProfileUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_aspnet_ProfileInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_ProfileInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_ProfileInsert];
GO

CREATE PROCEDURE [proc_aspnet_ProfileInsert]
(
	@UserId uniqueidentifier,
	@PropertyNames ntext,
	@PropertyValuesString ntext,
	@PropertyValuesBinary image,
	@LastUpdatedDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	IF @UserId IS NULL
		 SET @UserId = NEWID()

	SET @Err = @@Error

	IF (@Err <> 0)
	    RETURN @Err


	INSERT
	INTO [aspnet_Profile]
	(
		[UserId],
		[PropertyNames],
		[PropertyValuesString],
		[PropertyValuesBinary],
		[LastUpdatedDate]
	)
	VALUES
	(
		@UserId,
		@PropertyNames,
		@PropertyValuesString,
		@PropertyValuesBinary,
		@LastUpdatedDate
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_ProfileInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_ProfileInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_ProfileDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_ProfileDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_ProfileDelete];
GO

CREATE PROCEDURE [proc_aspnet_ProfileDelete]
(
	@UserId uniqueidentifier
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [aspnet_Profile]
	WHERE
		[UserId] = @UserId
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_ProfileDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_ProfileDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_RolesLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_RolesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_RolesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_aspnet_RolesLoadByPrimaryKey]
(
	@RoleId uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ApplicationId],
		[RoleId],
		[RoleName],
		[LoweredRoleName],
		[Description]
	FROM [aspnet_Roles]
	WHERE
		([RoleId] = @RoleId)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_RolesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_RolesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_RolesLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_RolesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_RolesLoadAll];
GO

CREATE PROCEDURE [proc_aspnet_RolesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ApplicationId],
		[RoleId],
		[RoleName],
		[LoweredRoleName],
		[Description]
	FROM [aspnet_Roles]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_RolesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_RolesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_RolesUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_RolesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_RolesUpdate];
GO

CREATE PROCEDURE [proc_aspnet_RolesUpdate]
(
	@ApplicationId uniqueidentifier,
	@RoleId uniqueidentifier,
	@RoleName nvarchar(256),
	@LoweredRoleName nvarchar(256),
	@Description nvarchar(256) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [aspnet_Roles]
	SET
		[ApplicationId] = @ApplicationId,
		[RoleName] = @RoleName,
		[LoweredRoleName] = @LoweredRoleName,
		[Description] = @Description
	WHERE
		[RoleId] = @RoleId


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_RolesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_RolesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_aspnet_RolesInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_RolesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_RolesInsert];
GO

CREATE PROCEDURE [proc_aspnet_RolesInsert]
(
	@ApplicationId uniqueidentifier,
	@RoleId uniqueidentifier,
	@RoleName nvarchar(256),
	@LoweredRoleName nvarchar(256),
	@Description nvarchar(256) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	IF @RoleId IS NULL
		 SET @RoleId = NEWID()

	SET @Err = @@Error

	IF (@Err <> 0)
	    RETURN @Err


	INSERT
	INTO [aspnet_Roles]
	(
		[ApplicationId],
		[RoleId],
		[RoleName],
		[LoweredRoleName],
		[Description]
	)
	VALUES
	(
		@ApplicationId,
		@RoleId,
		@RoleName,
		@LoweredRoleName,
		@Description
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_RolesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_RolesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_RolesDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_RolesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_RolesDelete];
GO

CREATE PROCEDURE [proc_aspnet_RolesDelete]
(
	@RoleId uniqueidentifier
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [aspnet_Roles]
	WHERE
		[RoleId] = @RoleId
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_RolesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_RolesDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_SchemaVersionsLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_SchemaVersionsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_SchemaVersionsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_aspnet_SchemaVersionsLoadByPrimaryKey]
(
	@Feature nvarchar(128),
	@CompatibleSchemaVersion nvarchar(128)
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[Feature],
		[CompatibleSchemaVersion],
		[IsCurrentVersion]
	FROM [aspnet_SchemaVersions]
	WHERE
		([Feature] = @Feature) AND
		([CompatibleSchemaVersion] = @CompatibleSchemaVersion)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_SchemaVersionsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_SchemaVersionsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_SchemaVersionsLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_SchemaVersionsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_SchemaVersionsLoadAll];
GO

CREATE PROCEDURE [proc_aspnet_SchemaVersionsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[Feature],
		[CompatibleSchemaVersion],
		[IsCurrentVersion]
	FROM [aspnet_SchemaVersions]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_SchemaVersionsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_SchemaVersionsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_SchemaVersionsUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_SchemaVersionsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_SchemaVersionsUpdate];
GO

CREATE PROCEDURE [proc_aspnet_SchemaVersionsUpdate]
(
	@Feature nvarchar(128),
	@CompatibleSchemaVersion nvarchar(128),
	@IsCurrentVersion bit
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [aspnet_SchemaVersions]
	SET
		[IsCurrentVersion] = @IsCurrentVersion
	WHERE
		[Feature] = @Feature
	AND	[CompatibleSchemaVersion] = @CompatibleSchemaVersion


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_SchemaVersionsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_SchemaVersionsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_aspnet_SchemaVersionsInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_SchemaVersionsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_SchemaVersionsInsert];
GO

CREATE PROCEDURE [proc_aspnet_SchemaVersionsInsert]
(
	@Feature nvarchar(128),
	@CompatibleSchemaVersion nvarchar(128),
	@IsCurrentVersion bit
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [aspnet_SchemaVersions]
	(
		[Feature],
		[CompatibleSchemaVersion],
		[IsCurrentVersion]
	)
	VALUES
	(
		@Feature,
		@CompatibleSchemaVersion,
		@IsCurrentVersion
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_SchemaVersionsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_SchemaVersionsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_SchemaVersionsDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_SchemaVersionsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_SchemaVersionsDelete];
GO

CREATE PROCEDURE [proc_aspnet_SchemaVersionsDelete]
(
	@Feature nvarchar(128),
	@CompatibleSchemaVersion nvarchar(128)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [aspnet_SchemaVersions]
	WHERE
		[Feature] = @Feature AND
		[CompatibleSchemaVersion] = @CompatibleSchemaVersion
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_SchemaVersionsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_SchemaVersionsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_UsersLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_UsersLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_UsersLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_aspnet_UsersLoadByPrimaryKey]
(
	@UserId uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ApplicationId],
		[UserId],
		[UserName],
		[LoweredUserName],
		[MobileAlias],
		[IsAnonymous],
		[LastActivityDate]
	FROM [aspnet_Users]
	WHERE
		([UserId] = @UserId)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_UsersLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_UsersLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_UsersLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_UsersLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_UsersLoadAll];
GO

CREATE PROCEDURE [proc_aspnet_UsersLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ApplicationId],
		[UserId],
		[UserName],
		[LoweredUserName],
		[MobileAlias],
		[IsAnonymous],
		[LastActivityDate]
	FROM [aspnet_Users]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_UsersLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_UsersLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_UsersUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_UsersUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_UsersUpdate];
GO

CREATE PROCEDURE [proc_aspnet_UsersUpdate]
(
	@ApplicationId uniqueidentifier,
	@UserId uniqueidentifier,
	@UserName nvarchar(256),
	@LoweredUserName nvarchar(256),
	@MobileAlias nvarchar(16) = NULL,
	@IsAnonymous bit,
	@LastActivityDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [aspnet_Users]
	SET
		[ApplicationId] = @ApplicationId,
		[UserName] = @UserName,
		[LoweredUserName] = @LoweredUserName,
		[MobileAlias] = @MobileAlias,
		[IsAnonymous] = @IsAnonymous,
		[LastActivityDate] = @LastActivityDate
	WHERE
		[UserId] = @UserId


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_UsersUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_UsersUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_aspnet_UsersInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_UsersInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_UsersInsert];
GO

CREATE PROCEDURE [proc_aspnet_UsersInsert]
(
	@ApplicationId uniqueidentifier,
	@UserId uniqueidentifier,
	@UserName nvarchar(256),
	@LoweredUserName nvarchar(256),
	@MobileAlias nvarchar(16) = NULL,
	@IsAnonymous bit,
	@LastActivityDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	IF @UserId IS NULL
		 SET @UserId = NEWID()

	SET @Err = @@Error

	IF (@Err <> 0)
	    RETURN @Err


	INSERT
	INTO [aspnet_Users]
	(
		[ApplicationId],
		[UserId],
		[UserName],
		[LoweredUserName],
		[MobileAlias],
		[IsAnonymous],
		[LastActivityDate]
	)
	VALUES
	(
		@ApplicationId,
		@UserId,
		@UserName,
		@LoweredUserName,
		@MobileAlias,
		@IsAnonymous,
		@LastActivityDate
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_UsersInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_UsersInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_UsersDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_UsersDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_UsersDelete];
GO

CREATE PROCEDURE [proc_aspnet_UsersDelete]
(
	@UserId uniqueidentifier
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [aspnet_Users]
	WHERE
		[UserId] = @UserId
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_UsersDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_UsersDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_UsersInRolesLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_UsersInRolesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_UsersInRolesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_aspnet_UsersInRolesLoadByPrimaryKey]
(
	@UserId uniqueidentifier,
	@RoleId uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserId],
		[RoleId]
	FROM [aspnet_UsersInRoles]
	WHERE
		([UserId] = @UserId) AND
		([RoleId] = @RoleId)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_UsersInRolesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_UsersInRolesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_UsersInRolesLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_UsersInRolesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_UsersInRolesLoadAll];
GO

CREATE PROCEDURE [proc_aspnet_UsersInRolesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserId],
		[RoleId]
	FROM [aspnet_UsersInRoles]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_UsersInRolesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_UsersInRolesLoadAll Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


/****** Object:  StoredProcedure [proc_aspnet_UsersInRolesInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_UsersInRolesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_UsersInRolesInsert];
GO

CREATE PROCEDURE [proc_aspnet_UsersInRolesInsert]
(
	@UserId uniqueidentifier,
	@RoleId uniqueidentifier
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	IF @UserId IS NULL
		 SET @UserId = NEWID()

	SET @Err = @@Error

	IF (@Err <> 0)
	    RETURN @Err

	IF @RoleId IS NULL
		 SET @RoleId = NEWID()

	SET @Err = @@Error

	IF (@Err <> 0)
	    RETURN @Err


	INSERT
	INTO [aspnet_UsersInRoles]
	(
		[UserId],
		[RoleId]
	)
	VALUES
	(
		@UserId,
		@RoleId
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_UsersInRolesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_UsersInRolesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_UsersInRolesDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_UsersInRolesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_UsersInRolesDelete];
GO

CREATE PROCEDURE [proc_aspnet_UsersInRolesDelete]
(
	@UserId uniqueidentifier,
	@RoleId uniqueidentifier
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [aspnet_UsersInRoles]
	WHERE
		[UserId] = @UserId AND
		[RoleId] = @RoleId
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_UsersInRolesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_UsersInRolesDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_WebEvent_EventsLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_WebEvent_EventsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_WebEvent_EventsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_aspnet_WebEvent_EventsLoadByPrimaryKey]
(
	@EventId char(32)
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[EventId],
		[EventTimeUtc],
		[EventTime],
		[EventType],
		[EventSequence],
		[EventOccurrence],
		[EventCode],
		[EventDetailCode],
		[Message],
		[ApplicationPath],
		[ApplicationVirtualPath],
		[MachineName],
		[RequestUrl],
		[ExceptionType],
		[Details]
	FROM [aspnet_WebEvent_Events]
	WHERE
		([EventId] = @EventId)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_WebEvent_EventsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_WebEvent_EventsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_WebEvent_EventsLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_WebEvent_EventsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_WebEvent_EventsLoadAll];
GO

CREATE PROCEDURE [proc_aspnet_WebEvent_EventsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[EventId],
		[EventTimeUtc],
		[EventTime],
		[EventType],
		[EventSequence],
		[EventOccurrence],
		[EventCode],
		[EventDetailCode],
		[Message],
		[ApplicationPath],
		[ApplicationVirtualPath],
		[MachineName],
		[RequestUrl],
		[ExceptionType],
		[Details]
	FROM [aspnet_WebEvent_Events]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_WebEvent_EventsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_WebEvent_EventsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_WebEvent_EventsUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_WebEvent_EventsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_WebEvent_EventsUpdate];
GO

CREATE PROCEDURE [proc_aspnet_WebEvent_EventsUpdate]
(
	@EventId char(32),
	@EventTimeUtc datetime,
	@EventTime datetime,
	@EventType nvarchar(256),
	@EventSequence decimal(19,0),
	@EventOccurrence decimal(19,0),
	@EventCode int,
	@EventDetailCode int,
	@Message nvarchar(1024) = NULL,
	@ApplicationPath nvarchar(256) = NULL,
	@ApplicationVirtualPath nvarchar(256) = NULL,
	@MachineName nvarchar(256),
	@RequestUrl nvarchar(1024) = NULL,
	@ExceptionType nvarchar(256) = NULL,
	@Details ntext = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [aspnet_WebEvent_Events]
	SET
		[EventTimeUtc] = @EventTimeUtc,
		[EventTime] = @EventTime,
		[EventType] = @EventType,
		[EventSequence] = @EventSequence,
		[EventOccurrence] = @EventOccurrence,
		[EventCode] = @EventCode,
		[EventDetailCode] = @EventDetailCode,
		[Message] = @Message,
		[ApplicationPath] = @ApplicationPath,
		[ApplicationVirtualPath] = @ApplicationVirtualPath,
		[MachineName] = @MachineName,
		[RequestUrl] = @RequestUrl,
		[ExceptionType] = @ExceptionType,
		[Details] = @Details
	WHERE
		[EventId] = @EventId


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_WebEvent_EventsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_WebEvent_EventsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_aspnet_WebEvent_EventsInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_WebEvent_EventsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_WebEvent_EventsInsert];
GO

CREATE PROCEDURE [proc_aspnet_WebEvent_EventsInsert]
(
	@EventId char(32),
	@EventTimeUtc datetime,
	@EventTime datetime,
	@EventType nvarchar(256),
	@EventSequence decimal(19,0),
	@EventOccurrence decimal(19,0),
	@EventCode int,
	@EventDetailCode int,
	@Message nvarchar(1024) = NULL,
	@ApplicationPath nvarchar(256) = NULL,
	@ApplicationVirtualPath nvarchar(256) = NULL,
	@MachineName nvarchar(256),
	@RequestUrl nvarchar(1024) = NULL,
	@ExceptionType nvarchar(256) = NULL,
	@Details ntext = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [aspnet_WebEvent_Events]
	(
		[EventId],
		[EventTimeUtc],
		[EventTime],
		[EventType],
		[EventSequence],
		[EventOccurrence],
		[EventCode],
		[EventDetailCode],
		[Message],
		[ApplicationPath],
		[ApplicationVirtualPath],
		[MachineName],
		[RequestUrl],
		[ExceptionType],
		[Details]
	)
	VALUES
	(
		@EventId,
		@EventTimeUtc,
		@EventTime,
		@EventType,
		@EventSequence,
		@EventOccurrence,
		@EventCode,
		@EventDetailCode,
		@Message,
		@ApplicationPath,
		@ApplicationVirtualPath,
		@MachineName,
		@RequestUrl,
		@ExceptionType,
		@Details
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_WebEvent_EventsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_WebEvent_EventsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_aspnet_WebEvent_EventsDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_aspnet_WebEvent_EventsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_aspnet_WebEvent_EventsDelete];
GO

CREATE PROCEDURE [proc_aspnet_WebEvent_EventsDelete]
(
	@EventId char(32)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [aspnet_WebEvent_Events]
	WHERE
		[EventId] = @EventId
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_aspnet_WebEvent_EventsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_aspnet_WebEvent_EventsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoriesLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CategoriesLoadByPrimaryKey]
(
	@CategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[CategoryName]
	FROM [Categories]
	WHERE
		([CategoryID] = @CategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoriesLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesLoadAll];
GO

CREATE PROCEDURE [proc_CategoriesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[CategoryName]
	FROM [Categories]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoriesUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesUpdate];
GO

CREATE PROCEDURE [proc_CategoriesUpdate]
(
	@CategoryID int,
	@CategoryName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Categories]
	SET
		[CategoryName] = @CategoryName
	WHERE
		[CategoryID] = @CategoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CategoriesInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesInsert];
GO

CREATE PROCEDURE [proc_CategoriesInsert]
(
	@CategoryID int = NULL output,
	@CategoryName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Categories]
	(
		[CategoryName]
	)
	VALUES
	(
		@CategoryName
	)

	SET @Err = @@Error

	SELECT @CategoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoriesDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesDelete];
GO

CREATE PROCEDURE [proc_CategoriesDelete]
(
	@CategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Categories]
	WHERE
		[CategoryID] = @CategoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ClientsLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ClientsLoadByPrimaryKey]
(
	@ClientID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ClientID],
		[ClientName],
		[ClientPhone],
		[ClientEmail],
		[ClientCode]
	FROM [Clients]
	WHERE
		([ClientID] = @ClientID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ClientsLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsLoadAll];
GO

CREATE PROCEDURE [proc_ClientsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ClientID],
		[ClientName],
		[ClientPhone],
		[ClientEmail],
		[ClientCode]
	FROM [Clients]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ClientsUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsUpdate];
GO

CREATE PROCEDURE [proc_ClientsUpdate]
(
	@ClientID int,
	@ClientName nvarchar(300) = NULL,
	@ClientPhone nvarchar(50) = NULL,
	@ClientEmail nvarchar(300) = NULL,
	@ClientCode nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Clients]
	SET
		[ClientName] = @ClientName,
		[ClientPhone] = @ClientPhone,
		[ClientEmail] = @ClientEmail,
		[ClientCode] = @ClientCode
	WHERE
		[ClientID] = @ClientID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ClientsInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsInsert];
GO

CREATE PROCEDURE [proc_ClientsInsert]
(
	@ClientID int = NULL output,
	@ClientName nvarchar(300) = NULL,
	@ClientPhone nvarchar(50) = NULL,
	@ClientEmail nvarchar(300) = NULL,
	@ClientCode nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Clients]
	(
		[ClientName],
		[ClientPhone],
		[ClientEmail],
		[ClientCode]
	)
	VALUES
	(
		@ClientName,
		@ClientPhone,
		@ClientEmail,
		@ClientCode
	)

	SET @Err = @@Error

	SELECT @ClientID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ClientsDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsDelete];
GO

CREATE PROCEDURE [proc_ClientsDelete]
(
	@ClientID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Clients]
	WHERE
		[ClientID] = @ClientID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DeliveryOrderLoadByPrimaryKey]
(
	@DeliveryOrderID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeliveryOrderID],
		[KilometerCounterBefore],
		[KilometerCounterAfter],
		[TotalPrice],
		[DeliveryOrderStatusID],
		[GeneralDeliveryCode],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[TransformationSupplier],
		[DriverName],
		[DriverNationID],
		[CarNumber],
		[DriverTelephone],
		[WatingHours],
		[PermationNumber],
		[Department],
		[ClientCode],
		[DeliveryOrderName],
		[DeliveryOrderDate],
		[DepartmentResponsableName],
		[CarType],
		[DepartmentID]
	FROM [DeliveryOrder]
	WHERE
		([DeliveryOrderID] = @DeliveryOrderID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderLoadAll];
GO

CREATE PROCEDURE [proc_DeliveryOrderLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeliveryOrderID],
		[KilometerCounterBefore],
		[KilometerCounterAfter],
		[TotalPrice],
		[DeliveryOrderStatusID],
		[GeneralDeliveryCode],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[TransformationSupplier],
		[DriverName],
		[DriverNationID],
		[CarNumber],
		[DriverTelephone],
		[WatingHours],
		[PermationNumber],
		[Department],
		[ClientCode],
		[DeliveryOrderName],
		[DeliveryOrderDate],
		[DepartmentResponsableName],
		[CarType],
		[DepartmentID]
	FROM [DeliveryOrder]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderUpdate];
GO

CREATE PROCEDURE [proc_DeliveryOrderUpdate]
(
	@DeliveryOrderID int,
	@KilometerCounterBefore decimal(8,2) = NULL,
	@KilometerCounterAfter decimal(8,2) = NULL,
	@TotalPrice float = NULL,
	@DeliveryOrderStatusID int = NULL,
	@GeneralDeliveryCode nvarchar(300) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@TransformationSupplier nvarchar(300) = NULL,
	@DriverName nvarchar(300) = NULL,
	@DriverNationID nvarchar(100) = NULL,
	@CarNumber nvarchar(50) = NULL,
	@DriverTelephone nvarchar(50) = NULL,
	@WatingHours float = NULL,
	@PermationNumber int = NULL,
	@Department nvarchar(300) = NULL,
	@ClientCode int = NULL,
	@DeliveryOrderName nvarchar(300) = NULL,
	@DeliveryOrderDate datetime = NULL,
	@DepartmentResponsableName nvarchar(300) = NULL,
	@CarType nvarchar(300) = NULL,
	@DepartmentID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DeliveryOrder]
	SET
		[KilometerCounterBefore] = @KilometerCounterBefore,
		[KilometerCounterAfter] = @KilometerCounterAfter,
		[TotalPrice] = @TotalPrice,
		[DeliveryOrderStatusID] = @DeliveryOrderStatusID,
		[GeneralDeliveryCode] = @GeneralDeliveryCode,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate,
		[TransformationSupplier] = @TransformationSupplier,
		[DriverName] = @DriverName,
		[DriverNationID] = @DriverNationID,
		[CarNumber] = @CarNumber,
		[DriverTelephone] = @DriverTelephone,
		[WatingHours] = @WatingHours,
		[PermationNumber] = @PermationNumber,
		[Department] = @Department,
		[ClientCode] = @ClientCode,
		[DeliveryOrderName] = @DeliveryOrderName,
		[DeliveryOrderDate] = @DeliveryOrderDate,
		[DepartmentResponsableName] = @DepartmentResponsableName,
		[CarType] = @CarType,
		[DepartmentID] = @DepartmentID
	WHERE
		[DeliveryOrderID] = @DeliveryOrderID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DeliveryOrderInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderInsert];
GO

CREATE PROCEDURE [proc_DeliveryOrderInsert]
(
	@DeliveryOrderID int = NULL output,
	@KilometerCounterBefore decimal(8,2) = NULL,
	@KilometerCounterAfter decimal(8,2) = NULL,
	@TotalPrice float = NULL,
	@DeliveryOrderStatusID int = NULL,
	@GeneralDeliveryCode nvarchar(300) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@TransformationSupplier nvarchar(300) = NULL,
	@DriverName nvarchar(300) = NULL,
	@DriverNationID nvarchar(100) = NULL,
	@CarNumber nvarchar(50) = NULL,
	@DriverTelephone nvarchar(50) = NULL,
	@WatingHours float = NULL,
	@PermationNumber int = NULL,
	@Department nvarchar(300) = NULL,
	@ClientCode int = NULL,
	@DeliveryOrderName nvarchar(300) = NULL,
	@DeliveryOrderDate datetime = NULL,
	@DepartmentResponsableName nvarchar(300) = NULL,
	@CarType nvarchar(300) = NULL,
	@DepartmentID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DeliveryOrder]
	(
		[KilometerCounterBefore],
		[KilometerCounterAfter],
		[TotalPrice],
		[DeliveryOrderStatusID],
		[GeneralDeliveryCode],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[TransformationSupplier],
		[DriverName],
		[DriverNationID],
		[CarNumber],
		[DriverTelephone],
		[WatingHours],
		[PermationNumber],
		[Department],
		[ClientCode],
		[DeliveryOrderName],
		[DeliveryOrderDate],
		[DepartmentResponsableName],
		[CarType],
		[DepartmentID]
	)
	VALUES
	(
		@KilometerCounterBefore,
		@KilometerCounterAfter,
		@TotalPrice,
		@DeliveryOrderStatusID,
		@GeneralDeliveryCode,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate,
		@TransformationSupplier,
		@DriverName,
		@DriverNationID,
		@CarNumber,
		@DriverTelephone,
		@WatingHours,
		@PermationNumber,
		@Department,
		@ClientCode,
		@DeliveryOrderName,
		@DeliveryOrderDate,
		@DepartmentResponsableName,
		@CarType,
		@DepartmentID
	)

	SET @Err = @@Error

	SELECT @DeliveryOrderID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderDelete];
GO

CREATE PROCEDURE [proc_DeliveryOrderDelete]
(
	@DeliveryOrderID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DeliveryOrder]
	WHERE
		[DeliveryOrderID] = @DeliveryOrderID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderDetailsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderDetailsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DeliveryOrderDetailsLoadByPrimaryKey]
(
	@DeliveryOrderDetailsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeliveryOrderDetailsID],
		[DeliveryOrderID],
		[DeliveryOrderStatusID],
		[DeliveryFrom],
		[DeliveryTo],
		[DateFrom],
		[DateTo],
		[ReceivableName],
		[ReceivableTelephone],
		[Price],
		[DeliveryOrderCode],
		[DeliveryOrderDetailsStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[WatingHours]
	FROM [DeliveryOrderDetails]
	WHERE
		([DeliveryOrderDetailsID] = @DeliveryOrderDetailsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderDetailsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderDetailsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderDetailsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderDetailsLoadAll];
GO

CREATE PROCEDURE [proc_DeliveryOrderDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeliveryOrderDetailsID],
		[DeliveryOrderID],
		[DeliveryOrderStatusID],
		[DeliveryFrom],
		[DeliveryTo],
		[DateFrom],
		[DateTo],
		[ReceivableName],
		[ReceivableTelephone],
		[Price],
		[DeliveryOrderCode],
		[DeliveryOrderDetailsStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[WatingHours]
	FROM [DeliveryOrderDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderDetailsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderDetailsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderDetailsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderDetailsUpdate];
GO

CREATE PROCEDURE [proc_DeliveryOrderDetailsUpdate]
(
	@DeliveryOrderDetailsID int,
	@DeliveryOrderID int = NULL,
	@DeliveryOrderStatusID int = NULL,
	@DeliveryFrom nvarchar(300) = NULL,
	@DeliveryTo nvarchar(300) = NULL,
	@DateFrom datetime = NULL,
	@DateTo datetime = NULL,
	@ReceivableName nvarchar(300) = NULL,
	@ReceivableTelephone nvarchar(50) = NULL,
	@Price float = NULL,
	@DeliveryOrderCode nvarchar(300) = NULL,
	@DeliveryOrderDetailsStatusID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@WatingHours float = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DeliveryOrderDetails]
	SET
		[DeliveryOrderID] = @DeliveryOrderID,
		[DeliveryOrderStatusID] = @DeliveryOrderStatusID,
		[DeliveryFrom] = @DeliveryFrom,
		[DeliveryTo] = @DeliveryTo,
		[DateFrom] = @DateFrom,
		[DateTo] = @DateTo,
		[ReceivableName] = @ReceivableName,
		[ReceivableTelephone] = @ReceivableTelephone,
		[Price] = @Price,
		[DeliveryOrderCode] = @DeliveryOrderCode,
		[DeliveryOrderDetailsStatusID] = @DeliveryOrderDetailsStatusID,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate,
		[WatingHours] = @WatingHours
	WHERE
		[DeliveryOrderDetailsID] = @DeliveryOrderDetailsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderDetailsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderDetailsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderDetailsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderDetailsInsert];
GO

CREATE PROCEDURE [proc_DeliveryOrderDetailsInsert]
(
	@DeliveryOrderDetailsID int = NULL output,
	@DeliveryOrderID int = NULL,
	@DeliveryOrderStatusID int = NULL,
	@DeliveryFrom nvarchar(300) = NULL,
	@DeliveryTo nvarchar(300) = NULL,
	@DateFrom datetime = NULL,
	@DateTo datetime = NULL,
	@ReceivableName nvarchar(300) = NULL,
	@ReceivableTelephone nvarchar(50) = NULL,
	@Price float = NULL,
	@DeliveryOrderCode nvarchar(300) = NULL,
	@DeliveryOrderDetailsStatusID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@WatingHours float = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DeliveryOrderDetails]
	(
		[DeliveryOrderID],
		[DeliveryOrderStatusID],
		[DeliveryFrom],
		[DeliveryTo],
		[DateFrom],
		[DateTo],
		[ReceivableName],
		[ReceivableTelephone],
		[Price],
		[DeliveryOrderCode],
		[DeliveryOrderDetailsStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[WatingHours]
	)
	VALUES
	(
		@DeliveryOrderID,
		@DeliveryOrderStatusID,
		@DeliveryFrom,
		@DeliveryTo,
		@DateFrom,
		@DateTo,
		@ReceivableName,
		@ReceivableTelephone,
		@Price,
		@DeliveryOrderCode,
		@DeliveryOrderDetailsStatusID,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate,
		@WatingHours
	)

	SET @Err = @@Error

	SELECT @DeliveryOrderDetailsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderDetailsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderDetailsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderDetailsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderDetailsDelete];
GO

CREATE PROCEDURE [proc_DeliveryOrderDetailsDelete]
(
	@DeliveryOrderDetailsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DeliveryOrderDetails]
	WHERE
		[DeliveryOrderDetailsID] = @DeliveryOrderDetailsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderDetailsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderDetailsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderStatusLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderStatusLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderStatusLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DeliveryOrderStatusLoadByPrimaryKey]
(
	@DeliveryOrderStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeliveryOrderStatusID],
		[DeliveryOrderStatusName],
		[DeliveryOrderStatusNameAr],
		[StatusClass]
	FROM [DeliveryOrderStatus]
	WHERE
		([DeliveryOrderStatusID] = @DeliveryOrderStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderStatusLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderStatusLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderStatusLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderStatusLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderStatusLoadAll];
GO

CREATE PROCEDURE [proc_DeliveryOrderStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeliveryOrderStatusID],
		[DeliveryOrderStatusName],
		[DeliveryOrderStatusNameAr],
		[StatusClass]
	FROM [DeliveryOrderStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderStatusLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderStatusLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderStatusUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderStatusUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderStatusUpdate];
GO

CREATE PROCEDURE [proc_DeliveryOrderStatusUpdate]
(
	@DeliveryOrderStatusID int,
	@DeliveryOrderStatusName nvarchar(300) = NULL,
	@DeliveryOrderStatusNameAr nvarchar(300) = NULL,
	@StatusClass nvarchar(100) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DeliveryOrderStatus]
	SET
		[DeliveryOrderStatusName] = @DeliveryOrderStatusName,
		[DeliveryOrderStatusNameAr] = @DeliveryOrderStatusNameAr,
		[StatusClass] = @StatusClass
	WHERE
		[DeliveryOrderStatusID] = @DeliveryOrderStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderStatusUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderStatusUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DeliveryOrderStatusInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderStatusInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderStatusInsert];
GO

CREATE PROCEDURE [proc_DeliveryOrderStatusInsert]
(
	@DeliveryOrderStatusID int = NULL output,
	@DeliveryOrderStatusName nvarchar(300) = NULL,
	@DeliveryOrderStatusNameAr nvarchar(300) = NULL,
	@StatusClass nvarchar(100) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DeliveryOrderStatus]
	(
		[DeliveryOrderStatusName],
		[DeliveryOrderStatusNameAr],
		[StatusClass]
	)
	VALUES
	(
		@DeliveryOrderStatusName,
		@DeliveryOrderStatusNameAr,
		@StatusClass
	)

	SET @Err = @@Error

	SELECT @DeliveryOrderStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderStatusInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderStatusInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderStatusDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderStatusDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderStatusDelete];
GO

CREATE PROCEDURE [proc_DeliveryOrderStatusDelete]
(
	@DeliveryOrderStatusID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DeliveryOrderStatus]
	WHERE
		[DeliveryOrderStatusID] = @DeliveryOrderStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderStatusDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderStatusDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DepartmentLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DepartmentLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DepartmentLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DepartmentLoadByPrimaryKey]
(
	@DepartmentID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DepartmentID],
		[DepartmentName]
	FROM [Department]
	WHERE
		([DepartmentID] = @DepartmentID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DepartmentLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DepartmentLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DepartmentLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DepartmentLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DepartmentLoadAll];
GO

CREATE PROCEDURE [proc_DepartmentLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DepartmentID],
		[DepartmentName]
	FROM [Department]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DepartmentLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DepartmentLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DepartmentUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DepartmentUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DepartmentUpdate];
GO

CREATE PROCEDURE [proc_DepartmentUpdate]
(
	@DepartmentID int,
	@DepartmentName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Department]
	SET
		[DepartmentName] = @DepartmentName
	WHERE
		[DepartmentID] = @DepartmentID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DepartmentUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DepartmentUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DepartmentInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DepartmentInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DepartmentInsert];
GO

CREATE PROCEDURE [proc_DepartmentInsert]
(
	@DepartmentID int = NULL output,
	@DepartmentName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Department]
	(
		[DepartmentName]
	)
	VALUES
	(
		@DepartmentName
	)

	SET @Err = @@Error

	SELECT @DepartmentID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DepartmentInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DepartmentInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DepartmentDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DepartmentDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DepartmentDelete];
GO

CREATE PROCEDURE [proc_DepartmentDelete]
(
	@DepartmentID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Department]
	WHERE
		[DepartmentID] = @DepartmentID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DepartmentDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DepartmentDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignDetailsLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignDetailsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignDetailsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DesignDetailsLoadByPrimaryKey]
(
	@DesignDetailsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DesignDetailsID],
		[JobOrderID],
		[DesignerID],
		[JobOrderStatusID],
		[StartDate],
		[EndDate],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [DesignDetails]
	WHERE
		([DesignDetailsID] = @DesignDetailsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignDetailsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignDetailsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignDetailsLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignDetailsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignDetailsLoadAll];
GO

CREATE PROCEDURE [proc_DesignDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DesignDetailsID],
		[JobOrderID],
		[DesignerID],
		[JobOrderStatusID],
		[StartDate],
		[EndDate],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [DesignDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignDetailsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignDetailsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignDetailsUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignDetailsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignDetailsUpdate];
GO

CREATE PROCEDURE [proc_DesignDetailsUpdate]
(
	@DesignDetailsID int,
	@JobOrderID int = NULL,
	@DesignerID int = NULL,
	@JobOrderStatusID int = NULL,
	@StartDate datetime = NULL,
	@EndDate datetime = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DesignDetails]
	SET
		[JobOrderID] = @JobOrderID,
		[DesignerID] = @DesignerID,
		[JobOrderStatusID] = @JobOrderStatusID,
		[StartDate] = @StartDate,
		[EndDate] = @EndDate,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[DesignDetailsID] = @DesignDetailsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignDetailsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignDetailsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DesignDetailsInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignDetailsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignDetailsInsert];
GO

CREATE PROCEDURE [proc_DesignDetailsInsert]
(
	@DesignDetailsID int = NULL output,
	@JobOrderID int = NULL,
	@DesignerID int = NULL,
	@JobOrderStatusID int = NULL,
	@StartDate datetime = NULL,
	@EndDate datetime = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DesignDetails]
	(
		[JobOrderID],
		[DesignerID],
		[JobOrderStatusID],
		[StartDate],
		[EndDate],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@JobOrderID,
		@DesignerID,
		@JobOrderStatusID,
		@StartDate,
		@EndDate,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @DesignDetailsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignDetailsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignDetailsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignDetailsDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignDetailsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignDetailsDelete];
GO

CREATE PROCEDURE [proc_DesignDetailsDelete]
(
	@DesignDetailsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DesignDetails]
	WHERE
		[DesignDetailsID] = @DesignDetailsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignDetailsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignDetailsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignservicesTypeLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DesignservicesTypeLoadByPrimaryKey]
(
	@DesignservicesTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DesignservicesTypeID],
		[DigitalPrintingDetailsID],
		[ServiceID]
	FROM [DesignservicesType]
	WHERE
		([DesignservicesTypeID] = @DesignservicesTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignservicesTypeLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeLoadAll];
GO

CREATE PROCEDURE [proc_DesignservicesTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DesignservicesTypeID],
		[DigitalPrintingDetailsID],
		[ServiceID]
	FROM [DesignservicesType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignservicesTypeUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeUpdate];
GO

CREATE PROCEDURE [proc_DesignservicesTypeUpdate]
(
	@DesignservicesTypeID int,
	@DigitalPrintingDetailsID int = NULL,
	@ServiceID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DesignservicesType]
	SET
		[DigitalPrintingDetailsID] = @DigitalPrintingDetailsID,
		[ServiceID] = @ServiceID
	WHERE
		[DesignservicesTypeID] = @DesignservicesTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DesignservicesTypeInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeInsert];
GO

CREATE PROCEDURE [proc_DesignservicesTypeInsert]
(
	@DesignservicesTypeID int = NULL output,
	@DigitalPrintingDetailsID int = NULL,
	@ServiceID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DesignservicesType]
	(
		[DigitalPrintingDetailsID],
		[ServiceID]
	)
	VALUES
	(
		@DigitalPrintingDetailsID,
		@ServiceID
	)

	SET @Err = @@Error

	SELECT @DesignservicesTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignservicesTypeDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeDelete];
GO

CREATE PROCEDURE [proc_DesignservicesTypeDelete]
(
	@DesignservicesTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DesignservicesType]
	WHERE
		[DesignservicesTypeID] = @DesignservicesTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DigitalPrintingDetailsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DigitalPrintingDetailsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DigitalPrintingDetailsLoadByPrimaryKey]
(
	@DigitalPrintingDetailsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DigitalPrintingDetailsID],
		[JobOrderID],
		[PrintingTypeID],
		[IsRAndV],
		[SupplierID],
		[DeliveryDoneTo],
		[JobOrderStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [DigitalPrintingDetails]
	WHERE
		([DigitalPrintingDetailsID] = @DigitalPrintingDetailsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DigitalPrintingDetailsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DigitalPrintingDetailsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DigitalPrintingDetailsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DigitalPrintingDetailsLoadAll];
GO

CREATE PROCEDURE [proc_DigitalPrintingDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DigitalPrintingDetailsID],
		[JobOrderID],
		[PrintingTypeID],
		[IsRAndV],
		[SupplierID],
		[DeliveryDoneTo],
		[JobOrderStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [DigitalPrintingDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DigitalPrintingDetailsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DigitalPrintingDetailsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DigitalPrintingDetailsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DigitalPrintingDetailsUpdate];
GO

CREATE PROCEDURE [proc_DigitalPrintingDetailsUpdate]
(
	@DigitalPrintingDetailsID int,
	@JobOrderID int = NULL,
	@PrintingTypeID int = NULL,
	@IsRAndV bit = NULL,
	@SupplierID int = NULL,
	@DeliveryDoneTo int = NULL,
	@JobOrderStatusID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DigitalPrintingDetails]
	SET
		[JobOrderID] = @JobOrderID,
		[PrintingTypeID] = @PrintingTypeID,
		[IsRAndV] = @IsRAndV,
		[SupplierID] = @SupplierID,
		[DeliveryDoneTo] = @DeliveryDoneTo,
		[JobOrderStatusID] = @JobOrderStatusID,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[DigitalPrintingDetailsID] = @DigitalPrintingDetailsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DigitalPrintingDetailsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DigitalPrintingDetailsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DigitalPrintingDetailsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DigitalPrintingDetailsInsert];
GO

CREATE PROCEDURE [proc_DigitalPrintingDetailsInsert]
(
	@DigitalPrintingDetailsID int = NULL output,
	@JobOrderID int = NULL,
	@PrintingTypeID int = NULL,
	@IsRAndV bit = NULL,
	@SupplierID int = NULL,
	@DeliveryDoneTo int = NULL,
	@JobOrderStatusID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DigitalPrintingDetails]
	(
		[JobOrderID],
		[PrintingTypeID],
		[IsRAndV],
		[SupplierID],
		[DeliveryDoneTo],
		[JobOrderStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@JobOrderID,
		@PrintingTypeID,
		@IsRAndV,
		@SupplierID,
		@DeliveryDoneTo,
		@JobOrderStatusID,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @DigitalPrintingDetailsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DigitalPrintingDetailsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DigitalPrintingDetailsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DigitalPrintingDetailsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DigitalPrintingDetailsDelete];
GO

CREATE PROCEDURE [proc_DigitalPrintingDetailsDelete]
(
	@DigitalPrintingDetailsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DigitalPrintingDetails]
	WHERE
		[DigitalPrintingDetailsID] = @DigitalPrintingDetailsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DigitalPrintingDetailsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DigitalPrintingDetailsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GeneralLookupLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_GeneralLookupLoadByPrimaryKey]
(
	@GeneralLookupID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GeneralLookupID],
		[CategoryID],
		[Name],
		[Address],
		[Telephone],
		[Email]
	FROM [GeneralLookup]
	WHERE
		([GeneralLookupID] = @GeneralLookupID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GeneralLookupLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupLoadAll];
GO

CREATE PROCEDURE [proc_GeneralLookupLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GeneralLookupID],
		[CategoryID],
		[Name],
		[Address],
		[Telephone],
		[Email]
	FROM [GeneralLookup]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GeneralLookupUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupUpdate];
GO

CREATE PROCEDURE [proc_GeneralLookupUpdate]
(
	@GeneralLookupID int,
	@CategoryID int = NULL,
	@Name nvarchar(300) = NULL,
	@Address nvarchar(300) = NULL,
	@Telephone nvarchar(300) = NULL,
	@Email nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [GeneralLookup]
	SET
		[CategoryID] = @CategoryID,
		[Name] = @Name,
		[Address] = @Address,
		[Telephone] = @Telephone,
		[Email] = @Email
	WHERE
		[GeneralLookupID] = @GeneralLookupID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_GeneralLookupInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupInsert];
GO

CREATE PROCEDURE [proc_GeneralLookupInsert]
(
	@GeneralLookupID int = NULL output,
	@CategoryID int = NULL,
	@Name nvarchar(300) = NULL,
	@Address nvarchar(300) = NULL,
	@Telephone nvarchar(300) = NULL,
	@Email nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [GeneralLookup]
	(
		[CategoryID],
		[Name],
		[Address],
		[Telephone],
		[Email]
	)
	VALUES
	(
		@CategoryID,
		@Name,
		@Address,
		@Telephone,
		@Email
	)

	SET @Err = @@Error

	SELECT @GeneralLookupID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GeneralLookupDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupDelete];
GO

CREATE PROCEDURE [proc_GeneralLookupDelete]
(
	@GeneralLookupID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [GeneralLookup]
	WHERE
		[GeneralLookupID] = @GeneralLookupID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiveawaysLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_GiveawaysLoadByPrimaryKey]
(
	@GiveawayID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GiveawayID],
		[JobOrderID],
		[ItemName],
		[GiveawayDescription],
		[GiveawayQuantity],
		[PricePerItem],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [Giveaways]
	WHERE
		([GiveawayID] = @GiveawayID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiveawaysLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysLoadAll];
GO

CREATE PROCEDURE [proc_GiveawaysLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GiveawayID],
		[JobOrderID],
		[ItemName],
		[GiveawayDescription],
		[GiveawayQuantity],
		[PricePerItem],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [Giveaways]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiveawaysUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysUpdate];
GO

CREATE PROCEDURE [proc_GiveawaysUpdate]
(
	@GiveawayID int,
	@JobOrderID int = NULL,
	@ItemName nvarchar(300) = NULL,
	@GiveawayDescription nvarchar(300) = NULL,
	@GiveawayQuantity int = NULL,
	@PricePerItem float = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Giveaways]
	SET
		[JobOrderID] = @JobOrderID,
		[ItemName] = @ItemName,
		[GiveawayDescription] = @GiveawayDescription,
		[GiveawayQuantity] = @GiveawayQuantity,
		[PricePerItem] = @PricePerItem,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[GiveawayID] = @GiveawayID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_GiveawaysInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysInsert];
GO

CREATE PROCEDURE [proc_GiveawaysInsert]
(
	@GiveawayID int = NULL output,
	@JobOrderID int = NULL,
	@ItemName nvarchar(300) = NULL,
	@GiveawayDescription nvarchar(300) = NULL,
	@GiveawayQuantity int = NULL,
	@PricePerItem float = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Giveaways]
	(
		[JobOrderID],
		[ItemName],
		[GiveawayDescription],
		[GiveawayQuantity],
		[PricePerItem],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@JobOrderID,
		@ItemName,
		@GiveawayDescription,
		@GiveawayQuantity,
		@PricePerItem,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @GiveawayID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiveawaysDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysDelete];
GO

CREATE PROCEDURE [proc_GiveawaysDelete]
(
	@GiveawayID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Giveaways]
	WHERE
		[GiveawayID] = @GiveawayID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InAndOutDoorDetailsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InAndOutDoorDetailsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_InAndOutDoorDetailsLoadByPrimaryKey]
(
	@InAndOutDoorDetailsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[InAndOutDoorDetailsID],
		[Item],
		[MaterialID],
		[LaminationID],
		[ServiceID],
		[Picture],
		[DeliveryDate],
		[Width],
		[Hight],
		[TotalSize],
		[DeliveryTo],
		[JobOrderStatusID],
		[JobOrderID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [InAndOutDoorDetails]
	WHERE
		([InAndOutDoorDetailsID] = @InAndOutDoorDetailsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_InAndOutDoorDetailsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_InAndOutDoorDetailsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InAndOutDoorDetailsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InAndOutDoorDetailsLoadAll];
GO

CREATE PROCEDURE [proc_InAndOutDoorDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[InAndOutDoorDetailsID],
		[Item],
		[MaterialID],
		[LaminationID],
		[ServiceID],
		[Picture],
		[DeliveryDate],
		[Width],
		[Hight],
		[TotalSize],
		[DeliveryTo],
		[JobOrderStatusID],
		[JobOrderID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [InAndOutDoorDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_InAndOutDoorDetailsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_InAndOutDoorDetailsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InAndOutDoorDetailsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InAndOutDoorDetailsUpdate];
GO

CREATE PROCEDURE [proc_InAndOutDoorDetailsUpdate]
(
	@InAndOutDoorDetailsID int,
	@Item nvarchar(500) = NULL,
	@MaterialID int = NULL,
	@LaminationID int = NULL,
	@ServiceID int = NULL,
	@Picture nvarchar(500) = NULL,
	@DeliveryDate datetime = NULL,
	@Width decimal(6,2) = NULL,
	@Hight decimal(6,2) = NULL,
	@TotalSize decimal(6,2) = NULL,
	@DeliveryTo nvarchar(500) = NULL,
	@JobOrderStatusID int = NULL,
	@JobOrderID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [InAndOutDoorDetails]
	SET
		[Item] = @Item,
		[MaterialID] = @MaterialID,
		[LaminationID] = @LaminationID,
		[ServiceID] = @ServiceID,
		[Picture] = @Picture,
		[DeliveryDate] = @DeliveryDate,
		[Width] = @Width,
		[Hight] = @Hight,
		[TotalSize] = @TotalSize,
		[DeliveryTo] = @DeliveryTo,
		[JobOrderStatusID] = @JobOrderStatusID,
		[JobOrderID] = @JobOrderID,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[InAndOutDoorDetailsID] = @InAndOutDoorDetailsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_InAndOutDoorDetailsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_InAndOutDoorDetailsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InAndOutDoorDetailsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InAndOutDoorDetailsInsert];
GO

CREATE PROCEDURE [proc_InAndOutDoorDetailsInsert]
(
	@InAndOutDoorDetailsID int = NULL output,
	@Item nvarchar(500) = NULL,
	@MaterialID int = NULL,
	@LaminationID int = NULL,
	@ServiceID int = NULL,
	@Picture nvarchar(500) = NULL,
	@DeliveryDate datetime = NULL,
	@Width decimal(6,2) = NULL,
	@Hight decimal(6,2) = NULL,
	@TotalSize decimal(6,2) = NULL,
	@DeliveryTo nvarchar(500) = NULL,
	@JobOrderStatusID int = NULL,
	@JobOrderID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [InAndOutDoorDetails]
	(
		[Item],
		[MaterialID],
		[LaminationID],
		[ServiceID],
		[Picture],
		[DeliveryDate],
		[Width],
		[Hight],
		[TotalSize],
		[DeliveryTo],
		[JobOrderStatusID],
		[JobOrderID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@Item,
		@MaterialID,
		@LaminationID,
		@ServiceID,
		@Picture,
		@DeliveryDate,
		@Width,
		@Hight,
		@TotalSize,
		@DeliveryTo,
		@JobOrderStatusID,
		@JobOrderID,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @InAndOutDoorDetailsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_InAndOutDoorDetailsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_InAndOutDoorDetailsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InAndOutDoorDetailsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InAndOutDoorDetailsDelete];
GO

CREATE PROCEDURE [proc_InAndOutDoorDetailsDelete]
(
	@InAndOutDoorDetailsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [InAndOutDoorDetails]
	WHERE
		[InAndOutDoorDetailsID] = @InAndOutDoorDetailsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_InAndOutDoorDetailsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_InAndOutDoorDetailsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_JobOrderLoadByPrimaryKey]
(
	@JobOrderID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[JobOrderID],
		[JobOrderStatusID],
		[JobOrderCode],
		[JobOrderDescription],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[JobOrderName],
		[ClientID]
	FROM [JobOrder]
	WHERE
		([JobOrderID] = @JobOrderID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderLoadAll];
GO

CREATE PROCEDURE [proc_JobOrderLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[JobOrderID],
		[JobOrderStatusID],
		[JobOrderCode],
		[JobOrderDescription],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[JobOrderName],
		[ClientID]
	FROM [JobOrder]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderUpdate];
GO

CREATE PROCEDURE [proc_JobOrderUpdate]
(
	@JobOrderID int,
	@JobOrderStatusID int = NULL,
	@JobOrderCode nvarchar(300) = NULL,
	@JobOrderDescription nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@JobOrderName nvarchar(300) = NULL,
	@ClientID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [JobOrder]
	SET
		[JobOrderStatusID] = @JobOrderStatusID,
		[JobOrderCode] = @JobOrderCode,
		[JobOrderDescription] = @JobOrderDescription,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate,
		[JobOrderName] = @JobOrderName,
		[ClientID] = @ClientID
	WHERE
		[JobOrderID] = @JobOrderID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_JobOrderInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderInsert];
GO

CREATE PROCEDURE [proc_JobOrderInsert]
(
	@JobOrderID int = NULL output,
	@JobOrderStatusID int = NULL,
	@JobOrderCode nvarchar(300) = NULL,
	@JobOrderDescription nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@JobOrderName nvarchar(300) = NULL,
	@ClientID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [JobOrder]
	(
		[JobOrderStatusID],
		[JobOrderCode],
		[JobOrderDescription],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[JobOrderName],
		[ClientID]
	)
	VALUES
	(
		@JobOrderStatusID,
		@JobOrderCode,
		@JobOrderDescription,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate,
		@JobOrderName,
		@ClientID
	)

	SET @Err = @@Error

	SELECT @JobOrderID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderDelete];
GO

CREATE PROCEDURE [proc_JobOrderDelete]
(
	@JobOrderID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [JobOrder]
	WHERE
		[JobOrderID] = @JobOrderID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderStatusLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderStatusLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderStatusLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_JobOrderStatusLoadByPrimaryKey]
(
	@JobOrderStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[JobOrderStatusID],
		[JobOrderStatusName],
		[JobOrderStatusNameAr],
		[StatusClass]
	FROM [JobOrderStatus]
	WHERE
		([JobOrderStatusID] = @JobOrderStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderStatusLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderStatusLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderStatusLoadAll]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderStatusLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderStatusLoadAll];
GO

CREATE PROCEDURE [proc_JobOrderStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[JobOrderStatusID],
		[JobOrderStatusName],
		[JobOrderStatusNameAr],
		[StatusClass]
	FROM [JobOrderStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderStatusLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderStatusLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderStatusUpdate]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderStatusUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderStatusUpdate];
GO

CREATE PROCEDURE [proc_JobOrderStatusUpdate]
(
	@JobOrderStatusID int,
	@JobOrderStatusName nvarchar(300) = NULL,
	@JobOrderStatusNameAr nvarchar(300) = NULL,
	@StatusClass nvarchar(100) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [JobOrderStatus]
	SET
		[JobOrderStatusName] = @JobOrderStatusName,
		[JobOrderStatusNameAr] = @JobOrderStatusNameAr,
		[StatusClass] = @StatusClass
	WHERE
		[JobOrderStatusID] = @JobOrderStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderStatusUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderStatusUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_JobOrderStatusInsert]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderStatusInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderStatusInsert];
GO

CREATE PROCEDURE [proc_JobOrderStatusInsert]
(
	@JobOrderStatusID int = NULL output,
	@JobOrderStatusName nvarchar(300) = NULL,
	@JobOrderStatusNameAr nvarchar(300) = NULL,
	@StatusClass nvarchar(100) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [JobOrderStatus]
	(
		[JobOrderStatusName],
		[JobOrderStatusNameAr],
		[StatusClass]
	)
	VALUES
	(
		@JobOrderStatusName,
		@JobOrderStatusNameAr,
		@StatusClass
	)

	SET @Err = @@Error

	SELECT @JobOrderStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderStatusInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderStatusInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderStatusDelete]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderStatusDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderStatusDelete];
GO

CREATE PROCEDURE [proc_JobOrderStatusDelete]
(
	@JobOrderStatusID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [JobOrderStatus]
	WHERE
		[JobOrderStatusID] = @JobOrderStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderStatusDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderStatusDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_OffsetPrintingDetailsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_OffsetPrintingDetailsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_OffsetPrintingDetailsLoadByPrimaryKey]
(
	@OffsetPrintingDetailsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[OffsetPrintingDetailsID],
		[JobOrderID],
		[PaperKindID],
		[GSMID],
		[PrintingHouseID],
		[FinishID],
		[JobOrderStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [OffsetPrintingDetails]
	WHERE
		([OffsetPrintingDetailsID] = @OffsetPrintingDetailsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_OffsetPrintingDetailsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_OffsetPrintingDetailsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsLoadAll]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_OffsetPrintingDetailsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_OffsetPrintingDetailsLoadAll];
GO

CREATE PROCEDURE [proc_OffsetPrintingDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[OffsetPrintingDetailsID],
		[JobOrderID],
		[PaperKindID],
		[GSMID],
		[PrintingHouseID],
		[FinishID],
		[JobOrderStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [OffsetPrintingDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_OffsetPrintingDetailsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_OffsetPrintingDetailsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsUpdate]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_OffsetPrintingDetailsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_OffsetPrintingDetailsUpdate];
GO

CREATE PROCEDURE [proc_OffsetPrintingDetailsUpdate]
(
	@OffsetPrintingDetailsID int,
	@JobOrderID int = NULL,
	@PaperKindID int = NULL,
	@GSMID int = NULL,
	@PrintingHouseID int = NULL,
	@FinishID int = NULL,
	@JobOrderStatusID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [OffsetPrintingDetails]
	SET
		[JobOrderID] = @JobOrderID,
		[PaperKindID] = @PaperKindID,
		[GSMID] = @GSMID,
		[PrintingHouseID] = @PrintingHouseID,
		[FinishID] = @FinishID,
		[JobOrderStatusID] = @JobOrderStatusID,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[OffsetPrintingDetailsID] = @OffsetPrintingDetailsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_OffsetPrintingDetailsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_OffsetPrintingDetailsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsInsert]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_OffsetPrintingDetailsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_OffsetPrintingDetailsInsert];
GO

CREATE PROCEDURE [proc_OffsetPrintingDetailsInsert]
(
	@OffsetPrintingDetailsID int = NULL output,
	@JobOrderID int = NULL,
	@PaperKindID int = NULL,
	@GSMID int = NULL,
	@PrintingHouseID int = NULL,
	@FinishID int = NULL,
	@JobOrderStatusID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [OffsetPrintingDetails]
	(
		[JobOrderID],
		[PaperKindID],
		[GSMID],
		[PrintingHouseID],
		[FinishID],
		[JobOrderStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@JobOrderID,
		@PaperKindID,
		@GSMID,
		@PrintingHouseID,
		@FinishID,
		@JobOrderStatusID,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @OffsetPrintingDetailsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_OffsetPrintingDetailsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_OffsetPrintingDetailsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsDelete]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_OffsetPrintingDetailsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_OffsetPrintingDetailsDelete];
GO

CREATE PROCEDURE [proc_OffsetPrintingDetailsDelete]
(
	@OffsetPrintingDetailsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [OffsetPrintingDetails]
	WHERE
		[OffsetPrintingDetailsID] = @OffsetPrintingDetailsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_OffsetPrintingDetailsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_OffsetPrintingDetailsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ProductionLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProductionLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProductionLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ProductionLoadByPrimaryKey]
(
	@ProductionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProductionID],
		[JobOrderID],
		[ItemID],
		[Size],
		[MaterialID],
		[DeliveryDate],
		[SupplierID],
		[DeliveryTo],
		[ISRemovable],
		[RemovableDate],
		[installationDate],
		[ProductStatusID],
		[InstallStationID],
		[Note],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [Production]
	WHERE
		([ProductionID] = @ProductionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProductionLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProductionLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ProductionLoadAll]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProductionLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProductionLoadAll];
GO

CREATE PROCEDURE [proc_ProductionLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProductionID],
		[JobOrderID],
		[ItemID],
		[Size],
		[MaterialID],
		[DeliveryDate],
		[SupplierID],
		[DeliveryTo],
		[ISRemovable],
		[RemovableDate],
		[installationDate],
		[ProductStatusID],
		[InstallStationID],
		[Note],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [Production]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProductionLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProductionLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ProductionUpdate]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProductionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProductionUpdate];
GO

CREATE PROCEDURE [proc_ProductionUpdate]
(
	@ProductionID int,
	@JobOrderID int = NULL,
	@ItemID int = NULL,
	@Size decimal(6,2) = NULL,
	@MaterialID int = NULL,
	@DeliveryDate datetime = NULL,
	@SupplierID int = NULL,
	@DeliveryTo nvarchar(500) = NULL,
	@ISRemovable bit = NULL,
	@RemovableDate datetime = NULL,
	@installationDate datetime = NULL,
	@ProductStatusID int = NULL,
	@InstallStationID int = NULL,
	@Note nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Production]
	SET
		[JobOrderID] = @JobOrderID,
		[ItemID] = @ItemID,
		[Size] = @Size,
		[MaterialID] = @MaterialID,
		[DeliveryDate] = @DeliveryDate,
		[SupplierID] = @SupplierID,
		[DeliveryTo] = @DeliveryTo,
		[ISRemovable] = @ISRemovable,
		[RemovableDate] = @RemovableDate,
		[installationDate] = @installationDate,
		[ProductStatusID] = @ProductStatusID,
		[InstallStationID] = @InstallStationID,
		[Note] = @Note,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[ProductionID] = @ProductionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProductionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProductionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ProductionInsert]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProductionInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProductionInsert];
GO

CREATE PROCEDURE [proc_ProductionInsert]
(
	@ProductionID int = NULL output,
	@JobOrderID int = NULL,
	@ItemID int = NULL,
	@Size decimal(6,2) = NULL,
	@MaterialID int = NULL,
	@DeliveryDate datetime = NULL,
	@SupplierID int = NULL,
	@DeliveryTo nvarchar(500) = NULL,
	@ISRemovable bit = NULL,
	@RemovableDate datetime = NULL,
	@installationDate datetime = NULL,
	@ProductStatusID int = NULL,
	@InstallStationID int = NULL,
	@Note nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Production]
	(
		[JobOrderID],
		[ItemID],
		[Size],
		[MaterialID],
		[DeliveryDate],
		[SupplierID],
		[DeliveryTo],
		[ISRemovable],
		[RemovableDate],
		[installationDate],
		[ProductStatusID],
		[InstallStationID],
		[Note],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@JobOrderID,
		@ItemID,
		@Size,
		@MaterialID,
		@DeliveryDate,
		@SupplierID,
		@DeliveryTo,
		@ISRemovable,
		@RemovableDate,
		@installationDate,
		@ProductStatusID,
		@InstallStationID,
		@Note,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @ProductionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProductionInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProductionInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ProductionDelete]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProductionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProductionDelete];
GO

CREATE PROCEDURE [proc_ProductionDelete]
(
	@ProductionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Production]
	WHERE
		[ProductionID] = @ProductionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProductionDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProductionDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PurchaseOrderLoadByPrimaryKey]
(
	@PurchaseOrderID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PurchaseOrderID],
		[PurchaseOrderNumber],
		[PurchaseOrderDate],
		[Management],
		[ISFinalProduct],
		[ISSample],
		[ISProductUnderManufacturing],
		[DeliveryDate],
		[DeliveryPlace],
		[PaymentRequierment],
		[ManagerName],
		[Signature],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [PurchaseOrder]
	WHERE
		([PurchaseOrderID] = @PurchaseOrderID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderLoadAll]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderLoadAll];
GO

CREATE PROCEDURE [proc_PurchaseOrderLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PurchaseOrderID],
		[PurchaseOrderNumber],
		[PurchaseOrderDate],
		[Management],
		[ISFinalProduct],
		[ISSample],
		[ISProductUnderManufacturing],
		[DeliveryDate],
		[DeliveryPlace],
		[PaymentRequierment],
		[ManagerName],
		[Signature],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [PurchaseOrder]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderUpdate]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderUpdate];
GO

CREATE PROCEDURE [proc_PurchaseOrderUpdate]
(
	@PurchaseOrderID int,
	@PurchaseOrderNumber nvarchar(300) = NULL,
	@PurchaseOrderDate datetime = NULL,
	@Management nvarchar(500) = NULL,
	@ISFinalProduct bit = NULL,
	@ISSample bit = NULL,
	@ISProductUnderManufacturing bit = NULL,
	@DeliveryDate datetime = NULL,
	@DeliveryPlace nvarchar(500) = NULL,
	@PaymentRequierment nvarchar(500) = NULL,
	@ManagerName nvarchar(300) = NULL,
	@Signature nvarchar(300) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PurchaseOrder]
	SET
		[PurchaseOrderNumber] = @PurchaseOrderNumber,
		[PurchaseOrderDate] = @PurchaseOrderDate,
		[Management] = @Management,
		[ISFinalProduct] = @ISFinalProduct,
		[ISSample] = @ISSample,
		[ISProductUnderManufacturing] = @ISProductUnderManufacturing,
		[DeliveryDate] = @DeliveryDate,
		[DeliveryPlace] = @DeliveryPlace,
		[PaymentRequierment] = @PaymentRequierment,
		[ManagerName] = @ManagerName,
		[Signature] = @Signature,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[PurchaseOrderID] = @PurchaseOrderID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PurchaseOrderInsert]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderInsert];
GO

CREATE PROCEDURE [proc_PurchaseOrderInsert]
(
	@PurchaseOrderID int = NULL output,
	@PurchaseOrderNumber nvarchar(300) = NULL,
	@PurchaseOrderDate datetime = NULL,
	@Management nvarchar(500) = NULL,
	@ISFinalProduct bit = NULL,
	@ISSample bit = NULL,
	@ISProductUnderManufacturing bit = NULL,
	@DeliveryDate datetime = NULL,
	@DeliveryPlace nvarchar(500) = NULL,
	@PaymentRequierment nvarchar(500) = NULL,
	@ManagerName nvarchar(300) = NULL,
	@Signature nvarchar(300) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PurchaseOrder]
	(
		[PurchaseOrderNumber],
		[PurchaseOrderDate],
		[Management],
		[ISFinalProduct],
		[ISSample],
		[ISProductUnderManufacturing],
		[DeliveryDate],
		[DeliveryPlace],
		[PaymentRequierment],
		[ManagerName],
		[Signature],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@PurchaseOrderNumber,
		@PurchaseOrderDate,
		@Management,
		@ISFinalProduct,
		@ISSample,
		@ISProductUnderManufacturing,
		@DeliveryDate,
		@DeliveryPlace,
		@PaymentRequierment,
		@ManagerName,
		@Signature,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @PurchaseOrderID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderDelete]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderDelete];
GO

CREATE PROCEDURE [proc_PurchaseOrderDelete]
(
	@PurchaseOrderID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PurchaseOrder]
	WHERE
		[PurchaseOrderID] = @PurchaseOrderID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderDetailsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderDetailsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PurchaseOrderDetailsLoadByPrimaryKey]
(
	@PurchaseOrderDetailsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PurchaseOrderDetailsID],
		[PurchaseOrderID],
		[TotalValue],
		[UnitPrice],
		[QuantityRequired],
		[StockOnHand],
		[Unit],
		[Description],
		[Serial],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [PurchaseOrderDetails]
	WHERE
		([PurchaseOrderDetailsID] = @PurchaseOrderDetailsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderDetailsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderDetailsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsLoadAll]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderDetailsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderDetailsLoadAll];
GO

CREATE PROCEDURE [proc_PurchaseOrderDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PurchaseOrderDetailsID],
		[PurchaseOrderID],
		[TotalValue],
		[UnitPrice],
		[QuantityRequired],
		[StockOnHand],
		[Unit],
		[Description],
		[Serial],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [PurchaseOrderDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderDetailsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderDetailsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsUpdate]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderDetailsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderDetailsUpdate];
GO

CREATE PROCEDURE [proc_PurchaseOrderDetailsUpdate]
(
	@PurchaseOrderDetailsID int,
	@PurchaseOrderID int = NULL,
	@TotalValue float = NULL,
	@UnitPrice float = NULL,
	@QuantityRequired int = NULL,
	@StockOnHand int = NULL,
	@Unit int = NULL,
	@Description nvarchar(500) = NULL,
	@Serial nvarchar(1) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PurchaseOrderDetails]
	SET
		[PurchaseOrderID] = @PurchaseOrderID,
		[TotalValue] = @TotalValue,
		[UnitPrice] = @UnitPrice,
		[QuantityRequired] = @QuantityRequired,
		[StockOnHand] = @StockOnHand,
		[Unit] = @Unit,
		[Description] = @Description,
		[Serial] = @Serial,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[PurchaseOrderDetailsID] = @PurchaseOrderDetailsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderDetailsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderDetailsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsInsert]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderDetailsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderDetailsInsert];
GO

CREATE PROCEDURE [proc_PurchaseOrderDetailsInsert]
(
	@PurchaseOrderDetailsID int = NULL output,
	@PurchaseOrderID int = NULL,
	@TotalValue float = NULL,
	@UnitPrice float = NULL,
	@QuantityRequired int = NULL,
	@StockOnHand int = NULL,
	@Unit int = NULL,
	@Description nvarchar(500) = NULL,
	@Serial nvarchar(1) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PurchaseOrderDetails]
	(
		[PurchaseOrderID],
		[TotalValue],
		[UnitPrice],
		[QuantityRequired],
		[StockOnHand],
		[Unit],
		[Description],
		[Serial],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@PurchaseOrderID,
		@TotalValue,
		@UnitPrice,
		@QuantityRequired,
		@StockOnHand,
		@Unit,
		@Description,
		@Serial,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @PurchaseOrderDetailsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderDetailsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderDetailsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsDelete]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderDetailsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderDetailsDelete];
GO

CREATE PROCEDURE [proc_PurchaseOrderDetailsDelete]
(
	@PurchaseOrderDetailsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PurchaseOrderDetails]
	WHERE
		[PurchaseOrderDetailsID] = @PurchaseOrderDetailsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderDetailsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderDetailsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TransformationSupplierLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TransformationSupplierLoadByPrimaryKey]
(
	@TransformationSupplierID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TransformationSupplierID],
		[TransformationSupplierName],
		[TransformationSupplierTelephone],
		[TransformationSupplierAddress]
	FROM [TransformationSupplier]
	WHERE
		([TransformationSupplierID] = @TransformationSupplierID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TransformationSupplierLoadAll]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierLoadAll];
GO

CREATE PROCEDURE [proc_TransformationSupplierLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TransformationSupplierID],
		[TransformationSupplierName],
		[TransformationSupplierTelephone],
		[TransformationSupplierAddress]
	FROM [TransformationSupplier]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TransformationSupplierUpdate]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierUpdate];
GO

CREATE PROCEDURE [proc_TransformationSupplierUpdate]
(
	@TransformationSupplierID int,
	@TransformationSupplierName nvarchar(300) = NULL,
	@TransformationSupplierTelephone nvarchar(50) = NULL,
	@TransformationSupplierAddress nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TransformationSupplier]
	SET
		[TransformationSupplierName] = @TransformationSupplierName,
		[TransformationSupplierTelephone] = @TransformationSupplierTelephone,
		[TransformationSupplierAddress] = @TransformationSupplierAddress
	WHERE
		[TransformationSupplierID] = @TransformationSupplierID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TransformationSupplierInsert]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierInsert];
GO

CREATE PROCEDURE [proc_TransformationSupplierInsert]
(
	@TransformationSupplierID int = NULL output,
	@TransformationSupplierName nvarchar(300) = NULL,
	@TransformationSupplierTelephone nvarchar(50) = NULL,
	@TransformationSupplierAddress nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TransformationSupplier]
	(
		[TransformationSupplierName],
		[TransformationSupplierTelephone],
		[TransformationSupplierAddress]
	)
	VALUES
	(
		@TransformationSupplierName,
		@TransformationSupplierTelephone,
		@TransformationSupplierAddress
	)

	SET @Err = @@Error

	SELECT @TransformationSupplierID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TransformationSupplierDelete]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierDelete];
GO

CREATE PROCEDURE [proc_TransformationSupplierDelete]
(
	@TransformationSupplierID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TransformationSupplier]
	WHERE
		[TransformationSupplierID] = @TransformationSupplierID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierDelete Error on Creation'
GO
