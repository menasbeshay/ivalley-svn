
/****** Object:  StoredProcedure [proc_TicketsLoadByPrimaryKey]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketsLoadByPrimaryKey]
(
	@TicketID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketID],
		[TicketTypeID],
		[CompanyID],
		[TradePricingID],
		[CommitteeHistoryID],
		[LastCommitteeDate],
		[LastDescision],
		[CurrentPrice],
		[SuggestedPrice],
		[TextRequest],
		[FileAttachement],
		[InitiateDate],
		[TicketStatusID],
		[TradeName]
	FROM [Tickets]
	WHERE
		([TicketID] = @TicketID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketsLoadAll]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketsLoadAll];
GO

CREATE PROCEDURE [proc_TicketsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketID],
		[TicketTypeID],
		[CompanyID],
		[TradePricingID],
		[CommitteeHistoryID],
		[LastCommitteeDate],
		[LastDescision],
		[CurrentPrice],
		[SuggestedPrice],
		[TextRequest],
		[FileAttachement],
		[InitiateDate],
		[TicketStatusID],
		[TradeName]
	FROM [Tickets]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketsUpdate]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketsUpdate];
GO

CREATE PROCEDURE [proc_TicketsUpdate]
(
	@TicketID int,
	@TicketTypeID int = NULL,
	@CompanyID int = NULL,
	@TradePricingID int = NULL,
	@CommitteeHistoryID int = NULL,
	@LastCommitteeDate datetime = NULL,
	@LastDescision nvarchar(2500) = NULL,
	@CurrentPrice float = NULL,
	@SuggestedPrice float = NULL,
	@TextRequest nvarchar(2500) = NULL,
	@FileAttachement nvarchar(350) = NULL,
	@InitiateDate datetime = NULL,
	@TicketStatusID int = NULL,
	@TradeName nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Tickets]
	SET
		[TicketTypeID] = @TicketTypeID,
		[CompanyID] = @CompanyID,
		[TradePricingID] = @TradePricingID,
		[CommitteeHistoryID] = @CommitteeHistoryID,
		[LastCommitteeDate] = @LastCommitteeDate,
		[LastDescision] = @LastDescision,
		[CurrentPrice] = @CurrentPrice,
		[SuggestedPrice] = @SuggestedPrice,
		[TextRequest] = @TextRequest,
		[FileAttachement] = @FileAttachement,
		[InitiateDate] = @InitiateDate,
		[TicketStatusID] = @TicketStatusID,
		[TradeName] = @TradeName
	WHERE
		[TicketID] = @TicketID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketsInsert]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketsInsert];
GO

CREATE PROCEDURE [proc_TicketsInsert]
(
	@TicketID int = NULL output,
	@TicketTypeID int = NULL,
	@CompanyID int = NULL,
	@TradePricingID int = NULL,
	@CommitteeHistoryID int = NULL,
	@LastCommitteeDate datetime = NULL,
	@LastDescision nvarchar(2500) = NULL,
	@CurrentPrice float = NULL,
	@SuggestedPrice float = NULL,
	@TextRequest nvarchar(2500) = NULL,
	@FileAttachement nvarchar(350) = NULL,
	@InitiateDate datetime = NULL,
	@TicketStatusID int = NULL,
	@TradeName nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Tickets]
	(
		[TicketTypeID],
		[CompanyID],
		[TradePricingID],
		[CommitteeHistoryID],
		[LastCommitteeDate],
		[LastDescision],
		[CurrentPrice],
		[SuggestedPrice],
		[TextRequest],
		[FileAttachement],
		[InitiateDate],
		[TicketStatusID],
		[TradeName]
	)
	VALUES
	(
		@TicketTypeID,
		@CompanyID,
		@TradePricingID,
		@CommitteeHistoryID,
		@LastCommitteeDate,
		@LastDescision,
		@CurrentPrice,
		@SuggestedPrice,
		@TextRequest,
		@FileAttachement,
		@InitiateDate,
		@TicketStatusID,
		@TradeName
	)

	SET @Err = @@Error

	SELECT @TicketID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketsDelete]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketsDelete];
GO

CREATE PROCEDURE [proc_TicketsDelete]
(
	@TicketID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Tickets]
	WHERE
		[TicketID] = @TicketID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketsDelete Error on Creation'
GO
