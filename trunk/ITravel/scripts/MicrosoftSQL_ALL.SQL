
USE [ITravel]
GO

/****** Object:  StoredProcedure [proc_AirLineLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirLineLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirLineLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_AirLineLoadByPrimaryKey]
(
	@AirLineID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AirLineID],
		[Name],
		[Description],
		[Notes],
		[CreatedBy],
		[UpdatedBy],
		[CreatedDate],
		[LastUpdatedDate]
	FROM [AirLine]
	WHERE
		([AirLineID] = @AirLineID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirLineLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirLineLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirLineLoadAll]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirLineLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirLineLoadAll];
GO

CREATE PROCEDURE [proc_AirLineLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AirLineID],
		[Name],
		[Description],
		[Notes],
		[CreatedBy],
		[UpdatedBy],
		[CreatedDate],
		[LastUpdatedDate]
	FROM [AirLine]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirLineLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirLineLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirLineUpdate]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirLineUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirLineUpdate];
GO

CREATE PROCEDURE [proc_AirLineUpdate]
(
	@AirLineID int,
	@Name nvarchar(100) = NULL,
	@Description nvarchar(2000) = NULL,
	@Notes nvarchar(MAX) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [AirLine]
	SET
		[Name] = @Name,
		[Description] = @Description,
		[Notes] = @Notes,
		[CreatedBy] = @CreatedBy,
		[UpdatedBy] = @UpdatedBy,
		[CreatedDate] = @CreatedDate,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[AirLineID] = @AirLineID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirLineUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirLineUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_AirLineInsert]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirLineInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirLineInsert];
GO

CREATE PROCEDURE [proc_AirLineInsert]
(
	@AirLineID int = NULL output,
	@Name nvarchar(100) = NULL,
	@Description nvarchar(2000) = NULL,
	@Notes nvarchar(MAX) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [AirLine]
	(
		[Name],
		[Description],
		[Notes],
		[CreatedBy],
		[UpdatedBy],
		[CreatedDate],
		[LastUpdatedDate]
	)
	VALUES
	(
		@Name,
		@Description,
		@Notes,
		@CreatedBy,
		@UpdatedBy,
		@CreatedDate,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @AirLineID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirLineInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirLineInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirLineDelete]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirLineDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirLineDelete];
GO

CREATE PROCEDURE [proc_AirLineDelete]
(
	@AirLineID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [AirLine]
	WHERE
		[AirLineID] = @AirLineID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirLineDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirLineDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirPortLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirPortLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirPortLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_AirPortLoadByPrimaryKey]
(
	@AirPortID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AirPortID],
		[Name],
		[IATACode],
		[ACAICode],
		[Description],
		[Notes],
		[CreatedBy],
		[UpdatedBy],
		[CreatedDate],
		[LastUpdatedDate]
	FROM [AirPort]
	WHERE
		([AirPortID] = @AirPortID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirPortLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirPortLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirPortLoadAll]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirPortLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirPortLoadAll];
GO

CREATE PROCEDURE [proc_AirPortLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AirPortID],
		[Name],
		[IATACode],
		[ACAICode],
		[Description],
		[Notes],
		[CreatedBy],
		[UpdatedBy],
		[CreatedDate],
		[LastUpdatedDate]
	FROM [AirPort]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirPortLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirPortLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirPortUpdate]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirPortUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirPortUpdate];
GO

CREATE PROCEDURE [proc_AirPortUpdate]
(
	@AirPortID int,
	@Name nvarchar(100) = NULL,
	@IATACode nvarchar(5) = NULL,
	@ACAICode nvarchar(10) = NULL,
	@Description nvarchar(2000) = NULL,
	@Notes nvarchar(MAX) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [AirPort]
	SET
		[Name] = @Name,
		[IATACode] = @IATACode,
		[ACAICode] = @ACAICode,
		[Description] = @Description,
		[Notes] = @Notes,
		[CreatedBy] = @CreatedBy,
		[UpdatedBy] = @UpdatedBy,
		[CreatedDate] = @CreatedDate,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[AirPortID] = @AirPortID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirPortUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirPortUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_AirPortInsert]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirPortInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirPortInsert];
GO

CREATE PROCEDURE [proc_AirPortInsert]
(
	@AirPortID int = NULL output,
	@Name nvarchar(100) = NULL,
	@IATACode nvarchar(5) = NULL,
	@ACAICode nvarchar(10) = NULL,
	@Description nvarchar(2000) = NULL,
	@Notes nvarchar(MAX) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [AirPort]
	(
		[Name],
		[IATACode],
		[ACAICode],
		[Description],
		[Notes],
		[CreatedBy],
		[UpdatedBy],
		[CreatedDate],
		[LastUpdatedDate]
	)
	VALUES
	(
		@Name,
		@IATACode,
		@ACAICode,
		@Description,
		@Notes,
		@CreatedBy,
		@UpdatedBy,
		@CreatedDate,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @AirPortID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirPortInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirPortInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirPortDelete]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirPortDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirPortDelete];
GO

CREATE PROCEDURE [proc_AirPortDelete]
(
	@AirPortID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [AirPort]
	WHERE
		[AirPortID] = @AirPortID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirPortDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirPortDelete Error on Creation'
GO

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

/****** Object:  StoredProcedure [proc_PassengerLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PassengerLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PassengerLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PassengerLoadByPrimaryKey]
(
	@PassengerID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PassengerID],
		[TitleID],
		[FirstName],
		[LastName],
		[DateOfBirth],
		[IsChild],
		[Email],
		[Mobile]
	FROM [Passenger]
	WHERE
		([PassengerID] = @PassengerID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PassengerLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PassengerLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PassengerLoadAll]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PassengerLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PassengerLoadAll];
GO

CREATE PROCEDURE [proc_PassengerLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PassengerID],
		[TitleID],
		[FirstName],
		[LastName],
		[DateOfBirth],
		[IsChild],
		[Email],
		[Mobile]
	FROM [Passenger]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PassengerLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PassengerLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PassengerUpdate]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PassengerUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PassengerUpdate];
GO

CREATE PROCEDURE [proc_PassengerUpdate]
(
	@PassengerID int,
	@TitleID int = NULL,
	@FirstName nvarchar(200) = NULL,
	@LastName nvarchar(200) = NULL,
	@DateOfBirth datetime = NULL,
	@IsChild bit = NULL,
	@Email nvarchar(200) = NULL,
	@Mobile nvarchar(15) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Passenger]
	SET
		[TitleID] = @TitleID,
		[FirstName] = @FirstName,
		[LastName] = @LastName,
		[DateOfBirth] = @DateOfBirth,
		[IsChild] = @IsChild,
		[Email] = @Email,
		[Mobile] = @Mobile
	WHERE
		[PassengerID] = @PassengerID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PassengerUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PassengerUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PassengerInsert]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PassengerInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PassengerInsert];
GO

CREATE PROCEDURE [proc_PassengerInsert]
(
	@PassengerID int = NULL output,
	@TitleID int = NULL,
	@FirstName nvarchar(200) = NULL,
	@LastName nvarchar(200) = NULL,
	@DateOfBirth datetime = NULL,
	@IsChild bit = NULL,
	@Email nvarchar(200) = NULL,
	@Mobile nvarchar(15) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Passenger]
	(
		[TitleID],
		[FirstName],
		[LastName],
		[DateOfBirth],
		[IsChild],
		[Email],
		[Mobile]
	)
	VALUES
	(
		@TitleID,
		@FirstName,
		@LastName,
		@DateOfBirth,
		@IsChild,
		@Email,
		@Mobile
	)

	SET @Err = @@Error

	SELECT @PassengerID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PassengerInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PassengerInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PassengerDelete]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PassengerDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PassengerDelete];
GO

CREATE PROCEDURE [proc_PassengerDelete]
(
	@PassengerID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Passenger]
	WHERE
		[PassengerID] = @PassengerID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PassengerDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PassengerDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PaymentVoucherLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PaymentVoucherLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PaymentVoucherLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PaymentVoucherLoadByPrimaryKey]
(
	@PaymentVoucherID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PaymentVoucherID],
		[VoucherNumber],
		[Amount],
		[PaidFor],
		[PassengerId],
		[IsCheque],
		[BankName],
		[ChuqueDate],
		[Reason],
		[VoucherDate],
		[CreatedBy],
		[LastUpdatedDate],
		[LastUpdatedBy]
	FROM [PaymentVoucher]
	WHERE
		([PaymentVoucherID] = @PaymentVoucherID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PaymentVoucherLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PaymentVoucherLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PaymentVoucherLoadAll]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PaymentVoucherLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PaymentVoucherLoadAll];
GO

CREATE PROCEDURE [proc_PaymentVoucherLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PaymentVoucherID],
		[VoucherNumber],
		[Amount],
		[PaidFor],
		[PassengerId],
		[IsCheque],
		[BankName],
		[ChuqueDate],
		[Reason],
		[VoucherDate],
		[CreatedBy],
		[LastUpdatedDate],
		[LastUpdatedBy]
	FROM [PaymentVoucher]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PaymentVoucherLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PaymentVoucherLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PaymentVoucherUpdate]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PaymentVoucherUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PaymentVoucherUpdate];
GO

CREATE PROCEDURE [proc_PaymentVoucherUpdate]
(
	@PaymentVoucherID int,
	@VoucherNumber nvarchar(10) = NULL,
	@Amount decimal(10,3) = NULL,
	@PaidFor nvarchar(200) = NULL,
	@PassengerId int = NULL,
	@IsCheque bit = NULL,
	@BankName nvarchar(200) = NULL,
	@ChuqueDate datetime = NULL,
	@Reason nvarchar(400) = NULL,
	@VoucherDate datetime = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@LastUpdatedBy uniqueidentifier = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PaymentVoucher]
	SET
		[VoucherNumber] = @VoucherNumber,
		[Amount] = @Amount,
		[PaidFor] = @PaidFor,
		[PassengerId] = @PassengerId,
		[IsCheque] = @IsCheque,
		[BankName] = @BankName,
		[ChuqueDate] = @ChuqueDate,
		[Reason] = @Reason,
		[VoucherDate] = @VoucherDate,
		[CreatedBy] = @CreatedBy,
		[LastUpdatedDate] = @LastUpdatedDate,
		[LastUpdatedBy] = @LastUpdatedBy
	WHERE
		[PaymentVoucherID] = @PaymentVoucherID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PaymentVoucherUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PaymentVoucherUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PaymentVoucherInsert]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PaymentVoucherInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PaymentVoucherInsert];
GO

CREATE PROCEDURE [proc_PaymentVoucherInsert]
(
	@PaymentVoucherID int = NULL output,
	@VoucherNumber nvarchar(10) = NULL,
	@Amount decimal(10,3) = NULL,
	@PaidFor nvarchar(200) = NULL,
	@PassengerId int = NULL,
	@IsCheque bit = NULL,
	@BankName nvarchar(200) = NULL,
	@ChuqueDate datetime = NULL,
	@Reason nvarchar(400) = NULL,
	@VoucherDate datetime = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@LastUpdatedBy uniqueidentifier = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PaymentVoucher]
	(
		[VoucherNumber],
		[Amount],
		[PaidFor],
		[PassengerId],
		[IsCheque],
		[BankName],
		[ChuqueDate],
		[Reason],
		[VoucherDate],
		[CreatedBy],
		[LastUpdatedDate],
		[LastUpdatedBy]
	)
	VALUES
	(
		@VoucherNumber,
		@Amount,
		@PaidFor,
		@PassengerId,
		@IsCheque,
		@BankName,
		@ChuqueDate,
		@Reason,
		@VoucherDate,
		@CreatedBy,
		@LastUpdatedDate,
		@LastUpdatedBy
	)

	SET @Err = @@Error

	SELECT @PaymentVoucherID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PaymentVoucherInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PaymentVoucherInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PaymentVoucherDelete]    Script Date: 10/22/2014 2:41:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PaymentVoucherDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PaymentVoucherDelete];
GO

CREATE PROCEDURE [proc_PaymentVoucherDelete]
(
	@PaymentVoucherID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PaymentVoucher]
	WHERE
		[PaymentVoucherID] = @PaymentVoucherID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PaymentVoucherDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PaymentVoucherDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ReceivingVoucherLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReceivingVoucherLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReceivingVoucherLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ReceivingVoucherLoadByPrimaryKey]
(
	@ReceivingVoucherID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReceivingVoucherID],
		[VoucherNumber],
		[Amount],
		[PaidFor],
		[PassengerId],
		[IsCheque],
		[BankName],
		[ChuqueDate],
		[Reason],
		[VoucherDate],
		[CreatedBy],
		[LastUpdatedDate],
		[LastUpdatedBy]
	FROM [ReceivingVoucher]
	WHERE
		([ReceivingVoucherID] = @ReceivingVoucherID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReceivingVoucherLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReceivingVoucherLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ReceivingVoucherLoadAll]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReceivingVoucherLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReceivingVoucherLoadAll];
GO

CREATE PROCEDURE [proc_ReceivingVoucherLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReceivingVoucherID],
		[VoucherNumber],
		[Amount],
		[PaidFor],
		[PassengerId],
		[IsCheque],
		[BankName],
		[ChuqueDate],
		[Reason],
		[VoucherDate],
		[CreatedBy],
		[LastUpdatedDate],
		[LastUpdatedBy]
	FROM [ReceivingVoucher]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReceivingVoucherLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReceivingVoucherLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ReceivingVoucherUpdate]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReceivingVoucherUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReceivingVoucherUpdate];
GO

CREATE PROCEDURE [proc_ReceivingVoucherUpdate]
(
	@ReceivingVoucherID int,
	@VoucherNumber nvarchar(10) = NULL,
	@Amount decimal(10,3) = NULL,
	@PaidFor nvarchar(200) = NULL,
	@PassengerId int = NULL,
	@IsCheque bit = NULL,
	@BankName nvarchar(200) = NULL,
	@ChuqueDate datetime = NULL,
	@Reason nvarchar(400) = NULL,
	@VoucherDate datetime = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@LastUpdatedBy uniqueidentifier = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [ReceivingVoucher]
	SET
		[VoucherNumber] = @VoucherNumber,
		[Amount] = @Amount,
		[PaidFor] = @PaidFor,
		[PassengerId] = @PassengerId,
		[IsCheque] = @IsCheque,
		[BankName] = @BankName,
		[ChuqueDate] = @ChuqueDate,
		[Reason] = @Reason,
		[VoucherDate] = @VoucherDate,
		[CreatedBy] = @CreatedBy,
		[LastUpdatedDate] = @LastUpdatedDate,
		[LastUpdatedBy] = @LastUpdatedBy
	WHERE
		[ReceivingVoucherID] = @ReceivingVoucherID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReceivingVoucherUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReceivingVoucherUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ReceivingVoucherInsert]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReceivingVoucherInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReceivingVoucherInsert];
GO

CREATE PROCEDURE [proc_ReceivingVoucherInsert]
(
	@ReceivingVoucherID int = NULL output,
	@VoucherNumber nvarchar(10) = NULL,
	@Amount decimal(10,3) = NULL,
	@PaidFor nvarchar(200) = NULL,
	@PassengerId int = NULL,
	@IsCheque bit = NULL,
	@BankName nvarchar(200) = NULL,
	@ChuqueDate datetime = NULL,
	@Reason nvarchar(400) = NULL,
	@VoucherDate datetime = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@LastUpdatedBy uniqueidentifier = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [ReceivingVoucher]
	(
		[VoucherNumber],
		[Amount],
		[PaidFor],
		[PassengerId],
		[IsCheque],
		[BankName],
		[ChuqueDate],
		[Reason],
		[VoucherDate],
		[CreatedBy],
		[LastUpdatedDate],
		[LastUpdatedBy]
	)
	VALUES
	(
		@VoucherNumber,
		@Amount,
		@PaidFor,
		@PassengerId,
		@IsCheque,
		@BankName,
		@ChuqueDate,
		@Reason,
		@VoucherDate,
		@CreatedBy,
		@LastUpdatedDate,
		@LastUpdatedBy
	)

	SET @Err = @@Error

	SELECT @ReceivingVoucherID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReceivingVoucherInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReceivingVoucherInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ReceivingVoucherDelete]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ReceivingVoucherDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ReceivingVoucherDelete];
GO

CREATE PROCEDURE [proc_ReceivingVoucherDelete]
(
	@ReceivingVoucherID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [ReceivingVoucher]
	WHERE
		[ReceivingVoucherID] = @ReceivingVoucherID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ReceivingVoucherDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ReceivingVoucherDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketHistoryLoadByPrimaryKey]
(
	@TicketHistoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketHistoryID],
		[TicketID],
		[From_AirportID],
		[To_AirportID],
		[AirLineID],
		[FromDate],
		[ToDate],
		[ActualPrice],
		[FinalPrice],
		[AddedValue],
		[AddedPercentage],
		[IsCanceled],
		[IsRefunded],
		[IsConfirmed],
		[UpdatedDate],
		[UpdatedBy],
		[TicketNo],
		[FlightNo],
		[SeatNo],
		[cabin_type],
		[TicketStatusID]
	FROM [TicketHistory]
	WHERE
		([TicketHistoryID] = @TicketHistoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryLoadAll]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryLoadAll];
GO

CREATE PROCEDURE [proc_TicketHistoryLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketHistoryID],
		[TicketID],
		[From_AirportID],
		[To_AirportID],
		[AirLineID],
		[FromDate],
		[ToDate],
		[ActualPrice],
		[FinalPrice],
		[AddedValue],
		[AddedPercentage],
		[IsCanceled],
		[IsRefunded],
		[IsConfirmed],
		[UpdatedDate],
		[UpdatedBy],
		[TicketNo],
		[FlightNo],
		[SeatNo],
		[cabin_type],
		[TicketStatusID]
	FROM [TicketHistory]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryUpdate]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryUpdate];
GO

CREATE PROCEDURE [proc_TicketHistoryUpdate]
(
	@TicketHistoryID int,
	@TicketID int = NULL,
	@From_AirportID int = NULL,
	@To_AirportID int = NULL,
	@AirLineID int = NULL,
	@FromDate datetime = NULL,
	@ToDate datetime = NULL,
	@ActualPrice decimal(9,3) = NULL,
	@FinalPrice decimal(9,3) = NULL,
	@AddedValue decimal(9,3) = NULL,
	@AddedPercentage decimal(4,2) = NULL,
	@IsCanceled bit = NULL,
	@IsRefunded bit = NULL,
	@IsConfirmed bit = NULL,
	@UpdatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@TicketNo nvarchar(20) = NULL,
	@FlightNo nvarchar(20) = NULL,
	@SeatNo int = NULL,
	@cabin_type nvarchar(30) = NULL,
	@TicketStatusID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TicketHistory]
	SET
		[TicketID] = @TicketID,
		[From_AirportID] = @From_AirportID,
		[To_AirportID] = @To_AirportID,
		[AirLineID] = @AirLineID,
		[FromDate] = @FromDate,
		[ToDate] = @ToDate,
		[ActualPrice] = @ActualPrice,
		[FinalPrice] = @FinalPrice,
		[AddedValue] = @AddedValue,
		[AddedPercentage] = @AddedPercentage,
		[IsCanceled] = @IsCanceled,
		[IsRefunded] = @IsRefunded,
		[IsConfirmed] = @IsConfirmed,
		[UpdatedDate] = @UpdatedDate,
		[UpdatedBy] = @UpdatedBy,
		[TicketNo] = @TicketNo,
		[FlightNo] = @FlightNo,
		[SeatNo] = @SeatNo,
		[cabin_type] = @cabin_type,
		[TicketStatusID] = @TicketStatusID
	WHERE
		[TicketHistoryID] = @TicketHistoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketHistoryInsert]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryInsert];
GO

CREATE PROCEDURE [proc_TicketHistoryInsert]
(
	@TicketHistoryID int = NULL output,
	@TicketID int = NULL,
	@From_AirportID int = NULL,
	@To_AirportID int = NULL,
	@AirLineID int = NULL,
	@FromDate datetime = NULL,
	@ToDate datetime = NULL,
	@ActualPrice decimal(9,3) = NULL,
	@FinalPrice decimal(9,3) = NULL,
	@AddedValue decimal(9,3) = NULL,
	@AddedPercentage decimal(4,2) = NULL,
	@IsCanceled bit = NULL,
	@IsRefunded bit = NULL,
	@IsConfirmed bit = NULL,
	@UpdatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@TicketNo nvarchar(20) = NULL,
	@FlightNo nvarchar(20) = NULL,
	@SeatNo int = NULL,
	@cabin_type nvarchar(30) = NULL,
	@TicketStatusID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TicketHistory]
	(
		[TicketID],
		[From_AirportID],
		[To_AirportID],
		[AirLineID],
		[FromDate],
		[ToDate],
		[ActualPrice],
		[FinalPrice],
		[AddedValue],
		[AddedPercentage],
		[IsCanceled],
		[IsRefunded],
		[IsConfirmed],
		[UpdatedDate],
		[UpdatedBy],
		[TicketNo],
		[FlightNo],
		[SeatNo],
		[cabin_type],
		[TicketStatusID]
	)
	VALUES
	(
		@TicketID,
		@From_AirportID,
		@To_AirportID,
		@AirLineID,
		@FromDate,
		@ToDate,
		@ActualPrice,
		@FinalPrice,
		@AddedValue,
		@AddedPercentage,
		@IsCanceled,
		@IsRefunded,
		@IsConfirmed,
		@UpdatedDate,
		@UpdatedBy,
		@TicketNo,
		@FlightNo,
		@SeatNo,
		@cabin_type,
		@TicketStatusID
	)

	SET @Err = @@Error

	SELECT @TicketHistoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryDelete]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketHistoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketHistoryDelete];
GO

CREATE PROCEDURE [proc_TicketHistoryDelete]
(
	@TicketHistoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TicketHistory]
	WHERE
		[TicketHistoryID] = @TicketHistoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketInfoLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketInfoLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketInfoLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketInfoLoadByPrimaryKey]
(
	@TicketID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketID],
		[From_AirportID],
		[To_AirportID],
		[AirLineID],
		[FromDate],
		[ToDate],
		[ActualPrice],
		[FinalPrice],
		[AddedValue],
		[AddedPercentage],
		[IsCanceled],
		[IsRefunded],
		[IsConfirmed],
		[CreatedDate],
		[CreatedBy],
		[LastUpdatedDate],
		[LastUpdatedBy],
		[TicketNo],
		[PassengerID],
		[FlightNo],
		[SeatNo],
		[cabin_type],
		[CreditCardID],
		[TicketStatusID]
	FROM [TicketInfo]
	WHERE
		([TicketID] = @TicketID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketInfoLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketInfoLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketInfoLoadAll]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketInfoLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketInfoLoadAll];
GO

CREATE PROCEDURE [proc_TicketInfoLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketID],
		[From_AirportID],
		[To_AirportID],
		[AirLineID],
		[FromDate],
		[ToDate],
		[ActualPrice],
		[FinalPrice],
		[AddedValue],
		[AddedPercentage],
		[IsCanceled],
		[IsRefunded],
		[IsConfirmed],
		[CreatedDate],
		[CreatedBy],
		[LastUpdatedDate],
		[LastUpdatedBy],
		[TicketNo],
		[PassengerID],
		[FlightNo],
		[SeatNo],
		[cabin_type],
		[CreditCardID],
		[TicketStatusID]
	FROM [TicketInfo]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketInfoLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketInfoLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketInfoUpdate]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketInfoUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketInfoUpdate];
GO

CREATE PROCEDURE [proc_TicketInfoUpdate]
(
	@TicketID int,
	@From_AirportID int = NULL,
	@To_AirportID int = NULL,
	@AirLineID int = NULL,
	@FromDate datetime = NULL,
	@ToDate datetime = NULL,
	@ActualPrice decimal(9,3) = NULL,
	@FinalPrice decimal(9,3) = NULL,
	@AddedValue decimal(9,3) = NULL,
	@AddedPercentage decimal(4,2) = NULL,
	@IsCanceled bit = NULL,
	@IsRefunded bit = NULL,
	@IsConfirmed bit = NULL,
	@CreatedDate datetime = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@LastUpdatedBy uniqueidentifier = NULL,
	@TicketNo nvarchar(20) = NULL,
	@PassengerID int = NULL,
	@FlightNo nvarchar(20) = NULL,
	@SeatNo int = NULL,
	@cabin_type nvarchar(30) = NULL,
	@CreditCardID int = NULL,
	@TicketStatusID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TicketInfo]
	SET
		[From_AirportID] = @From_AirportID,
		[To_AirportID] = @To_AirportID,
		[AirLineID] = @AirLineID,
		[FromDate] = @FromDate,
		[ToDate] = @ToDate,
		[ActualPrice] = @ActualPrice,
		[FinalPrice] = @FinalPrice,
		[AddedValue] = @AddedValue,
		[AddedPercentage] = @AddedPercentage,
		[IsCanceled] = @IsCanceled,
		[IsRefunded] = @IsRefunded,
		[IsConfirmed] = @IsConfirmed,
		[CreatedDate] = @CreatedDate,
		[CreatedBy] = @CreatedBy,
		[LastUpdatedDate] = @LastUpdatedDate,
		[LastUpdatedBy] = @LastUpdatedBy,
		[TicketNo] = @TicketNo,
		[PassengerID] = @PassengerID,
		[FlightNo] = @FlightNo,
		[SeatNo] = @SeatNo,
		[cabin_type] = @cabin_type,
		[CreditCardID] = @CreditCardID,
		[TicketStatusID] = @TicketStatusID
	WHERE
		[TicketID] = @TicketID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketInfoUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketInfoUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketInfoInsert]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketInfoInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketInfoInsert];
GO

CREATE PROCEDURE [proc_TicketInfoInsert]
(
	@TicketID int = NULL output,
	@From_AirportID int = NULL,
	@To_AirportID int = NULL,
	@AirLineID int = NULL,
	@FromDate datetime = NULL,
	@ToDate datetime = NULL,
	@ActualPrice decimal(9,3) = NULL,
	@FinalPrice decimal(9,3) = NULL,
	@AddedValue decimal(9,3) = NULL,
	@AddedPercentage decimal(4,2) = NULL,
	@IsCanceled bit = NULL,
	@IsRefunded bit = NULL,
	@IsConfirmed bit = NULL,
	@CreatedDate datetime = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL,
	@LastUpdatedBy uniqueidentifier = NULL,
	@TicketNo nvarchar(20) = NULL,
	@PassengerID int = NULL,
	@FlightNo nvarchar(20) = NULL,
	@SeatNo int = NULL,
	@cabin_type nvarchar(30) = NULL,
	@CreditCardID int = NULL,
	@TicketStatusID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TicketInfo]
	(
		[From_AirportID],
		[To_AirportID],
		[AirLineID],
		[FromDate],
		[ToDate],
		[ActualPrice],
		[FinalPrice],
		[AddedValue],
		[AddedPercentage],
		[IsCanceled],
		[IsRefunded],
		[IsConfirmed],
		[CreatedDate],
		[CreatedBy],
		[LastUpdatedDate],
		[LastUpdatedBy],
		[TicketNo],
		[PassengerID],
		[FlightNo],
		[SeatNo],
		[cabin_type],
		[CreditCardID],
		[TicketStatusID]
	)
	VALUES
	(
		@From_AirportID,
		@To_AirportID,
		@AirLineID,
		@FromDate,
		@ToDate,
		@ActualPrice,
		@FinalPrice,
		@AddedValue,
		@AddedPercentage,
		@IsCanceled,
		@IsRefunded,
		@IsConfirmed,
		@CreatedDate,
		@CreatedBy,
		@LastUpdatedDate,
		@LastUpdatedBy,
		@TicketNo,
		@PassengerID,
		@FlightNo,
		@SeatNo,
		@cabin_type,
		@CreditCardID,
		@TicketStatusID
	)

	SET @Err = @@Error

	SELECT @TicketID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketInfoInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketInfoInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketInfoDelete]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketInfoDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketInfoDelete];
GO

CREATE PROCEDURE [proc_TicketInfoDelete]
(
	@TicketID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TicketInfo]
	WHERE
		[TicketID] = @TicketID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketInfoDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketInfoDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketStatusLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TicketStatusLoadByPrimaryKey]
(
	@TicketStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketStatusID],
		[ArName],
		[EnName]
	FROM [TicketStatus]
	WHERE
		([TicketStatusID] = @TicketStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketStatusLoadAll]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusLoadAll];
GO

CREATE PROCEDURE [proc_TicketStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TicketStatusID],
		[ArName],
		[EnName]
	FROM [TicketStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketStatusUpdate]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusUpdate];
GO

CREATE PROCEDURE [proc_TicketStatusUpdate]
(
	@TicketStatusID int,
	@ArName nvarchar(40) = NULL,
	@EnName nvarchar(40) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [TicketStatus]
	SET
		[ArName] = @ArName,
		[EnName] = @EnName
	WHERE
		[TicketStatusID] = @TicketStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TicketStatusInsert]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusInsert];
GO

CREATE PROCEDURE [proc_TicketStatusInsert]
(
	@TicketStatusID int = NULL output,
	@ArName nvarchar(40) = NULL,
	@EnName nvarchar(40) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [TicketStatus]
	(
		[ArName],
		[EnName]
	)
	VALUES
	(
		@ArName,
		@EnName
	)

	SET @Err = @@Error

	SELECT @TicketStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketStatusDelete]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TicketStatusDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TicketStatusDelete];
GO

CREATE PROCEDURE [proc_TicketStatusDelete]
(
	@TicketStatusID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [TicketStatus]
	WHERE
		[TicketStatusID] = @TicketStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketStatusDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketStatusDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TitleLoadByPrimaryKey]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TitleLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TitleLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_TitleLoadByPrimaryKey]
(
	@TitleID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TitleID],
		[Name]
	FROM [Title]
	WHERE
		([TitleID] = @TitleID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TitleLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_TitleLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TitleLoadAll]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TitleLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TitleLoadAll];
GO

CREATE PROCEDURE [proc_TitleLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TitleID],
		[Name]
	FROM [Title]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TitleLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TitleLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TitleUpdate]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TitleUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TitleUpdate];
GO

CREATE PROCEDURE [proc_TitleUpdate]
(
	@TitleID int,
	@Name nvarchar(40) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Title]
	SET
		[Name] = @Name
	WHERE
		[TitleID] = @TitleID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TitleUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_TitleUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_TitleInsert]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TitleInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TitleInsert];
GO

CREATE PROCEDURE [proc_TitleInsert]
(
	@TitleID int = NULL output,
	@Name nvarchar(40) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Title]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	SET @Err = @@Error

	SELECT @TitleID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TitleInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_TitleInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TitleDelete]    Script Date: 10/22/2014 2:41:09 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_TitleDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_TitleDelete];
GO

CREATE PROCEDURE [proc_TitleDelete]
(
	@TitleID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Title]
	WHERE
		[TitleID] = @TitleID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TitleDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_TitleDelete Error on Creation'
GO
