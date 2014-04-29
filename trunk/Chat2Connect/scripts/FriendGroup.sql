
/****** Object:  StoredProcedure [proc_FriendGroupLoadByPrimaryKey]    Script Date: 4/29/2014 2:20:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FriendGroupLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FriendGroupLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_FriendGroupLoadByPrimaryKey]
(
	@FriendGroupID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[FriendGroupID],
		[MemberID],
		[Name]
	FROM [FriendGroup]
	WHERE
		([FriendGroupID] = @FriendGroupID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FriendGroupLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_FriendGroupLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FriendGroupLoadAll]    Script Date: 4/29/2014 2:20:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FriendGroupLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FriendGroupLoadAll];
GO

CREATE PROCEDURE [proc_FriendGroupLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[FriendGroupID],
		[MemberID],
		[Name]
	FROM [FriendGroup]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FriendGroupLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_FriendGroupLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FriendGroupUpdate]    Script Date: 4/29/2014 2:20:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FriendGroupUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FriendGroupUpdate];
GO

CREATE PROCEDURE [proc_FriendGroupUpdate]
(
	@FriendGroupID int,
	@MemberID int = NULL,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [FriendGroup]
	SET
		[MemberID] = @MemberID,
		[Name] = @Name
	WHERE
		[FriendGroupID] = @FriendGroupID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FriendGroupUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_FriendGroupUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_FriendGroupInsert]    Script Date: 4/29/2014 2:20:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FriendGroupInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FriendGroupInsert];
GO

CREATE PROCEDURE [proc_FriendGroupInsert]
(
	@FriendGroupID int = NULL output,
	@MemberID int = NULL,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [FriendGroup]
	(
		[MemberID],
		[Name]
	)
	VALUES
	(
		@MemberID,
		@Name
	)

	SET @Err = @@Error

	SELECT @FriendGroupID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FriendGroupInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_FriendGroupInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FriendGroupDelete]    Script Date: 4/29/2014 2:20:16 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FriendGroupDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FriendGroupDelete];
GO

CREATE PROCEDURE [proc_FriendGroupDelete]
(
	@FriendGroupID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [FriendGroup]
	WHERE
		[FriendGroupID] = @FriendGroupID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FriendGroupDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_FriendGroupDelete Error on Creation'
GO
