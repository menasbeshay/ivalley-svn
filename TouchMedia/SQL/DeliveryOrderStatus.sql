
/****** Object:  StoredProcedure [proc_DeliveryOrderStatusLoadByPrimaryKey]    Script Date: 6/15/2015 2:31:13 PM ******/
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

/****** Object:  StoredProcedure [proc_DeliveryOrderStatusLoadAll]    Script Date: 6/15/2015 2:31:13 PM ******/
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

/****** Object:  StoredProcedure [proc_DeliveryOrderStatusUpdate]    Script Date: 6/15/2015 2:31:13 PM ******/
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




/****** Object:  StoredProcedure [proc_DeliveryOrderStatusInsert]    Script Date: 6/15/2015 2:31:13 PM ******/
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

/****** Object:  StoredProcedure [proc_DeliveryOrderStatusDelete]    Script Date: 6/15/2015 2:31:13 PM ******/
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
