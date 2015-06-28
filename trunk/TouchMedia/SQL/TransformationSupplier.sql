
/****** Object:  StoredProcedure [proc_TransformationSupplierLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TransformationSupplierLoadByPrimaryKey]
(
	@TransformationSupplierID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TransformationSupplierID],
		[TransformationSupplierName],
		[TransformationSupplierTelephone],
		[TransformationSupplierAddress]
	FROM [TransformationSupplier]
	WHERE
		([TransformationSupplierID] = @TransformationSupplierID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TransformationSupplierLoadAll]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierLoadAll];
GO

CREATE PROCEDURE [proc_TransformationSupplierLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TransformationSupplierID],
		[TransformationSupplierName],
		[TransformationSupplierTelephone],
		[TransformationSupplierAddress]
	FROM [TransformationSupplier]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TransformationSupplierUpdate]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierUpdate];
GO

CREATE PROCEDURE [proc_TransformationSupplierUpdate]
(
	@TransformationSupplierID int,
	@TransformationSupplierName nvarchar(300) = NULL,
	@TransformationSupplierTelephone nvarchar(50) = NULL,
	@TransformationSupplierAddress nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TransformationSupplier]
	SET
		[TransformationSupplierName] = @TransformationSupplierName,
		[TransformationSupplierTelephone] = @TransformationSupplierTelephone,
		[TransformationSupplierAddress] = @TransformationSupplierAddress
	WHERE
		[TransformationSupplierID] = @TransformationSupplierID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TransformationSupplierInsert]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierInsert];
GO

CREATE PROCEDURE [proc_TransformationSupplierInsert]
(
	@TransformationSupplierID int = NULL output,
	@TransformationSupplierName nvarchar(300) = NULL,
	@TransformationSupplierTelephone nvarchar(50) = NULL,
	@TransformationSupplierAddress nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TransformationSupplier]
	(
		[TransformationSupplierName],
		[TransformationSupplierTelephone],
		[TransformationSupplierAddress]
	)
	VALUES
	(
		@TransformationSupplierName,
		@TransformationSupplierTelephone,
		@TransformationSupplierAddress
	)

	SET @Err = @@Error

	SELECT @TransformationSupplierID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TransformationSupplierDelete]    Script Date: 6/28/2015 1:14:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TransformationSupplierDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TransformationSupplierDelete];
GO

CREATE PROCEDURE [proc_TransformationSupplierDelete]
(
	@TransformationSupplierID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TransformationSupplier]
	WHERE
		[TransformationSupplierID] = @TransformationSupplierID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TransformationSupplierDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TransformationSupplierDelete Error on Creation'
GO
