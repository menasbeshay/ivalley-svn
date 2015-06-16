
/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsLoadByPrimaryKey]    Script Date: 6/16/2015 10:45:23 AM ******/
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

/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsLoadAll]    Script Date: 6/16/2015 10:45:23 AM ******/
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

/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsUpdate]    Script Date: 6/16/2015 10:45:23 AM ******/
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




/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsInsert]    Script Date: 6/16/2015 10:45:23 AM ******/
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

/****** Object:  StoredProcedure [proc_InAndOutDoorDetailsDelete]    Script Date: 6/16/2015 10:45:23 AM ******/
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
