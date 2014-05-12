
/****** Object:  StoredProcedure [proc_UserInfoLoadByPrimaryKey]    Script Date: 5/9/2014 4:42:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserInfoLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserInfoLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_UserInfoLoadByPrimaryKey]
(
	@UserID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserID],
		[UserName],
		[UserPassword],
		[FullName],
		[UserAddress],
		[ShippingAddress],
		[MobilePhone],
		[LandLine],
		[Email]
	FROM [UserInfo]
	WHERE
		([UserID] = @UserID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserInfoLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserInfoLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserInfoLoadAll]    Script Date: 5/9/2014 4:42:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserInfoLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserInfoLoadAll];
GO

CREATE PROCEDURE [proc_UserInfoLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserID],
		[UserName],
		[UserPassword],
		[FullName],
		[UserAddress],
		[ShippingAddress],
		[MobilePhone],
		[LandLine],
		[Email]
	FROM [UserInfo]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserInfoLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserInfoLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserInfoUpdate]    Script Date: 5/9/2014 4:42:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserInfoUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserInfoUpdate];
GO

CREATE PROCEDURE [proc_UserInfoUpdate]
(
	@UserID int,
	@UserName nvarchar(50) = NULL,
	@UserPassword nvarchar(50) = NULL,
	@FullName nvarchar(250) = NULL,
	@UserAddress nvarchar(500) = NULL,
	@ShippingAddress nvarchar(500) = NULL,
	@MobilePhone nvarchar(20) = NULL,
	@LandLine nvarchar(20) = NULL,
	@Email nvarchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [UserInfo]
	SET
		[UserName] = @UserName,
		[UserPassword] = @UserPassword,
		[FullName] = @FullName,
		[UserAddress] = @UserAddress,
		[ShippingAddress] = @ShippingAddress,
		[MobilePhone] = @MobilePhone,
		[LandLine] = @LandLine,
		[Email] = @Email
	WHERE
		[UserID] = @UserID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserInfoUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserInfoUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_UserInfoInsert]    Script Date: 5/9/2014 4:42:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserInfoInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserInfoInsert];
GO

CREATE PROCEDURE [proc_UserInfoInsert]
(
	@UserID int = NULL output,
	@UserName nvarchar(50) = NULL,
	@UserPassword nvarchar(50) = NULL,
	@FullName nvarchar(250) = NULL,
	@UserAddress nvarchar(500) = NULL,
	@ShippingAddress nvarchar(500) = NULL,
	@MobilePhone nvarchar(20) = NULL,
	@LandLine nvarchar(20) = NULL,
	@Email nvarchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [UserInfo]
	(
		[UserName],
		[UserPassword],
		[FullName],
		[UserAddress],
		[ShippingAddress],
		[MobilePhone],
		[LandLine],
		[Email]
	)
	VALUES
	(
		@UserName,
		@UserPassword,
		@FullName,
		@UserAddress,
		@ShippingAddress,
		@MobilePhone,
		@LandLine,
		@Email
	)

	SET @Err = @@Error

	SELECT @UserID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserInfoInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserInfoInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_UserInfoDelete]    Script Date: 5/9/2014 4:42:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_UserInfoDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_UserInfoDelete];
GO

CREATE PROCEDURE [proc_UserInfoDelete]
(
	@UserID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [UserInfo]
	WHERE
		[UserID] = @UserID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_UserInfoDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_UserInfoDelete Error on Creation'
GO
