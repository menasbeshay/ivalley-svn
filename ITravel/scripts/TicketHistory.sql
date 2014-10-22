
/****** Object:  StoredProcedure [proc_TicketHistoryLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketHistoryLoadByPrimaryKey]
(
	@TicketHistoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketHistoryID],
		[TicketID],
		[From_AirportID],
		[To_AirportID],
		[AirLineID],
		[FromDate],
		[ToDate],
		[ActualPrice],
		[FinalPrice],
		[AddedValue],
		[AddedPercentage],
		[IsCanceled],
		[IsRefunded],
		[IsConfirmed],
		[UpdatedDate],
		[UpdatedBy],
		[TicketNo],
		[FlightNo],
		[SeatNo],
		[cabin_type],
		[TicketStatusID]
	FROM [TicketHistory]
	WHERE
		([TicketHistoryID] = @TicketHistoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryLoadAll]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryLoadAll];
GO

CREATE PROCEDURE [proc_TicketHistoryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketHistoryID],
		[TicketID],
		[From_AirportID],
		[To_AirportID],
		[AirLineID],
		[FromDate],
		[ToDate],
		[ActualPrice],
		[FinalPrice],
		[AddedValue],
		[AddedPercentage],
		[IsCanceled],
		[IsRefunded],
		[IsConfirmed],
		[UpdatedDate],
		[UpdatedBy],
		[TicketNo],
		[FlightNo],
		[SeatNo],
		[cabin_type],
		[TicketStatusID]
	FROM [TicketHistory]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryUpdate]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryUpdate];
GO

CREATE PROCEDURE [proc_TicketHistoryUpdate]
(
	@TicketHistoryID int,
	@TicketID int = NULL,
	@From_AirportID int = NULL,
	@To_AirportID int = NULL,
	@AirLineID int = NULL,
	@FromDate datetime = NULL,
	@ToDate datetime = NULL,
	@ActualPrice decimal(9,3) = NULL,
	@FinalPrice decimal(9,3) = NULL,
	@AddedValue decimal(9,3) = NULL,
	@AddedPercentage decimal(4,2) = NULL,
	@IsCanceled bit = NULL,
	@IsRefunded bit = NULL,
	@IsConfirmed bit = NULL,
	@UpdatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@TicketNo nvarchar(20) = NULL,
	@FlightNo nvarchar(20) = NULL,
	@SeatNo int = NULL,
	@cabin_type nvarchar(30) = NULL,
	@TicketStatusID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TicketHistory]
	SET
		[TicketID] = @TicketID,
		[From_AirportID] = @From_AirportID,
		[To_AirportID] = @To_AirportID,
		[AirLineID] = @AirLineID,
		[FromDate] = @FromDate,
		[ToDate] = @ToDate,
		[ActualPrice] = @ActualPrice,
		[FinalPrice] = @FinalPrice,
		[AddedValue] = @AddedValue,
		[AddedPercentage] = @AddedPercentage,
		[IsCanceled] = @IsCanceled,
		[IsRefunded] = @IsRefunded,
		[IsConfirmed] = @IsConfirmed,
		[UpdatedDate] = @UpdatedDate,
		[UpdatedBy] = @UpdatedBy,
		[TicketNo] = @TicketNo,
		[FlightNo] = @FlightNo,
		[SeatNo] = @SeatNo,
		[cabin_type] = @cabin_type,
		[TicketStatusID] = @TicketStatusID
	WHERE
		[TicketHistoryID] = @TicketHistoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketHistoryInsert]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryInsert];
GO

CREATE PROCEDURE [proc_TicketHistoryInsert]
(
	@TicketHistoryID int = NULL output,
	@TicketID int = NULL,
	@From_AirportID int = NULL,
	@To_AirportID int = NULL,
	@AirLineID int = NULL,
	@FromDate datetime = NULL,
	@ToDate datetime = NULL,
	@ActualPrice decimal(9,3) = NULL,
	@FinalPrice decimal(9,3) = NULL,
	@AddedValue decimal(9,3) = NULL,
	@AddedPercentage decimal(4,2) = NULL,
	@IsCanceled bit = NULL,
	@IsRefunded bit = NULL,
	@IsConfirmed bit = NULL,
	@UpdatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@TicketNo nvarchar(20) = NULL,
	@FlightNo nvarchar(20) = NULL,
	@SeatNo int = NULL,
	@cabin_type nvarchar(30) = NULL,
	@TicketStatusID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TicketHistory]
	(
		[TicketID],
		[From_AirportID],
		[To_AirportID],
		[AirLineID],
		[FromDate],
		[ToDate],
		[ActualPrice],
		[FinalPrice],
		[AddedValue],
		[AddedPercentage],
		[IsCanceled],
		[IsRefunded],
		[IsConfirmed],
		[UpdatedDate],
		[UpdatedBy],
		[TicketNo],
		[FlightNo],
		[SeatNo],
		[cabin_type],
		[TicketStatusID]
	)
	VALUES
	(
		@TicketID,
		@From_AirportID,
		@To_AirportID,
		@AirLineID,
		@FromDate,
		@ToDate,
		@ActualPrice,
		@FinalPrice,
		@AddedValue,
		@AddedPercentage,
		@IsCanceled,
		@IsRefunded,
		@IsConfirmed,
		@UpdatedDate,
		@UpdatedBy,
		@TicketNo,
		@FlightNo,
		@SeatNo,
		@cabin_type,
		@TicketStatusID
	)

	SET @Err = @@Error

	SELECT @TicketHistoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryDelete]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryDelete];
GO

CREATE PROCEDURE [proc_TicketHistoryDelete]
(
	@TicketHistoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TicketHistory]
	WHERE
		[TicketHistoryID] = @TicketHistoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryDelete Error on Creation'
GO
