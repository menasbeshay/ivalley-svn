
USE [TouchMediadb]
GO

/****** Object:  StoredProcedure [proc_CategoriesLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CategoriesLoadByPrimaryKey]
(
	@CategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[CategoryName]
	FROM [Categories]
	WHERE
		([CategoryID] = @CategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoriesLoadAll]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesLoadAll];
GO

CREATE PROCEDURE [proc_CategoriesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CategoryID],
		[CategoryName]
	FROM [Categories]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoriesUpdate]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesUpdate];
GO

CREATE PROCEDURE [proc_CategoriesUpdate]
(
	@CategoryID int,
	@CategoryName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Categories]
	SET
		[CategoryName] = @CategoryName
	WHERE
		[CategoryID] = @CategoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CategoriesInsert]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesInsert];
GO

CREATE PROCEDURE [proc_CategoriesInsert]
(
	@CategoryID int = NULL output,
	@CategoryName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Categories]
	(
		[CategoryName]
	)
	VALUES
	(
		@CategoryName
	)

	SET @Err = @@Error

	SELECT @CategoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CategoriesDelete]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CategoriesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CategoriesDelete];
GO

CREATE PROCEDURE [proc_CategoriesDelete]
(
	@CategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Categories]
	WHERE
		[CategoryID] = @CategoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CategoriesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CategoriesDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ClientsLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ClientsLoadByPrimaryKey]
(
	@ClientID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ClientID],
		[ClientName],
		[ClientPhone],
		[ClientEmail],
		[ClientCode]
	FROM [Clients]
	WHERE
		([ClientID] = @ClientID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ClientsLoadAll]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsLoadAll];
GO

CREATE PROCEDURE [proc_ClientsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ClientID],
		[ClientName],
		[ClientPhone],
		[ClientEmail],
		[ClientCode]
	FROM [Clients]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ClientsUpdate]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsUpdate];
GO

CREATE PROCEDURE [proc_ClientsUpdate]
(
	@ClientID int,
	@ClientName nvarchar(300) = NULL,
	@ClientPhone nvarchar(50) = NULL,
	@ClientEmail nvarchar(300) = NULL,
	@ClientCode nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Clients]
	SET
		[ClientName] = @ClientName,
		[ClientPhone] = @ClientPhone,
		[ClientEmail] = @ClientEmail,
		[ClientCode] = @ClientCode
	WHERE
		[ClientID] = @ClientID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ClientsInsert]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsInsert];
GO

CREATE PROCEDURE [proc_ClientsInsert]
(
	@ClientID int = NULL output,
	@ClientName nvarchar(300) = NULL,
	@ClientPhone nvarchar(50) = NULL,
	@ClientEmail nvarchar(300) = NULL,
	@ClientCode nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Clients]
	(
		[ClientName],
		[ClientPhone],
		[ClientEmail],
		[ClientCode]
	)
	VALUES
	(
		@ClientName,
		@ClientPhone,
		@ClientEmail,
		@ClientCode
	)

	SET @Err = @@Error

	SELECT @ClientID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ClientsDelete]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsDelete];
GO

CREATE PROCEDURE [proc_ClientsDelete]
(
	@ClientID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Clients]
	WHERE
		[ClientID] = @ClientID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:45 PM ******/
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
		[DeliveryOrderName]
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

/****** Object:  StoredProcedure [proc_DeliveryOrderLoadAll]    Script Date: 6/18/2015 3:31:45 PM ******/
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
		[DeliveryOrderName]
	FROM [DeliveryOrder]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderUpdate]    Script Date: 6/18/2015 3:31:45 PM ******/
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
	@DriverNationID int = NULL,
	@CarNumber nvarchar(50) = NULL,
	@DriverTelephone nvarchar(50) = NULL,
	@WatingHours float = NULL,
	@PermationNumber int = NULL,
	@Department nvarchar(300) = NULL,
	@ClientCode int = NULL,
	@DeliveryOrderName nvarchar(300) = NULL
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
		[DeliveryOrderName] = @DeliveryOrderName
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




