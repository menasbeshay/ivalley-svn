
/****** Object:  StoredProcedure [proc_StatusHistoryLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_StatusHistoryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_StatusHistoryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_StatusHistoryLoadByPrimaryKey]
(
	@StatusHistoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[StatusHistoryID],
		[TradePricingID],
		[CommitteeTypeID],
		[CommitteeDescisionID],
		[CompanyDescisionID],
		[PricingStatusID],
		[CommitteDate],
		[CurrentPrice],
		[Comment],
		[AttachementPath]
	FROM [StatusHistory]
	WHERE
		([StatusHistoryID] = @StatusHistoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_StatusHistoryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_StatusHistoryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_StatusHistoryLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_StatusHistoryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_StatusHistoryLoadAll];
GO

CREATE PROCEDURE [proc_StatusHistoryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[StatusHistoryID],
		[TradePricingID],
		[CommitteeTypeID],
		[CommitteeDescisionID],
		[CompanyDescisionID],
		[PricingStatusID],
		[CommitteDate],
		[CurrentPrice],
		[Comment],
		[AttachementPath]
	FROM [StatusHistory]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_StatusHistoryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_StatusHistoryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_StatusHistoryUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_StatusHistoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_StatusHistoryUpdate];
GO

CREATE PROCEDURE [proc_StatusHistoryUpdate]
(
	@StatusHistoryID int,
	@TradePricingID int = NULL,
	@CommitteeTypeID int = NULL,
	@CommitteeDescisionID int = NULL,
	@CompanyDescisionID int = NULL,
	@PricingStatusID int = NULL,
	@CommitteDate datetime = NULL,
	@CurrentPrice float = NULL,
	@Comment nvarchar(2500) = NULL,
	@AttachementPath nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [StatusHistory]
	SET
		[TradePricingID] = @TradePricingID,
		[CommitteeTypeID] = @CommitteeTypeID,
		[CommitteeDescisionID] = @CommitteeDescisionID,
		[CompanyDescisionID] = @CompanyDescisionID,
		[PricingStatusID] = @PricingStatusID,
		[CommitteDate] = @CommitteDate,
		[CurrentPrice] = @CurrentPrice,
		[Comment] = @Comment,
		[AttachementPath] = @AttachementPath
	WHERE
		[StatusHistoryID] = @StatusHistoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_StatusHistoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_StatusHistoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_StatusHistoryInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_StatusHistoryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_StatusHistoryInsert];
GO

CREATE PROCEDURE [proc_StatusHistoryInsert]
(
	@StatusHistoryID int = NULL output,
	@TradePricingID int = NULL,
	@CommitteeTypeID int = NULL,
	@CommitteeDescisionID int = NULL,
	@CompanyDescisionID int = NULL,
	@PricingStatusID int = NULL,
	@CommitteDate datetime = NULL,
	@CurrentPrice float = NULL,
	@Comment nvarchar(2500) = NULL,
	@AttachementPath nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [StatusHistory]
	(
		[TradePricingID],
		[CommitteeTypeID],
		[CommitteeDescisionID],
		[CompanyDescisionID],
		[PricingStatusID],
		[CommitteDate],
		[CurrentPrice],
		[Comment],
		[AttachementPath]
	)
	VALUES
	(
		@TradePricingID,
		@CommitteeTypeID,
		@CommitteeDescisionID,
		@CompanyDescisionID,
		@PricingStatusID,
		@CommitteDate,
		@CurrentPrice,
		@Comment,
		@AttachementPath
	)

	SET @Err = @@Error

	SELECT @StatusHistoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_StatusHistoryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_StatusHistoryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_StatusHistoryDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_StatusHistoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_StatusHistoryDelete];
GO

CREATE PROCEDURE [proc_StatusHistoryDelete]
(
	@StatusHistoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [StatusHistory]
	WHERE
		[StatusHistoryID] = @StatusHistoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_StatusHistoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_StatusHistoryDelete Error on Creation'
GO
