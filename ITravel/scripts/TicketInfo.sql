
/****** Object:  StoredProcedure [proc_TicketInfoLoadByPrimaryKey]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketInfoLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketInfoLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketInfoLoadByPrimaryKey]
(
	@TicketID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
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
		[CreatedDate],
		[CreatedBy],
		[LastUpdatedDate],
		[LastUpdatedBy]
	FROM [TicketInfo]
	WHERE
		([TicketID] = @TicketID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketInfoLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketInfoLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketInfoLoadAll]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketInfoLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketInfoLoadAll];
GO

CREATE PROCEDURE [proc_TicketInfoLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
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
		[CreatedDate],
		[CreatedBy],
		[LastUpdatedDate],
		[LastUpdatedBy]
	FROM [TicketInfo]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketInfoLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketInfoLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketInfoUpdate]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketInfoUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketInfoUpdate];
GO

CREATE PROCEDURE [proc_TicketInfoUpdate]
(
	@TicketID int,
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
	@CreatedDate datetime = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@LastUpdatedBy uniqueidentifier = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TicketInfo]
	SET
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
		[CreatedDate] = @CreatedDate,
		[CreatedBy] = @CreatedBy,
		[LastUpdatedDate] = @LastUpdatedDate,
		[LastUpdatedBy] = @LastUpdatedBy
	WHERE
		[TicketID] = @TicketID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketInfoUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketInfoUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketInfoInsert]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketInfoInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketInfoInsert];
GO

CREATE PROCEDURE [proc_TicketInfoInsert]
(
	@TicketID int = NULL output,
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
	@CreatedDate datetime = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@LastUpdatedBy uniqueidentifier = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TicketInfo]
	(
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
		[CreatedDate],
		[CreatedBy],
		[LastUpdatedDate],
		[LastUpdatedBy]
	)
	VALUES
	(
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
		@CreatedDate,
		@CreatedBy,
		@LastUpdatedDate,
		@LastUpdatedBy
	)

	SET @Err = @@Error

	SELECT @TicketID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketInfoInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketInfoInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketInfoDelete]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketInfoDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketInfoDelete];
GO

CREATE PROCEDURE [proc_TicketInfoDelete]
(
	@TicketID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TicketInfo]
	WHERE
		[TicketID] = @TicketID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketInfoDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketInfoDelete Error on Creation'
GO