/****** Object:  StoredProcedure [proc_DeliveryOrderInsert]    Script Date: 6/18/2015 3:31:45 PM ******/
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
	@DriverNationID int = NULL,
	@CarNumber nvarchar(50) = NULL,
	@DriverTelephone nvarchar(50) = NULL,
	@WatingHours float = NULL,
	@PermationNumber int = NULL,
	@Department nvarchar(300) = NULL,
	@ClientCode int = NULL,
	@DeliveryOrderName nvarchar(300) = NULL
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
		[DeliveryOrderName]
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
		@DeliveryOrderName
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

/****** Object:  StoredProcedure [proc_DeliveryOrderDelete]    Script Date: 6/18/2015 3:31:45 PM ******/
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

/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:45 PM ******/
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

/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsLoadAll]    Script Date: 6/18/2015 3:31:45 PM ******/
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

/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsUpdate]    Script Date: 6/18/2015 3:31:45 PM ******/
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




/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_DeliveryOrderDetailsDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_DeliveryOrderStatusLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderStatusLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderStatusLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DeliveryOrderStatusLoadByPrimaryKey]
(
	@DeliveryOrderStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeliveryOrderStatusID],
		[DeliveryOrderStatusName]
	FROM [DeliveryOrderStatus]
	WHERE
		([DeliveryOrderStatusID] = @DeliveryOrderStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderStatusLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderStatusLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderStatusLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderStatusLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderStatusLoadAll];
GO

CREATE PROCEDURE [proc_DeliveryOrderStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeliveryOrderStatusID],
		[DeliveryOrderStatusName]
	FROM [DeliveryOrderStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderStatusLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderStatusLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderStatusUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderStatusUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderStatusUpdate];
GO

CREATE PROCEDURE [proc_DeliveryOrderStatusUpdate]
(
	@DeliveryOrderStatusID int,
	@DeliveryOrderStatusName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DeliveryOrderStatus]
	SET
		[DeliveryOrderStatusName] = @DeliveryOrderStatusName
	WHERE
		[DeliveryOrderStatusID] = @DeliveryOrderStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderStatusUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderStatusUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DeliveryOrderStatusInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderStatusInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderStatusInsert];
GO

CREATE PROCEDURE [proc_DeliveryOrderStatusInsert]
(
	@DeliveryOrderStatusID int = NULL output,
	@DeliveryOrderStatusName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DeliveryOrderStatus]
	(
		[DeliveryOrderStatusName]
	)
	VALUES
	(
		@DeliveryOrderStatusName
	)

	SET @Err = @@Error

	SELECT @DeliveryOrderStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderStatusInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderStatusInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeliveryOrderStatusDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeliveryOrderStatusDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeliveryOrderStatusDelete];
GO

CREATE PROCEDURE [proc_DeliveryOrderStatusDelete]
(
	@DeliveryOrderStatusID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DeliveryOrderStatus]
	WHERE
		[DeliveryOrderStatusID] = @DeliveryOrderStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeliveryOrderStatusDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeliveryOrderStatusDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignDetailsLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignDetailsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignDetailsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DesignDetailsLoadByPrimaryKey]
(
	@DesignDetailsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DesignDetailsID],
		[JobOrderID],
		[DesignerID],
		[JobOrderStatusID],
		[StartDate],
		[EndDate],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [DesignDetails]
	WHERE
		([DesignDetailsID] = @DesignDetailsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignDetailsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignDetailsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignDetailsLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignDetailsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignDetailsLoadAll];
GO

CREATE PROCEDURE [proc_DesignDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DesignDetailsID],
		[JobOrderID],
		[DesignerID],
		[JobOrderStatusID],
		[StartDate],
		[EndDate],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [DesignDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignDetailsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignDetailsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignDetailsUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignDetailsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignDetailsUpdate];
GO

CREATE PROCEDURE [proc_DesignDetailsUpdate]
(
	@DesignDetailsID int,
	@JobOrderID int = NULL,
	@DesignerID int = NULL,
	@JobOrderStatusID int = NULL,
	@StartDate datetime = NULL,
	@EndDate datetime = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DesignDetails]
	SET
		[JobOrderID] = @JobOrderID,
		[DesignerID] = @DesignerID,
		[JobOrderStatusID] = @JobOrderStatusID,
		[StartDate] = @StartDate,
		[EndDate] = @EndDate,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[DesignDetailsID] = @DesignDetailsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignDetailsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignDetailsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DesignDetailsInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignDetailsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignDetailsInsert];
