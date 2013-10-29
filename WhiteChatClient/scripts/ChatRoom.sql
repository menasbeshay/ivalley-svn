
/****** Object:  StoredProcedure [proc_ChatRoomLoadByPrimaryKey]    Script Date: 10/29/2013 4:47:25 PM ******/
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
		[CategoryID],
		[SubCategoryID]
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

/****** Object:  StoredProcedure [proc_ChatRoomLoadAll]    Script Date: 10/29/2013 4:47:25 PM ******/
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
		[CategoryID],
		[SubCategoryID]
	FROM [ChatRoom]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ChatRoomLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ChatRoomLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ChatRoomUpdate]    Script Date: 10/29/2013 4:47:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ChatRoomUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ChatRoomUpdate];
GO

CREATE PROCEDURE [proc_ChatRoomUpdate]
(
	@ChatRoomID int,
	@Name nvarchar(200) = NULL,
	@CategoryID int = NULL,
	@SubCategoryID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [ChatRoom]
	SET
		[Name] = @Name,
		[CategoryID] = @CategoryID,
		[SubCategoryID] = @SubCategoryID
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




/****** Object:  StoredProcedure [proc_ChatRoomInsert]    Script Date: 10/29/2013 4:47:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ChatRoomInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ChatRoomInsert];
GO

CREATE PROCEDURE [proc_ChatRoomInsert]
(
	@ChatRoomID int = NULL output,
	@Name nvarchar(200) = NULL,
	@CategoryID int = NULL,
	@SubCategoryID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [ChatRoom]
	(
		[Name],
		[CategoryID],
		[SubCategoryID]
	)
	VALUES
	(
		@Name,
		@CategoryID,
		@SubCategoryID
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

/****** Object:  StoredProcedure [proc_ChatRoomDelete]    Script Date: 10/29/2013 4:47:25 PM ******/
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
