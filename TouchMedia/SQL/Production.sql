
/****** Object:  StoredProcedure [proc_ProductionLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:12 PM ******/
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

/****** Object:  StoredProcedure [proc_ProductionLoadAll]    Script Date: 6/28/2015 1:14:12 PM ******/
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

/****** Object:  StoredProcedure [proc_ProductionUpdate]    Script Date: 6/28/2015 1:14:12 PM ******/
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




/****** Object:  StoredProcedure [proc_ProductionInsert]    Script Date: 6/28/2015 1:14:12 PM ******/
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

/****** Object:  StoredProcedure [proc_ProductionDelete]    Script Date: 6/28/2015 1:14:12 PM ******/
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
