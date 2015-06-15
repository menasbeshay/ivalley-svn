
/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsLoadByPrimaryKey]    Script Date: 6/15/2015 2:31:14 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderDetailsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderDetailsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PurchaseOrderDetailsLoadByPrimaryKey]
(
	@PurchaseOrderDetailsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PurchaseOrderDetailsID],
		[PurchaseOrderID],
		[TotalValue],
		[UnitPrice],
		[QuantityRequired],
		[StockOnHand],
		[Unit],
		[Description],
		[Serial],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [PurchaseOrderDetails]
	WHERE
		([PurchaseOrderDetailsID] = @PurchaseOrderDetailsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderDetailsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderDetailsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsLoadAll]    Script Date: 6/15/2015 2:31:14 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderDetailsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderDetailsLoadAll];
GO

CREATE PROCEDURE [proc_PurchaseOrderDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PurchaseOrderDetailsID],
		[PurchaseOrderID],
		[TotalValue],
		[UnitPrice],
		[QuantityRequired],
		[StockOnHand],
		[Unit],
		[Description],
		[Serial],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [PurchaseOrderDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderDetailsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderDetailsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsUpdate]    Script Date: 6/15/2015 2:31:14 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderDetailsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderDetailsUpdate];
GO

CREATE PROCEDURE [proc_PurchaseOrderDetailsUpdate]
(
	@PurchaseOrderDetailsID int,
	@PurchaseOrderID int = NULL,
	@TotalValue float = NULL,
	@UnitPrice float = NULL,
	@QuantityRequired int = NULL,
	@StockOnHand int = NULL,
	@Unit int = NULL,
	@Description nvarchar(500) = NULL,
	@Serial nvarchar(1) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PurchaseOrderDetails]
	SET
		[PurchaseOrderID] = @PurchaseOrderID,
		[TotalValue] = @TotalValue,
		[UnitPrice] = @UnitPrice,
		[QuantityRequired] = @QuantityRequired,
		[StockOnHand] = @StockOnHand,
		[Unit] = @Unit,
		[Description] = @Description,
		[Serial] = @Serial,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[PurchaseOrderDetailsID] = @PurchaseOrderDetailsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderDetailsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderDetailsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsInsert]    Script Date: 6/15/2015 2:31:14 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderDetailsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderDetailsInsert];
GO

CREATE PROCEDURE [proc_PurchaseOrderDetailsInsert]
(
	@PurchaseOrderDetailsID int = NULL output,
	@PurchaseOrderID int = NULL,
	@TotalValue float = NULL,
	@UnitPrice float = NULL,
	@QuantityRequired int = NULL,
	@StockOnHand int = NULL,
	@Unit int = NULL,
	@Description nvarchar(500) = NULL,
	@Serial nvarchar(1) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PurchaseOrderDetails]
	(
		[PurchaseOrderID],
		[TotalValue],
		[UnitPrice],
		[QuantityRequired],
		[StockOnHand],
		[Unit],
		[Description],
		[Serial],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@PurchaseOrderID,
		@TotalValue,
		@UnitPrice,
		@QuantityRequired,
		@StockOnHand,
		@Unit,
		@Description,
		@Serial,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @PurchaseOrderDetailsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderDetailsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderDetailsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsDelete]    Script Date: 6/15/2015 2:31:14 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderDetailsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderDetailsDelete];
GO

CREATE PROCEDURE [proc_PurchaseOrderDetailsDelete]
(
	@PurchaseOrderDetailsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PurchaseOrderDetails]
	WHERE
		[PurchaseOrderDetailsID] = @PurchaseOrderDetailsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderDetailsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderDetailsDelete Error on Creation'
GO
