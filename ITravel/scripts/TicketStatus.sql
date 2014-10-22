
/****** Object:  StoredProcedure [proc_TicketStatusLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketStatusLoadByPrimaryKey]
(
	@TicketStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketStatusID],
		[ArName],
		[EnName]
	FROM [TicketStatus]
	WHERE
		([TicketStatusID] = @TicketStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketStatusLoadAll]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusLoadAll];
GO

CREATE PROCEDURE [proc_TicketStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketStatusID],
		[ArName],
		[EnName]
	FROM [TicketStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketStatusUpdate]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusUpdate];
GO

CREATE PROCEDURE [proc_TicketStatusUpdate]
(
	@TicketStatusID int,
	@ArName nvarchar(40) = NULL,
	@EnName nvarchar(40) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TicketStatus]
	SET
		[ArName] = @ArName,
		[EnName] = @EnName
	WHERE
		[TicketStatusID] = @TicketStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketStatusInsert]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusInsert];
GO

CREATE PROCEDURE [proc_TicketStatusInsert]
(
	@TicketStatusID int = NULL output,
	@ArName nvarchar(40) = NULL,
	@EnName nvarchar(40) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TicketStatus]
	(
		[ArName],
		[EnName]
	)
	VALUES
	(
		@ArName,
		@EnName
	)

	SET @Err = @@Error

	SELECT @TicketStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketStatusDelete]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusDelete];
GO

CREATE PROCEDURE [proc_TicketStatusDelete]
(
	@TicketStatusID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TicketStatus]
	WHERE
		[TicketStatusID] = @TicketStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusDelete Error on Creation'
GO