GO

CREATE PROCEDURE [proc_DesignDetailsInsert]
(
	@DesignDetailsID int = NULL output,
	@JobOrderID int = NULL,
	@DesignerID int = NULL,
	@JobOrderStatusID int = NULL,
	@StartDate datetime = NULL,
	@EndDate datetime = NULL,
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
	INTO [DesignDetails]
	(
		[JobOrderID],
		[DesignerID],
		[JobOrderStatusID],
		[StartDate],
		[EndDate],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@JobOrderID,
		@DesignerID,
		@JobOrderStatusID,
		@StartDate,
		@EndDate,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @DesignDetailsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignDetailsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignDetailsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignDetailsDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignDetailsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignDetailsDelete];
GO

CREATE PROCEDURE [proc_DesignDetailsDelete]
(
	@DesignDetailsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DesignDetails]
	WHERE
		[DesignDetailsID] = @DesignDetailsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignDetailsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignDetailsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignservicesTypeLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DesignservicesTypeLoadByPrimaryKey]
(
	@DesignservicesTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DesignservicesTypeID],
		[DigitalPrintingDetailsID],
		[ServiceID]
	FROM [DesignservicesType]
	WHERE
		([DesignservicesTypeID] = @DesignservicesTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignservicesTypeLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeLoadAll];
GO

CREATE PROCEDURE [proc_DesignservicesTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DesignservicesTypeID],
		[DigitalPrintingDetailsID],
		[ServiceID]
	FROM [DesignservicesType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignservicesTypeUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeUpdate];
GO

CREATE PROCEDURE [proc_DesignservicesTypeUpdate]
(
	@DesignservicesTypeID int,
	@DigitalPrintingDetailsID int = NULL,
	@ServiceID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DesignservicesType]
	SET
		[DigitalPrintingDetailsID] = @DigitalPrintingDetailsID,
		[ServiceID] = @ServiceID
	WHERE
		[DesignservicesTypeID] = @DesignservicesTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DesignservicesTypeInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeInsert];
GO

CREATE PROCEDURE [proc_DesignservicesTypeInsert]
(
	@DesignservicesTypeID int = NULL output,
	@DigitalPrintingDetailsID int = NULL,
	@ServiceID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DesignservicesType]
	(
		[DigitalPrintingDetailsID],
		[ServiceID]
	)
	VALUES
	(
		@DigitalPrintingDetailsID,
		@ServiceID
	)

	SET @Err = @@Error

	SELECT @DesignservicesTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignservicesTypeDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeDelete];
GO

CREATE PROCEDURE [proc_DesignservicesTypeDelete]
(
	@DesignservicesTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DesignservicesType]
	WHERE
		[DesignservicesTypeID] = @DesignservicesTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
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




/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_DigitalPrintingDetailsDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_GeneralLookupLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_GeneralLookupLoadByPrimaryKey]
(
	@GeneralLookupID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GeneralLookupID],
		[CategoryID],
		[Name],
		[Address],
		[Telephone],
		[Email]
	FROM [GeneralLookup]
	WHERE
		([GeneralLookupID] = @GeneralLookupID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GeneralLookupLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupLoadAll];
GO

CREATE PROCEDURE [proc_GeneralLookupLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GeneralLookupID],
		[CategoryID],
		[Name],
		[Address],
		[Telephone],
		[Email]
	FROM [GeneralLookup]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GeneralLookupUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupUpdate];
GO

CREATE PROCEDURE [proc_GeneralLookupUpdate]
(
	@GeneralLookupID int,
	@CategoryID int = NULL,
	@Name nvarchar(300) = NULL,
	@Address nvarchar(300) = NULL,
	@Telephone nvarchar(300) = NULL,
	@Email nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [GeneralLookup]
	SET
		[CategoryID] = @CategoryID,
		[Name] = @Name,
		[Address] = @Address,
		[Telephone] = @Telephone,
		[Email] = @Email
	WHERE
		[GeneralLookupID] = @GeneralLookupID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_GeneralLookupInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupInsert];
GO

