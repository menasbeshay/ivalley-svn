Alter Table ApplicationStatusHistory
AddVisaAppointMentDate DateTime


/****** Object:  StoredProcedure [proc_ApplicationStatusHistoryLoadByPrimaryKey]    Script Date: 11/23/2014 2:15:38 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ApplicationStatusHistoryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ApplicationStatusHistoryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ApplicationStatusHistoryLoadByPrimaryKey]
(
	@StatusHistoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[StatusHistoryID],
		[ApplicationStatusID],
		[StudentID],
		[StatusDate],
		[StatusComment],
		[ApplicationDataID],
		[TuitionFees],
		[WireTranseferReceipt],
		[VisaResult],
		[VisaAppointMentDate]
	FROM [ApplicationStatusHistory]
	WHERE
		([StatusHistoryID] = @StatusHistoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ApplicationStatusHistoryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ApplicationStatusHistoryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ApplicationStatusHistoryLoadAll]    Script Date: 11/23/2014 2:15:38 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ApplicationStatusHistoryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ApplicationStatusHistoryLoadAll];
GO

CREATE PROCEDURE [proc_ApplicationStatusHistoryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[StatusHistoryID],
		[ApplicationStatusID],
		[StudentID],
		[StatusDate],
		[StatusComment],
		[ApplicationDataID],
		[TuitionFees],
		[WireTranseferReceipt],
		[VisaResult],
		[VisaAppointMentDate]
	FROM [ApplicationStatusHistory]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ApplicationStatusHistoryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ApplicationStatusHistoryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ApplicationStatusHistoryUpdate]    Script Date: 11/23/2014 2:15:38 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ApplicationStatusHistoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ApplicationStatusHistoryUpdate];
GO

CREATE PROCEDURE [proc_ApplicationStatusHistoryUpdate]
(
	@StatusHistoryID int,
	@ApplicationStatusID int = NULL,
	@StudentID int = NULL,
	@StatusDate datetime = NULL,
	@StatusComment nvarchar(MAX) = NULL,
	@ApplicationDataID int = NULL,
	@TuitionFees decimal(6,2) = NULL,
	@WireTranseferReceipt nvarchar(300) = NULL,
	@VisaResult nvarchar(300) = NULL,
	@VisaAppointMentDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [ApplicationStatusHistory]
	SET
		[ApplicationStatusID] = @ApplicationStatusID,
		[StudentID] = @StudentID,
		[StatusDate] = @StatusDate,
		[StatusComment] = @StatusComment,
		[ApplicationDataID] = @ApplicationDataID,
		[TuitionFees] = @TuitionFees,
		[WireTranseferReceipt] = @WireTranseferReceipt,
		[VisaResult] = @VisaResult,
		[VisaAppointMentDate] = @VisaAppointMentDate
	WHERE
		[StatusHistoryID] = @StatusHistoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ApplicationStatusHistoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ApplicationStatusHistoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ApplicationStatusHistoryInsert]    Script Date: 11/23/2014 2:15:38 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ApplicationStatusHistoryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ApplicationStatusHistoryInsert];
GO

CREATE PROCEDURE [proc_ApplicationStatusHistoryInsert]
(
	@StatusHistoryID int = NULL output,
	@ApplicationStatusID int = NULL,
	@StudentID int = NULL,
	@StatusDate datetime = NULL,
	@StatusComment nvarchar(MAX) = NULL,
	@ApplicationDataID int = NULL,
	@TuitionFees decimal(6,2) = NULL,
	@WireTranseferReceipt nvarchar(300) = NULL,
	@VisaResult nvarchar(300) = NULL,
	@VisaAppointMentDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [ApplicationStatusHistory]
	(
		[ApplicationStatusID],
		[StudentID],
		[StatusDate],
		[StatusComment],
		[ApplicationDataID],
		[TuitionFees],
		[WireTranseferReceipt],
		[VisaResult],
		[VisaAppointMentDate]
	)
	VALUES
	(
		@ApplicationStatusID,
		@StudentID,
		@StatusDate,
		@StatusComment,
		@ApplicationDataID,
		@TuitionFees,
		@WireTranseferReceipt,
		@VisaResult,
		@VisaAppointMentDate
	)

	SET @Err = @@Error

	SELECT @StatusHistoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ApplicationStatusHistoryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ApplicationStatusHistoryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ApplicationStatusHistoryDelete]    Script Date: 11/23/2014 2:15:38 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ApplicationStatusHistoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ApplicationStatusHistoryDelete];
GO

CREATE PROCEDURE [proc_ApplicationStatusHistoryDelete]
(
	@StatusHistoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [ApplicationStatusHistory]
	WHERE
		[StatusHistoryID] = @StatusHistoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ApplicationStatusHistoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ApplicationStatusHistoryDelete Error on Creation'
GO
