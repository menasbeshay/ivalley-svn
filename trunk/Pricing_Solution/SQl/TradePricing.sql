
/****** Object:  StoredProcedure [proc_TradePricingLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TradePricingLoadByPrimaryKey]
(
	@TradePricingID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TradePricingID],
		[CompanyID],
		[PricingStatusID],
		[RegistrationCommitteTypeID],
		[DosageFormID],
		[FileTypeID],
		[ManufactureID],
		[TradeName],
		[Generics],
		[CompanyPrice],
		[CommittePrice],
		[CommitteDate],
		[DiscussionDate],
		[SubmissionDate],
		[Pack],
		[FileNo],
		[FilePath],
		[Generic],
		[GenericStrength],
		[ImportedManufacture]
	FROM [TradePricing]
	WHERE
		([TradePricingID] = @TradePricingID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingLoadAll];
GO

CREATE PROCEDURE [proc_TradePricingLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TradePricingID],
		[CompanyID],
		[PricingStatusID],
		[RegistrationCommitteTypeID],
		[DosageFormID],
		[FileTypeID],
		[ManufactureID],
		[TradeName],
		[Generics],
		[CompanyPrice],
		[CommittePrice],
		[CommitteDate],
		[DiscussionDate],
		[SubmissionDate],
		[Pack],
		[FileNo],
		[FilePath],
		[Generic],
		[GenericStrength],
		[ImportedManufacture]
	FROM [TradePricing]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingUpdate];
GO

CREATE PROCEDURE [proc_TradePricingUpdate]
(
	@TradePricingID int,
	@CompanyID int = NULL,
	@PricingStatusID int = NULL,
	@RegistrationCommitteTypeID int = NULL,
	@DosageFormID int = NULL,
	@FileTypeID int = NULL,
	@ManufactureID int = NULL,
	@TradeName nvarchar(150) = NULL,
	@Generics nvarchar(250) = NULL,
	@CompanyPrice float = NULL,
	@CommittePrice float = NULL,
	@CommitteDate nvarchar(50) = NULL,
	@DiscussionDate nvarchar(50) = NULL,
	@SubmissionDate nvarchar(50) = NULL,
	@Pack nvarchar(250) = NULL,
	@FileNo nvarchar(10) = NULL,
	@FilePath nvarchar(250) = NULL,
	@Generic nvarchar(250) = NULL,
	@GenericStrength nvarchar(50) = NULL,
	@ImportedManufacture nvarchar(1500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TradePricing]
	SET
		[CompanyID] = @CompanyID,
		[PricingStatusID] = @PricingStatusID,
		[RegistrationCommitteTypeID] = @RegistrationCommitteTypeID,
		[DosageFormID] = @DosageFormID,
		[FileTypeID] = @FileTypeID,
		[ManufactureID] = @ManufactureID,
		[TradeName] = @TradeName,
		[Generics] = @Generics,
		[CompanyPrice] = @CompanyPrice,
		[CommittePrice] = @CommittePrice,
		[CommitteDate] = @CommitteDate,
		[DiscussionDate] = @DiscussionDate,
		[SubmissionDate] = @SubmissionDate,
		[Pack] = @Pack,
		[FileNo] = @FileNo,
		[FilePath] = @FilePath,
		[Generic] = @Generic,
		[GenericStrength] = @GenericStrength,
		[ImportedManufacture] = @ImportedManufacture
	WHERE
		[TradePricingID] = @TradePricingID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TradePricingInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingInsert];
GO

CREATE PROCEDURE [proc_TradePricingInsert]
(
	@TradePricingID int = NULL output,
	@CompanyID int = NULL,
	@PricingStatusID int = NULL,
	@RegistrationCommitteTypeID int = NULL,
	@DosageFormID int = NULL,
	@FileTypeID int = NULL,
	@ManufactureID int = NULL,
	@TradeName nvarchar(150) = NULL,
	@Generics nvarchar(250) = NULL,
	@CompanyPrice float = NULL,
	@CommittePrice float = NULL,
	@CommitteDate nvarchar(50) = NULL,
	@DiscussionDate nvarchar(50) = NULL,
	@SubmissionDate nvarchar(50) = NULL,
	@Pack nvarchar(250) = NULL,
	@FileNo nvarchar(10) = NULL,
	@FilePath nvarchar(250) = NULL,
	@Generic nvarchar(250) = NULL,
	@GenericStrength nvarchar(50) = NULL,
	@ImportedManufacture nvarchar(1500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TradePricing]
	(
		[CompanyID],
		[PricingStatusID],
		[RegistrationCommitteTypeID],
		[DosageFormID],
		[FileTypeID],
		[ManufactureID],
		[TradeName],
		[Generics],
		[CompanyPrice],
		[CommittePrice],
		[CommitteDate],
		[DiscussionDate],
		[SubmissionDate],
		[Pack],
		[FileNo],
		[FilePath],
		[Generic],
		[GenericStrength],
		[ImportedManufacture]
	)
	VALUES
	(
		@CompanyID,
		@PricingStatusID,
		@RegistrationCommitteTypeID,
		@DosageFormID,
		@FileTypeID,
		@ManufactureID,
		@TradeName,
		@Generics,
		@CompanyPrice,
		@CommittePrice,
		@CommitteDate,
		@DiscussionDate,
		@SubmissionDate,
		@Pack,
		@FileNo,
		@FilePath,
		@Generic,
		@GenericStrength,
		@ImportedManufacture
	)

	SET @Err = @@Error

	SELECT @TradePricingID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingDelete];
GO

CREATE PROCEDURE [proc_TradePricingDelete]
(
	@TradePricingID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TradePricing]
	WHERE
		[TradePricingID] = @TradePricingID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingDelete Error on Creation'
GO
