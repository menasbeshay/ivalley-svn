
/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsLoadByPrimaryKey]    Script Date: 6/22/2015 1:13:29 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderDetailsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderDetailsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DeliveryOrderDetailsLoadByPrimaryKey]
(
	@DeliveryOrderDetailsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeliveryOrderDetailsID],
		[DeliveryOrderID],
		[DeliveryOrderStatusID],
		[DeliveryFrom],
		[DeliveryTo],
		[DateFrom],
		[DateTo],
		[ReceivableName],
		[ReceivableTelephone],
		[Price],
		[DeliveryOrderCode],
		[DeliveryOrderDetailsStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[WatingHours]
	FROM [DeliveryOrderDetails]
	WHERE
		([DeliveryOrderDetailsID] = @DeliveryOrderDetailsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderDetailsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderDetailsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsLoadAll]    Script Date: 6/22/2015 1:13:29 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderDetailsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderDetailsLoadAll];
GO

CREATE PROCEDURE [proc_DeliveryOrderDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeliveryOrderDetailsID],
		[DeliveryOrderID],
		[DeliveryOrderStatusID],
		[DeliveryFrom],
		[DeliveryTo],
		[DateFrom],
		[DateTo],
		[ReceivableName],
		[ReceivableTelephone],
		[Price],
		[DeliveryOrderCode],
		[DeliveryOrderDetailsStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[WatingHours]
	FROM [DeliveryOrderDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderDetailsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderDetailsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsUpdate]    Script Date: 6/22/2015 1:13:29 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderDetailsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderDetailsUpdate];
GO

CREATE PROCEDURE [proc_DeliveryOrderDetailsUpdate]
(
	@DeliveryOrderDetailsID int,
	@DeliveryOrderID int = NULL,
	@DeliveryOrderStatusID int = NULL,
	@DeliveryFrom nvarchar(300) = NULL,
	@DeliveryTo nvarchar(300) = NULL,
	@DateFrom datetime = NULL,
	@DateTo datetime = NULL,
	@ReceivableName nvarchar(300) = NULL,
	@ReceivableTelephone nvarchar(50) = NULL,
	@Price float = NULL,
	@DeliveryOrderCode nvarchar(300) = NULL,
	@DeliveryOrderDetailsStatusID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@WatingHours float = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DeliveryOrderDetails]
	SET
		[DeliveryOrderID] = @DeliveryOrderID,
		[DeliveryOrderStatusID] = @DeliveryOrderStatusID,
		[DeliveryFrom] = @DeliveryFrom,
		[DeliveryTo] = @DeliveryTo,
		[DateFrom] = @DateFrom,
		[DateTo] = @DateTo,
		[ReceivableName] = @ReceivableName,
		[ReceivableTelephone] = @ReceivableTelephone,
		[Price] = @Price,
		[DeliveryOrderCode] = @DeliveryOrderCode,
		[DeliveryOrderDetailsStatusID] = @DeliveryOrderDetailsStatusID,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate,
		[WatingHours] = @WatingHours
	WHERE
		[DeliveryOrderDetailsID] = @DeliveryOrderDetailsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderDetailsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderDetailsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsInsert]    Script Date: 6/22/2015 1:13:29 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderDetailsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderDetailsInsert];
GO

CREATE PROCEDURE [proc_DeliveryOrderDetailsInsert]
(
	@DeliveryOrderDetailsID int = NULL output,
	@DeliveryOrderID int = NULL,
	@DeliveryOrderStatusID int = NULL,
	@DeliveryFrom nvarchar(300) = NULL,
	@DeliveryTo nvarchar(300) = NULL,
	@DateFrom datetime = NULL,
	@DateTo datetime = NULL,
	@ReceivableName nvarchar(300) = NULL,
	@ReceivableTelephone nvarchar(50) = NULL,
	@Price float = NULL,
	@DeliveryOrderCode nvarchar(300) = NULL,
	@DeliveryOrderDetailsStatusID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@WatingHours float = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DeliveryOrderDetails]
	(
		[DeliveryOrderID],
		[DeliveryOrderStatusID],
		[DeliveryFrom],
		[DeliveryTo],
		[DateFrom],
		[DateTo],
		[ReceivableName],
		[ReceivableTelephone],
		[Price],
		[DeliveryOrderCode],
		[DeliveryOrderDetailsStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[WatingHours]
	)
	VALUES
	(
		@DeliveryOrderID,
		@DeliveryOrderStatusID,
		@DeliveryFrom,
		@DeliveryTo,
		@DateFrom,
		@DateTo,
		@ReceivableName,
		@ReceivableTelephone,
		@Price,
		@DeliveryOrderCode,
		@DeliveryOrderDetailsStatusID,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate,
		@WatingHours
	)

	SET @Err = @@Error

	SELECT @DeliveryOrderDetailsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderDetailsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderDetailsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsDelete]    Script Date: 6/22/2015 1:13:29 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderDetailsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderDetailsDelete];
GO

CREATE PROCEDURE [proc_DeliveryOrderDetailsDelete]
(
	@DeliveryOrderDetailsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DeliveryOrderDetails]
	WHERE
		[DeliveryOrderDetailsID] = @DeliveryOrderDetailsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderDetailsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderDetailsDelete Error on Creation'
GO
