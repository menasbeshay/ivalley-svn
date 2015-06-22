
/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsLoadByPrimaryKey]    Script Date: 6/22/2015 1:13:30 PM ******/
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

/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsLoadAll]    Script Date: 6/22/2015 1:13:30 PM ******/
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

/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsUpdate]    Script Date: 6/22/2015 1:13:30 PM ******/
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




/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsInsert]    Script Date: 6/22/2015 1:13:30 PM ******/
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

/****** Object:  StoredProcedure [proc_OffsetPrintingDetailsDelete]    Script Date: 6/22/2015 1:13:30 PM ******/
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
