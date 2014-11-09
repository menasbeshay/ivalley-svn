
IF NOT EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'OldName' AND [object_id] = OBJECT_ID(N'MemberType'))
BEGIN
	ALTER TABLE MemberType ADD OldName NVARCHAR(400)
END

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
		[CreateBy],
		[OldName]
	FROM [MemberType]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberTypeLoadAll]    Script Date: 11/9/2014 2:03:56 PM ******/
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
		[CreateBy],
		[OldName]
	FROM [MemberType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberTypeUpdate]    Script Date: 11/9/2014 2:03:56 PM ******/
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
	@CreateBy int,
	@OldName nvarchar(400) = NULL
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
		[CreateBy] = @CreateBy,
		[OldName] = @OldName
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberTypeInsert]    Script Date: 11/9/2014 2:03:56 PM ******/
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
	@CreateBy int,
	@OldName nvarchar(400) = NULL
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
		[CreateBy],
		[OldName]
	)
	VALUES
	(
		@MemberID,
		@MemberTypeSpecDurationID,
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberTypeDelete]    Script Date: 11/9/2014 2:03:56 PM ******/
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberTypeDelete Error on Creation'
GO