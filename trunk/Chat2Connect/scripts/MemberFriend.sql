
/****** Object:  StoredProcedure [proc_MemberFriendLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberFriendLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberFriendLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberFriendLoadByPrimaryKey]
(
	@MemberFriendID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberFriendID],
		[MemberID],
		[FriendID],
		[FriendGroupID]
	FROM [MemberFriend]
	WHERE
		([MemberFriendID] = @MemberFriendID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberFriendLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberFriendLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberFriendLoadAll]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberFriendLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberFriendLoadAll];
GO

CREATE PROCEDURE [proc_MemberFriendLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberFriendID],
		[MemberID],
		[FriendID],
		[FriendGroupID]
	FROM [MemberFriend]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberFriendLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberFriendLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberFriendUpdate]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberFriendUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberFriendUpdate];
GO

CREATE PROCEDURE [proc_MemberFriendUpdate]
(
	@MemberFriendID int,
	@MemberID int = NULL,
	@FriendID int = NULL,
	@FriendGroupID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberFriend]
	SET
		[MemberID] = @MemberID,
		[FriendID] = @FriendID,
		[FriendGroupID] = @FriendGroupID
	WHERE
		[MemberFriendID] = @MemberFriendID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberFriendUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberFriendUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberFriendInsert]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberFriendInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberFriendInsert];
GO

CREATE PROCEDURE [proc_MemberFriendInsert]
(
	@MemberFriendID int = NULL output,
	@MemberID int = NULL,
	@FriendID int = NULL,
	@FriendGroupID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberFriend]
	(
		[MemberID],
		[FriendID],
		[FriendGroupID]
	)
	VALUES
	(
		@MemberID,
		@FriendID,
		@FriendGroupID
	)

	SET @Err = @@Error

	SELECT @MemberFriendID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberFriendInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberFriendInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberFriendDelete]    Script Date: 5/8/2014 1:38:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberFriendDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberFriendDelete];
GO

CREATE PROCEDURE [proc_MemberFriendDelete]
(
	@MemberFriendID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberFriend]
	WHERE
		[MemberFriendID] = @MemberFriendID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberFriendDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberFriendDelete Error on Creation'
GO
