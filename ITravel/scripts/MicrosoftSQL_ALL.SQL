
USE [ITravel]
GO

/****** Object:  StoredProcedure [proc_AirPortLoadByPrimaryKey]    Script Date: 9/23/2014 12:16:48 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPortLoadAll]    Script Date: 9/23/2014 12:16:48 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPortUpdate]    Script Date: 9/23/2014 12:16:48 PM ******/
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




/****** Object:  StoredProcedure [proc_AirPortInsert]    Script Date: 9/23/2014 12:16:48 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPortDelete]    Script Date: 9/23/2014 12:16:48 PM ******/
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

/****** Object:  StoredProcedure [proc_ContactInfoLoadByPrimaryKey]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ContactInfoLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ContactInfoLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ContactInfoLoadByPrimaryKey]
(
	@ContactInfoID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ContactInfoID],
		[PassengerID],
		[TitleID],
		[FirstName],
		[LastName],
		[Email],
		[CountryCode],
		[Mobile]
	FROM [ContactInfo]
	WHERE
		([ContactInfoID] = @ContactInfoID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ContactInfoLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ContactInfoLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ContactInfoLoadAll]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ContactInfoLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ContactInfoLoadAll];
GO

CREATE PROCEDURE [proc_ContactInfoLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ContactInfoID],
		[PassengerID],
		[TitleID],
		[FirstName],
		[LastName],
		[Email],
		[CountryCode],
		[Mobile]
	FROM [ContactInfo]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ContactInfoLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ContactInfoLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ContactInfoUpdate]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ContactInfoUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ContactInfoUpdate];
GO

CREATE PROCEDURE [proc_ContactInfoUpdate]
(
	@ContactInfoID int,
	@PassengerID int = NULL,
	@TitleID int = NULL,
	@FirstName nvarchar(200) = NULL,
	@LastName nvarchar(200) = NULL,
	@Email nvarchar(200) = NULL,
	@CountryCode nvarchar(7) = NULL,
	@Mobile nvarchar(10) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [ContactInfo]
	SET
		[PassengerID] = @PassengerID,
		[TitleID] = @TitleID,
		[FirstName] = @FirstName,
		[LastName] = @LastName,
		[Email] = @Email,
		[CountryCode] = @CountryCode,
		[Mobile] = @Mobile
	WHERE
		[ContactInfoID] = @ContactInfoID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ContactInfoUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ContactInfoUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ContactInfoInsert]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ContactInfoInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ContactInfoInsert];
GO

CREATE PROCEDURE [proc_ContactInfoInsert]
(
	@ContactInfoID int = NULL output,
	@PassengerID int = NULL,
	@TitleID int = NULL,
	@FirstName nvarchar(200) = NULL,
	@LastName nvarchar(200) = NULL,
	@Email nvarchar(200) = NULL,
	@CountryCode nvarchar(7) = NULL,
	@Mobile nvarchar(10) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [ContactInfo]
	(
		[PassengerID],
		[TitleID],
		[FirstName],
		[LastName],
		[Email],
		[CountryCode],
		[Mobile]
	)
	VALUES
	(
		@PassengerID,
		@TitleID,
		@FirstName,
		@LastName,
		@Email,
		@CountryCode,
		@Mobile
	)

	SET @Err = @@Error

	SELECT @ContactInfoID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ContactInfoInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ContactInfoInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ContactInfoDelete]    Script Date: 9/23/2014 12:16:48 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ContactInfoDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ContactInfoDelete];
GO

CREATE PROCEDURE [proc_ContactInfoDelete]
(
	@ContactInfoID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [ContactInfo]
	WHERE
		[ContactInfoID] = @ContactInfoID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ContactInfoDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ContactInfoDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PassengerLoadByPrimaryKey]    Script Date: 9/23/2014 12:16:48 PM ******/
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
		[TicketID]
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

/****** Object:  StoredProcedure [proc_PassengerLoadAll]    Script Date: 9/23/2014 12:16:48 PM ******/
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
		[TicketID]
	FROM [Passenger]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PassengerLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PassengerLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PassengerUpdate]    Script Date: 9/23/2014 12:16:48 PM ******/
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
	@TicketID int = NULL
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
		[TicketID] = @TicketID
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




/****** Object:  StoredProcedure [proc_PassengerInsert]    Script Date: 9/23/2014 12:16:48 PM ******/
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
	@TicketID int = NULL
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
		[TicketID]
	)
	VALUES
	(
		@TitleID,
		@FirstName,
		@LastName,
		@DateOfBirth,
		@IsChild,
		@TicketID
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

/****** Object:  StoredProcedure [proc_PassengerDelete]    Script Date: 9/23/2014 12:16:48 PM ******/
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

/****** Object:  StoredProcedure [proc_TicketHistoryLoadByPrimaryKey]    Script Date: 9/23/2014 12:16:48 PM ******/
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
		[UpdatedBy]
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

/****** Object:  StoredProcedure [proc_TicketHistoryLoadAll]    Script Date: 9/23/2014 12:16:48 PM ******/
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
		[UpdatedBy]
	FROM [TicketHistory]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketHistoryLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketHistoryLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketHistoryUpdate]    Script Date: 9/23/2014 12:16:48 PM ******/
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
	@UpdatedBy uniqueidentifier = NULL
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
		[UpdatedBy] = @UpdatedBy
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




/****** Object:  StoredProcedure [proc_TicketHistoryInsert]    Script Date: 9/23/2014 12:16:48 PM ******/
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
	@UpdatedBy uniqueidentifier = NULL
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
		[UpdatedBy]
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
		@UpdatedBy
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

/****** Object:  StoredProcedure [proc_TicketHistoryDelete]    Script Date: 9/23/2014 12:16:48 PM ******/
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

/****** Object:  StoredProcedure [proc_TicketInfoLoadByPrimaryKey]    Script Date: 9/23/2014 12:16:48 PM ******/
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
		[LastUpdatedBy]
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

/****** Object:  StoredProcedure [proc_TicketInfoLoadAll]    Script Date: 9/23/2014 12:16:48 PM ******/
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
		[LastUpdatedBy]
	FROM [TicketInfo]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_TicketInfoLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_TicketInfoLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_TicketInfoUpdate]    Script Date: 9/23/2014 12:16:48 PM ******/
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
	@LastUpdatedBy uniqueidentifier = NULL
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
		[LastUpdatedBy] = @LastUpdatedBy
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




/****** Object:  StoredProcedure [proc_TicketInfoInsert]    Script Date: 9/23/2014 12:16:48 PM ******/
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
	@LastUpdatedBy uniqueidentifier = NULL
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
		[LastUpdatedBy]
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
		@LastUpdatedBy
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

/****** Object:  StoredProcedure [proc_TicketInfoDelete]    Script Date: 9/23/2014 12:16:48 PM ******/
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

/****** Object:  StoredProcedure [proc_TitleLoadByPrimaryKey]    Script Date: 9/23/2014 12:16:48 PM ******/
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

/****** Object:  StoredProcedure [proc_TitleLoadAll]    Script Date: 9/23/2014 12:16:48 PM ******/
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

/****** Object:  StoredProcedure [proc_TitleUpdate]    Script Date: 9/23/2014 12:16:48 PM ******/
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




/****** Object:  StoredProcedure [proc_TitleInsert]    Script Date: 9/23/2014 12:16:48 PM ******/
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

/****** Object:  StoredProcedure [proc_TitleDelete]    Script Date: 9/23/2014 12:16:48 PM ******/
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
