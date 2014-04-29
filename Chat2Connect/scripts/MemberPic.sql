
/****** Object:  StoredProcedure [proc_MemberPicLoadByPrimaryKey]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberPicLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberPicLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberPicLoadByPrimaryKey]
(
	@MemberPicID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberPicID],
		[MemberID],
		[Description]
	FROM [MemberPic]
	WHERE
		([MemberPicID] = @MemberPicID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberPicLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberPicLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberPicLoadAll]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberPicLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberPicLoadAll];
GO

CREATE PROCEDURE [proc_MemberPicLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberPicID],
		[MemberID],
		[Description]
	FROM [MemberPic]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberPicLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberPicLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberPicUpdate]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberPicUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberPicUpdate];
GO

CREATE PROCEDURE [proc_MemberPicUpdate]
(
	@MemberPicID int,
	@MemberID int = NULL,
	@Description nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberPic]
	SET
		[MemberID] = @MemberID,
		[Description] = @Description
	WHERE
		[MemberPicID] = @MemberPicID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberPicUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberPicUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberPicInsert]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberPicInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberPicInsert];
GO

CREATE PROCEDURE [proc_MemberPicInsert]
(
	@MemberPicID int = NULL output,
	@MemberID int = NULL,
	@Description nvarchar(200) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberPic]
	(
		[MemberID],
		[Description]
	)
	VALUES
	(
		@MemberID,
		@Description
	)

	SET @Err = @@Error

	SELECT @MemberPicID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberPicInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberPicInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberPicDelete]    Script Date: 4/29/2014 2:20:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberPicDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberPicDelete];
GO

CREATE PROCEDURE [proc_MemberPicDelete]
(
	@MemberPicID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberPic]
	WHERE
		[MemberPicID] = @MemberPicID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberPicDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberPicDelete Error on Creation'
GO
