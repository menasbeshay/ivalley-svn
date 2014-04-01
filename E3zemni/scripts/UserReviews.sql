
/****** Object:  StoredProcedure [proc_UserReviewsLoadByPrimaryKey]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserReviewsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserReviewsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_UserReviewsLoadByPrimaryKey]
(
	@ReviewID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReviewID],
		[UserID],
		[CardID],
		[Stars],
		[RevTitle],
		[RevDescription]
	FROM [UserReviews]
	WHERE
		([ReviewID] = @ReviewID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserReviewsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserReviewsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserReviewsLoadAll]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserReviewsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserReviewsLoadAll];
GO

CREATE PROCEDURE [proc_UserReviewsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReviewID],
		[UserID],
		[CardID],
		[Stars],
		[RevTitle],
		[RevDescription]
	FROM [UserReviews]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserReviewsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserReviewsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserReviewsUpdate]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserReviewsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserReviewsUpdate];
GO

CREATE PROCEDURE [proc_UserReviewsUpdate]
(
	@ReviewID int,
	@UserID int = NULL,
	@CardID int = NULL,
	@Stars int = NULL,
	@RevTitle nvarchar(250) = NULL,
	@RevDescription nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [UserReviews]
	SET
		[UserID] = @UserID,
		[CardID] = @CardID,
		[Stars] = @Stars,
		[RevTitle] = @RevTitle,
		[RevDescription] = @RevDescription
	WHERE
		[ReviewID] = @ReviewID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserReviewsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserReviewsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_UserReviewsInsert]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserReviewsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserReviewsInsert];
GO

CREATE PROCEDURE [proc_UserReviewsInsert]
(
	@ReviewID int = NULL output,
	@UserID int = NULL,
	@CardID int = NULL,
	@Stars int = NULL,
	@RevTitle nvarchar(250) = NULL,
	@RevDescription nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [UserReviews]
	(
		[UserID],
		[CardID],
		[Stars],
		[RevTitle],
		[RevDescription]
	)
	VALUES
	(
		@UserID,
		@CardID,
		@Stars,
		@RevTitle,
		@RevDescription
	)

	SET @Err = @@Error

	SELECT @ReviewID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserReviewsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserReviewsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserReviewsDelete]    Script Date: 4/1/2014 2:11:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserReviewsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserReviewsDelete];
GO

CREATE PROCEDURE [proc_UserReviewsDelete]
(
	@ReviewID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [UserReviews]
	WHERE
		[ReviewID] = @ReviewID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserReviewsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserReviewsDelete Error on Creation'
GO
