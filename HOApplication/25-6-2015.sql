alter table dbo.DeadMedicalInfo
add IsUnderInvestigation bit


/****** Object:  StoredProcedure [proc_DeadMedicalInfoLoadByPrimaryKey]    Script Date: 6/25/2015 10:51:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeadMedicalInfoLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeadMedicalInfoLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_DeadMedicalInfoLoadByPrimaryKey]
(
	@DeadMedicalInfoID uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeadMedicalInfoID],
		[DeadEventID],
		[CauseOfDeathA],
		[CauseOfDeathAPeriod],
		[CauseOfDeathBPeriod],
		[CauseOfDeathC],
		[CauseOfDeathCPeriod],
		[CauseOfDeathD],
		[CauseOfDeathDPeriod],
		[CauseOfDeathNotRelatedA],
		[CauseOfDeathNotRelatedAPeriod],
		[CauseOfDeathNotRelatedB],
		[CauseOfDeathNotRelatedBPeriod],
		[IsSmoker],
		[SmokeType],
		[SmokePeriod],
		[IsCausedByAccedent],
		[AccedentCause],
		[AccedentAnotherCause],
		[AccedentPlace],
		[VehicleType],
		[VehicleTypeOther],
		[DeadStatus],
		[HasTumor],
		[PlaceOfTumor],
		[TypeOfTumor],
		[PhaseOfTumor],
		[DeadThroghCarry],
		[AbortionPast6Weeks],
		[DeadThroghBirth],
		[BirthPast6Weeks],
		[BirthDate],
		[BirthResult],
		[BirthPlace],
		[BirthOperator],
		[AbortionDate],
		[CauseOfDeathB],
		[AbortionPlace],
		[LocationOfTumor],
		[IsUnderInvestigation]
	FROM [DeadMedicalInfo]
	WHERE
		([DeadMedicalInfoID] = @DeadMedicalInfoID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeadMedicalInfoLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeadMedicalInfoLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeadMedicalInfoLoadAll]    Script Date: 6/25/2015 10:51:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeadMedicalInfoLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeadMedicalInfoLoadAll];
GO

CREATE PROCEDURE [proc_DeadMedicalInfoLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DeadMedicalInfoID],
		[DeadEventID],
		[CauseOfDeathA],
		[CauseOfDeathAPeriod],
		[CauseOfDeathBPeriod],
		[CauseOfDeathC],
		[CauseOfDeathCPeriod],
		[CauseOfDeathD],
		[CauseOfDeathDPeriod],
		[CauseOfDeathNotRelatedA],
		[CauseOfDeathNotRelatedAPeriod],
		[CauseOfDeathNotRelatedB],
		[CauseOfDeathNotRelatedBPeriod],
		[IsSmoker],
		[SmokeType],
		[SmokePeriod],
		[IsCausedByAccedent],
		[AccedentCause],
		[AccedentAnotherCause],
		[AccedentPlace],
		[VehicleType],
		[VehicleTypeOther],
		[DeadStatus],
		[HasTumor],
		[PlaceOfTumor],
		[TypeOfTumor],
		[PhaseOfTumor],
		[DeadThroghCarry],
		[AbortionPast6Weeks],
		[DeadThroghBirth],
		[BirthPast6Weeks],
		[BirthDate],
		[BirthResult],
		[BirthPlace],
		[BirthOperator],
		[AbortionDate],
		[CauseOfDeathB],
		[AbortionPlace],
		[LocationOfTumor],
		[IsUnderInvestigation]
	FROM [DeadMedicalInfo]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeadMedicalInfoLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeadMedicalInfoLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeadMedicalInfoUpdate]    Script Date: 6/25/2015 10:51:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeadMedicalInfoUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeadMedicalInfoUpdate];
GO

CREATE PROCEDURE [proc_DeadMedicalInfoUpdate]
(
	@DeadMedicalInfoID uniqueidentifier,
	@DeadEventID uniqueidentifier,
	@CauseOfDeathA char(20) = NULL,
	@CauseOfDeathAPeriod char(10) = NULL,
	@CauseOfDeathBPeriod char(10) = NULL,
	@CauseOfDeathC char(20) = NULL,
	@CauseOfDeathCPeriod char(10) = NULL,
	@CauseOfDeathD char(20) = NULL,
	@CauseOfDeathDPeriod char(10) = NULL,
	@CauseOfDeathNotRelatedA char(20) = NULL,
	@CauseOfDeathNotRelatedAPeriod char(10) = NULL,
	@CauseOfDeathNotRelatedB char(20) = NULL,
	@CauseOfDeathNotRelatedBPeriod char(10) = NULL,
	@IsSmoker bit = NULL,
	@SmokeType nvarchar(100) = NULL,
	@SmokePeriod char(4) = NULL,
	@IsCausedByAccedent bit = NULL,
	@AccedentCause int = NULL,
	@AccedentAnotherCause nvarchar(100) = NULL,
	@AccedentPlace nvarchar(100) = NULL,
	@VehicleType int = NULL,
	@VehicleTypeOther nvarchar(100) = NULL,
	@DeadStatus int = NULL,
	@HasTumor bit = NULL,
	@PlaceOfTumor nvarchar(100) = NULL,
	@TypeOfTumor int = NULL,
	@PhaseOfTumor int = NULL,
	@DeadThroghCarry bit = NULL,
	@AbortionPast6Weeks bit = NULL,
	@DeadThroghBirth bit = NULL,
	@BirthPast6Weeks bit = NULL,
	@BirthDate smalldatetime = NULL,
	@BirthResult int = NULL,
	@BirthPlace nvarchar(100) = NULL,
	@BirthOperator nvarchar(100) = NULL,
	@AbortionDate datetime = NULL,
	@CauseOfDeathB char(20) = NULL,
	@AbortionPlace nvarchar(200) = NULL,
	@LocationOfTumor int = NULL,
	@IsUnderInvestigation bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DeadMedicalInfo]
	SET
		[DeadEventID] = @DeadEventID,
		[CauseOfDeathA] = @CauseOfDeathA,
		[CauseOfDeathAPeriod] = @CauseOfDeathAPeriod,
		[CauseOfDeathBPeriod] = @CauseOfDeathBPeriod,
		[CauseOfDeathC] = @CauseOfDeathC,
		[CauseOfDeathCPeriod] = @CauseOfDeathCPeriod,
		[CauseOfDeathD] = @CauseOfDeathD,
		[CauseOfDeathDPeriod] = @CauseOfDeathDPeriod,
		[CauseOfDeathNotRelatedA] = @CauseOfDeathNotRelatedA,
		[CauseOfDeathNotRelatedAPeriod] = @CauseOfDeathNotRelatedAPeriod,
		[CauseOfDeathNotRelatedB] = @CauseOfDeathNotRelatedB,
		[CauseOfDeathNotRelatedBPeriod] = @CauseOfDeathNotRelatedBPeriod,
		[IsSmoker] = @IsSmoker,
		[SmokeType] = @SmokeType,
		[SmokePeriod] = @SmokePeriod,
		[IsCausedByAccedent] = @IsCausedByAccedent,
		[AccedentCause] = @AccedentCause,
		[AccedentAnotherCause] = @AccedentAnotherCause,
		[AccedentPlace] = @AccedentPlace,
		[VehicleType] = @VehicleType,
		[VehicleTypeOther] = @VehicleTypeOther,
		[DeadStatus] = @DeadStatus,
		[HasTumor] = @HasTumor,
		[PlaceOfTumor] = @PlaceOfTumor,
		[TypeOfTumor] = @TypeOfTumor,
		[PhaseOfTumor] = @PhaseOfTumor,
		[DeadThroghCarry] = @DeadThroghCarry,
		[AbortionPast6Weeks] = @AbortionPast6Weeks,
		[DeadThroghBirth] = @DeadThroghBirth,
		[BirthPast6Weeks] = @BirthPast6Weeks,
		[BirthDate] = @BirthDate,
		[BirthResult] = @BirthResult,
		[BirthPlace] = @BirthPlace,
		[BirthOperator] = @BirthOperator,
		[AbortionDate] = @AbortionDate,
		[CauseOfDeathB] = @CauseOfDeathB,
		[AbortionPlace] = @AbortionPlace,
		[LocationOfTumor] = @LocationOfTumor,
		[IsUnderInvestigation] = @IsUnderInvestigation
	WHERE
		[DeadMedicalInfoID] = @DeadMedicalInfoID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeadMedicalInfoUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeadMedicalInfoUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_DeadMedicalInfoInsert]    Script Date: 6/25/2015 10:51:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeadMedicalInfoInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeadMedicalInfoInsert];
GO

CREATE PROCEDURE [proc_DeadMedicalInfoInsert]
(
	@DeadMedicalInfoID uniqueidentifier,
	@DeadEventID uniqueidentifier,
	@CauseOfDeathA char(20) = NULL,
	@CauseOfDeathAPeriod char(10) = NULL,
	@CauseOfDeathBPeriod char(10) = NULL,
	@CauseOfDeathC char(20) = NULL,
	@CauseOfDeathCPeriod char(10) = NULL,
	@CauseOfDeathD char(20) = NULL,
	@CauseOfDeathDPeriod char(10) = NULL,
	@CauseOfDeathNotRelatedA char(20) = NULL,
	@CauseOfDeathNotRelatedAPeriod char(10) = NULL,
	@CauseOfDeathNotRelatedB char(20) = NULL,
	@CauseOfDeathNotRelatedBPeriod char(10) = NULL,
	@IsSmoker bit = NULL,
	@SmokeType nvarchar(100) = NULL,
	@SmokePeriod char(4) = NULL,
	@IsCausedByAccedent bit = NULL,
	@AccedentCause int = NULL,
	@AccedentAnotherCause nvarchar(100) = NULL,
	@AccedentPlace nvarchar(100) = NULL,
	@VehicleType int = NULL,
	@VehicleTypeOther nvarchar(100) = NULL,
	@DeadStatus int = NULL,
	@HasTumor bit = NULL,
	@PlaceOfTumor nvarchar(100) = NULL,
	@TypeOfTumor int = NULL,
	@PhaseOfTumor int = NULL,
	@DeadThroghCarry bit = NULL,
	@AbortionPast6Weeks bit = NULL,
	@DeadThroghBirth bit = NULL,
	@BirthPast6Weeks bit = NULL,
	@BirthDate smalldatetime = NULL,
	@BirthResult int = NULL,
	@BirthPlace nvarchar(100) = NULL,
	@BirthOperator nvarchar(100) = NULL,
	@AbortionDate datetime = NULL,
	@CauseOfDeathB char(20) = NULL,
	@AbortionPlace nvarchar(200) = NULL,
	@LocationOfTumor int = NULL,
	@IsUnderInvestigation bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	IF @DeadMedicalInfoID IS NULL
		 SET @DeadMedicalInfoID = NEWID()

	SET @Err = @@Error

	IF (@Err <> 0)
	    RETURN @Err


	INSERT
	INTO [DeadMedicalInfo]
	(
		[DeadMedicalInfoID],
		[DeadEventID],
		[CauseOfDeathA],
		[CauseOfDeathAPeriod],
		[CauseOfDeathBPeriod],
		[CauseOfDeathC],
		[CauseOfDeathCPeriod],
		[CauseOfDeathD],
		[CauseOfDeathDPeriod],
		[CauseOfDeathNotRelatedA],
		[CauseOfDeathNotRelatedAPeriod],
		[CauseOfDeathNotRelatedB],
		[CauseOfDeathNotRelatedBPeriod],
		[IsSmoker],
		[SmokeType],
		[SmokePeriod],
		[IsCausedByAccedent],
		[AccedentCause],
		[AccedentAnotherCause],
		[AccedentPlace],
		[VehicleType],
		[VehicleTypeOther],
		[DeadStatus],
		[HasTumor],
		[PlaceOfTumor],
		[TypeOfTumor],
		[PhaseOfTumor],
		[DeadThroghCarry],
		[AbortionPast6Weeks],
		[DeadThroghBirth],
		[BirthPast6Weeks],
		[BirthDate],
		[BirthResult],
		[BirthPlace],
		[BirthOperator],
		[AbortionDate],
		[CauseOfDeathB],
		[AbortionPlace],
		[LocationOfTumor],
		[IsUnderInvestigation]
	)
	VALUES
	(
		@DeadMedicalInfoID,
		@DeadEventID,
		@CauseOfDeathA,
		@CauseOfDeathAPeriod,
		@CauseOfDeathBPeriod,
		@CauseOfDeathC,
		@CauseOfDeathCPeriod,
		@CauseOfDeathD,
		@CauseOfDeathDPeriod,
		@CauseOfDeathNotRelatedA,
		@CauseOfDeathNotRelatedAPeriod,
		@CauseOfDeathNotRelatedB,
		@CauseOfDeathNotRelatedBPeriod,
		@IsSmoker,
		@SmokeType,
		@SmokePeriod,
		@IsCausedByAccedent,
		@AccedentCause,
		@AccedentAnotherCause,
		@AccedentPlace,
		@VehicleType,
		@VehicleTypeOther,
		@DeadStatus,
		@HasTumor,
		@PlaceOfTumor,
		@TypeOfTumor,
		@PhaseOfTumor,
		@DeadThroghCarry,
		@AbortionPast6Weeks,
		@DeadThroghBirth,
		@BirthPast6Weeks,
		@BirthDate,
		@BirthResult,
		@BirthPlace,
		@BirthOperator,
		@AbortionDate,
		@CauseOfDeathB,
		@AbortionPlace,
		@LocationOfTumor,
		@IsUnderInvestigation
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeadMedicalInfoInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeadMedicalInfoInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_DeadMedicalInfoDelete]    Script Date: 6/25/2015 10:51:17 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_DeadMedicalInfoDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_DeadMedicalInfoDelete];
GO

CREATE PROCEDURE [proc_DeadMedicalInfoDelete]
(
	@DeadMedicalInfoID uniqueidentifier
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DeadMedicalInfo]
	WHERE
		[DeadMedicalInfoID] = @DeadMedicalInfoID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_DeadMedicalInfoDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_DeadMedicalInfoDelete Error on Creation'
GO
