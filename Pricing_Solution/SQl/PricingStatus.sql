
/****** Object:  StoredProcedure [proc_PricingStatusLoadByPrimaryKey]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PricingStatusLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PricingStatusLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PricingStatusLoadByPrimaryKey]
(
	@PricingStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PricingStatusID],
		[Status],
		[Description]
	FROM [PricingStatus]
	WHERE
		([PricingStatusID] = @PricingStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PricingStatusLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PricingStatusLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PricingStatusLoadAll]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PricingStatusLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PricingStatusLoadAll];
GO

CREATE PROCEDURE [proc_PricingStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PricingStatusID],
		[Status],
		[Description]
	FROM [PricingStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PricingStatusLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PricingStatusLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PricingStatusUpdate]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PricingStatusUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PricingStatusUpdate];
GO

CREATE PROCEDURE [proc_PricingStatusUpdate]
(
	@PricingStatusID int,
	@Status nvarchar(50) = NULL,
	@Description nvarchar(250) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PricingStatus]
	SET
		[Status] = @Status,
		[Description] = @Description
	WHERE
		[PricingStatusID] = @PricingStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PricingStatusUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PricingStatusUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PricingStatusInsert]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PricingStatusInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PricingStatusInsert];
GO

CREATE PROCEDURE [proc_PricingStatusInsert]
(
	@PricingStatusID int = NULL output,
	@Status nvarchar(50) = NULL,
	@Description nvarchar(250) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PricingStatus]
	(
		[Status],
		[Description]
	)
	VALUES
	(
		@Status,
		@Description
	)

	SET @Err = @@Error

	SELECT @PricingStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PricingStatusInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PricingStatusInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PricingStatusDelete]    Script Date: 6/25/2014 1:38:25 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PricingStatusDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PricingStatusDelete];
GO

CREATE PROCEDURE [proc_PricingStatusDelete]
(
	@PricingStatusID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PricingStatus]
	WHERE
		[PricingStatusID] = @PricingStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PricingStatusDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PricingStatusDelete Error on Creation'
GO