CREATE PROCEDURE [proc_GeneralLookupInsert]
(
	@GeneralLookupID int = NULL output,
	@CategoryID int = NULL,
	@Name nvarchar(300) = NULL,
	@Address nvarchar(300) = NULL,
	@Telephone nvarchar(300) = NULL,
	@Email nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [GeneralLookup]
	(
		[CategoryID],
		[Name],
		[Address],
		[Telephone],
		[Email]
	)
	VALUES
	(
		@CategoryID,
		@Name,
		@Address,
		@Telephone,
		@Email
	)

	SET @Err = @@Error

	SELECT @GeneralLookupID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GeneralLookupDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupDelete];
GO

CREATE PROCEDURE [proc_GeneralLookupDelete]
(
	@GeneralLookupID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [GeneralLookup]
	WHERE
		[GeneralLookupID] = @GeneralLookupID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiveawaysLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_GiveawaysLoadByPrimaryKey]
(
	@GiveawayID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GiveawayID],
		[JobOrderID],
		[ItemName],
		[GiveawayDescription],
		[GiveawayQuantity],
		[PricePerItem],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [Giveaways]
	WHERE
		([GiveawayID] = @GiveawayID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiveawaysLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysLoadAll];
GO

CREATE PROCEDURE [proc_GiveawaysLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GiveawayID],
		[JobOrderID],
		[ItemName],
		[GiveawayDescription],
		[GiveawayQuantity],
		[PricePerItem],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [Giveaways]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiveawaysUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysUpdate];
GO

CREATE PROCEDURE [proc_GiveawaysUpdate]
(
	@GiveawayID int,
	@JobOrderID int = NULL,
	@ItemName nvarchar(300) = NULL,
	@GiveawayDescription nvarchar(300) = NULL,
	@GiveawayQuantity int = NULL,
	@PricePerItem float = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Giveaways]
	SET
		[JobOrderID] = @JobOrderID,
		[ItemName] = @ItemName,
		[GiveawayDescription] = @GiveawayDescription,
		[GiveawayQuantity] = @GiveawayQuantity,
		[PricePerItem] = @PricePerItem,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[GiveawayID] = @GiveawayID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_GiveawaysInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysInsert];
GO

CREATE PROCEDURE [proc_GiveawaysInsert]
(
	@GiveawayID int = NULL output,
	@JobOrderID int = NULL,
	@ItemName nvarchar(300) = NULL,
	@GiveawayDescription nvarchar(300) = NULL,
	@GiveawayQuantity int = NULL,
	@PricePerItem float = NULL,
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
	INTO [Giveaways]
	(
		[JobOrderID],
		[ItemName],
		[GiveawayDescription],
		[GiveawayQuantity],
		[PricePerItem],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@JobOrderID,
		@ItemName,
		@GiveawayDescription,
		@GiveawayQuantity,
		@PricePerItem,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @GiveawayID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiveawaysDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysDelete];
GO

CREATE PROCEDURE [proc_GiveawaysDelete]
(
	@GiveawayID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Giveaways]
	WHERE
		[GiveawayID] = @GiveawayID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InAndOutDoorDetailsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InAndOutDoorDetailsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_InAndOutDoorDetailsLoadByPrimaryKey]
