
/****** Object:  StoredProcedure [proc_UserFavoritesLoadByPrimaryKey]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserFavoritesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserFavoritesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_UserFavoritesLoadByPrimaryKey]
(
	@UserFavoritesID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserFavoritesID],
		[UserID],
		[CardID],
		[MarkDate]
	FROM [UserFavorites]
	WHERE
		([UserFavoritesID] = @UserFavoritesID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserFavoritesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserFavoritesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserFavoritesLoadAll]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserFavoritesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserFavoritesLoadAll];
GO

CREATE PROCEDURE [proc_UserFavoritesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserFavoritesID],
		[UserID],
		[CardID],
		[MarkDate]
	FROM [UserFavorites]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserFavoritesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserFavoritesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserFavoritesUpdate]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserFavoritesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserFavoritesUpdate];
GO

CREATE PROCEDURE [proc_UserFavoritesUpdate]
(
	@UserFavoritesID int,
	@UserID int = NULL,
	@CardID int = NULL,
	@MarkDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [UserFavorites]
	SET
		[UserID] = @UserID,
		[CardID] = @CardID,
		[MarkDate] = @MarkDate
	WHERE
		[UserFavoritesID] = @UserFavoritesID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserFavoritesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserFavoritesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_UserFavoritesInsert]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserFavoritesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserFavoritesInsert];
GO

CREATE PROCEDURE [proc_UserFavoritesInsert]
(
	@UserFavoritesID int = NULL output,
	@UserID int = NULL,
	@CardID int = NULL,
	@MarkDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [UserFavorites]
	(
		[UserID],
		[CardID],
		[MarkDate]
	)
	VALUES
	(
		@UserID,
		@CardID,
		@MarkDate
	)

	SET @Err = @@Error

	SELECT @UserFavoritesID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserFavoritesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserFavoritesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserFavoritesDelete]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserFavoritesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserFavoritesDelete];
GO

CREATE PROCEDURE [proc_UserFavoritesDelete]
(
	@UserFavoritesID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [UserFavorites]
	WHERE
		[UserFavoritesID] = @UserFavoritesID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserFavoritesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserFavoritesDelete Error on Creation'
GO
