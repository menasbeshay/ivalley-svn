
/****** Object:  StoredProcedure [proc_TicketHistoryLoadByPrimaryKey]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketHistoryLoadByPrimaryKey]
(
	@TicketHistoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketHistoryID],
		[TicketID],
		[ResponseText],
		[ResponseDate],
		[CAPA_ResponderID],
		[TicketStatusID],
		[FileAttachement]
	FROM [TicketHistory]
	WHERE
		([TicketHistoryID] = @TicketHistoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryLoadAll]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryLoadAll];
GO

CREATE PROCEDURE [proc_TicketHistoryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketHistoryID],
		[TicketID],
		[ResponseText],
		[ResponseDate],
		[CAPA_ResponderID],
		[TicketStatusID],
		[FileAttachement]
	FROM [TicketHistory]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryUpdate]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryUpdate];
GO

CREATE PROCEDURE [proc_TicketHistoryUpdate]
(
	@TicketHistoryID int,
	@TicketID int = NULL,
	@ResponseText nvarchar(500) = NULL,
	@ResponseDate datetime = NULL,
	@CAPA_ResponderID int = NULL,
	@TicketStatusID int = NULL,
	@FileAttachement nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TicketHistory]
	SET
		[TicketID] = @TicketID,
		[ResponseText] = @ResponseText,
		[ResponseDate] = @ResponseDate,
		[CAPA_ResponderID] = @CAPA_ResponderID,
		[TicketStatusID] = @TicketStatusID,
		[FileAttachement] = @FileAttachement
	WHERE
		[TicketHistoryID] = @TicketHistoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketHistoryInsert]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryInsert];
GO

CREATE PROCEDURE [proc_TicketHistoryInsert]
(
	@TicketHistoryID int = NULL output,
	@TicketID int = NULL,
	@ResponseText nvarchar(500) = NULL,
	@ResponseDate datetime = NULL,
	@CAPA_ResponderID int = NULL,
	@TicketStatusID int = NULL,
	@FileAttachement nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TicketHistory]
	(
		[TicketID],
		[ResponseText],
		[ResponseDate],
		[CAPA_ResponderID],
		[TicketStatusID],
		[FileAttachement]
	)
	VALUES
	(
		@TicketID,
		@ResponseText,
		@ResponseDate,
		@CAPA_ResponderID,
		@TicketStatusID,
		@FileAttachement
	)

	SET @Err = @@Error

	SELECT @TicketHistoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryDelete]    Script Date: 6/25/2014 1:38:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryDelete];
GO

CREATE PROCEDURE [proc_TicketHistoryDelete]
(
	@TicketHistoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TicketHistory]
	WHERE
		[TicketHistoryID] = @TicketHistoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryDelete Error on Creation'
GO
