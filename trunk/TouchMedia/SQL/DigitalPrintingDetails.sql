
/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsLoadByPrimaryKey]    Script Date: 6/22/2015 1:13:30 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DigitalPrintingDetailsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DigitalPrintingDetailsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DigitalPrintingDetailsLoadByPrimaryKey]
(
	@DigitalPrintingDetailsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DigitalPrintingDetailsID],
		[JobOrderID],
		[PrintingTypeID],
		[IsRAndV],
		[SupplierID],
		[DeliveryDoneTo],
		[JobOrderStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [DigitalPrintingDetails]
	WHERE
		([DigitalPrintingDetailsID] = @DigitalPrintingDetailsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DigitalPrintingDetailsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DigitalPrintingDetailsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsLoadAll]    Script Date: 6/22/2015 1:13:30 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DigitalPrintingDetailsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DigitalPrintingDetailsLoadAll];
GO

CREATE PROCEDURE [proc_DigitalPrintingDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DigitalPrintingDetailsID],
		[JobOrderID],
		[PrintingTypeID],
		[IsRAndV],
		[SupplierID],
		[DeliveryDoneTo],
		[JobOrderStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [DigitalPrintingDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DigitalPrintingDetailsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DigitalPrintingDetailsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsUpdate]    Script Date: 6/22/2015 1:13:30 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DigitalPrintingDetailsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DigitalPrintingDetailsUpdate];
GO

CREATE PROCEDURE [proc_DigitalPrintingDetailsUpdate]
(
	@DigitalPrintingDetailsID int,
	@JobOrderID int = NULL,
	@PrintingTypeID int = NULL,
	@IsRAndV bit = NULL,
	@SupplierID int = NULL,
	@DeliveryDoneTo int = NULL,
	@JobOrderStatusID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DigitalPrintingDetails]
	SET
		[JobOrderID] = @JobOrderID,
		[PrintingTypeID] = @PrintingTypeID,
		[IsRAndV] = @IsRAndV,
		[SupplierID] = @SupplierID,
		[DeliveryDoneTo] = @DeliveryDoneTo,
		[JobOrderStatusID] = @JobOrderStatusID,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[DigitalPrintingDetailsID] = @DigitalPrintingDetailsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DigitalPrintingDetailsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DigitalPrintingDetailsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsInsert]    Script Date: 6/22/2015 1:13:30 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DigitalPrintingDetailsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DigitalPrintingDetailsInsert];
GO

CREATE PROCEDURE [proc_DigitalPrintingDetailsInsert]
(
	@DigitalPrintingDetailsID int = NULL output,
	@JobOrderID int = NULL,
	@PrintingTypeID int = NULL,
	@IsRAndV bit = NULL,
	@SupplierID int = NULL,
	@DeliveryDoneTo int = NULL,
	@JobOrderStatusID int = NULL,
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
	INTO [DigitalPrintingDetails]
	(
		[JobOrderID],
		[PrintingTypeID],
		[IsRAndV],
		[SupplierID],
		[DeliveryDoneTo],
		[JobOrderStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@JobOrderID,
		@PrintingTypeID,
		@IsRAndV,
		@SupplierID,
		@DeliveryDoneTo,
		@JobOrderStatusID,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @DigitalPrintingDetailsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DigitalPrintingDetailsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DigitalPrintingDetailsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsDelete]    Script Date: 6/22/2015 1:13:30 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DigitalPrintingDetailsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DigitalPrintingDetailsDelete];
GO

CREATE PROCEDURE [proc_DigitalPrintingDetailsDelete]
(
	@DigitalPrintingDetailsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DigitalPrintingDetails]
	WHERE
		[DigitalPrintingDetailsID] = @DigitalPrintingDetailsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DigitalPrintingDetailsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DigitalPrintingDetailsDelete Error on Creation'
GO
