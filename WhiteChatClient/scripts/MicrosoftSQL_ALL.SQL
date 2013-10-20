
USE [WhiteChat_db]
GO

/****** Object:  StoredProcedure [proc_CategoryLoadByPrimaryKey]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CategoryLoadByPrimaryKey]
(
	@CategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[Name]
	FROM [Category]
	WHERE
		([CategoryID] = @CategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoryLoadAll]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryLoadAll];
GO

CREATE PROCEDURE [proc_CategoryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[Name]
	FROM [Category]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoryUpdate]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryUpdate];
GO

CREATE PROCEDURE [proc_CategoryUpdate]
(
	@CategoryID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Category]
	SET
		[Name] = @Name
	WHERE
		[CategoryID] = @CategoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CategoryInsert]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryInsert];
GO

CREATE PROCEDURE [proc_CategoryInsert]
(
	@CategoryID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Category]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @CategoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoryDelete]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoryDelete];
GO

CREATE PROCEDURE [proc_CategoryDelete]
(
	@CategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Category]
	WHERE
		[CategoryID] = @CategoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoryDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ChatRoomLoadByPrimaryKey]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ChatRoomLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ChatRoomLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ChatRoomLoadByPrimaryKey]
(
	@ChatRoomID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ChatRoomID],
		[Name],
		[CategoryID]
	FROM [ChatRoom]
	WHERE
		([ChatRoomID] = @ChatRoomID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ChatRoomLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ChatRoomLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ChatRoomLoadAll]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ChatRoomLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ChatRoomLoadAll];
GO

CREATE PROCEDURE [proc_ChatRoomLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ChatRoomID],
		[Name],
		[CategoryID]
	FROM [ChatRoom]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ChatRoomLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ChatRoomLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ChatRoomUpdate]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ChatRoomUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ChatRoomUpdate];
GO

CREATE PROCEDURE [proc_ChatRoomUpdate]
(
	@ChatRoomID int,
	@Name nvarchar(200) = NULL,
	@CategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [ChatRoom]
	SET
		[Name] = @Name,
		[CategoryID] = @CategoryID
	WHERE
		[ChatRoomID] = @ChatRoomID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ChatRoomUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ChatRoomUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ChatRoomInsert]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ChatRoomInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ChatRoomInsert];
GO

CREATE PROCEDURE [proc_ChatRoomInsert]
(
	@ChatRoomID int = NULL output,
	@Name nvarchar(200) = NULL,
	@CategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [ChatRoom]
	(
		[Name],
		[CategoryID]
	)
	VALUES
	(
		@Name,
		@CategoryID
	)

	SET @Err = @@Error

	SELECT @ChatRoomID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ChatRoomInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ChatRoomInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ChatRoomDelete]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ChatRoomDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ChatRoomDelete];
GO

CREATE PROCEDURE [proc_ChatRoomDelete]
(
	@ChatRoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [ChatRoom]
	WHERE
		[ChatRoomID] = @ChatRoomID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ChatRoomDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ChatRoomDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberLoadByPrimaryKey]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberLoadByPrimaryKey]
(
	@MemberID nvarchar(200),
	@ChatRoomID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[ChatRoomID]
	FROM [Member]
	WHERE
		([MemberID] = @MemberID) AND
		([ChatRoomID] = @ChatRoomID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberLoadAll]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberLoadAll];
GO

CREATE PROCEDURE [proc_MemberLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[ChatRoomID]
	FROM [Member]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberLoadAll Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


/****** Object:  StoredProcedure [proc_MemberInsert]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberInsert];
GO

CREATE PROCEDURE [proc_MemberInsert]
(
	@MemberID nvarchar(200),
	@ChatRoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Member]
	(
		[MemberID],
		[ChatRoomID]
	)
	VALUES
	(
		@MemberID,
		@ChatRoomID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberDelete]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberDelete];
GO

CREATE PROCEDURE [proc_MemberDelete]
(
	@MemberID nvarchar(200),
	@ChatRoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Member]
	WHERE
		[MemberID] = @MemberID AND
		[ChatRoomID] = @ChatRoomID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberDelete Error on Creation'
GO
