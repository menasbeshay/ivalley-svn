
/****** Object:  StoredProcedure [proc_MessageFolderLoadByPrimaryKey]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageFolderLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageFolderLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MessageFolderLoadByPrimaryKey]
(
	@MessageFolderID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MessageFolderID],
		[MemberID],
		[Name]
	FROM [MessageFolder]
	WHERE
		([MessageFolderID] = @MessageFolderID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MessageFolderLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MessageFolderLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MessageFolderLoadAll]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageFolderLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageFolderLoadAll];
GO

CREATE PROCEDURE [proc_MessageFolderLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MessageFolderID],
		[MemberID],
		[Name]
	FROM [MessageFolder]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MessageFolderLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MessageFolderLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MessageFolderUpdate]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageFolderUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageFolderUpdate];
GO

CREATE PROCEDURE [proc_MessageFolderUpdate]
(
	@MessageFolderID int,
	@MemberID int = NULL,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MessageFolder]
	SET
		[MemberID] = @MemberID,
		[Name] = @Name
	WHERE
		[MessageFolderID] = @MessageFolderID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MessageFolderUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MessageFolderUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MessageFolderInsert]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageFolderInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageFolderInsert];
GO

CREATE PROCEDURE [proc_MessageFolderInsert]
(
	@MessageFolderID int = NULL output,
	@MemberID int = NULL,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MessageFolder]
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

	SELECT @MessageFolderID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MessageFolderInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MessageFolderInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MessageFolderDelete]    Script Date: 4/24/2014 3:42:33 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MessageFolderDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MessageFolderDelete];
GO

CREATE PROCEDURE [proc_MessageFolderDelete]
(
	@MessageFolderID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MessageFolder]
	WHERE
		[MessageFolderID] = @MessageFolderID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MessageFolderDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MessageFolderDelete Error on Creation'
GO
