
/****** Object:  StoredProcedure [proc_DesignservicesTypeLoadByPrimaryKey]    Script Date: 6/16/2015 4:00:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DesignservicesTypeLoadByPrimaryKey]
(
	@DesignservicesTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DesignservicesTypeID],
		[DigitalPrintingDetailsID],
		[ServiceID]
	FROM [DesignservicesType]
	WHERE
		([DesignservicesTypeID] = @DesignservicesTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignservicesTypeLoadAll]    Script Date: 6/16/2015 4:00:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeLoadAll];
GO

CREATE PROCEDURE [proc_DesignservicesTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DesignservicesTypeID],
		[DigitalPrintingDetailsID],
		[ServiceID]
	FROM [DesignservicesType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignservicesTypeUpdate]    Script Date: 6/16/2015 4:00:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeUpdate];
GO

CREATE PROCEDURE [proc_DesignservicesTypeUpdate]
(
	@DesignservicesTypeID int,
	@DigitalPrintingDetailsID int = NULL,
	@ServiceID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DesignservicesType]
	SET
		[DigitalPrintingDetailsID] = @DigitalPrintingDetailsID,
		[ServiceID] = @ServiceID
	WHERE
		[DesignservicesTypeID] = @DesignservicesTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DesignservicesTypeInsert]    Script Date: 6/16/2015 4:00:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeInsert];
GO

CREATE PROCEDURE [proc_DesignservicesTypeInsert]
(
	@DesignservicesTypeID int = NULL output,
	@DigitalPrintingDetailsID int = NULL,
	@ServiceID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DesignservicesType]
	(
		[DigitalPrintingDetailsID],
		[ServiceID]
	)
	VALUES
	(
		@DigitalPrintingDetailsID,
		@ServiceID
	)

	SET @Err = @@Error

	SELECT @DesignservicesTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DesignservicesTypeDelete]    Script Date: 6/16/2015 4:00:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DesignservicesTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DesignservicesTypeDelete];
GO

CREATE PROCEDURE [proc_DesignservicesTypeDelete]
(
	@DesignservicesTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DesignservicesType]
	WHERE
		[DesignservicesTypeID] = @DesignservicesTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DesignservicesTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DesignservicesTypeDelete Error on Creation'
GO
