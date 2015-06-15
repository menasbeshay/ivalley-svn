
/****** Object:  StoredProcedure [proc_PurchaseOrderLoadByPrimaryKey]    Script Date: 6/15/2015 2:31:14 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PurchaseOrderLoadByPrimaryKey]
(
	@PurchaseOrderID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PurchaseOrderID],
		[PurchaseOrderNumber],
		[PurchaseOrderDate],
		[Management],
		[ISFinalProduct],
		[ISSample],
		[ISProductUnderManufacturing],
		[DeliveryDate],
		[DeliveryPlace],
		[PaymentRequierment],
		[ManagerName],
		[Signature],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [PurchaseOrder]
	WHERE
		([PurchaseOrderID] = @PurchaseOrderID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderLoadAll]    Script Date: 6/15/2015 2:31:14 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderLoadAll];
GO

CREATE PROCEDURE [proc_PurchaseOrderLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PurchaseOrderID],
		[PurchaseOrderNumber],
		[PurchaseOrderDate],
		[Management],
		[ISFinalProduct],
		[ISSample],
		[ISProductUnderManufacturing],
		[DeliveryDate],
		[DeliveryPlace],
		[PaymentRequierment],
		[ManagerName],
		[Signature],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [PurchaseOrder]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderUpdate]    Script Date: 6/15/2015 2:31:14 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderUpdate];
GO

CREATE PROCEDURE [proc_PurchaseOrderUpdate]
(
	@PurchaseOrderID int,
	@PurchaseOrderNumber nvarchar(300) = NULL,
	@PurchaseOrderDate datetime = NULL,
	@Management nvarchar(500) = NULL,
	@ISFinalProduct bit = NULL,
	@ISSample bit = NULL,
	@ISProductUnderManufacturing bit = NULL,
	@DeliveryDate datetime = NULL,
	@DeliveryPlace nvarchar(500) = NULL,
	@PaymentRequierment nvarchar(500) = NULL,
	@ManagerName nvarchar(300) = NULL,
	@Signature nvarchar(300) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PurchaseOrder]
	SET
		[PurchaseOrderNumber] = @PurchaseOrderNumber,
		[PurchaseOrderDate] = @PurchaseOrderDate,
		[Management] = @Management,
		[ISFinalProduct] = @ISFinalProduct,
		[ISSample] = @ISSample,
		[ISProductUnderManufacturing] = @ISProductUnderManufacturing,
		[DeliveryDate] = @DeliveryDate,
		[DeliveryPlace] = @DeliveryPlace,
		[PaymentRequierment] = @PaymentRequierment,
		[ManagerName] = @ManagerName,
		[Signature] = @Signature,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[PurchaseOrderID] = @PurchaseOrderID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PurchaseOrderInsert]    Script Date: 6/15/2015 2:31:14 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderInsert];
GO

CREATE PROCEDURE [proc_PurchaseOrderInsert]
(
	@PurchaseOrderID int = NULL output,
	@PurchaseOrderNumber nvarchar(300) = NULL,
	@PurchaseOrderDate datetime = NULL,
	@Management nvarchar(500) = NULL,
	@ISFinalProduct bit = NULL,
	@ISSample bit = NULL,
	@ISProductUnderManufacturing bit = NULL,
	@DeliveryDate datetime = NULL,
	@DeliveryPlace nvarchar(500) = NULL,
	@PaymentRequierment nvarchar(500) = NULL,
	@ManagerName nvarchar(300) = NULL,
	@Signature nvarchar(300) = NULL,
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
	INTO [PurchaseOrder]
	(
		[PurchaseOrderNumber],
		[PurchaseOrderDate],
		[Management],
		[ISFinalProduct],
		[ISSample],
		[ISProductUnderManufacturing],
		[DeliveryDate],
		[DeliveryPlace],
		[PaymentRequierment],
		[ManagerName],
		[Signature],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@PurchaseOrderNumber,
		@PurchaseOrderDate,
		@Management,
		@ISFinalProduct,
		@ISSample,
		@ISProductUnderManufacturing,
		@DeliveryDate,
		@DeliveryPlace,
		@PaymentRequierment,
		@ManagerName,
		@Signature,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @PurchaseOrderID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderDelete]    Script Date: 6/15/2015 2:31:14 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PurchaseOrderDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PurchaseOrderDelete];
GO

CREATE PROCEDURE [proc_PurchaseOrderDelete]
(
	@PurchaseOrderID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PurchaseOrder]
	WHERE
		[PurchaseOrderID] = @PurchaseOrderID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PurchaseOrderDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PurchaseOrderDelete Error on Creation'
GO
