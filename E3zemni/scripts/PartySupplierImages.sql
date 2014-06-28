
/****** Object:  StoredProcedure [proc_PartySupplierImagesLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PartySupplierImagesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PartySupplierImagesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PartySupplierImagesLoadByPrimaryKey]
(
	@PartySupplierImageID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PartySupplierImageID],
		[CardID],
		[ImagePath]
	FROM [PartySupplierImages]
	WHERE
		([PartySupplierImageID] = @PartySupplierImageID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PartySupplierImagesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PartySupplierImagesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PartySupplierImagesLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PartySupplierImagesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PartySupplierImagesLoadAll];
GO

CREATE PROCEDURE [proc_PartySupplierImagesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PartySupplierImageID],
		[CardID],
		[ImagePath]
	FROM [PartySupplierImages]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PartySupplierImagesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PartySupplierImagesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PartySupplierImagesUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PartySupplierImagesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PartySupplierImagesUpdate];
GO

CREATE PROCEDURE [proc_PartySupplierImagesUpdate]
(
	@PartySupplierImageID int,
	@CardID int = NULL,
	@ImagePath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PartySupplierImages]
	SET
		[CardID] = @CardID,
		[ImagePath] = @ImagePath
	WHERE
		[PartySupplierImageID] = @PartySupplierImageID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PartySupplierImagesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PartySupplierImagesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PartySupplierImagesInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PartySupplierImagesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PartySupplierImagesInsert];
GO

CREATE PROCEDURE [proc_PartySupplierImagesInsert]
(
	@PartySupplierImageID int = NULL output,
	@CardID int = NULL,
	@ImagePath nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PartySupplierImages]
	(
		[CardID],
		[ImagePath]
	)
	VALUES
	(
		@CardID,
		@ImagePath
	)

	SET @Err = @@Error

	SELECT @PartySupplierImageID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PartySupplierImagesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PartySupplierImagesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PartySupplierImagesDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PartySupplierImagesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PartySupplierImagesDelete];
GO

CREATE PROCEDURE [proc_PartySupplierImagesDelete]
(
	@PartySupplierImageID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PartySupplierImages]
	WHERE
		[PartySupplierImageID] = @PartySupplierImageID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PartySupplierImagesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PartySupplierImagesDelete Error on Creation'
GO
