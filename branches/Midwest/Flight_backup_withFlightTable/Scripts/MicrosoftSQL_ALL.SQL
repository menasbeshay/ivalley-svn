
USE [FlightReport]
GO

/****** Object:  StoredProcedure [proc_AirPlaneLoadByPrimaryKey]    Script Date: 11/2/2012 1:47:43 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPlaneLoadAll]    Script Date: 11/2/2012 1:47:43 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPlaneUpdate]    Script Date: 11/2/2012 1:47:43 PM ******/
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




/****** Object:  StoredProcedure [proc_AirPlaneInsert]    Script Date: 11/2/2012 1:47:43 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPlaneDelete]    Script Date: 11/2/2012 1:47:43 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPortLoadByPrimaryKey]    Script Date: 11/2/2012 1:47:43 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPortLoadAll]    Script Date: 11/2/2012 1:47:43 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPortUpdate]    Script Date: 11/2/2012 1:47:43 PM ******/
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




/****** Object:  StoredProcedure [proc_AirPortInsert]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPortDelete]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_CompanyPositionLoadByPrimaryKey]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_CompanyPositionLoadAll]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_CompanyPositionUpdate]    Script Date: 11/2/2012 1:47:44 PM ******/
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




/****** Object:  StoredProcedure [proc_CompanyPositionInsert]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_CompanyPositionDelete]    Script Date: 11/2/2012 1:47:44 PM ******/
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


/****** Object:  StoredProcedure [proc_CrewLoadByPrimaryKey]    Script Date: 11/7/2012 3:38:56 PM ******/
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

/****** Object:  StoredProcedure [proc_CrewLoadAll]    Script Date: 11/7/2012 3:38:56 PM ******/
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

/****** Object:  StoredProcedure [proc_CrewUpdate]    Script Date: 11/7/2012 3:38:56 PM ******/
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




/****** Object:  StoredProcedure [proc_CrewInsert]    Script Date: 11/7/2012 3:38:56 PM ******/
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

/****** Object:  StoredProcedure [proc_CrewDelete]    Script Date: 11/7/2012 3:38:56 PM ******/
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


/****** Object:  StoredProcedure [proc_DelayLoadByPrimaryKey]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_DelayLoadAll]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_DelayUpdate]    Script Date: 11/2/2012 1:47:44 PM ******/
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




/****** Object:  StoredProcedure [proc_DelayInsert]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_DelayDelete]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_FlightLoadByPrimaryKey]    Script Date: 11/21/2012 2:32:17 PM ******/
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

/****** Object:  StoredProcedure [proc_FlightLoadAll]    Script Date: 11/21/2012 2:32:17 PM ******/
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

/****** Object:  StoredProcedure [proc_FlightUpdate]    Script Date: 11/21/2012 2:32:17 PM ******/
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




/****** Object:  StoredProcedure [proc_FlightInsert]    Script Date: 11/21/2012 2:32:17 PM ******/
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

/****** Object:  StoredProcedure [proc_FlightDelete]    Script Date: 11/21/2012 2:32:17 PM ******/
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

/****** Object:  StoredProcedure [proc_FlightCrewLoadByPrimaryKey]    Script Date: 11/2/2012 1:47:44 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightCrewLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightCrewLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_FlightCrewLoadByPrimaryKey]
(
	@ReportCrewID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReportCrewID],
		[ReportID],
		[CrewID],
		[PositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [FlightCrew]
	WHERE
		([ReportCrewID] = @ReportCrewID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightCrewLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightCrewLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FlightCrewLoadAll]    Script Date: 11/2/2012 1:47:44 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightCrewLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightCrewLoadAll];
GO

CREATE PROCEDURE [proc_FlightCrewLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReportCrewID],
		[ReportID],
		[CrewID],
		[PositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [FlightCrew]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightCrewLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightCrewLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FlightCrewUpdate]    Script Date: 11/2/2012 1:47:44 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightCrewUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightCrewUpdate];
GO

CREATE PROCEDURE [proc_FlightCrewUpdate]
(
	@ReportCrewID int,
	@ReportID int,
	@CrewID int,
	@PositionID int = NULL,
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

	UPDATE [FlightCrew]
	SET
		[ReportID] = @ReportID,
		[CrewID] = @CrewID,
		[PositionID] = @PositionID,
		[Notes] = @Notes,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate
	WHERE
		[ReportCrewID] = @ReportCrewID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightCrewUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightCrewUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_FlightCrewInsert]    Script Date: 11/2/2012 1:47:44 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightCrewInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightCrewInsert];
GO

CREATE PROCEDURE [proc_FlightCrewInsert]
(
	@ReportCrewID int = NULL output,
	@ReportID int,
	@CrewID int,
	@PositionID int = NULL,
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
	INTO [FlightCrew]
	(
		[ReportID],
		[CrewID],
		[PositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	)
	VALUES
	(
		@ReportID,
		@CrewID,
		@PositionID,
		@Notes,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate
	)

	SET @Err = @@Error

	SELECT @ReportCrewID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightCrewInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightCrewInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FlightCrewDelete]    Script Date: 11/2/2012 1:47:44 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightCrewDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightCrewDelete];
GO

CREATE PROCEDURE [proc_FlightCrewDelete]
(
	@ReportCrewID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [FlightCrew]
	WHERE
		[ReportCrewID] = @ReportCrewID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightCrewDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightCrewDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FlightPilotLoadByPrimaryKey]    Script Date: 11/2/2012 1:47:44 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightPilotLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightPilotLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_FlightPilotLoadByPrimaryKey]
(
	@ReportPilotID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReportPilotID],
		[ReportID],
		[PilotID],
		[PositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [FlightPilot]
	WHERE
		([ReportPilotID] = @ReportPilotID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightPilotLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightPilotLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FlightPilotLoadAll]    Script Date: 11/2/2012 1:47:44 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightPilotLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightPilotLoadAll];
GO

CREATE PROCEDURE [proc_FlightPilotLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ReportPilotID],
		[ReportID],
		[PilotID],
		[PositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	FROM [FlightPilot]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightPilotLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightPilotLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FlightPilotUpdate]    Script Date: 11/2/2012 1:47:44 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightPilotUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightPilotUpdate];
GO

CREATE PROCEDURE [proc_FlightPilotUpdate]
(
	@ReportPilotID int,
	@ReportID int = NULL,
	@PilotID int = NULL,
	@PositionID int = NULL,
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

	UPDATE [FlightPilot]
	SET
		[ReportID] = @ReportID,
		[PilotID] = @PilotID,
		[PositionID] = @PositionID,
		[Notes] = @Notes,
		[CreatedBy] = @CreatedBy,
		[ModifiedBy] = @ModifiedBy,
		[CreatedDate] = @CreatedDate,
		[LastModifiedDate] = @LastModifiedDate
	WHERE
		[ReportPilotID] = @ReportPilotID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightPilotUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightPilotUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_FlightPilotInsert]    Script Date: 11/2/2012 1:47:44 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightPilotInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightPilotInsert];
GO

CREATE PROCEDURE [proc_FlightPilotInsert]
(
	@ReportPilotID int = NULL output,
	@ReportID int = NULL,
	@PilotID int = NULL,
	@PositionID int = NULL,
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
	INTO [FlightPilot]
	(
		[ReportID],
		[PilotID],
		[PositionID],
		[Notes],
		[CreatedBy],
		[ModifiedBy],
		[CreatedDate],
		[LastModifiedDate]
	)
	VALUES
	(
		@ReportID,
		@PilotID,
		@PositionID,
		@Notes,
		@CreatedBy,
		@ModifiedBy,
		@CreatedDate,
		@LastModifiedDate
	)

	SET @Err = @@Error

	SELECT @ReportPilotID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightPilotInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightPilotInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FlightPilotDelete]    Script Date: 11/2/2012 1:47:44 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FlightPilotDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FlightPilotDelete];
GO

CREATE PROCEDURE [proc_FlightPilotDelete]
(
	@ReportPilotID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [FlightPilot]
	WHERE
		[ReportPilotID] = @ReportPilotID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FlightPilotDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_FlightPilotDelete Error on Creation'
GO

/****** Object:  StoredProcedure [proc_PilotLoadByPrimaryKey]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_PilotLoadAll]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_PilotUpdate]    Script Date: 11/2/2012 1:47:44 PM ******/
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




/****** Object:  StoredProcedure [proc_PilotInsert]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_PilotDelete]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_Pilot_CompanyPositionLoadByPrimaryKey]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_Pilot_CompanyPositionLoadAll]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_Pilot_CompanyPositionUpdate]    Script Date: 11/2/2012 1:47:44 PM ******/
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




/****** Object:  StoredProcedure [proc_Pilot_CompanyPositionInsert]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_Pilot_CompanyPositionDelete]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_Pilot_TBFLoadByPrimaryKey]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_Pilot_TBFLoadAll]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_Pilot_TBFUpdate]    Script Date: 11/2/2012 1:47:44 PM ******/
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




/****** Object:  StoredProcedure [proc_Pilot_TBFInsert]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_Pilot_TBFDelete]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_PositionLoadByPrimaryKey]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_PositionLoadAll]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_PositionUpdate]    Script Date: 11/2/2012 1:47:44 PM ******/
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




/****** Object:  StoredProcedure [proc_PositionInsert]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_PositionDelete]    Script Date: 11/2/2012 1:47:44 PM ******/
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

/****** Object:  StoredProcedure [proc_SectorLoadByPrimaryKey]    Script Date: 11/2/2012 1:47:44 PM ******/
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
		[IsPAX]
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

/****** Object:  StoredProcedure [proc_SectorLoadAll]    Script Date: 11/2/2012 1:47:44 PM ******/
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
		[IsPAX]
	FROM [Sector]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_SectorLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_SectorLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_SectorUpdate]    Script Date: 11/2/2012 1:47:44 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorUpdate];
GO

CREATE PROCEDURE [proc_SectorUpdate]
(
	@SectorID int,
	@ReportID int,
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
	@IsPAX bit = NULL
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
		[IsPAX] = @IsPAX
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




/****** Object:  StoredProcedure [proc_SectorInsert]    Script Date: 11/2/2012 1:47:44 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_SectorInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_SectorInsert];
GO

CREATE PROCEDURE [proc_SectorInsert]
(
	@SectorID int = NULL output,
	@ReportID int,
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
	@IsPAX bit = NULL
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
		[IsPAX]
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
		@IsPAX
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

/****** Object:  StoredProcedure [proc_SectorDelete]    Script Date: 11/2/2012 1:47:44 PM ******/
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
