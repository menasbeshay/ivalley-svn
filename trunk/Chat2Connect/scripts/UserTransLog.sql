
/****** Object:  StoredProcedure [proc_UserTransLogLoadByPrimaryKey]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserTransLogLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserTransLogLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_UserTransLogLoadByPrimaryKey]
(
	@UserTransLogID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserTransLogID],
		[MemberID],
		[TransDate],
		[TransType],
		[AddedBy],
		[PaymentMethod],
		[Value],
		[Notes],
		[AddedFrom],
		[AddedTo]
	FROM [UserTransLog]
	WHERE
		([UserTransLogID] = @UserTransLogID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserTransLogLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserTransLogLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserTransLogLoadAll]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserTransLogLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserTransLogLoadAll];
GO

CREATE PROCEDURE [proc_UserTransLogLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserTransLogID],
		[MemberID],
		[TransDate],
		[TransType],
		[AddedBy],
		[PaymentMethod],
		[Value],
		[Notes],
		[AddedFrom],
		[AddedTo]
	FROM [UserTransLog]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserTransLogLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserTransLogLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserTransLogUpdate]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserTransLogUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserTransLogUpdate];
GO

CREATE PROCEDURE [proc_UserTransLogUpdate]
(
	@UserTransLogID int,
	@MemberID int = NULL,
	@TransDate datetime = NULL,
	@TransType smallint = NULL,
	@AddedBy nvarchar(100) = NULL,
	@PaymentMethod nvarchar(100) = NULL,
	@Value decimal(10,4) = NULL,
	@Notes nvarchar(1000) = NULL,
	@AddedFrom int = NULL,
	@AddedTo int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [UserTransLog]
	SET
		[MemberID] = @MemberID,
		[TransDate] = @TransDate,
		[TransType] = @TransType,
		[AddedBy] = @AddedBy,
		[PaymentMethod] = @PaymentMethod,
		[Value] = @Value,
		[Notes] = @Notes,
		[AddedFrom] = @AddedFrom,
		[AddedTo] = @AddedTo
	WHERE
		[UserTransLogID] = @UserTransLogID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserTransLogUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserTransLogUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_UserTransLogInsert]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserTransLogInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserTransLogInsert];
GO

CREATE PROCEDURE [proc_UserTransLogInsert]
(
	@UserTransLogID int = NULL output,
	@MemberID int = NULL,
	@TransDate datetime = NULL,
	@TransType smallint = NULL,
	@AddedBy nvarchar(100) = NULL,
	@PaymentMethod nvarchar(100) = NULL,
	@Value decimal(10,4) = NULL,
	@Notes nvarchar(1000) = NULL,
	@AddedFrom int = NULL,
	@AddedTo int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [UserTransLog]
	(
		[MemberID],
		[TransDate],
		[TransType],
		[AddedBy],
		[PaymentMethod],
		[Value],
		[Notes],
		[AddedFrom],
		[AddedTo]
	)
	VALUES
	(
		@MemberID,
		@TransDate,
		@TransType,
		@AddedBy,
		@PaymentMethod,
		@Value,
		@Notes,
		@AddedFrom,
		@AddedTo
	)

	SET @Err = @@Error

	SELECT @UserTransLogID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserTransLogInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserTransLogInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserTransLogDelete]    Script Date: 5/8/2014 1:38:51 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserTransLogDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserTransLogDelete];
GO

CREATE PROCEDURE [proc_UserTransLogDelete]
(
	@UserTransLogID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [UserTransLog]
	WHERE
		[UserTransLogID] = @UserTransLogID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserTransLogDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserTransLogDelete Error on Creation'
GO
