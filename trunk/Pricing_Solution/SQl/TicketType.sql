
/****** Object:  StoredProcedure [proc_TicketTypeLoadByPrimaryKey]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketTypeLoadByPrimaryKey]
(
	@TicketTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketTypeID],
		[Name]
	FROM [TicketType]
	WHERE
		([TicketTypeID] = @TicketTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketTypeLoadAll]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketTypeLoadAll];
GO

CREATE PROCEDURE [proc_TicketTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketTypeID],
		[Name]
	FROM [TicketType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketTypeUpdate]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketTypeUpdate];
GO

CREATE PROCEDURE [proc_TicketTypeUpdate]
(
	@TicketTypeID int,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TicketType]
	SET
		[Name] = @Name
	WHERE
		[TicketTypeID] = @TicketTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketTypeInsert]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketTypeInsert];
GO

CREATE PROCEDURE [proc_TicketTypeInsert]
(
	@TicketTypeID int = NULL output,
	@Name nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TicketType]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @TicketTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketTypeDelete]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketTypeDelete];
GO

CREATE PROCEDURE [proc_TicketTypeDelete]
(
	@TicketTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TicketType]
	WHERE
		[TicketTypeID] = @TicketTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketTypeDelete Error on Creation'
GO
