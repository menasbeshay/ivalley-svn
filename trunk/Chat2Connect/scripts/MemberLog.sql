
USE [chat2connect]
GO

/****** Object:  StoredProcedure [proc_MemberLogLoadByPrimaryKey]    Script Date: 15/5/2014 12:59:14 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberLogLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberLogLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberLogLoadByPrimaryKey]
(
	@ID bigint
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberID],
		[LogTypeID],
		[LogDetails],
		[RelatedRoomID],
		[RelatedMemberID],
		[CreateDate]
	FROM [MemberLog]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberLogLoadAll]    Script Date: 15/5/2014 12:59:14 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberLogLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberLogLoadAll];
GO

CREATE PROCEDURE [proc_MemberLogLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberID],
		[LogTypeID],
		[LogDetails],
		[RelatedRoomID],
		[RelatedMemberID],
		[CreateDate]
	FROM [MemberLog]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberLogUpdate]    Script Date: 15/5/2014 12:59:14 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberLogUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberLogUpdate];
GO

CREATE PROCEDURE [proc_MemberLogUpdate]
(
	@ID bigint,
	@MemberID int,
	@LogTypeID int,
	@LogDetails nvarchar(MAX),
	@RelatedRoomID int = NULL,
	@RelatedMemberID int = NULL,
	@CreateDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberLog]
	SET
		[MemberID] = @MemberID,
		[LogTypeID] = @LogTypeID,
		[LogDetails] = @LogDetails,
		[RelatedRoomID] = @RelatedRoomID,
		[RelatedMemberID] = @RelatedMemberID,
		[CreateDate] = @CreateDate
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_MemberLogInsert]    Script Date: 15/5/2014 12:59:14 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberLogInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberLogInsert];
GO

CREATE PROCEDURE [proc_MemberLogInsert]
(
	@ID bigint = NULL output,
	@MemberID int,
	@LogTypeID int,
	@LogDetails nvarchar(MAX),
	@RelatedRoomID int = NULL,
	@RelatedMemberID int = NULL,
	@CreateDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberLog]
	(
		[MemberID],
		[LogTypeID],
		[LogDetails],
		[RelatedRoomID],
		[RelatedMemberID],
		[CreateDate]
	)
	VALUES
	(
		@MemberID,
		@LogTypeID,
		@LogDetails,
		@RelatedRoomID,
		@RelatedMemberID,
		@CreateDate
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberLogDelete]    Script Date: 15/5/2014 12:59:14 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberLogDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberLogDelete];
GO

CREATE PROCEDURE [proc_MemberLogDelete]
(
	@ID bigint
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberLog]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO

