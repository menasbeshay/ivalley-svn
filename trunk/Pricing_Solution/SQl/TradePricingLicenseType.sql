
/****** Object:  StoredProcedure [proc_TradePricingLicenseTypeLoadByPrimaryKey]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingLicenseTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingLicenseTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TradePricingLicenseTypeLoadByPrimaryKey]
(
	@TradePricingLicenseTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TradePricingLicenseTypeID],
		[Name]
	FROM [TradePricingLicenseType]
	WHERE
		([TradePricingLicenseTypeID] = @TradePricingLicenseTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingLicenseTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingLicenseTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingLicenseTypeLoadAll]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingLicenseTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingLicenseTypeLoadAll];
GO

CREATE PROCEDURE [proc_TradePricingLicenseTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TradePricingLicenseTypeID],
		[Name]
	FROM [TradePricingLicenseType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingLicenseTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingLicenseTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingLicenseTypeUpdate]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingLicenseTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingLicenseTypeUpdate];
GO

CREATE PROCEDURE [proc_TradePricingLicenseTypeUpdate]
(
	@TradePricingLicenseTypeID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TradePricingLicenseType]
	SET
		[Name] = @Name
	WHERE
		[TradePricingLicenseTypeID] = @TradePricingLicenseTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingLicenseTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingLicenseTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TradePricingLicenseTypeInsert]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingLicenseTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingLicenseTypeInsert];
GO

CREATE PROCEDURE [proc_TradePricingLicenseTypeInsert]
(
	@TradePricingLicenseTypeID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TradePricingLicenseType]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @TradePricingLicenseTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingLicenseTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingLicenseTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TradePricingLicenseTypeDelete]    Script Date: 6/25/2014 4:33:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TradePricingLicenseTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TradePricingLicenseTypeDelete];
GO

CREATE PROCEDURE [proc_TradePricingLicenseTypeDelete]
(
	@TradePricingLicenseTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TradePricingLicenseType]
	WHERE
		[TradePricingLicenseTypeID] = @TradePricingLicenseTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TradePricingLicenseTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TradePricingLicenseTypeDelete Error on Creation'
GO
