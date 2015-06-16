
/****** Object:  StoredProcedure [proc_JobOrderLoadByPrimaryKey]    Script Date: 6/16/2015 4:00:26 PM ******/
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

/****** Object:  StoredProcedure [proc_JobOrderLoadAll]    Script Date: 6/16/2015 4:00:26 PM ******/
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

/****** Object:  StoredProcedure [proc_JobOrderUpdate]    Script Date: 6/16/2015 4:00:26 PM ******/
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




/****** Object:  StoredProcedure [proc_JobOrderInsert]    Script Date: 6/16/2015 4:00:26 PM ******/
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

/****** Object:  StoredProcedure [proc_JobOrderDelete]    Script Date: 6/16/2015 4:00:26 PM ******/
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
