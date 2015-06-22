
/****** Object:  StoredProcedure [proc_DeliveryOrderLoadByPrimaryKey]    Script Date: 6/22/2015 1:13:29 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DeliveryOrderLoadByPrimaryKey]
(
	@DeliveryOrderID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeliveryOrderID],
		[KilometerCounterBefore],
		[KilometerCounterAfter],
		[TotalPrice],
		[DeliveryOrderStatusID],
		[GeneralDeliveryCode],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[TransformationSupplier],
		[DriverName],
		[DriverNationID],
		[CarNumber],
		[DriverTelephone],
		[WatingHours],
		[PermationNumber],
		[Department],
		[ClientCode],
		[DeliveryOrderName],
		[DeliveryOrderDate],
		[DepartmentResponsableName],
		[CarType]
	FROM [DeliveryOrder]
	WHERE
		([DeliveryOrderID] = @DeliveryOrderID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderLoadAll]    Script Date: 6/22/2015 1:13:29 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderLoadAll];
GO

CREATE PROCEDURE [proc_DeliveryOrderLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeliveryOrderID],
		[KilometerCounterBefore],
		[KilometerCounterAfter],
		[TotalPrice],
		[DeliveryOrderStatusID],
		[GeneralDeliveryCode],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[TransformationSupplier],
		[DriverName],
		[DriverNationID],
		[CarNumber],
		[DriverTelephone],
		[WatingHours],
		[PermationNumber],
		[Department],
		[ClientCode],
		[DeliveryOrderName],
		[DeliveryOrderDate],
		[DepartmentResponsableName],
		[CarType]
	FROM [DeliveryOrder]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderUpdate]    Script Date: 6/22/2015 1:13:29 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderUpdate];
GO

CREATE PROCEDURE [proc_DeliveryOrderUpdate]
(
	@DeliveryOrderID int,
	@KilometerCounterBefore decimal(8,2) = NULL,
	@KilometerCounterAfter decimal(8,2) = NULL,
	@TotalPrice float = NULL,
	@DeliveryOrderStatusID int = NULL,
	@GeneralDeliveryCode nvarchar(300) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@TransformationSupplier nvarchar(300) = NULL,
	@DriverName nvarchar(300) = NULL,
	@DriverNationID nvarchar(100) = NULL,
	@CarNumber nvarchar(50) = NULL,
	@DriverTelephone nvarchar(50) = NULL,
	@WatingHours float = NULL,
	@PermationNumber int = NULL,
	@Department nvarchar(300) = NULL,
	@ClientCode int = NULL,
	@DeliveryOrderName nvarchar(300) = NULL,
	@DeliveryOrderDate datetime = NULL,
	@DepartmentResponsableName nvarchar(300) = NULL,
	@CarType nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DeliveryOrder]
	SET
		[KilometerCounterBefore] = @KilometerCounterBefore,
		[KilometerCounterAfter] = @KilometerCounterAfter,
		[TotalPrice] = @TotalPrice,
		[DeliveryOrderStatusID] = @DeliveryOrderStatusID,
		[GeneralDeliveryCode] = @GeneralDeliveryCode,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate,
		[TransformationSupplier] = @TransformationSupplier,
		[DriverName] = @DriverName,
		[DriverNationID] = @DriverNationID,
		[CarNumber] = @CarNumber,
		[DriverTelephone] = @DriverTelephone,
		[WatingHours] = @WatingHours,
		[PermationNumber] = @PermationNumber,
		[Department] = @Department,
		[ClientCode] = @ClientCode,
		[DeliveryOrderName] = @DeliveryOrderName,
		[DeliveryOrderDate] = @DeliveryOrderDate,
		[DepartmentResponsableName] = @DepartmentResponsableName,
		[CarType] = @CarType
	WHERE
		[DeliveryOrderID] = @DeliveryOrderID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DeliveryOrderInsert]    Script Date: 6/22/2015 1:13:29 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderInsert];
GO

CREATE PROCEDURE [proc_DeliveryOrderInsert]
(
	@DeliveryOrderID int = NULL output,
	@KilometerCounterBefore decimal(8,2) = NULL,
	@KilometerCounterAfter decimal(8,2) = NULL,
	@TotalPrice float = NULL,
	@DeliveryOrderStatusID int = NULL,
	@GeneralDeliveryCode nvarchar(300) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@TransformationSupplier nvarchar(300) = NULL,
	@DriverName nvarchar(300) = NULL,
	@DriverNationID nvarchar(100) = NULL,
	@CarNumber nvarchar(50) = NULL,
	@DriverTelephone nvarchar(50) = NULL,
	@WatingHours float = NULL,
	@PermationNumber int = NULL,
	@Department nvarchar(300) = NULL,
	@ClientCode int = NULL,
	@DeliveryOrderName nvarchar(300) = NULL,
	@DeliveryOrderDate datetime = NULL,
	@DepartmentResponsableName nvarchar(300) = NULL,
	@CarType nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DeliveryOrder]
	(
		[KilometerCounterBefore],
		[KilometerCounterAfter],
		[TotalPrice],
		[DeliveryOrderStatusID],
		[GeneralDeliveryCode],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[TransformationSupplier],
		[DriverName],
		[DriverNationID],
		[CarNumber],
		[DriverTelephone],
		[WatingHours],
		[PermationNumber],
		[Department],
		[ClientCode],
		[DeliveryOrderName],
		[DeliveryOrderDate],
		[DepartmentResponsableName],
		[CarType]
	)
	VALUES
	(
		@KilometerCounterBefore,
		@KilometerCounterAfter,
		@TotalPrice,
		@DeliveryOrderStatusID,
		@GeneralDeliveryCode,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate,
		@TransformationSupplier,
		@DriverName,
		@DriverNationID,
		@CarNumber,
		@DriverTelephone,
		@WatingHours,
		@PermationNumber,
		@Department,
		@ClientCode,
		@DeliveryOrderName,
		@DeliveryOrderDate,
		@DepartmentResponsableName,
		@CarType
	)

	SET @Err = @@Error

	SELECT @DeliveryOrderID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderDelete]    Script Date: 6/22/2015 1:13:29 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderDelete];
GO

CREATE PROCEDURE [proc_DeliveryOrderDelete]
(
	@DeliveryOrderID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DeliveryOrder]
	WHERE
		[DeliveryOrderID] = @DeliveryOrderID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderDelete Error on Creation'
GO
