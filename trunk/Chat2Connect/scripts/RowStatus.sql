
/****** Object:  StoredProcedure [proc_RowStatusLoadByPrimaryKey]    Script Date: 4/24/2014 3:42:34 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RowStatusLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RowStatusLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RowStatusLoadByPrimaryKey]
(
	@RowStatusID tinyint
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RowStatusID],
		[StatusName]
	FROM [RowStatus]
	WHERE
		([RowStatusID] = @RowStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RowStatusLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RowStatusLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RowStatusLoadAll]    Script Date: 4/24/2014 3:42:34 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RowStatusLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RowStatusLoadAll];
GO

CREATE PROCEDURE [proc_RowStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RowStatusID],
		[StatusName]
	FROM [RowStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RowStatusLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RowStatusLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RowStatusUpdate]    Script Date: 4/24/2014 3:42:34 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RowStatusUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RowStatusUpdate];
GO

CREATE PROCEDURE [proc_RowStatusUpdate]
(
	@RowStatusID tinyint,
	@StatusName nvarchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RowStatus]
	SET
		[StatusName] = @StatusName
	WHERE
		[RowStatusID] = @RowStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RowStatusUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RowStatusUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RowStatusInsert]    Script Date: 4/24/2014 3:42:34 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RowStatusInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RowStatusInsert];
GO

CREATE PROCEDURE [proc_RowStatusInsert]
(
	@RowStatusID tinyint,
	@StatusName nvarchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RowStatus]
	(
		[RowStatusID],
		[StatusName]
	)
	VALUES
	(
		@RowStatusID,
		@StatusName
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RowStatusInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RowStatusInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RowStatusDelete]    Script Date: 4/24/2014 3:42:34 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RowStatusDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RowStatusDelete];
GO

CREATE PROCEDURE [proc_RowStatusDelete]
(
	@RowStatusID tinyint
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RowStatus]
	WHERE
		[RowStatusID] = @RowStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RowStatusDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RowStatusDelete Error on Creation'
GO
