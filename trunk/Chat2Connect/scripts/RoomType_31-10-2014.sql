
IF NOT EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'OldName' AND [object_id] = OBJECT_ID(N'RoomType'))
BEGIN
	ALTER TABLE RoomType ADD OldName NVARCHAR(400)
END


/****** Object:  StoredProcedure [proc_RoomTypeLoadByPrimaryKey]    Script Date: 31/10/2014 7:50:23 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomTypeLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomID],
		[RoomTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy],
		[OldName]
	FROM [RoomType]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeLoadAll]    Script Date: 31/10/2014 7:50:23 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeLoadAll];
GO

CREATE PROCEDURE [proc_RoomTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomID],
		[RoomTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy],
		[OldName]
	FROM [RoomType]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeUpdate]    Script Date: 31/10/2014 7:50:23 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeUpdate];
GO

CREATE PROCEDURE [proc_RoomTypeUpdate]
(
	@ID int,
	@RoomID int,
	@RoomTypeSpecDurationID int,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@CreateBy int,
	@OldName nvarchar(400) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomType]
	SET
		[RoomID] = @RoomID,
		[RoomTypeSpecDurationID] = @RoomTypeSpecDurationID,
		[StartDate] = @StartDate,
		[EndDate] = @EndDate,
		[CreateBy] = @CreateBy,
		[OldName] = @OldName
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_RoomTypeInsert]    Script Date: 31/10/2014 7:50:23 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeInsert];
GO

CREATE PROCEDURE [proc_RoomTypeInsert]
(
	@ID int = NULL output,
	@RoomID int,
	@RoomTypeSpecDurationID int,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@CreateBy int,
	@OldName nvarchar(400) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomType]
	(
		[RoomID],
		[RoomTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy],
		[OldName]
	)
	VALUES
	(
		@RoomID,
		@RoomTypeSpecDurationID,
		@StartDate,
		@EndDate,
		@CreateBy,
		@OldName
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeDelete]    Script Date: 31/10/2014 7:50:23 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeDelete];
GO

CREATE PROCEDURE [proc_RoomTypeDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomType]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO

ALTER PROCEDURE [dbo].[proc_TypesValidate]
AS
BEGIN
		
	UPDATE Member SET RowStatusID=3 --disable
	FROM Member	
	INNER JOIN MemberType ON Member.MemberID=MemberType.MemberID
	INNER JOIN MemberTypeSpecDuration ON MemberType.MemberTypeSpecDurationID=MemberTypeSpecDuration.ID
	WHERE MemberTypeSpecID=4 AND EndDate<GETDATE()
	
	UPDATE Room SET Name=ISNULL(RoomType.OldName,Room.Name)
	FROM Room	
	INNER JOIN RoomType ON Room.RoomID=RoomType.RoomID
	INNER JOIN RoomTypeSpecDuration ON RoomType.RoomTypeSpecDurationID=RoomTypeSpecDuration.ID
	WHERE RoomTypeSpecID=4 AND EndDate<GETDATE()
	
	DELETE FROM MemberType
	WHERE EndDate<GETDATE()
	
	DELETE FROM RoomType
	WHERE EndDate<GETDATE()
	
	
END