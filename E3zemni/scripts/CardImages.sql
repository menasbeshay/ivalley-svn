
/****** Object:  StoredProcedure [proc_CardImagesLoadByPrimaryKey]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardImagesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardImagesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CardImagesLoadByPrimaryKey]
(
	@CardImageID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CardImageID],
		[CardID],
		[PosX],
		[PosY],
		[ImgWidth],
		[ImgHieght],
		[IsBackGround]
	FROM [CardImages]
	WHERE
		([CardImageID] = @CardImageID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardImagesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardImagesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardImagesLoadAll]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardImagesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardImagesLoadAll];
GO

CREATE PROCEDURE [proc_CardImagesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CardImageID],
		[CardID],
		[PosX],
		[PosY],
		[ImgWidth],
		[ImgHieght],
		[IsBackGround]
	FROM [CardImages]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardImagesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardImagesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardImagesUpdate]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardImagesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardImagesUpdate];
GO

CREATE PROCEDURE [proc_CardImagesUpdate]
(
	@CardImageID int,
	@CardID int = NULL,
	@PosX int = NULL,
	@PosY int = NULL,
	@ImgWidth int = NULL,
	@ImgHieght int = NULL,
	@IsBackGround bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CardImages]
	SET
		[CardID] = @CardID,
		[PosX] = @PosX,
		[PosY] = @PosY,
		[ImgWidth] = @ImgWidth,
		[ImgHieght] = @ImgHieght,
		[IsBackGround] = @IsBackGround
	WHERE
		[CardImageID] = @CardImageID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardImagesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardImagesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CardImagesInsert]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardImagesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardImagesInsert];
GO

CREATE PROCEDURE [proc_CardImagesInsert]
(
	@CardImageID int = NULL output,
	@CardID int = NULL,
	@PosX int = NULL,
	@PosY int = NULL,
	@ImgWidth int = NULL,
	@ImgHieght int = NULL,
	@IsBackGround bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CardImages]
	(
		[CardID],
		[PosX],
		[PosY],
		[ImgWidth],
		[ImgHieght],
		[IsBackGround]
	)
	VALUES
	(
		@CardID,
		@PosX,
		@PosY,
		@ImgWidth,
		@ImgHieght,
		@IsBackGround
	)

	SET @Err = @@Error

	SELECT @CardImageID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardImagesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardImagesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardImagesDelete]    Script Date: 4/13/2014 3:19:42 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardImagesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardImagesDelete];
GO

CREATE PROCEDURE [proc_CardImagesDelete]
(
	@CardImageID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CardImages]
	WHERE
		[CardImageID] = @CardImageID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardImagesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardImagesDelete Error on Creation'
GO
