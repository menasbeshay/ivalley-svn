
/****** Object:  StoredProcedure [proc_CreditCardLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CreditCardLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CreditCardLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CreditCardLoadByPrimaryKey]
(
	@CreditCardID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CreditCardID],
		[Name],
		[CardNumber],
		[ExpiryMonthYear],
		[CVV]
	FROM [CreditCard]
	WHERE
		([CreditCardID] = @CreditCardID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CreditCardLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CreditCardLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CreditCardLoadAll]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CreditCardLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CreditCardLoadAll];
GO

CREATE PROCEDURE [proc_CreditCardLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CreditCardID],
		[Name],
		[CardNumber],
		[ExpiryMonthYear],
		[CVV]
	FROM [CreditCard]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CreditCardLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CreditCardLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CreditCardUpdate]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CreditCardUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CreditCardUpdate];
GO

CREATE PROCEDURE [proc_CreditCardUpdate]
(
	@CreditCardID int,
	@Name nvarchar(200) = NULL,
	@CardNumber nvarchar(20) = NULL,
	@ExpiryMonthYear nvarchar(10) = NULL,
	@CVV nvarchar(5) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CreditCard]
	SET
		[Name] = @Name,
		[CardNumber] = @CardNumber,
		[ExpiryMonthYear] = @ExpiryMonthYear,
		[CVV] = @CVV
	WHERE
		[CreditCardID] = @CreditCardID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CreditCardUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CreditCardUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CreditCardInsert]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CreditCardInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CreditCardInsert];
GO

CREATE PROCEDURE [proc_CreditCardInsert]
(
	@CreditCardID int = NULL output,
	@Name nvarchar(200) = NULL,
	@CardNumber nvarchar(20) = NULL,
	@ExpiryMonthYear nvarchar(10) = NULL,
	@CVV nvarchar(5) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CreditCard]
	(
		[Name],
		[CardNumber],
		[ExpiryMonthYear],
		[CVV]
	)
	VALUES
	(
		@Name,
		@CardNumber,
		@ExpiryMonthYear,
		@CVV
	)

	SET @Err = @@Error

	SELECT @CreditCardID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CreditCardInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CreditCardInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CreditCardDelete]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CreditCardDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CreditCardDelete];
GO

CREATE PROCEDURE [proc_CreditCardDelete]
(
	@CreditCardID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CreditCard]
	WHERE
		[CreditCardID] = @CreditCardID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CreditCardDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CreditCardDelete Error on Creation'
GO
