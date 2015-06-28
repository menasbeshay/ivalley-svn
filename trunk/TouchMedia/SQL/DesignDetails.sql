
/****** Object:  StoredProcedure [proc_DesignDetailsLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
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

/****** Object:  StoredProcedure [proc_DesignDetailsLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
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

/****** Object:  StoredProcedure [proc_DesignDetailsUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
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




/****** Object:  StoredProcedure [proc_DesignDetailsInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
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

/****** Object:  StoredProcedure [proc_DesignDetailsDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
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
