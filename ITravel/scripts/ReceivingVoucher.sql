
/****** Object:  StoredProcedure [proc_ReceivingVoucherLoadByPrimaryKey]    Script Date: 10/7/2014 4:05:04 PM ******/
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

/****** Object:  StoredProcedure [proc_ReceivingVoucherLoadAll]    Script Date: 10/7/2014 4:05:04 PM ******/
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

/****** Object:  StoredProcedure [proc_ReceivingVoucherUpdate]    Script Date: 10/7/2014 4:05:04 PM ******/
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




/****** Object:  StoredProcedure [proc_ReceivingVoucherInsert]    Script Date: 10/7/2014 4:05:05 PM ******/
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

/****** Object:  StoredProcedure [proc_ReceivingVoucherDelete]    Script Date: 10/7/2014 4:05:05 PM ******/
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
