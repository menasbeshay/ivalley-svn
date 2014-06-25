
/****** Object:  StoredProcedure [proc_UnitLoadByPrimaryKey]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UnitLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UnitLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_UnitLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[NAME]
	FROM [Unit]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UnitLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_UnitLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UnitLoadAll]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UnitLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UnitLoadAll];
GO

CREATE PROCEDURE [proc_UnitLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[NAME]
	FROM [Unit]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UnitLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_UnitLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UnitUpdate]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UnitUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UnitUpdate];
GO

CREATE PROCEDURE [proc_UnitUpdate]
(
	@ID int,
	@NAME nvarchar(1000) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Unit]
	SET
		[NAME] = @NAME
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UnitUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_UnitUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_UnitInsert]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UnitInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UnitInsert];
GO

CREATE PROCEDURE [proc_UnitInsert]
(
	@ID int = NULL output,
	@NAME nvarchar(1000) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Unit]
	(
		[NAME]
	)
	VALUES
	(
		@NAME
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UnitInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_UnitInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UnitDelete]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UnitDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UnitDelete];
GO

CREATE PROCEDURE [proc_UnitDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Unit]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UnitDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_UnitDelete Error on Creation'
GO
