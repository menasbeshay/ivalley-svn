
/****** Object:  StoredProcedure [proc_TradePricingStatusLoadByPrimaryKey]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingStatusLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingStatusLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TradePricingStatusLoadByPrimaryKey]
(
	@TradePricingStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TradePricingStatusID],
		[Name]
	FROM [TradePricingStatus]
	WHERE
		([TradePricingStatusID] = @TradePricingStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingStatusLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingStatusLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingStatusLoadAll]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingStatusLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingStatusLoadAll];
GO

CREATE PROCEDURE [proc_TradePricingStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TradePricingStatusID],
		[Name]
	FROM [TradePricingStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingStatusLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingStatusLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingStatusUpdate]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingStatusUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingStatusUpdate];
GO

CREATE PROCEDURE [proc_TradePricingStatusUpdate]
(
	@TradePricingStatusID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TradePricingStatus]
	SET
		[Name] = @Name
	WHERE
		[TradePricingStatusID] = @TradePricingStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingStatusUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingStatusUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TradePricingStatusInsert]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingStatusInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingStatusInsert];
GO

CREATE PROCEDURE [proc_TradePricingStatusInsert]
(
	@TradePricingStatusID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TradePricingStatus]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @TradePricingStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingStatusInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingStatusInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingStatusDelete]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingStatusDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingStatusDelete];
GO

CREATE PROCEDURE [proc_TradePricingStatusDelete]
(
	@TradePricingStatusID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TradePricingStatus]
	WHERE
		[TradePricingStatusID] = @TradePricingStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingStatusDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingStatusDelete Error on Creation'
GO
