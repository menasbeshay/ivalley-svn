
/****** Object:  StoredProcedure [proc_PaymentVoucherLoadByPrimaryKey]    Script Date: 10/7/2014 4:05:04 PM ******/
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

/****** Object:  StoredProcedure [proc_PaymentVoucherLoadAll]    Script Date: 10/7/2014 4:05:04 PM ******/
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

/****** Object:  StoredProcedure [proc_PaymentVoucherUpdate]    Script Date: 10/7/2014 4:05:04 PM ******/
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




/****** Object:  StoredProcedure [proc_PaymentVoucherInsert]    Script Date: 10/7/2014 4:05:04 PM ******/
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

/****** Object:  StoredProcedure [proc_PaymentVoucherDelete]    Script Date: 10/7/2014 4:05:04 PM ******/
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
