
/****** Object:  StoredProcedure [proc_MemberGiftLoadByPrimaryKey]    Script Date: 12/9/2013 11:26:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberGiftLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberGiftLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberGiftLoadByPrimaryKey]
(
	@MemberGiftID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberGiftID],
		[MemberID],
		[GiftID],
		[SenderID],
		[SendDate]
	FROM [MemberGift]
	WHERE
		([MemberGiftID] = @MemberGiftID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberGiftLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberGiftLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberGiftLoadAll]    Script Date: 12/9/2013 11:26:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberGiftLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberGiftLoadAll];
GO

CREATE PROCEDURE [proc_MemberGiftLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberGiftID],
		[MemberID],
		[GiftID],
		[SenderID],
		[SendDate]
	FROM [MemberGift]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberGiftLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberGiftLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberGiftUpdate]    Script Date: 12/9/2013 11:26:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberGiftUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberGiftUpdate];
GO

CREATE PROCEDURE [proc_MemberGiftUpdate]
(
	@MemberGiftID int,
	@MemberID int = NULL,
	@GiftID int = NULL,
	@SenderID int = NULL,
	@SendDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberGift]
	SET
		[MemberID] = @MemberID,
		[GiftID] = @GiftID,
		[SenderID] = @SenderID,
		[SendDate] = @SendDate
	WHERE
		[MemberGiftID] = @MemberGiftID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberGiftUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberGiftUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_MemberGiftInsert]    Script Date: 12/9/2013 11:26:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberGiftInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberGiftInsert];
GO

CREATE PROCEDURE [proc_MemberGiftInsert]
(
	@MemberGiftID int = NULL output,
	@MemberID int = NULL,
	@GiftID int = NULL,
	@SenderID int = NULL,
	@SendDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberGift]
	(
		[MemberID],
		[GiftID],
		[SenderID],
		[SendDate]
	)
	VALUES
	(
		@MemberID,
		@GiftID,
		@SenderID,
		@SendDate
	)

	SET @Err = @@Error

	SELECT @MemberGiftID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberGiftInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberGiftInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberGiftDelete]    Script Date: 12/9/2013 11:26:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberGiftDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberGiftDelete];
GO

CREATE PROCEDURE [proc_MemberGiftDelete]
(
	@MemberGiftID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MemberGift]
	WHERE
		[MemberGiftID] = @MemberGiftID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberGiftDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberGiftDelete Error on Creation'
GO
