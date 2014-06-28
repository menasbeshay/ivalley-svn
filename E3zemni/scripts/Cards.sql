
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
