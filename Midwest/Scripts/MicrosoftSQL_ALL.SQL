
USE [FlightReports]
GO

/****** Object:  StoredProcedure [proc_ActivitiesLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ActivitiesLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ActivitiesLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ActivitiesLoadByPrimaryKey]
(
	@ActivityID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ActivityID],
		[Name],
		[ShortName]
	FROM [Activities]
	WHERE
		([ActivityID] = @ActivityID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ActivitiesLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ActivitiesLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ActivitiesLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ActivitiesLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ActivitiesLoadAll];
GO

CREATE PROCEDURE [proc_ActivitiesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ActivityID],
		[Name],
		[ShortName]
	FROM [Activities]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ActivitiesLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ActivitiesLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ActivitiesUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ActivitiesUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ActivitiesUpdate];
GO

CREATE PROCEDURE [proc_ActivitiesUpdate]
(
	@ActivityID int,
	@Name nvarchar(30) = NULL,
	@ShortName nvarchar(5) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Activities]
	SET
		[Name] = @Name,
		[ShortName] = @ShortName
	WHERE
		[ActivityID] = @ActivityID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ActivitiesUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ActivitiesUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ActivitiesInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ActivitiesInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ActivitiesInsert];
GO

CREATE PROCEDURE [proc_ActivitiesInsert]
(
	@ActivityID int = NULL output,
	@Name nvarchar(30) = NULL,
	@ShortName nvarchar(5) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Activities]
	(
		[Name],
		[ShortName]
	)
	VALUES
	(
		@Name,
		@ShortName
	)

	SET @Err = @@Error

	SELECT @ActivityID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ActivitiesInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ActivitiesInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ActivitiesDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ActivitiesDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ActivitiesDelete];
GO

CREATE PROCEDURE [proc_ActivitiesDelete]
(
	@ActivityID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Activities]
	WHERE
		[ActivityID] = @ActivityID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ActivitiesDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ActivitiesDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ActivitiesLogLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ActivitiesLogLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ActivitiesLogLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ActivitiesLogLoadByPrimaryKey]
(
	@ActivitiesLogID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ActivitiesLogID],
		[Date],
		[ActivityID]
	FROM [ActivitiesLog]
	WHERE
		([ActivitiesLogID] = @ActivitiesLogID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ActivitiesLogLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ActivitiesLogLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ActivitiesLogLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ActivitiesLogLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ActivitiesLogLoadAll];
GO

CREATE PROCEDURE [proc_ActivitiesLogLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ActivitiesLogID],
		[Date],
		[ActivityID]
	FROM [ActivitiesLog]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ActivitiesLogLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ActivitiesLogLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ActivitiesLogUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ActivitiesLogUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ActivitiesLogUpdate];
GO

CREATE PROCEDURE [proc_ActivitiesLogUpdate]
(
	@ActivitiesLogID int,
	@Date datetime = NULL,
	@ActivityID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [ActivitiesLog]
	SET
		[Date] = @Date,
		[ActivityID] = @ActivityID
	WHERE
		[ActivitiesLogID] = @ActivitiesLogID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ActivitiesLogUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ActivitiesLogUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ActivitiesLogInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ActivitiesLogInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ActivitiesLogInsert];
GO

CREATE PROCEDURE [proc_ActivitiesLogInsert]
(
	@ActivitiesLogID int = NULL output,
	@Date datetime = NULL,
	@ActivityID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [ActivitiesLog]
	(
		[Date],
		[ActivityID]
	)
	VALUES
	(
		@Date,
		@ActivityID
	)

	SET @Err = @@Error

	SELECT @ActivitiesLogID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ActivitiesLogInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ActivitiesLogInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ActivitiesLogDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ActivitiesLogDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ActivitiesLogDelete];
GO

CREATE PROCEDURE [proc_ActivitiesLogDelete]
(
	@ActivitiesLogID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [ActivitiesLog]
	WHERE
		[ActivitiesLogID] = @ActivitiesLogID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ActivitiesLogDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ActivitiesLogDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirPlaneLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirPlaneLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirPlaneLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_AirPlaneLoadByPrimaryKey]
(
	@AirPlaneID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AirPlaneID],
		[Code],
		[Name],
		[Model],
		[Description],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [AirPlane]
	WHERE
		([AirPlaneID] = @AirPlaneID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirPlaneLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirPlaneLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirPlaneLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirPlaneLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirPlaneLoadAll];
GO

CREATE PROCEDURE [proc_AirPlaneLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AirPlaneID],
		[Code],
		[Name],
		[Model],
		[Description],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [AirPlane]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirPlaneLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirPlaneLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirPlaneUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirPlaneUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirPlaneUpdate];
GO

CREATE PROCEDURE [proc_AirPlaneUpdate]
(
	@AirPlaneID int,
	@Code nvarchar(5) = NULL,
	@Name nvarchar(100) = NULL,
	@Model nvarchar(250) = NULL,
	@Description nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [AirPlane]
	SET
		[Code] = @Code,
		[Name] = @Name,
		[Model] = @Model,
		[Description] = @Description,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate
	WHERE
		[AirPlaneID] = @AirPlaneID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirPlaneUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirPlaneUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_AirPlaneInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirPlaneInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirPlaneInsert];
GO

CREATE PROCEDURE [proc_AirPlaneInsert]
(
	@AirPlaneID int = NULL output,
	@Code nvarchar(5) = NULL,
	@Name nvarchar(100) = NULL,
	@Model nvarchar(250) = NULL,
	@Description nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [AirPlane]
	(
		[Code],
		[Name],
		[Model],
		[Description],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	)
	VALUES
	(
		@Code,
		@Name,
		@Model,
		@Description,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate
	)

	SET @Err = @@Error

	SELECT @AirPlaneID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirPlaneInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirPlaneInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirPlaneDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_AirPlaneDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_AirPlaneDelete];
GO

CREATE PROCEDURE [proc_AirPlaneDelete]
(
	@AirPlaneID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [AirPlane]
	WHERE
		[AirPlaneID] = @AirPlaneID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirPlaneDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirPlaneDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirPortLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
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
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
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

/****** Object:  StoredProcedure [proc_AirPortLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
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
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [AirPort]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_AirPortLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_AirPortLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_AirPortUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
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
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
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
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate
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




/****** Object:  StoredProcedure [proc_AirPortInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
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
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
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
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	)
	VALUES
	(
		@Name,
		@IATACode,
		@ACAICode,
		@Description,
		@Notes,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate
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

/****** Object:  StoredProcedure [proc_AirPortDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
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

/****** Object:  StoredProcedure [proc_CompanyPositionLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompanyPositionLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompanyPositionLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CompanyPositionLoadByPrimaryKey]
(
	@CompanyPositionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CompanyPositionID],
		[Title],
		[ShortTitle],
		[JobDescription],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [CompanyPosition]
	WHERE
		([CompanyPositionID] = @CompanyPositionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompanyPositionLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompanyPositionLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CompanyPositionLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompanyPositionLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompanyPositionLoadAll];
GO

CREATE PROCEDURE [proc_CompanyPositionLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CompanyPositionID],
		[Title],
		[ShortTitle],
		[JobDescription],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [CompanyPosition]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompanyPositionLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompanyPositionLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CompanyPositionUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompanyPositionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompanyPositionUpdate];
GO

CREATE PROCEDURE [proc_CompanyPositionUpdate]
(
	@CompanyPositionID int,
	@Title nvarchar(250) = NULL,
	@ShortTitle nvarchar(10) = NULL,
	@JobDescription nvarchar(MAX) = NULL,
	@Notes nvarchar(1000) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CompanyPosition]
	SET
		[Title] = @Title,
		[ShortTitle] = @ShortTitle,
		[JobDescription] = @JobDescription,
		[Notes] = @Notes,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate
	WHERE
		[CompanyPositionID] = @CompanyPositionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompanyPositionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompanyPositionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CompanyPositionInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompanyPositionInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompanyPositionInsert];
GO

CREATE PROCEDURE [proc_CompanyPositionInsert]
(
	@CompanyPositionID int = NULL output,
	@Title nvarchar(250) = NULL,
	@ShortTitle nvarchar(10) = NULL,
	@JobDescription nvarchar(MAX) = NULL,
	@Notes nvarchar(1000) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CompanyPosition]
	(
		[Title],
		[ShortTitle],
		[JobDescription],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	)
	VALUES
	(
		@Title,
		@ShortTitle,
		@JobDescription,
		@Notes,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate
	)

	SET @Err = @@Error

	SELECT @CompanyPositionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompanyPositionInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompanyPositionInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CompanyPositionDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CompanyPositionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CompanyPositionDelete];
GO

CREATE PROCEDURE [proc_CompanyPositionDelete]
(
	@CompanyPositionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CompanyPosition]
	WHERE
		[CompanyPositionID] = @CompanyPositionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CompanyPositionDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CompanyPositionDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CrewLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CrewLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CrewLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CrewLoadByPrimaryKey]
(
	@CrewID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CrewID],
		[Name],
		[StaffNo],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[Username],
		[RANK],
		[IDNO],
		[LicenseNo],
		[Competenecycheck],
		[MEDICALLICENSEEXPIRYFrom],
		[MEDICALLICENSEEXPIRYTo],
		[InstructorRenewal],
		[TRANSITIONCOURSE],
		[RECURRENT12],
		[RECURRENT24],
		[SMS],
		[security]
	FROM [Crew]
	WHERE
		([CrewID] = @CrewID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CrewLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CrewLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CrewLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CrewLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CrewLoadAll];
GO

CREATE PROCEDURE [proc_CrewLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CrewID],
		[Name],
		[StaffNo],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[Username],
		[RANK],
		[IDNO],
		[LicenseNo],
		[Competenecycheck],
		[MEDICALLICENSEEXPIRYFrom],
		[MEDICALLICENSEEXPIRYTo],
		[InstructorRenewal],
		[TRANSITIONCOURSE],
		[RECURRENT12],
		[RECURRENT24],
		[SMS],
		[security]
	FROM [Crew]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CrewLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CrewLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CrewUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CrewUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CrewUpdate];
GO

CREATE PROCEDURE [proc_CrewUpdate]
(
	@CrewID int,
	@Name nvarchar(150) = NULL,
	@StaffNo int,
	@Notes nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL,
	@Username nvarchar(50) = NULL,
	@RANK nvarchar(10) = NULL,
	@IDNO nvarchar(10) = NULL,
	@LicenseNo nvarchar(10) = NULL,
	@Competenecycheck datetime = NULL,
	@MEDICALLICENSEEXPIRYFrom datetime = NULL,
	@MEDICALLICENSEEXPIRYTo datetime = NULL,
	@InstructorRenewal datetime = NULL,
	@TRANSITIONCOURSE datetime = NULL,
	@RECURRENT12 datetime = NULL,
	@RECURRENT24 datetime = NULL,
	@SMS datetime = NULL,
	@security datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Crew]
	SET
		[Name] = @Name,
		[StaffNo] = @StaffNo,
		[Notes] = @Notes,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate,
		[Username] = @Username,
		[RANK] = @RANK,
		[IDNO] = @IDNO,
		[LicenseNo] = @LicenseNo,
		[Competenecycheck] = @Competenecycheck,
		[MEDICALLICENSEEXPIRYFrom] = @MEDICALLICENSEEXPIRYFrom,
		[MEDICALLICENSEEXPIRYTo] = @MEDICALLICENSEEXPIRYTo,
		[InstructorRenewal] = @InstructorRenewal,
		[TRANSITIONCOURSE] = @TRANSITIONCOURSE,
		[RECURRENT12] = @RECURRENT12,
		[RECURRENT24] = @RECURRENT24,
		[SMS] = @SMS,
		[security] = @security
	WHERE
		[CrewID] = @CrewID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CrewUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CrewUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CrewInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CrewInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CrewInsert];
GO

CREATE PROCEDURE [proc_CrewInsert]
(
	@CrewID int = NULL output,
	@Name nvarchar(150) = NULL,
	@StaffNo int,
	@Notes nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL,
	@Username nvarchar(50) = NULL,
	@RANK nvarchar(10) = NULL,
	@IDNO nvarchar(10) = NULL,
	@LicenseNo nvarchar(10) = NULL,
	@Competenecycheck datetime = NULL,
	@MEDICALLICENSEEXPIRYFrom datetime = NULL,
	@MEDICALLICENSEEXPIRYTo datetime = NULL,
	@InstructorRenewal datetime = NULL,
	@TRANSITIONCOURSE datetime = NULL,
	@RECURRENT12 datetime = NULL,
	@RECURRENT24 datetime = NULL,
	@SMS datetime = NULL,
	@security datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Crew]
	(
		[Name],
		[StaffNo],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[Username],
		[RANK],
		[IDNO],
		[LicenseNo],
		[Competenecycheck],
		[MEDICALLICENSEEXPIRYFrom],
		[MEDICALLICENSEEXPIRYTo],
		[InstructorRenewal],
		[TRANSITIONCOURSE],
		[RECURRENT12],
		[RECURRENT24],
		[SMS],
		[security]
	)
	VALUES
	(
		@Name,
		@StaffNo,
		@Notes,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate,
		@Username,
		@RANK,
		@IDNO,
		@LicenseNo,
		@Competenecycheck,
		@MEDICALLICENSEEXPIRYFrom,
		@MEDICALLICENSEEXPIRYTo,
		@InstructorRenewal,
		@TRANSITIONCOURSE,
		@RECURRENT12,
		@RECURRENT24,
		@SMS,
		@security
	)

	SET @Err = @@Error

	SELECT @CrewID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CrewInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CrewInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CrewDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CrewDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CrewDelete];
GO

CREATE PROCEDURE [proc_CrewDelete]
(
	@CrewID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Crew]
	WHERE
		[CrewID] = @CrewID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CrewDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CrewDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DaysLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DaysLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DaysLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DaysLoadByPrimaryKey]
(
	@DayID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DayID],
		[Day]
	FROM [Days]
	WHERE
		([DayID] = @DayID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DaysLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DaysLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DaysLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DaysLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DaysLoadAll];
GO

CREATE PROCEDURE [proc_DaysLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DayID],
		[Day]
	FROM [Days]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DaysLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DaysLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DaysUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DaysUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DaysUpdate];
GO

CREATE PROCEDURE [proc_DaysUpdate]
(
	@DayID int,
	@Day int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Days]
	SET
		[Day] = @Day
	WHERE
		[DayID] = @DayID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DaysUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DaysUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DaysInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DaysInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DaysInsert];
GO

CREATE PROCEDURE [proc_DaysInsert]
(
	@DayID int = NULL output,
	@Day int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Days]
	(
		[Day]
	)
	VALUES
	(
		@Day
	)

	SET @Err = @@Error

	SELECT @DayID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DaysInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DaysInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DaysDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DaysDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DaysDelete];
GO

CREATE PROCEDURE [proc_DaysDelete]
(
	@DayID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Days]
	WHERE
		[DayID] = @DayID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DaysDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DaysDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DelayLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DelayLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DelayLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DelayLoadByPrimaryKey]
(
	@DelayID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DelayID],
		[Code],
		[Description],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [Delay]
	WHERE
		([DelayID] = @DelayID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DelayLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DelayLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DelayLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DelayLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DelayLoadAll];
GO

CREATE PROCEDURE [proc_DelayLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DelayID],
		[Code],
		[Description],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [Delay]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DelayLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DelayLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DelayUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DelayUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DelayUpdate];
GO

CREATE PROCEDURE [proc_DelayUpdate]
(
	@DelayID int,
	@Code nvarchar(5) = NULL,
	@Description nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Delay]
	SET
		[Code] = @Code,
		[Description] = @Description,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate
	WHERE
		[DelayID] = @DelayID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DelayUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DelayUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DelayInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DelayInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DelayInsert];
GO

CREATE PROCEDURE [proc_DelayInsert]
(
	@DelayID int = NULL output,
	@Code nvarchar(5) = NULL,
	@Description nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Delay]
	(
		[Code],
		[Description],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	)
	VALUES
	(
		@Code,
		@Description,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate
	)

	SET @Err = @@Error

	SELECT @DelayID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DelayInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DelayInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DelayDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DelayDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DelayDelete];
GO

CREATE PROCEDURE [proc_DelayDelete]
(
	@DelayID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Delay]
	WHERE
		[DelayID] = @DelayID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DelayDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DelayDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FlightLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_FlightLoadByPrimaryKey]
(
	@ReportID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReportID],
		[ReportDate],
		[AirCraft_AirPlaneID],
		[FlightNo],
		[IsHeavy],
		[Comment],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[IsHeavyCrew],
		[IsPAX],
		[IsReturnFlight],
		[ReturnFlightID]
	FROM [Flight]
	WHERE
		([ReportID] = @ReportID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FlightLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightLoadAll];
GO

CREATE PROCEDURE [proc_FlightLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReportID],
		[ReportDate],
		[AirCraft_AirPlaneID],
		[FlightNo],
		[IsHeavy],
		[Comment],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[IsHeavyCrew],
		[IsPAX],
		[IsReturnFlight],
		[ReturnFlightID]
	FROM [Flight]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FlightUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightUpdate];
GO

CREATE PROCEDURE [proc_FlightUpdate]
(
	@ReportID int,
	@ReportDate datetime,
	@AirCraft_AirPlaneID int,
	@FlightNo nvarchar(15) = NULL,
	@IsHeavy bit,
	@Comment nvarchar(MAX) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL,
	@IsHeavyCrew bit = NULL,
	@IsPAX bit = NULL,
	@IsReturnFlight bit = NULL,
	@ReturnFlightID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Flight]
	SET
		[ReportDate] = @ReportDate,
		[AirCraft_AirPlaneID] = @AirCraft_AirPlaneID,
		[FlightNo] = @FlightNo,
		[IsHeavy] = @IsHeavy,
		[Comment] = @Comment,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate,
		[IsHeavyCrew] = @IsHeavyCrew,
		[IsPAX] = @IsPAX,
		[IsReturnFlight] = @IsReturnFlight,
		[ReturnFlightID] = @ReturnFlightID
	WHERE
		[ReportID] = @ReportID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_FlightInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightInsert];
GO

CREATE PROCEDURE [proc_FlightInsert]
(
	@ReportID int = NULL output,
	@ReportDate datetime,
	@AirCraft_AirPlaneID int,
	@FlightNo nvarchar(15) = NULL,
	@IsHeavy bit,
	@Comment nvarchar(MAX) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL,
	@IsHeavyCrew bit = NULL,
	@IsPAX bit = NULL,
	@IsReturnFlight bit = NULL,
	@ReturnFlightID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Flight]
	(
		[ReportDate],
		[AirCraft_AirPlaneID],
		[FlightNo],
		[IsHeavy],
		[Comment],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[IsHeavyCrew],
		[IsPAX],
		[IsReturnFlight],
		[ReturnFlightID]
	)
	VALUES
	(
		@ReportDate,
		@AirCraft_AirPlaneID,
		@FlightNo,
		@IsHeavy,
		@Comment,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate,
		@IsHeavyCrew,
		@IsPAX,
		@IsReturnFlight,
		@ReturnFlightID
	)

	SET @Err = @@Error

	SELECT @ReportID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FlightDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightDelete];
GO

CREATE PROCEDURE [proc_FlightDelete]
(
	@ReportID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Flight]
	WHERE
		[ReportID] = @ReportID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PilotLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PilotLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PilotLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PilotLoadByPrimaryKey]
(
	@PilotID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PilotID],
		[FirstName],
		[SecondName],
		[SureName],
		[TBF_Day_Hours],
		[TBF_Day_Mins],
		[TBF_Night_Hours],
		[TBF_Night_Mins],
		[TBF_Total_Hours],
		[TBF_Total_Mins],
		[LicenseNo],
		[LicenseStatus],
		[LicenseRenewDate],
		[StaffNo],
		[ShortName],
		[IsPilot],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[UserName]
	FROM [Pilot]
	WHERE
		([PilotID] = @PilotID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PilotLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PilotLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PilotLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PilotLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PilotLoadAll];
GO

CREATE PROCEDURE [proc_PilotLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PilotID],
		[FirstName],
		[SecondName],
		[SureName],
		[TBF_Day_Hours],
		[TBF_Day_Mins],
		[TBF_Night_Hours],
		[TBF_Night_Mins],
		[TBF_Total_Hours],
		[TBF_Total_Mins],
		[LicenseNo],
		[LicenseStatus],
		[LicenseRenewDate],
		[StaffNo],
		[ShortName],
		[IsPilot],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[UserName]
	FROM [Pilot]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PilotLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PilotLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PilotUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PilotUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PilotUpdate];
GO

CREATE PROCEDURE [proc_PilotUpdate]
(
	@PilotID int,
	@FirstName nvarchar(50) = NULL,
	@SecondName nvarchar(50) = NULL,
	@SureName nvarchar(50) = NULL,
	@TBF_Day_Hours int = NULL,
	@TBF_Day_Mins int = NULL,
	@TBF_Night_Hours int = NULL,
	@TBF_Night_Mins int = NULL,
	@TBF_Total_Hours int,
	@TBF_Total_Mins int,
	@LicenseNo nvarchar(15) = NULL,
	@LicenseStatus nvarchar(50) = NULL,
	@LicenseRenewDate datetime = NULL,
	@StaffNo int = NULL,
	@ShortName nvarchar(5) = NULL,
	@IsPilot bit = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL,
	@UserName nvarchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Pilot]
	SET
		[FirstName] = @FirstName,
		[SecondName] = @SecondName,
		[SureName] = @SureName,
		[TBF_Day_Hours] = @TBF_Day_Hours,
		[TBF_Day_Mins] = @TBF_Day_Mins,
		[TBF_Night_Hours] = @TBF_Night_Hours,
		[TBF_Night_Mins] = @TBF_Night_Mins,
		[TBF_Total_Hours] = @TBF_Total_Hours,
		[TBF_Total_Mins] = @TBF_Total_Mins,
		[LicenseNo] = @LicenseNo,
		[LicenseStatus] = @LicenseStatus,
		[LicenseRenewDate] = @LicenseRenewDate,
		[StaffNo] = @StaffNo,
		[ShortName] = @ShortName,
		[IsPilot] = @IsPilot,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate,
		[UserName] = @UserName
	WHERE
		[PilotID] = @PilotID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PilotUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PilotUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PilotInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PilotInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PilotInsert];
GO

CREATE PROCEDURE [proc_PilotInsert]
(
	@PilotID int = NULL output,
	@FirstName nvarchar(50) = NULL,
	@SecondName nvarchar(50) = NULL,
	@SureName nvarchar(50) = NULL,
	@TBF_Day_Hours int = NULL,
	@TBF_Day_Mins int = NULL,
	@TBF_Night_Hours int = NULL,
	@TBF_Night_Mins int = NULL,
	@TBF_Total_Hours int,
	@TBF_Total_Mins int,
	@LicenseNo nvarchar(15) = NULL,
	@LicenseStatus nvarchar(50) = NULL,
	@LicenseRenewDate datetime = NULL,
	@StaffNo int = NULL,
	@ShortName nvarchar(5) = NULL,
	@IsPilot bit = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL,
	@UserName nvarchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Pilot]
	(
		[FirstName],
		[SecondName],
		[SureName],
		[TBF_Day_Hours],
		[TBF_Day_Mins],
		[TBF_Night_Hours],
		[TBF_Night_Mins],
		[TBF_Total_Hours],
		[TBF_Total_Mins],
		[LicenseNo],
		[LicenseStatus],
		[LicenseRenewDate],
		[StaffNo],
		[ShortName],
		[IsPilot],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[UserName]
	)
	VALUES
	(
		@FirstName,
		@SecondName,
		@SureName,
		@TBF_Day_Hours,
		@TBF_Day_Mins,
		@TBF_Night_Hours,
		@TBF_Night_Mins,
		@TBF_Total_Hours,
		@TBF_Total_Mins,
		@LicenseNo,
		@LicenseStatus,
		@LicenseRenewDate,
		@StaffNo,
		@ShortName,
		@IsPilot,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate,
		@UserName
	)

	SET @Err = @@Error

	SELECT @PilotID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PilotInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PilotInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PilotDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PilotDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PilotDelete];
GO

CREATE PROCEDURE [proc_PilotDelete]
(
	@PilotID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Pilot]
	WHERE
		[PilotID] = @PilotID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PilotDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PilotDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Pilot_CompanyPositionLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Pilot_CompanyPositionLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Pilot_CompanyPositionLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_Pilot_CompanyPositionLoadByPrimaryKey]
(
	@Pilot_CompanyPositionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[Pilot_CompanyPositionID],
		[PilotID],
		[CompanyPositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [Pilot_CompanyPosition]
	WHERE
		([Pilot_CompanyPositionID] = @Pilot_CompanyPositionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Pilot_CompanyPositionLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_Pilot_CompanyPositionLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Pilot_CompanyPositionLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Pilot_CompanyPositionLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Pilot_CompanyPositionLoadAll];
GO

CREATE PROCEDURE [proc_Pilot_CompanyPositionLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[Pilot_CompanyPositionID],
		[PilotID],
		[CompanyPositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [Pilot_CompanyPosition]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Pilot_CompanyPositionLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_Pilot_CompanyPositionLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Pilot_CompanyPositionUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Pilot_CompanyPositionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Pilot_CompanyPositionUpdate];
GO

CREATE PROCEDURE [proc_Pilot_CompanyPositionUpdate]
(
	@Pilot_CompanyPositionID int,
	@PilotID int = NULL,
	@CompanyPositionID int = NULL,
	@Notes nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Pilot_CompanyPosition]
	SET
		[PilotID] = @PilotID,
		[CompanyPositionID] = @CompanyPositionID,
		[Notes] = @Notes,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate
	WHERE
		[Pilot_CompanyPositionID] = @Pilot_CompanyPositionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Pilot_CompanyPositionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_Pilot_CompanyPositionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_Pilot_CompanyPositionInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Pilot_CompanyPositionInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Pilot_CompanyPositionInsert];
GO

CREATE PROCEDURE [proc_Pilot_CompanyPositionInsert]
(
	@Pilot_CompanyPositionID int = NULL output,
	@PilotID int = NULL,
	@CompanyPositionID int = NULL,
	@Notes nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Pilot_CompanyPosition]
	(
		[PilotID],
		[CompanyPositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	)
	VALUES
	(
		@PilotID,
		@CompanyPositionID,
		@Notes,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate
	)

	SET @Err = @@Error

	SELECT @Pilot_CompanyPositionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Pilot_CompanyPositionInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_Pilot_CompanyPositionInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Pilot_CompanyPositionDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Pilot_CompanyPositionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Pilot_CompanyPositionDelete];
GO

CREATE PROCEDURE [proc_Pilot_CompanyPositionDelete]
(
	@Pilot_CompanyPositionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Pilot_CompanyPosition]
	WHERE
		[Pilot_CompanyPositionID] = @Pilot_CompanyPositionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Pilot_CompanyPositionDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_Pilot_CompanyPositionDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Pilot_TBFLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Pilot_TBFLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Pilot_TBFLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_Pilot_TBFLoadByPrimaryKey]
(
	@TBF_ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TBF_ID],
		[TBF_Day],
		[TBF_Night],
		[PilotID],
		[AirPlaneID],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [Pilot_TBF]
	WHERE
		([TBF_ID] = @TBF_ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Pilot_TBFLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_Pilot_TBFLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Pilot_TBFLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Pilot_TBFLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Pilot_TBFLoadAll];
GO

CREATE PROCEDURE [proc_Pilot_TBFLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[TBF_ID],
		[TBF_Day],
		[TBF_Night],
		[PilotID],
		[AirPlaneID],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [Pilot_TBF]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Pilot_TBFLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_Pilot_TBFLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Pilot_TBFUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Pilot_TBFUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Pilot_TBFUpdate];
GO

CREATE PROCEDURE [proc_Pilot_TBFUpdate]
(
	@TBF_ID int,
	@TBF_Day datetime = NULL,
	@TBF_Night datetime = NULL,
	@PilotID int = NULL,
	@AirPlaneID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Pilot_TBF]
	SET
		[TBF_Day] = @TBF_Day,
		[TBF_Night] = @TBF_Night,
		[PilotID] = @PilotID,
		[AirPlaneID] = @AirPlaneID,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate
	WHERE
		[TBF_ID] = @TBF_ID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Pilot_TBFUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_Pilot_TBFUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_Pilot_TBFInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Pilot_TBFInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Pilot_TBFInsert];
GO

CREATE PROCEDURE [proc_Pilot_TBFInsert]
(
	@TBF_ID int = NULL output,
	@TBF_Day datetime = NULL,
	@TBF_Night datetime = NULL,
	@PilotID int = NULL,
	@AirPlaneID int = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Pilot_TBF]
	(
		[TBF_Day],
		[TBF_Night],
		[PilotID],
		[AirPlaneID],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	)
	VALUES
	(
		@TBF_Day,
		@TBF_Night,
		@PilotID,
		@AirPlaneID,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate
	)

	SET @Err = @@Error

	SELECT @TBF_ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Pilot_TBFInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_Pilot_TBFInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Pilot_TBFDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Pilot_TBFDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Pilot_TBFDelete];
GO

CREATE PROCEDURE [proc_Pilot_TBFDelete]
(
	@TBF_ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Pilot_TBF]
	WHERE
		[TBF_ID] = @TBF_ID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Pilot_TBFDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_Pilot_TBFDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PilotPerDiemLogLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PilotPerDiemLogLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PilotPerDiemLogLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PilotPerDiemLogLoadByPrimaryKey]
(
	@LogID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[LogID],
		[PilotID],
		[FromDate],
		[ToDate],
		[Days],
		[InsertedDate],
		[StartDate],
		[EndDate]
	FROM [PilotPerDiemLog]
	WHERE
		([LogID] = @LogID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PilotPerDiemLogLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PilotPerDiemLogLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PilotPerDiemLogLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PilotPerDiemLogLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PilotPerDiemLogLoadAll];
GO

CREATE PROCEDURE [proc_PilotPerDiemLogLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[LogID],
		[PilotID],
		[FromDate],
		[ToDate],
		[Days],
		[InsertedDate],
		[StartDate],
		[EndDate]
	FROM [PilotPerDiemLog]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PilotPerDiemLogLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PilotPerDiemLogLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PilotPerDiemLogUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PilotPerDiemLogUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PilotPerDiemLogUpdate];
GO

CREATE PROCEDURE [proc_PilotPerDiemLogUpdate]
(
	@LogID int,
	@PilotID int,
	@FromDate datetime = NULL,
	@ToDate datetime = NULL,
	@Days int = NULL,
	@InsertedDate datetime = NULL,
	@StartDate datetime = NULL,
	@EndDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PilotPerDiemLog]
	SET
		[PilotID] = @PilotID,
		[FromDate] = @FromDate,
		[ToDate] = @ToDate,
		[Days] = @Days,
		[InsertedDate] = @InsertedDate,
		[StartDate] = @StartDate,
		[EndDate] = @EndDate
	WHERE
		[LogID] = @LogID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PilotPerDiemLogUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PilotPerDiemLogUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PilotPerDiemLogInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PilotPerDiemLogInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PilotPerDiemLogInsert];
GO

CREATE PROCEDURE [proc_PilotPerDiemLogInsert]
(
	@LogID int = NULL output,
	@PilotID int,
	@FromDate datetime = NULL,
	@ToDate datetime = NULL,
	@Days int = NULL,
	@InsertedDate datetime = NULL,
	@StartDate datetime = NULL,
	@EndDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PilotPerDiemLog]
	(
		[PilotID],
		[FromDate],
		[ToDate],
		[Days],
		[InsertedDate],
		[StartDate],
		[EndDate]
	)
	VALUES
	(
		@PilotID,
		@FromDate,
		@ToDate,
		@Days,
		@InsertedDate,
		@StartDate,
		@EndDate
	)

	SET @Err = @@Error

	SELECT @LogID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PilotPerDiemLogInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PilotPerDiemLogInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PilotPerDiemLogDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PilotPerDiemLogDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PilotPerDiemLogDelete];
GO

CREATE PROCEDURE [proc_PilotPerDiemLogDelete]
(
	@LogID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PilotPerDiemLog]
	WHERE
		[LogID] = @LogID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PilotPerDiemLogDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PilotPerDiemLogDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PositionLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PositionLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PositionLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_PositionLoadByPrimaryKey]
(
	@PositionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PositionID],
		[Title],
		[TitleShort],
		[Description],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [Position]
	WHERE
		([PositionID] = @PositionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PositionLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_PositionLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PositionLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PositionLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PositionLoadAll];
GO

CREATE PROCEDURE [proc_PositionLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[PositionID],
		[Title],
		[TitleShort],
		[Description],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [Position]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PositionLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_PositionLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PositionUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PositionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PositionUpdate];
GO

CREATE PROCEDURE [proc_PositionUpdate]
(
	@PositionID int,
	@Title nvarchar(150) = NULL,
	@TitleShort nvarchar(10) = NULL,
	@Description nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Position]
	SET
		[Title] = @Title,
		[TitleShort] = @TitleShort,
		[Description] = @Description,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate
	WHERE
		[PositionID] = @PositionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PositionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_PositionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_PositionInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PositionInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PositionInsert];
GO

CREATE PROCEDURE [proc_PositionInsert]
(
	@PositionID int = NULL output,
	@Title nvarchar(150) = NULL,
	@TitleShort nvarchar(10) = NULL,
	@Description nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Position]
	(
		[Title],
		[TitleShort],
		[Description],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	)
	VALUES
	(
		@Title,
		@TitleShort,
		@Description,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate
	)

	SET @Err = @@Error

	SELECT @PositionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PositionInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_PositionInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PositionDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_PositionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_PositionDelete];
GO

CREATE PROCEDURE [proc_PositionDelete]
(
	@PositionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Position]
	WHERE
		[PositionID] = @PositionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_PositionDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_PositionDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorLoadByPrimaryKey]    Script Date: 1/3/2013 10:26:28 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_SectorLoadByPrimaryKey]
(
	@SectorID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[SectorID],
		[ReportID],
		[From_AirportID],
		[To_AirportID],
		[FuleUplifted],
		[STD],
		[ATD],
		[ChoxOff],
		[STA],
		[ATA],
		[ChoxOn],
		[StandardBurnOff],
		[ActualBurnOff],
		[DepDelayID1],
		[DepDelayTime1],
		[DepDelayID2],
		[DepDelayTime2],
		[DepDelayID3],
		[DepDelayTime3],
		[ArrDelayID1],
		[ArrDelayTime1],
		[ArrDelayID2],
		[ArrDelayTime2],
		[ArrDelayID3],
		[ArrDelayTime3],
		[PilotFlying_CrewID],
		[PilotMonitoring_CrewID],
		[FlyAtDay],
		[FlyAtNight],
		[DepFule],
		[ArrFule],
		[NoOfPax_A],
		[NoOfPax_C],
		[NoOfPax_I],
		[ZFW],
		[TOW],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[FlightNo],
		[IsPAX],
		[IsHeavy],
		[IsHeavyCrew],
		[Comments],
		[AirCraft_AirPlaneID],
		[SectorDate],
		[IsReturnSector],
		[ReturnSectorID]
	FROM [Sector]
	WHERE
		([SectorID] = @SectorID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorLoadAll]    Script Date: 1/3/2013 10:26:28 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorLoadAll];
GO

CREATE PROCEDURE [proc_SectorLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[SectorID],
		[ReportID],
		[From_AirportID],
		[To_AirportID],
		[FuleUplifted],
		[STD],
		[ATD],
		[ChoxOff],
		[STA],
		[ATA],
		[ChoxOn],
		[StandardBurnOff],
		[ActualBurnOff],
		[DepDelayID1],
		[DepDelayTime1],
		[DepDelayID2],
		[DepDelayTime2],
		[DepDelayID3],
		[DepDelayTime3],
		[ArrDelayID1],
		[ArrDelayTime1],
		[ArrDelayID2],
		[ArrDelayTime2],
		[ArrDelayID3],
		[ArrDelayTime3],
		[PilotFlying_CrewID],
		[PilotMonitoring_CrewID],
		[FlyAtDay],
		[FlyAtNight],
		[DepFule],
		[ArrFule],
		[NoOfPax_A],
		[NoOfPax_C],
		[NoOfPax_I],
		[ZFW],
		[TOW],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[FlightNo],
		[IsPAX],
		[IsHeavy],
		[IsHeavyCrew],
		[Comments],
		[AirCraft_AirPlaneID],
		[SectorDate],
		[IsReturnSector],
		[ReturnSectorID]
	FROM [Sector]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorUpdate]    Script Date: 1/3/2013 10:26:28 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorUpdate];
GO

CREATE PROCEDURE [proc_SectorUpdate]
(
	@SectorID int,
	@ReportID int = NULL,
	@From_AirportID int = NULL,
	@To_AirportID int = NULL,
	@FuleUplifted int = NULL,
	@STD datetime = NULL,
	@ATD datetime = NULL,
	@ChoxOff datetime = NULL,
	@STA datetime = NULL,
	@ATA datetime = NULL,
	@ChoxOn datetime = NULL,
	@StandardBurnOff int = NULL,
	@ActualBurnOff int = NULL,
	@DepDelayID1 int = NULL,
	@DepDelayTime1 datetime = NULL,
	@DepDelayID2 int = NULL,
	@DepDelayTime2 datetime = NULL,
	@DepDelayID3 int = NULL,
	@DepDelayTime3 datetime = NULL,
	@ArrDelayID1 int = NULL,
	@ArrDelayTime1 datetime = NULL,
	@ArrDelayID2 int = NULL,
	@ArrDelayTime2 datetime = NULL,
	@ArrDelayID3 int = NULL,
	@ArrDelayTime3 datetime = NULL,
	@PilotFlying_CrewID int = NULL,
	@PilotMonitoring_CrewID int = NULL,
	@FlyAtDay datetime = NULL,
	@FlyAtNight datetime = NULL,
	@DepFule int = NULL,
	@ArrFule int = NULL,
	@NoOfPax_A int = NULL,
	@NoOfPax_C int = NULL,
	@NoOfPax_I int = NULL,
	@ZFW bigint = NULL,
	@TOW bigint = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL,
	@FlightNo nvarchar(15) = NULL,
	@IsPAX bit = NULL,
	@IsHeavy bit = NULL,
	@IsHeavyCrew bit = NULL,
	@Comments nvarchar(500) = NULL,
	@AirCraft_AirPlaneID int = NULL,
	@SectorDate datetime = NULL,
	@IsReturnSector bit = NULL,
	@ReturnSectorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Sector]
	SET
		[ReportID] = @ReportID,
		[From_AirportID] = @From_AirportID,
		[To_AirportID] = @To_AirportID,
		[FuleUplifted] = @FuleUplifted,
		[STD] = @STD,
		[ATD] = @ATD,
		[ChoxOff] = @ChoxOff,
		[STA] = @STA,
		[ATA] = @ATA,
		[ChoxOn] = @ChoxOn,
		[StandardBurnOff] = @StandardBurnOff,
		[ActualBurnOff] = @ActualBurnOff,
		[DepDelayID1] = @DepDelayID1,
		[DepDelayTime1] = @DepDelayTime1,
		[DepDelayID2] = @DepDelayID2,
		[DepDelayTime2] = @DepDelayTime2,
		[DepDelayID3] = @DepDelayID3,
		[DepDelayTime3] = @DepDelayTime3,
		[ArrDelayID1] = @ArrDelayID1,
		[ArrDelayTime1] = @ArrDelayTime1,
		[ArrDelayID2] = @ArrDelayID2,
		[ArrDelayTime2] = @ArrDelayTime2,
		[ArrDelayID3] = @ArrDelayID3,
		[ArrDelayTime3] = @ArrDelayTime3,
		[PilotFlying_CrewID] = @PilotFlying_CrewID,
		[PilotMonitoring_CrewID] = @PilotMonitoring_CrewID,
		[FlyAtDay] = @FlyAtDay,
		[FlyAtNight] = @FlyAtNight,
		[DepFule] = @DepFule,
		[ArrFule] = @ArrFule,
		[NoOfPax_A] = @NoOfPax_A,
		[NoOfPax_C] = @NoOfPax_C,
		[NoOfPax_I] = @NoOfPax_I,
		[ZFW] = @ZFW,
		[TOW] = @TOW,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate,
		[FlightNo] = @FlightNo,
		[IsPAX] = @IsPAX,
		[IsHeavy] = @IsHeavy,
		[IsHeavyCrew] = @IsHeavyCrew,
		[Comments] = @Comments,
		[AirCraft_AirPlaneID] = @AirCraft_AirPlaneID,
		[SectorDate] = @SectorDate,
		[IsReturnSector] = @IsReturnSector,
		[ReturnSectorID] = @ReturnSectorID
	WHERE
		[SectorID] = @SectorID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_SectorInsert]    Script Date: 1/3/2013 10:26:28 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorInsert];
GO

CREATE PROCEDURE [proc_SectorInsert]
(
	@SectorID int = NULL output,
	@ReportID int = NULL,
	@From_AirportID int = NULL,
	@To_AirportID int = NULL,
	@FuleUplifted int = NULL,
	@STD datetime = NULL,
	@ATD datetime = NULL,
	@ChoxOff datetime = NULL,
	@STA datetime = NULL,
	@ATA datetime = NULL,
	@ChoxOn datetime = NULL,
	@StandardBurnOff int = NULL,
	@ActualBurnOff int = NULL,
	@DepDelayID1 int = NULL,
	@DepDelayTime1 datetime = NULL,
	@DepDelayID2 int = NULL,
	@DepDelayTime2 datetime = NULL,
	@DepDelayID3 int = NULL,
	@DepDelayTime3 datetime = NULL,
	@ArrDelayID1 int = NULL,
	@ArrDelayTime1 datetime = NULL,
	@ArrDelayID2 int = NULL,
	@ArrDelayTime2 datetime = NULL,
	@ArrDelayID3 int = NULL,
	@ArrDelayTime3 datetime = NULL,
	@PilotFlying_CrewID int = NULL,
	@PilotMonitoring_CrewID int = NULL,
	@FlyAtDay datetime = NULL,
	@FlyAtNight datetime = NULL,
	@DepFule int = NULL,
	@ArrFule int = NULL,
	@NoOfPax_A int = NULL,
	@NoOfPax_C int = NULL,
	@NoOfPax_I int = NULL,
	@ZFW bigint = NULL,
	@TOW bigint = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL,
	@FlightNo nvarchar(15) = NULL,
	@IsPAX bit = NULL,
	@IsHeavy bit = NULL,
	@IsHeavyCrew bit = NULL,
	@Comments nvarchar(500) = NULL,
	@AirCraft_AirPlaneID int = NULL,
	@SectorDate datetime = NULL,
	@IsReturnSector bit = NULL,
	@ReturnSectorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Sector]
	(
		[ReportID],
		[From_AirportID],
		[To_AirportID],
		[FuleUplifted],
		[STD],
		[ATD],
		[ChoxOff],
		[STA],
		[ATA],
		[ChoxOn],
		[StandardBurnOff],
		[ActualBurnOff],
		[DepDelayID1],
		[DepDelayTime1],
		[DepDelayID2],
		[DepDelayTime2],
		[DepDelayID3],
		[DepDelayTime3],
		[ArrDelayID1],
		[ArrDelayTime1],
		[ArrDelayID2],
		[ArrDelayTime2],
		[ArrDelayID3],
		[ArrDelayTime3],
		[PilotFlying_CrewID],
		[PilotMonitoring_CrewID],
		[FlyAtDay],
		[FlyAtNight],
		[DepFule],
		[ArrFule],
		[NoOfPax_A],
		[NoOfPax_C],
		[NoOfPax_I],
		[ZFW],
		[TOW],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[FlightNo],
		[IsPAX],
		[IsHeavy],
		[IsHeavyCrew],
		[Comments],
		[AirCraft_AirPlaneID],
		[SectorDate],
		[IsReturnSector],
		[ReturnSectorID]
	)
	VALUES
	(
		@ReportID,
		@From_AirportID,
		@To_AirportID,
		@FuleUplifted,
		@STD,
		@ATD,
		@ChoxOff,
		@STA,
		@ATA,
		@ChoxOn,
		@StandardBurnOff,
		@ActualBurnOff,
		@DepDelayID1,
		@DepDelayTime1,
		@DepDelayID2,
		@DepDelayTime2,
		@DepDelayID3,
		@DepDelayTime3,
		@ArrDelayID1,
		@ArrDelayTime1,
		@ArrDelayID2,
		@ArrDelayTime2,
		@ArrDelayID3,
		@ArrDelayTime3,
		@PilotFlying_CrewID,
		@PilotMonitoring_CrewID,
		@FlyAtDay,
		@FlyAtNight,
		@DepFule,
		@ArrFule,
		@NoOfPax_A,
		@NoOfPax_C,
		@NoOfPax_I,
		@ZFW,
		@TOW,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate,
		@FlightNo,
		@IsPAX,
		@IsHeavy,
		@IsHeavyCrew,
		@Comments,
		@AirCraft_AirPlaneID,
		@SectorDate,
		@IsReturnSector,
		@ReturnSectorID
	)

	SET @Err = @@Error

	SELECT @SectorID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorDelete]    Script Date: 1/3/2013 10:26:28 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorDelete];
GO

CREATE PROCEDURE [proc_SectorDelete]
(
	@SectorID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Sector]
	WHERE
		[SectorID] = @SectorID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorDelete Error on Creation'
GO


/****** Object:  StoredProcedure [proc_SectorCrewLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorCrewLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorCrewLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_SectorCrewLoadByPrimaryKey]
(
	@ReportCrewID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReportCrewID],
		[CrewID],
		[PositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[SectorID]
	FROM [SectorCrew]
	WHERE
		([ReportCrewID] = @ReportCrewID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorCrewLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorCrewLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorCrewLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorCrewLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorCrewLoadAll];
GO

CREATE PROCEDURE [proc_SectorCrewLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReportCrewID],
		[CrewID],
		[PositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[SectorID]
	FROM [SectorCrew]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorCrewLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorCrewLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorCrewUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorCrewUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorCrewUpdate];
GO

CREATE PROCEDURE [proc_SectorCrewUpdate]
(
	@ReportCrewID int,
	@CrewID int,
	@PositionID int = NULL,
	@Notes nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL,
	@SectorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [SectorCrew]
	SET
		[CrewID] = @CrewID,
		[PositionID] = @PositionID,
		[Notes] = @Notes,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate,
		[SectorID] = @SectorID
	WHERE
		[ReportCrewID] = @ReportCrewID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorCrewUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorCrewUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_SectorCrewInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorCrewInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorCrewInsert];
GO

CREATE PROCEDURE [proc_SectorCrewInsert]
(
	@ReportCrewID int = NULL output,
	@CrewID int,
	@PositionID int = NULL,
	@Notes nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL,
	@SectorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [SectorCrew]
	(
		[CrewID],
		[PositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[SectorID]
	)
	VALUES
	(
		@CrewID,
		@PositionID,
		@Notes,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate,
		@SectorID
	)

	SET @Err = @@Error

	SELECT @ReportCrewID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorCrewInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorCrewInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorCrewDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorCrewDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorCrewDelete];
GO

CREATE PROCEDURE [proc_SectorCrewDelete]
(
	@ReportCrewID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [SectorCrew]
	WHERE
		[ReportCrewID] = @ReportCrewID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorCrewDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorCrewDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorPilotLoadByPrimaryKey]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorPilotLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorPilotLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_SectorPilotLoadByPrimaryKey]
(
	@ReportPilotID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReportPilotID],
		[PilotID],
		[PositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[SectorID]
	FROM [SectorPilot]
	WHERE
		([ReportPilotID] = @ReportPilotID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorPilotLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorPilotLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorPilotLoadAll]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorPilotLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorPilotLoadAll];
GO

CREATE PROCEDURE [proc_SectorPilotLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReportPilotID],
		[PilotID],
		[PositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[SectorID]
	FROM [SectorPilot]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorPilotLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorPilotLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorPilotUpdate]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorPilotUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorPilotUpdate];
GO

CREATE PROCEDURE [proc_SectorPilotUpdate]
(
	@ReportPilotID int,
	@PilotID int = NULL,
	@PositionID int = NULL,
	@Notes nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL,
	@SectorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [SectorPilot]
	SET
		[PilotID] = @PilotID,
		[PositionID] = @PositionID,
		[Notes] = @Notes,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate,
		[SectorID] = @SectorID
	WHERE
		[ReportPilotID] = @ReportPilotID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorPilotUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorPilotUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_SectorPilotInsert]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorPilotInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorPilotInsert];
GO

CREATE PROCEDURE [proc_SectorPilotInsert]
(
	@ReportPilotID int = NULL output,
	@PilotID int = NULL,
	@PositionID int = NULL,
	@Notes nvarchar(500) = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@ModifiedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@LastModifiedDate datetime = NULL,
	@SectorID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [SectorPilot]
	(
		[PilotID],
		[PositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate],
		[SectorID]
	)
	VALUES
	(
		@PilotID,
		@PositionID,
		@Notes,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate,
		@SectorID
	)

	SET @Err = @@Error

	SELECT @ReportPilotID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorPilotInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorPilotInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorPilotDelete]    Script Date: 12/25/2012 12:28:35 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorPilotDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorPilotDelete];
GO

CREATE PROCEDURE [proc_SectorPilotDelete]
(
	@ReportPilotID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [SectorPilot]
	WHERE
		[ReportPilotID] = @ReportPilotID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorPilotDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorPilotDelete Error on Creation'
GO
