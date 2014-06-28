
USE [E3zemni]
GO

/****** Object:  StoredProcedure [proc_CardColorLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardColorLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardColorLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CardColorLoadByPrimaryKey]
(
	@ColorID int,
	@CardID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ColorID],
		[CardID]
	FROM [CardColor]
	WHERE
		([ColorID] = @ColorID) AND
		([CardID] = @CardID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardColorLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardColorLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardColorLoadAll]    Script Date: 6/28/2014 3:09:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardColorLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardColorLoadAll];
GO

CREATE PROCEDURE [proc_CardColorLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ColorID],
		[CardID]
	FROM [CardColor]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardColorLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardColorLoadAll Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


/****** Object:  StoredProcedure [proc_CardColorInsert]    Script Date: 6/28/2014 3:09:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardColorInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardColorInsert];
GO

CREATE PROCEDURE [proc_CardColorInsert]
(
	@ColorID int,
	@CardID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CardColor]
	(
		[ColorID],
		[CardID]
	)
	VALUES
	(
		@ColorID,
		@CardID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardColorInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardColorInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardColorDelete]    Script Date: 6/28/2014 3:09:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardColorDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardColorDelete];
GO

CREATE PROCEDURE [proc_CardColorDelete]
(
	@ColorID int,
	@CardID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CardColor]
	WHERE
		[ColorID] = @ColorID AND
		[CardID] = @CardID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardColorDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardColorDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardImagesLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
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

/****** Object:  StoredProcedure [proc_CardImagesLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
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

/****** Object:  StoredProcedure [proc_CardImagesUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
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




/****** Object:  StoredProcedure [proc_CardImagesInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
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

/****** Object:  StoredProcedure [proc_CardImagesDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
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

/****** Object:  StoredProcedure [proc_CardLayoutsLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardLayoutsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardLayoutsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CardLayoutsLoadByPrimaryKey]
(
	@CardLayoutID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CardLayoutID],
		[CardID],
		[LayoutImage],
		[LayeoutBackImage],
		[ColorID]
	FROM [CardLayouts]
	WHERE
		([CardLayoutID] = @CardLayoutID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardLayoutsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardLayoutsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardLayoutsLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardLayoutsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardLayoutsLoadAll];
GO

CREATE PROCEDURE [proc_CardLayoutsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CardLayoutID],
		[CardID],
		[LayoutImage],
		[LayeoutBackImage],
		[ColorID]
	FROM [CardLayouts]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardLayoutsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardLayoutsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardLayoutsUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardLayoutsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardLayoutsUpdate];
GO

CREATE PROCEDURE [proc_CardLayoutsUpdate]
(
	@CardLayoutID int,
	@CardID int = NULL,
	@LayoutImage nvarchar(250) = NULL,
	@LayeoutBackImage nvarchar(250) = NULL,
	@ColorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CardLayouts]
	SET
		[CardID] = @CardID,
		[LayoutImage] = @LayoutImage,
		[LayeoutBackImage] = @LayeoutBackImage,
		[ColorID] = @ColorID
	WHERE
		[CardLayoutID] = @CardLayoutID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardLayoutsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardLayoutsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CardLayoutsInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardLayoutsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardLayoutsInsert];
GO

CREATE PROCEDURE [proc_CardLayoutsInsert]
(
	@CardLayoutID int = NULL output,
	@CardID int = NULL,
	@LayoutImage nvarchar(250) = NULL,
	@LayeoutBackImage nvarchar(250) = NULL,
	@ColorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CardLayouts]
	(
		[CardID],
		[LayoutImage],
		[LayeoutBackImage],
		[ColorID]
	)
	VALUES
	(
		@CardID,
		@LayoutImage,
		@LayeoutBackImage,
		@ColorID
	)

	SET @Err = @@Error

	SELECT @CardLayoutID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardLayoutsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardLayoutsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardLayoutsDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardLayoutsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardLayoutsDelete];
GO

CREATE PROCEDURE [proc_CardLayoutsDelete]
(
	@CardLayoutID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CardLayouts]
	WHERE
		[CardLayoutID] = @CardLayoutID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardLayoutsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardLayoutsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardsLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CardsLoadByPrimaryKey]
(
	@CardID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CardID],
		[CategoryID],
		[CardNameAr],
		[CardNameEng],
		[PriceBefore],
		[PriceNow],
		[DescriptionAr],
		[DescriptionEng],
		[MainPhoto],
		[MainPhotoHover],
		[UploadDate],
		[DimensionID],
		[IsPartySupplier]
	FROM [Cards]
	WHERE
		([CardID] = @CardID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardsLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardsLoadAll];
GO

CREATE PROCEDURE [proc_CardsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CardID],
		[CategoryID],
		[CardNameAr],
		[CardNameEng],
		[PriceBefore],
		[PriceNow],
		[DescriptionAr],
		[DescriptionEng],
		[MainPhoto],
		[MainPhotoHover],
		[UploadDate],
		[DimensionID],
		[IsPartySupplier]
	FROM [Cards]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardsUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardsUpdate];
GO

CREATE PROCEDURE [proc_CardsUpdate]
(
	@CardID int,
	@CategoryID int = NULL,
	@CardNameAr nvarchar(250) = NULL,
	@CardNameEng nvarchar(250) = NULL,
	@PriceBefore float = NULL,
	@PriceNow float = NULL,
	@DescriptionAr nvarchar(2000) = NULL,
	@DescriptionEng nvarchar(2000) = NULL,
	@MainPhoto nvarchar(500) = NULL,
	@MainPhotoHover nvarchar(500) = NULL,
	@UploadDate datetime = NULL,
	@DimensionID int = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Cards]
	SET
		[CategoryID] = @CategoryID,
		[CardNameAr] = @CardNameAr,
		[CardNameEng] = @CardNameEng,
		[PriceBefore] = @PriceBefore,
		[PriceNow] = @PriceNow,
		[DescriptionAr] = @DescriptionAr,
		[DescriptionEng] = @DescriptionEng,
		[MainPhoto] = @MainPhoto,
		[MainPhotoHover] = @MainPhotoHover,
		[UploadDate] = @UploadDate,
		[DimensionID] = @DimensionID,
		[IsPartySupplier] = @IsPartySupplier
	WHERE
		[CardID] = @CardID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CardsInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardsInsert];
GO

CREATE PROCEDURE [proc_CardsInsert]
(
	@CardID int = NULL output,
	@CategoryID int = NULL,
	@CardNameAr nvarchar(250) = NULL,
	@CardNameEng nvarchar(250) = NULL,
	@PriceBefore float = NULL,
	@PriceNow float = NULL,
	@DescriptionAr nvarchar(2000) = NULL,
	@DescriptionEng nvarchar(2000) = NULL,
	@MainPhoto nvarchar(500) = NULL,
	@MainPhotoHover nvarchar(500) = NULL,
	@UploadDate datetime = NULL,
	@DimensionID int = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Cards]
	(
		[CategoryID],
		[CardNameAr],
		[CardNameEng],
		[PriceBefore],
		[PriceNow],
		[DescriptionAr],
		[DescriptionEng],
		[MainPhoto],
		[MainPhotoHover],
		[UploadDate],
		[DimensionID],
		[IsPartySupplier]
	)
	VALUES
	(
		@CategoryID,
		@CardNameAr,
		@CardNameEng,
		@PriceBefore,
		@PriceNow,
		@DescriptionAr,
		@DescriptionEng,
		@MainPhoto,
		@MainPhotoHover,
		@UploadDate,
		@DimensionID,
		@IsPartySupplier
	)

	SET @Err = @@Error

	SELECT @CardID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardsDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardsDelete];
GO

CREATE PROCEDURE [proc_CardsDelete]
(
	@CardID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Cards]
	WHERE
		[CardID] = @CardID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardTextLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardTextLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardTextLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CardTextLoadByPrimaryKey]
(
	@CardTextID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CardTextID],
		[CardID],
		[PosX],
		[PosY],
		[TextLabel],
		[IsMultiLine],
		[Width],
		[Height]
	FROM [CardText]
	WHERE
		([CardTextID] = @CardTextID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardTextLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardTextLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardTextLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardTextLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardTextLoadAll];
GO

CREATE PROCEDURE [proc_CardTextLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CardTextID],
		[CardID],
		[PosX],
		[PosY],
		[TextLabel],
		[IsMultiLine],
		[Width],
		[Height]
	FROM [CardText]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardTextLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardTextLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardTextUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardTextUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardTextUpdate];
GO

CREATE PROCEDURE [proc_CardTextUpdate]
(
	@CardTextID int,
	@CardID int = NULL,
	@PosX int = NULL,
	@PosY int = NULL,
	@TextLabel nvarchar(150) = NULL,
	@IsMultiLine bit = NULL,
	@Width int = NULL,
	@Height int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CardText]
	SET
		[CardID] = @CardID,
		[PosX] = @PosX,
		[PosY] = @PosY,
		[TextLabel] = @TextLabel,
		[IsMultiLine] = @IsMultiLine,
		[Width] = @Width,
		[Height] = @Height
	WHERE
		[CardTextID] = @CardTextID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardTextUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardTextUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CardTextInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardTextInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardTextInsert];
GO

CREATE PROCEDURE [proc_CardTextInsert]
(
	@CardTextID int = NULL output,
	@CardID int = NULL,
	@PosX int = NULL,
	@PosY int = NULL,
	@TextLabel nvarchar(150) = NULL,
	@IsMultiLine bit = NULL,
	@Width int = NULL,
	@Height int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CardText]
	(
		[CardID],
		[PosX],
		[PosY],
		[TextLabel],
		[IsMultiLine],
		[Width],
		[Height]
	)
	VALUES
	(
		@CardID,
		@PosX,
		@PosY,
		@TextLabel,
		@IsMultiLine,
		@Width,
		@Height
	)

	SET @Err = @@Error

	SELECT @CardTextID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardTextInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardTextInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardTextDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardTextDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardTextDelete];
GO

CREATE PROCEDURE [proc_CardTextDelete]
(
	@CardTextID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CardText]
	WHERE
		[CardTextID] = @CardTextID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardTextDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardTextDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoriesLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
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
		[CatNameAr],
		[CatNameEng],
		[CatImage],
		[MainCatId],
		[HoverImage],
		[IsPartySupplier]
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

/****** Object:  StoredProcedure [proc_CategoriesLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
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
		[CatNameAr],
		[CatNameEng],
		[CatImage],
		[MainCatId],
		[HoverImage],
		[IsPartySupplier]
	FROM [Categories]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoriesUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesUpdate];
GO

CREATE PROCEDURE [proc_CategoriesUpdate]
(
	@CategoryID int,
	@CatNameAr nvarchar(250) = NULL,
	@CatNameEng nvarchar(250) = NULL,
	@CatImage nvarchar(500) = NULL,
	@MainCatId int = NULL,
	@HoverImage nvarchar(200) = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Categories]
	SET
		[CatNameAr] = @CatNameAr,
		[CatNameEng] = @CatNameEng,
		[CatImage] = @CatImage,
		[MainCatId] = @MainCatId,
		[HoverImage] = @HoverImage,
		[IsPartySupplier] = @IsPartySupplier
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




/****** Object:  StoredProcedure [proc_CategoriesInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesInsert];
GO

CREATE PROCEDURE [proc_CategoriesInsert]
(
	@CategoryID int = NULL output,
	@CatNameAr nvarchar(250) = NULL,
	@CatNameEng nvarchar(250) = NULL,
	@CatImage nvarchar(500) = NULL,
	@MainCatId int = NULL,
	@HoverImage nvarchar(200) = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Categories]
	(
		[CatNameAr],
		[CatNameEng],
		[CatImage],
		[MainCatId],
		[HoverImage],
		[IsPartySupplier]
	)
	VALUES
	(
		@CatNameAr,
		@CatNameEng,
		@CatImage,
		@MainCatId,
		@HoverImage,
		@IsPartySupplier
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

/****** Object:  StoredProcedure [proc_CategoriesDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
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

/****** Object:  StoredProcedure [proc_ColorLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ColorLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ColorLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ColorLoadByPrimaryKey]
(
	@ColorID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ColorID],
		[ColorCode],
		[ColorNameEng],
		[ColorNameAr]
	FROM [Color]
	WHERE
		([ColorID] = @ColorID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ColorLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ColorLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ColorLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ColorLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ColorLoadAll];
GO

CREATE PROCEDURE [proc_ColorLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ColorID],
		[ColorCode],
		[ColorNameEng],
		[ColorNameAr]
	FROM [Color]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ColorLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ColorLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ColorUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ColorUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ColorUpdate];
GO

CREATE PROCEDURE [proc_ColorUpdate]
(
	@ColorID int,
	@ColorCode nvarchar(6) = NULL,
	@ColorNameEng nvarchar(30) = NULL,
	@ColorNameAr nvarchar(30) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Color]
	SET
		[ColorCode] = @ColorCode,
		[ColorNameEng] = @ColorNameEng,
		[ColorNameAr] = @ColorNameAr
	WHERE
		[ColorID] = @ColorID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ColorUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ColorUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ColorInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ColorInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ColorInsert];
GO

CREATE PROCEDURE [proc_ColorInsert]
(
	@ColorID int = NULL output,
	@ColorCode nvarchar(6) = NULL,
	@ColorNameEng nvarchar(30) = NULL,
	@ColorNameAr nvarchar(30) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Color]
	(
		[ColorCode],
		[ColorNameEng],
		[ColorNameAr]
	)
	VALUES
	(
		@ColorCode,
		@ColorNameEng,
		@ColorNameAr
	)

	SET @Err = @@Error

	SELECT @ColorID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ColorInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ColorInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ColorDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ColorDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ColorDelete];
GO

CREATE PROCEDURE [proc_ColorDelete]
(
	@ColorID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Color]
	WHERE
		[ColorID] = @ColorID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ColorDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ColorDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DimensionLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DimensionLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DimensionLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DimensionLoadByPrimaryKey]
(
	@DimensionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DimensionID],
		[Width],
		[Height]
	FROM [Dimension]
	WHERE
		([DimensionID] = @DimensionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DimensionLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DimensionLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DimensionLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DimensionLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DimensionLoadAll];
GO

CREATE PROCEDURE [proc_DimensionLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DimensionID],
		[Width],
		[Height]
	FROM [Dimension]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DimensionLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DimensionLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DimensionUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DimensionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DimensionUpdate];
GO

CREATE PROCEDURE [proc_DimensionUpdate]
(
	@DimensionID int,
	@Width decimal(6,2) = NULL,
	@Height decimal(6,2) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Dimension]
	SET
		[Width] = @Width,
		[Height] = @Height
	WHERE
		[DimensionID] = @DimensionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DimensionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DimensionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DimensionInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DimensionInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DimensionInsert];
GO

CREATE PROCEDURE [proc_DimensionInsert]
(
	@DimensionID int = NULL output,
	@Width decimal(6,2) = NULL,
	@Height decimal(6,2) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Dimension]
	(
		[Width],
		[Height]
	)
	VALUES
	(
		@Width,
		@Height
	)

	SET @Err = @@Error

	SELECT @DimensionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DimensionInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DimensionInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DimensionDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DimensionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DimensionDelete];
GO

CREATE PROCEDURE [proc_DimensionDelete]
(
	@DimensionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Dimension]
	WHERE
		[DimensionID] = @DimensionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DimensionDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DimensionDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_EnvelopsLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EnvelopsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EnvelopsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_EnvelopsLoadByPrimaryKey]
(
	@EnvelopID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[EnvelopID],
		[ImagePath],
		[Price],
		[UploadDate],
		[DimensionID],
		[ColorID]
	FROM [Envelops]
	WHERE
		([EnvelopID] = @EnvelopID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EnvelopsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_EnvelopsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_EnvelopsLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EnvelopsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EnvelopsLoadAll];
GO

CREATE PROCEDURE [proc_EnvelopsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[EnvelopID],
		[ImagePath],
		[Price],
		[UploadDate],
		[DimensionID],
		[ColorID]
	FROM [Envelops]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EnvelopsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_EnvelopsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_EnvelopsUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EnvelopsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EnvelopsUpdate];
GO

CREATE PROCEDURE [proc_EnvelopsUpdate]
(
	@EnvelopID int,
	@ImagePath nvarchar(150) = NULL,
	@Price float = NULL,
	@UploadDate datetime = NULL,
	@DimensionID int = NULL,
	@ColorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Envelops]
	SET
		[ImagePath] = @ImagePath,
		[Price] = @Price,
		[UploadDate] = @UploadDate,
		[DimensionID] = @DimensionID,
		[ColorID] = @ColorID
	WHERE
		[EnvelopID] = @EnvelopID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EnvelopsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_EnvelopsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_EnvelopsInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EnvelopsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EnvelopsInsert];
GO

CREATE PROCEDURE [proc_EnvelopsInsert]
(
	@EnvelopID int = NULL output,
	@ImagePath nvarchar(150) = NULL,
	@Price float = NULL,
	@UploadDate datetime = NULL,
	@DimensionID int = NULL,
	@ColorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Envelops]
	(
		[ImagePath],
		[Price],
		[UploadDate],
		[DimensionID],
		[ColorID]
	)
	VALUES
	(
		@ImagePath,
		@Price,
		@UploadDate,
		@DimensionID,
		@ColorID
	)

	SET @Err = @@Error

	SELECT @EnvelopID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EnvelopsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_EnvelopsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_EnvelopsDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_EnvelopsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_EnvelopsDelete];
GO

CREATE PROCEDURE [proc_EnvelopsDelete]
(
	@EnvelopID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Envelops]
	WHERE
		[EnvelopID] = @EnvelopID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_EnvelopsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_EnvelopsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MainCatLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MainCatLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MainCatLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MainCatLoadByPrimaryKey]
(
	@MainCatID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MainCatID],
		[NameEng],
		[NameAr],
		[TopLevelCatID],
		[ImagePath],
		[HoverImage],
		[IsPartySupplier]
	FROM [MainCat]
	WHERE
		([MainCatID] = @MainCatID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MainCatLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MainCatLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MainCatLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MainCatLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MainCatLoadAll];
GO

CREATE PROCEDURE [proc_MainCatLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MainCatID],
		[NameEng],
		[NameAr],
		[TopLevelCatID],
		[ImagePath],
		[HoverImage],
		[IsPartySupplier]
	FROM [MainCat]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MainCatLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MainCatLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MainCatUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MainCatUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MainCatUpdate];
GO

CREATE PROCEDURE [proc_MainCatUpdate]
(
	@MainCatID int,
	@NameEng nvarchar(30) = NULL,
	@NameAr nvarchar(30) = NULL,
	@TopLevelCatID int = NULL,
	@ImagePath nvarchar(200) = NULL,
	@HoverImage nvarchar(200) = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MainCat]
	SET
		[NameEng] = @NameEng,
		[NameAr] = @NameAr,
		[TopLevelCatID] = @TopLevelCatID,
		[ImagePath] = @ImagePath,
		[HoverImage] = @HoverImage,
		[IsPartySupplier] = @IsPartySupplier
	WHERE
		[MainCatID] = @MainCatID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MainCatUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MainCatUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MainCatInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MainCatInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MainCatInsert];
GO

CREATE PROCEDURE [proc_MainCatInsert]
(
	@MainCatID int = NULL output,
	@NameEng nvarchar(30) = NULL,
	@NameAr nvarchar(30) = NULL,
	@TopLevelCatID int = NULL,
	@ImagePath nvarchar(200) = NULL,
	@HoverImage nvarchar(200) = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MainCat]
	(
		[NameEng],
		[NameAr],
		[TopLevelCatID],
		[ImagePath],
		[HoverImage],
		[IsPartySupplier]
	)
	VALUES
	(
		@NameEng,
		@NameAr,
		@TopLevelCatID,
		@ImagePath,
		@HoverImage,
		@IsPartySupplier
	)

	SET @Err = @@Error

	SELECT @MainCatID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MainCatInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MainCatInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MainCatDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MainCatDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MainCatDelete];
GO

CREATE PROCEDURE [proc_MainCatDelete]
(
	@MainCatID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MainCat]
	WHERE
		[MainCatID] = @MainCatID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MainCatDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MainCatDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PartySupplierImagesLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PartySupplierImagesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PartySupplierImagesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PartySupplierImagesLoadByPrimaryKey]
(
	@PartySupplierImageID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PartySupplierImageID],
		[CardID],
		[ImagePath]
	FROM [PartySupplierImages]
	WHERE
		([PartySupplierImageID] = @PartySupplierImageID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PartySupplierImagesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PartySupplierImagesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PartySupplierImagesLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PartySupplierImagesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PartySupplierImagesLoadAll];
GO

CREATE PROCEDURE [proc_PartySupplierImagesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PartySupplierImageID],
		[CardID],
		[ImagePath]
	FROM [PartySupplierImages]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PartySupplierImagesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PartySupplierImagesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PartySupplierImagesUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PartySupplierImagesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PartySupplierImagesUpdate];
GO

CREATE PROCEDURE [proc_PartySupplierImagesUpdate]
(
	@PartySupplierImageID int,
	@CardID int = NULL,
	@ImagePath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PartySupplierImages]
	SET
		[CardID] = @CardID,
		[ImagePath] = @ImagePath
	WHERE
		[PartySupplierImageID] = @PartySupplierImageID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PartySupplierImagesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PartySupplierImagesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PartySupplierImagesInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PartySupplierImagesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PartySupplierImagesInsert];
GO

CREATE PROCEDURE [proc_PartySupplierImagesInsert]
(
	@PartySupplierImageID int = NULL output,
	@CardID int = NULL,
	@ImagePath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PartySupplierImages]
	(
		[CardID],
		[ImagePath]
	)
	VALUES
	(
		@CardID,
		@ImagePath
	)

	SET @Err = @@Error

	SELECT @PartySupplierImageID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PartySupplierImagesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PartySupplierImagesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PartySupplierImagesDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PartySupplierImagesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PartySupplierImagesDelete];
GO

CREATE PROCEDURE [proc_PartySupplierImagesDelete]
(
	@PartySupplierImageID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PartySupplierImages]
	WHERE
		[PartySupplierImageID] = @PartySupplierImageID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PartySupplierImagesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PartySupplierImagesDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SitePagesLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SitePagesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SitePagesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_SitePagesLoadByPrimaryKey]
(
	@PageID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PageID],
		[PageTitleAr],
		[PageTitleEng],
		[PageTextAr],
		[PageTextEng]
	FROM [SitePages]
	WHERE
		([PageID] = @PageID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SitePagesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SitePagesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SitePagesLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SitePagesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SitePagesLoadAll];
GO

CREATE PROCEDURE [proc_SitePagesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PageID],
		[PageTitleAr],
		[PageTitleEng],
		[PageTextAr],
		[PageTextEng]
	FROM [SitePages]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SitePagesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SitePagesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SitePagesUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SitePagesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SitePagesUpdate];
GO

CREATE PROCEDURE [proc_SitePagesUpdate]
(
	@PageID int,
	@PageTitleAr nvarchar(250) = NULL,
	@PageTitleEng nvarchar(250) = NULL,
	@PageTextAr nvarchar(MAX) = NULL,
	@PageTextEng nvarchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [SitePages]
	SET
		[PageTitleAr] = @PageTitleAr,
		[PageTitleEng] = @PageTitleEng,
		[PageTextAr] = @PageTextAr,
		[PageTextEng] = @PageTextEng
	WHERE
		[PageID] = @PageID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SitePagesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SitePagesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_SitePagesInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SitePagesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SitePagesInsert];
GO

CREATE PROCEDURE [proc_SitePagesInsert]
(
	@PageID int = NULL output,
	@PageTitleAr nvarchar(250) = NULL,
	@PageTitleEng nvarchar(250) = NULL,
	@PageTextAr nvarchar(MAX) = NULL,
	@PageTextEng nvarchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [SitePages]
	(
		[PageTitleAr],
		[PageTitleEng],
		[PageTextAr],
		[PageTextEng]
	)
	VALUES
	(
		@PageTitleAr,
		@PageTitleEng,
		@PageTextAr,
		@PageTextEng
	)

	SET @Err = @@Error

	SELECT @PageID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SitePagesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SitePagesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SitePagesDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SitePagesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SitePagesDelete];
GO

CREATE PROCEDURE [proc_SitePagesDelete]
(
	@PageID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [SitePages]
	WHERE
		[PageID] = @PageID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SitePagesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SitePagesDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TopLevelCatLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TopLevelCatLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TopLevelCatLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TopLevelCatLoadByPrimaryKey]
(
	@TopLevelCatID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TopLevelCatID],
		[NameEng],
		[NameAr],
		[ImagePath],
		[HoverImage],
		[IsPartySupplier]
	FROM [TopLevelCat]
	WHERE
		([TopLevelCatID] = @TopLevelCatID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TopLevelCatLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TopLevelCatLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TopLevelCatLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TopLevelCatLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TopLevelCatLoadAll];
GO

CREATE PROCEDURE [proc_TopLevelCatLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TopLevelCatID],
		[NameEng],
		[NameAr],
		[ImagePath],
		[HoverImage],
		[IsPartySupplier]
	FROM [TopLevelCat]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TopLevelCatLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TopLevelCatLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TopLevelCatUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TopLevelCatUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TopLevelCatUpdate];
GO

CREATE PROCEDURE [proc_TopLevelCatUpdate]
(
	@TopLevelCatID int,
	@NameEng nvarchar(30) = NULL,
	@NameAr nvarchar(30) = NULL,
	@ImagePath nvarchar(200) = NULL,
	@HoverImage nvarchar(200) = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TopLevelCat]
	SET
		[NameEng] = @NameEng,
		[NameAr] = @NameAr,
		[ImagePath] = @ImagePath,
		[HoverImage] = @HoverImage,
		[IsPartySupplier] = @IsPartySupplier
	WHERE
		[TopLevelCatID] = @TopLevelCatID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TopLevelCatUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TopLevelCatUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TopLevelCatInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TopLevelCatInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TopLevelCatInsert];
GO

CREATE PROCEDURE [proc_TopLevelCatInsert]
(
	@TopLevelCatID int = NULL output,
	@NameEng nvarchar(30) = NULL,
	@NameAr nvarchar(30) = NULL,
	@ImagePath nvarchar(200) = NULL,
	@HoverImage nvarchar(200) = NULL,
	@IsPartySupplier bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TopLevelCat]
	(
		[NameEng],
		[NameAr],
		[ImagePath],
		[HoverImage],
		[IsPartySupplier]
	)
	VALUES
	(
		@NameEng,
		@NameAr,
		@ImagePath,
		@HoverImage,
		@IsPartySupplier
	)

	SET @Err = @@Error

	SELECT @TopLevelCatID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TopLevelCatInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TopLevelCatInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TopLevelCatDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TopLevelCatDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TopLevelCatDelete];
GO

CREATE PROCEDURE [proc_TopLevelCatDelete]
(
	@TopLevelCatID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TopLevelCat]
	WHERE
		[TopLevelCatID] = @TopLevelCatID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TopLevelCatDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TopLevelCatDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserFavoritesLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
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

/****** Object:  StoredProcedure [proc_UserFavoritesLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
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

/****** Object:  StoredProcedure [proc_UserFavoritesUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
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




/****** Object:  StoredProcedure [proc_UserFavoritesInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
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

/****** Object:  StoredProcedure [proc_UserFavoritesDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
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

/****** Object:  StoredProcedure [proc_UserInfoLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserInfoLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserInfoLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_UserInfoLoadByPrimaryKey]
(
	@UserID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserID],
		[UserName],
		[UserPassword],
		[FullName],
		[UserAddress],
		[ShippingAddress],
		[MobilePhone],
		[LandLine],
		[Email]
	FROM [UserInfo]
	WHERE
		([UserID] = @UserID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserInfoLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserInfoLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserInfoLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserInfoLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserInfoLoadAll];
GO

CREATE PROCEDURE [proc_UserInfoLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserID],
		[UserName],
		[UserPassword],
		[FullName],
		[UserAddress],
		[ShippingAddress],
		[MobilePhone],
		[LandLine],
		[Email]
	FROM [UserInfo]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserInfoLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserInfoLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserInfoUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserInfoUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserInfoUpdate];
GO

CREATE PROCEDURE [proc_UserInfoUpdate]
(
	@UserID int,
	@UserName nvarchar(50) = NULL,
	@UserPassword nvarchar(50) = NULL,
	@FullName nvarchar(250) = NULL,
	@UserAddress nvarchar(500) = NULL,
	@ShippingAddress nvarchar(500) = NULL,
	@MobilePhone nvarchar(20) = NULL,
	@LandLine nvarchar(20) = NULL,
	@Email nvarchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [UserInfo]
	SET
		[UserName] = @UserName,
		[UserPassword] = @UserPassword,
		[FullName] = @FullName,
		[UserAddress] = @UserAddress,
		[ShippingAddress] = @ShippingAddress,
		[MobilePhone] = @MobilePhone,
		[LandLine] = @LandLine,
		[Email] = @Email
	WHERE
		[UserID] = @UserID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserInfoUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserInfoUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_UserInfoInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserInfoInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserInfoInsert];
GO

CREATE PROCEDURE [proc_UserInfoInsert]
(
	@UserID int = NULL output,
	@UserName nvarchar(50) = NULL,
	@UserPassword nvarchar(50) = NULL,
	@FullName nvarchar(250) = NULL,
	@UserAddress nvarchar(500) = NULL,
	@ShippingAddress nvarchar(500) = NULL,
	@MobilePhone nvarchar(20) = NULL,
	@LandLine nvarchar(20) = NULL,
	@Email nvarchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [UserInfo]
	(
		[UserName],
		[UserPassword],
		[FullName],
		[UserAddress],
		[ShippingAddress],
		[MobilePhone],
		[LandLine],
		[Email]
	)
	VALUES
	(
		@UserName,
		@UserPassword,
		@FullName,
		@UserAddress,
		@ShippingAddress,
		@MobilePhone,
		@LandLine,
		@Email
	)

	SET @Err = @@Error

	SELECT @UserID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserInfoInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserInfoInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserInfoDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserInfoDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserInfoDelete];
GO

CREATE PROCEDURE [proc_UserInfoDelete]
(
	@UserID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [UserInfo]
	WHERE
		[UserID] = @UserID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserInfoDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserInfoDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserPayementLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserPayementLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserPayementLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_UserPayementLoadByPrimaryKey]
(
	@PayementID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PayementID],
		[UserID],
		[CardID],
		[CardDesign],
		[CardCount],
		[EnvelopID],
		[EnvelopCount],
		[TotalPrice],
		[PayementDate],
		[OrderStatus]
	FROM [UserPayement]
	WHERE
		([PayementID] = @PayementID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserPayementLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserPayementLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserPayementLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserPayementLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserPayementLoadAll];
GO

CREATE PROCEDURE [proc_UserPayementLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PayementID],
		[UserID],
		[CardID],
		[CardDesign],
		[CardCount],
		[EnvelopID],
		[EnvelopCount],
		[TotalPrice],
		[PayementDate],
		[OrderStatus]
	FROM [UserPayement]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserPayementLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserPayementLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserPayementUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserPayementUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserPayementUpdate];
GO

CREATE PROCEDURE [proc_UserPayementUpdate]
(
	@PayementID int,
	@UserID int = NULL,
	@CardID int = NULL,
	@CardDesign nvarchar(250) = NULL,
	@CardCount int = NULL,
	@EnvelopID int = NULL,
	@EnvelopCount int = NULL,
	@TotalPrice float = NULL,
	@PayementDate datetime = NULL,
	@OrderStatus int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [UserPayement]
	SET
		[UserID] = @UserID,
		[CardID] = @CardID,
		[CardDesign] = @CardDesign,
		[CardCount] = @CardCount,
		[EnvelopID] = @EnvelopID,
		[EnvelopCount] = @EnvelopCount,
		[TotalPrice] = @TotalPrice,
		[PayementDate] = @PayementDate,
		[OrderStatus] = @OrderStatus
	WHERE
		[PayementID] = @PayementID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserPayementUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserPayementUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_UserPayementInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserPayementInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserPayementInsert];
GO

CREATE PROCEDURE [proc_UserPayementInsert]
(
	@PayementID int = NULL output,
	@UserID int = NULL,
	@CardID int = NULL,
	@CardDesign nvarchar(250) = NULL,
	@CardCount int = NULL,
	@EnvelopID int = NULL,
	@EnvelopCount int = NULL,
	@TotalPrice float = NULL,
	@PayementDate datetime = NULL,
	@OrderStatus int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [UserPayement]
	(
		[UserID],
		[CardID],
		[CardDesign],
		[CardCount],
		[EnvelopID],
		[EnvelopCount],
		[TotalPrice],
		[PayementDate],
		[OrderStatus]
	)
	VALUES
	(
		@UserID,
		@CardID,
		@CardDesign,
		@CardCount,
		@EnvelopID,
		@EnvelopCount,
		@TotalPrice,
		@PayementDate,
		@OrderStatus
	)

	SET @Err = @@Error

	SELECT @PayementID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserPayementInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserPayementInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserPayementDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserPayementDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserPayementDelete];
GO

CREATE PROCEDURE [proc_UserPayementDelete]
(
	@PayementID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [UserPayement]
	WHERE
		[PayementID] = @PayementID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserPayementDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserPayementDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserReviewsLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
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

/****** Object:  StoredProcedure [proc_UserReviewsLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
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

/****** Object:  StoredProcedure [proc_UserReviewsUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
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




/****** Object:  StoredProcedure [proc_UserReviewsInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
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

/****** Object:  StoredProcedure [proc_UserReviewsDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
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
