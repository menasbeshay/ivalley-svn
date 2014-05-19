
USE [chat2connect]
GO

/****** Object:  StoredProcedure [proc_MemberTypeLoadByPrimaryKey]    Script Date: 20/5/2014 3:15:36 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberTypeLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberID],
		[MemberTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy]
	FROM [MemberType]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeLoadAll]    Script Date: 20/5/2014 3:15:36 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeLoadAll];
GO

CREATE PROCEDURE [proc_MemberTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberID],
		[MemberTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy]
	FROM [MemberType]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeUpdate]    Script Date: 20/5/2014 3:15:36 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeUpdate];
GO

CREATE PROCEDURE [proc_MemberTypeUpdate]
(
	@ID int,
	@MemberID int,
	@MemberTypeSpecDurationID int,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@CreateBy int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberType]
	SET
		[MemberID] = @MemberID,
		[MemberTypeSpecDurationID] = @MemberTypeSpecDurationID,
		[StartDate] = @StartDate,
		[EndDate] = @EndDate,
		[CreateBy] = @CreateBy
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_MemberTypeInsert]    Script Date: 20/5/2014 3:15:37 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeInsert];
GO

CREATE PROCEDURE [proc_MemberTypeInsert]
(
	@ID int = NULL output,
	@MemberID int,
	@MemberTypeSpecDurationID int,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@CreateBy int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberType]
	(
		[MemberID],
		[MemberTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy]
	)
	VALUES
	(
		@MemberID,
		@MemberTypeSpecDurationID,
		@StartDate,
		@EndDate,
		@CreateBy
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MemberTypeDelete]    Script Date: 20/5/2014 3:15:37 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberTypeDelete];
GO

CREATE PROCEDURE [proc_MemberTypeDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberType]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO

