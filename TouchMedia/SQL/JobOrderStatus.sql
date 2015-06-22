
/****** Object:  StoredProcedure [proc_JobOrderStatusLoadByPrimaryKey]    Script Date: 6/22/2015 1:13:30 PM ******/
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

/****** Object:  StoredProcedure [proc_JobOrderStatusLoadAll]    Script Date: 6/22/2015 1:13:30 PM ******/
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

/****** Object:  StoredProcedure [proc_JobOrderStatusUpdate]    Script Date: 6/22/2015 1:13:30 PM ******/
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




/****** Object:  StoredProcedure [proc_JobOrderStatusInsert]    Script Date: 6/22/2015 1:13:30 PM ******/
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

/****** Object:  StoredProcedure [proc_JobOrderStatusDelete]    Script Date: 6/22/2015 1:13:30 PM ******/
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