(
	@InAndOutDoorDetailsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[InAndOutDoorDetailsID],
		[Item],
		[MaterialID],
		[LaminationID],
		[ServiceID],
		[Picture],
		[DeliveryDate],
		[Width],
		[Hight],
		[TotalSize],
		[DeliveryTo],
		[JobOrderStatusID],
		[JobOrderID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [InAndOutDoorDetails]
	WHERE
		([InAndOutDoorDetailsID] = @InAndOutDoorDetailsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_InAndOutDoorDetailsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_InAndOutDoorDetailsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InAndOutDoorDetailsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InAndOutDoorDetailsLoadAll];
GO

CREATE PROCEDURE [proc_InAndOutDoorDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[InAndOutDoorDetailsID],
		[Item],
		[MaterialID],
		[LaminationID],
		[ServiceID],
		[Picture],
		[DeliveryDate],
		[Width],
		[Hight],
		[TotalSize],
		[DeliveryTo],
		[JobOrderStatusID],
		[JobOrderID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [InAndOutDoorDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_InAndOutDoorDetailsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_InAndOutDoorDetailsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InAndOutDoorDetailsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InAndOutDoorDetailsUpdate];
GO

CREATE PROCEDURE [proc_InAndOutDoorDetailsUpdate]
(
	@InAndOutDoorDetailsID int,
	@Item nvarchar(500) = NULL,
	@MaterialID int = NULL,
	@LaminationID int = NULL,
	@ServiceID int = NULL,
	@Picture nvarchar(500) = NULL,
	@DeliveryDate datetime = NULL,
	@Width decimal(6,2) = NULL,
	@Hight decimal(6,2) = NULL,
	@TotalSize decimal(6,2) = NULL,
	@DeliveryTo nvarchar(500) = NULL,
	@JobOrderStatusID int = NULL,
	@JobOrderID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [InAndOutDoorDetails]
	SET
		[Item] = @Item,
		[MaterialID] = @MaterialID,
		[LaminationID] = @LaminationID,
		[ServiceID] = @ServiceID,
		[Picture] = @Picture,
		[DeliveryDate] = @DeliveryDate,
		[Width] = @Width,
		[Hight] = @Hight,
		[TotalSize] = @TotalSize,
		[DeliveryTo] = @DeliveryTo,
		[JobOrderStatusID] = @JobOrderStatusID,
		[JobOrderID] = @JobOrderID,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[InAndOutDoorDetailsID] = @InAndOutDoorDetailsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_InAndOutDoorDetailsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_InAndOutDoorDetailsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InAndOutDoorDetailsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InAndOutDoorDetailsInsert];
GO

CREATE PROCEDURE [proc_InAndOutDoorDetailsInsert]
(
	@InAndOutDoorDetailsID int = NULL output,
	@Item nvarchar(500) = NULL,
	@MaterialID int = NULL,
	@LaminationID int = NULL,
	@ServiceID int = NULL,
	@Picture nvarchar(500) = NULL,
	@DeliveryDate datetime = NULL,
	@Width decimal(6,2) = NULL,
	@Hight decimal(6,2) = NULL,
	@TotalSize decimal(6,2) = NULL,
	@DeliveryTo nvarchar(500) = NULL,
	@JobOrderStatusID int = NULL,
	@JobOrderID int = NULL,
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
	INTO [InAndOutDoorDetails]
	(
		[Item],
		[MaterialID],
		[LaminationID],
		[ServiceID],
		[Picture],
		[DeliveryDate],
		[Width],
		[Hight],
		[TotalSize],
		[DeliveryTo],
		[JobOrderStatusID],
		[JobOrderID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@Item,
		@MaterialID,
		@LaminationID,
		@ServiceID,
		@Picture,
		@DeliveryDate,
		@Width,
		@Hight,
		@TotalSize,
		@DeliveryTo,
		@JobOrderStatusID,
		@JobOrderID,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @InAndOutDoorDetailsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_InAndOutDoorDetailsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_InAndOutDoorDetailsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_InAndOutDoorDetailsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_InAndOutDoorDetailsDelete];
GO

CREATE PROCEDURE [proc_InAndOutDoorDetailsDelete]
(
	@InAndOutDoorDetailsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [InAndOutDoorDetails]
	WHERE
		[InAndOutDoorDetailsID] = @InAndOutDoorDetailsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_InAndOutDoorDetailsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_InAndOutDoorDetailsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_JobOrderLoadByPrimaryKey]
(
	@JobOrderID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[JobOrderID],
		[JobOrderStatusID],
		[JobOrderCode],
		[JobOrderDescription],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[JobOrderName]
	FROM [JobOrder]
	WHERE
		([JobOrderID] = @JobOrderID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderLoadAll];
GO

CREATE PROCEDURE [proc_JobOrderLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[JobOrderID],
		[JobOrderStatusID],
		[JobOrderCode],
		[JobOrderDescription],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[JobOrderName]
	FROM [JobOrder]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderUpdate];
GO

CREATE PROCEDURE [proc_JobOrderUpdate]
(
	@JobOrderID int,
	@JobOrderStatusID int = NULL,
	@JobOrderCode nvarchar(300) = NULL,
	@JobOrderDescription nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@JobOrderName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [JobOrder]
	SET
		[JobOrderStatusID] = @JobOrderStatusID,
		[JobOrderCode] = @JobOrderCode,
		[JobOrderDescription] = @JobOrderDescription,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate,
		[JobOrderName] = @JobOrderName
	WHERE
		[JobOrderID] = @JobOrderID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_JobOrderInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderInsert];
GO

CREATE PROCEDURE [proc_JobOrderInsert]
(
	@JobOrderID int = NULL output,
	@JobOrderStatusID int = NULL,
	@JobOrderCode nvarchar(300) = NULL,
	@JobOrderDescription nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@JobOrderName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [JobOrder]
	(
		[JobOrderStatusID],
		[JobOrderCode],
		[JobOrderDescription],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate],
		[JobOrderName]
	)
	VALUES
	(
		@JobOrderStatusID,
		@JobOrderCode,
		@JobOrderDescription,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate,
		@JobOrderName
	)

	SET @Err = @@Error

	SELECT @JobOrderID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderDelete];
GO

CREATE PROCEDURE [proc_JobOrderDelete]
(
	@JobOrderID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [JobOrder]
	WHERE
		[JobOrderID] = @JobOrderID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderStatusLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderStatusLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderStatusLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_JobOrderStatusLoadByPrimaryKey]
(
	@JobOrderStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[JobOrderStatusID],
		[JobOrderStatusName]
	FROM [JobOrderStatus]
	WHERE
		([JobOrderStatusID] = @JobOrderStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderStatusLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderStatusLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderStatusLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderStatusLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderStatusLoadAll];
GO

CREATE PROCEDURE [proc_JobOrderStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[JobOrderStatusID],
		[JobOrderStatusName]
	FROM [JobOrderStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderStatusLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderStatusLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderStatusUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderStatusUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderStatusUpdate];
GO

CREATE PROCEDURE [proc_JobOrderStatusUpdate]
(
	@JobOrderStatusID int,
	@JobOrderStatusName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [JobOrderStatus]
	SET
		[JobOrderStatusName] = @JobOrderStatusName
	WHERE
		[JobOrderStatusID] = @JobOrderStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderStatusUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderStatusUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_JobOrderStatusInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderStatusInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderStatusInsert];
GO

CREATE PROCEDURE [proc_JobOrderStatusInsert]
(
	@JobOrderStatusID int = NULL output,
	@JobOrderStatusName nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [JobOrderStatus]
	(
		[JobOrderStatusName]
	)
	VALUES
	(
		@JobOrderStatusName
	)

	SET @Err = @@Error

	SELECT @JobOrderStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderStatusInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderStatusInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_JobOrderStatusDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_JobOrderStatusDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_JobOrderStatusDelete];
GO

CREATE PROCEDURE [proc_JobOrderStatusDelete]
(
	@JobOrderStatusID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [JobOrderStatus]
	WHERE
		[JobOrderStatusID] = @JobOrderStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_JobOrderStatusDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_JobOrderStatusDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_OffsetPrintingDetailsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_OffsetPrintingDetailsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_OffsetPrintingDetailsLoadByPrimaryKey]
(
	@OffsetPrintingDetailsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[OffsetPrintingDetailsID],
		[JobOrderID],
		[PaperKindID],
		[GSMID],
		[PrintingHouseID],
		[FinishID],
		[JobOrderStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [OffsetPrintingDetails]
	WHERE
		([OffsetPrintingDetailsID] = @OffsetPrintingDetailsID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_OffsetPrintingDetailsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_OffsetPrintingDetailsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_OffsetPrintingDetailsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_OffsetPrintingDetailsLoadAll];
GO

CREATE PROCEDURE [proc_OffsetPrintingDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[OffsetPrintingDetailsID],
		[JobOrderID],
		[PaperKindID],
		[GSMID],
		[PrintingHouseID],
		[FinishID],
		[JobOrderStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [OffsetPrintingDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_OffsetPrintingDetailsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_OffsetPrintingDetailsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_OffsetPrintingDetailsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_OffsetPrintingDetailsUpdate];
GO

CREATE PROCEDURE [proc_OffsetPrintingDetailsUpdate]
(
	@OffsetPrintingDetailsID int,
	@JobOrderID int = NULL,
	@PaperKindID int = NULL,
	@GSMID int = NULL,
	@PrintingHouseID int = NULL,
	@FinishID int = NULL,
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

	UPDATE [OffsetPrintingDetails]
	SET
		[JobOrderID] = @JobOrderID,
		[PaperKindID] = @PaperKindID,
		[GSMID] = @GSMID,
		[PrintingHouseID] = @PrintingHouseID,
		[FinishID] = @FinishID,
		[JobOrderStatusID] = @JobOrderStatusID,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[OffsetPrintingDetailsID] = @OffsetPrintingDetailsID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_OffsetPrintingDetailsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_OffsetPrintingDetailsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_OffsetPrintingDetailsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_OffsetPrintingDetailsInsert];
GO

CREATE PROCEDURE [proc_OffsetPrintingDetailsInsert]
(
	@OffsetPrintingDetailsID int = NULL output,
	@JobOrderID int = NULL,
	@PaperKindID int = NULL,
	@GSMID int = NULL,
	@PrintingHouseID int = NULL,
	@FinishID int = NULL,
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
	INTO [OffsetPrintingDetails]
	(
		[JobOrderID],
		[PaperKindID],
		[GSMID],
		[PrintingHouseID],
		[FinishID],
		[JobOrderStatusID],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@JobOrderID,
		@PaperKindID,
		@GSMID,
		@PrintingHouseID,
		@FinishID,
		@JobOrderStatusID,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @OffsetPrintingDetailsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_OffsetPrintingDetailsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_OffsetPrintingDetailsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_OffsetPrintingDetailsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_OffsetPrintingDetailsDelete];
GO

CREATE PROCEDURE [proc_OffsetPrintingDetailsDelete]
(
	@OffsetPrintingDetailsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [OffsetPrintingDetails]
	WHERE
		[OffsetPrintingDetailsID] = @OffsetPrintingDetailsID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_OffsetPrintingDetailsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_OffsetPrintingDetailsDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ProductionLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProductionLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProductionLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ProductionLoadByPrimaryKey]
(
	@ProductionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProductionID],
		[JobOrderID],
		[ItemID],
		[Size],
		[MaterialID],
		[DeliveryDate],
		[SupplierID],
		[DeliveryTo],
		[ISRemovable],
		[RemovableDate],
		[installationDate],
		[ProductStatusID],
		[InstallStationID],
		[Note],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [Production]
	WHERE
		([ProductionID] = @ProductionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProductionLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProductionLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ProductionLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProductionLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProductionLoadAll];
GO

CREATE PROCEDURE [proc_ProductionLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProductionID],
		[JobOrderID],
		[ItemID],
		[Size],
		[MaterialID],
		[DeliveryDate],
		[SupplierID],
		[DeliveryTo],
		[ISRemovable],
		[RemovableDate],
		[installationDate],
		[ProductStatusID],
		[InstallStationID],
		[Note],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [Production]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProductionLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProductionLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ProductionUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProductionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProductionUpdate];
GO

CREATE PROCEDURE [proc_ProductionUpdate]
(
	@ProductionID int,
	@JobOrderID int = NULL,
	@ItemID int = NULL,
	@Size decimal(6,2) = NULL,
	@MaterialID int = NULL,
	@DeliveryDate datetime = NULL,
	@SupplierID int = NULL,
	@DeliveryTo nvarchar(500) = NULL,
	@ISRemovable bit = NULL,
	@RemovableDate datetime = NULL,
	@installationDate datetime = NULL,
	@ProductStatusID int = NULL,
	@InstallStationID int = NULL,
	@Note nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Production]
	SET
		[JobOrderID] = @JobOrderID,
		[ItemID] = @ItemID,
		[Size] = @Size,
		[MaterialID] = @MaterialID,
		[DeliveryDate] = @DeliveryDate,
		[SupplierID] = @SupplierID,
		[DeliveryTo] = @DeliveryTo,
		[ISRemovable] = @ISRemovable,
		[RemovableDate] = @RemovableDate,
		[installationDate] = @installationDate,
		[ProductStatusID] = @ProductStatusID,
		[InstallStationID] = @InstallStationID,
		[Note] = @Note,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[ProductionID] = @ProductionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProductionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProductionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ProductionInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProductionInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProductionInsert];
GO

CREATE PROCEDURE [proc_ProductionInsert]
(
	@ProductionID int = NULL output,
	@JobOrderID int = NULL,
	@ItemID int = NULL,
	@Size decimal(6,2) = NULL,
	@MaterialID int = NULL,
	@DeliveryDate datetime = NULL,
	@SupplierID int = NULL,
	@DeliveryTo nvarchar(500) = NULL,
	@ISRemovable bit = NULL,
	@RemovableDate datetime = NULL,
	@installationDate datetime = NULL,
	@ProductStatusID int = NULL,
	@InstallStationID int = NULL,
	@Note nvarchar(500) = NULL,
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
	INTO [Production]
	(
		[JobOrderID],
		[ItemID],
		[Size],
		[MaterialID],
		[DeliveryDate],
		[SupplierID],
		[DeliveryTo],
		[ISRemovable],
		[RemovableDate],
		[installationDate],
		[ProductStatusID],
		[InstallStationID],
		[Note],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@JobOrderID,
		@ItemID,
		@Size,
		@MaterialID,
		@DeliveryDate,
		@SupplierID,
		@DeliveryTo,
		@ISRemovable,
		@RemovableDate,
		@installationDate,
		@ProductStatusID,
		@InstallStationID,
		@Note,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @ProductionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProductionInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProductionInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ProductionDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProductionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProductionDelete];
GO

CREATE PROCEDURE [proc_ProductionDelete]
(
	@ProductionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Production]
	WHERE
		[ProductionID] = @ProductionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProductionDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProductionDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PurchaseOrderLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_PurchaseOrderLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_PurchaseOrderUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
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




/****** Object:  StoredProcedure [proc_PurchaseOrderInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_PurchaseOrderDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
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




/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_PurchaseOrderDetailsDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
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

/****** Object:  StoredProcedure [proc_TransformationSupplierLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TransformationSupplierLoadByPrimaryKey]
(
	@TransformationSupplierID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TransformationSupplierID],
		[TransformationSupplierName],
		[TransformationSupplierTelephone],
		[TransformationSupplierAddress]
	FROM [TransformationSupplier]
	WHERE
		([TransformationSupplierID] = @TransformationSupplierID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TransformationSupplierLoadAll]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierLoadAll];
GO

CREATE PROCEDURE [proc_TransformationSupplierLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TransformationSupplierID],
		[TransformationSupplierName],
		[TransformationSupplierTelephone],
		[TransformationSupplierAddress]
	FROM [TransformationSupplier]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TransformationSupplierUpdate]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierUpdate];
GO

CREATE PROCEDURE [proc_TransformationSupplierUpdate]
(
	@TransformationSupplierID int,
	@TransformationSupplierName nvarchar(300) = NULL,
	@TransformationSupplierTelephone nvarchar(50) = NULL,
	@TransformationSupplierAddress nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TransformationSupplier]
	SET
		[TransformationSupplierName] = @TransformationSupplierName,
		[TransformationSupplierTelephone] = @TransformationSupplierTelephone,
		[TransformationSupplierAddress] = @TransformationSupplierAddress
	WHERE
		[TransformationSupplierID] = @TransformationSupplierID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TransformationSupplierInsert]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierInsert];
GO

CREATE PROCEDURE [proc_TransformationSupplierInsert]
(
	@TransformationSupplierID int = NULL output,
	@TransformationSupplierName nvarchar(300) = NULL,
	@TransformationSupplierTelephone nvarchar(50) = NULL,
	@TransformationSupplierAddress nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TransformationSupplier]
	(
		[TransformationSupplierName],
		[TransformationSupplierTelephone],
		[TransformationSupplierAddress]
	)
	VALUES
	(
		@TransformationSupplierName,
		@TransformationSupplierTelephone,
		@TransformationSupplierAddress
	)

	SET @Err = @@Error

	SELECT @TransformationSupplierID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TransformationSupplierDelete]    Script Date: 6/18/2015 3:31:46 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierDelete];
GO

CREATE PROCEDURE [proc_TransformationSupplierDelete]
(
	@TransformationSupplierID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TransformationSupplier]
	WHERE
		[TransformationSupplierID] = @TransformationSupplierID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierDelete Error on Creation'
GO
