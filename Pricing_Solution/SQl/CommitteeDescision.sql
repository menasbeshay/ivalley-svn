
USE [PricingAppointment]
GO

/****** Object:  StoredProcedure [proc_CommitteeDescisionLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteeDescisionLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteeDescisionLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CommitteeDescisionLoadByPrimaryKey]
(
	@CommitteeDescisionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CommitteeDescisionID],
		[DescisionText],
		[Notice]
	FROM [CommitteeDescision]
	WHERE
		([CommitteeDescisionID] = @CommitteeDescisionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteeDescisionLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteeDescisionLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CommitteeDescisionLoadAll]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteeDescisionLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteeDescisionLoadAll];
GO

CREATE PROCEDURE [proc_CommitteeDescisionLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CommitteeDescisionID],
		[DescisionText],
		[Notice]
	FROM [CommitteeDescision]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteeDescisionLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteeDescisionLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CommitteeDescisionUpdate]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteeDescisionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteeDescisionUpdate];
GO

CREATE PROCEDURE [proc_CommitteeDescisionUpdate]
(
	@CommitteeDescisionID int,
	@DescisionText nvarchar(450) = NULL,
	@Notice nvarchar(1500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CommitteeDescision]
	SET
		[DescisionText] = @DescisionText,
		[Notice] = @Notice
	WHERE
		[CommitteeDescisionID] = @CommitteeDescisionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteeDescisionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteeDescisionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CommitteeDescisionInsert]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteeDescisionInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteeDescisionInsert];
GO

CREATE PROCEDURE [proc_CommitteeDescisionInsert]
(
	@CommitteeDescisionID int = NULL output,
	@DescisionText nvarchar(450) = NULL,
	@Notice nvarchar(1500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CommitteeDescision]
	(
		[DescisionText],
		[Notice]
	)
	VALUES
	(
		@DescisionText,
		@Notice
	)

	SET @Err = @@Error

	SELECT @CommitteeDescisionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteeDescisionInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteeDescisionInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CommitteeDescisionDelete]    Script Date: 5/17/2014 5:05:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CommitteeDescisionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CommitteeDescisionDelete];
GO

CREATE PROCEDURE [proc_CommitteeDescisionDelete]
(
	@CommitteeDescisionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CommitteeDescision]
	WHERE
		[CommitteeDescisionID] = @CommitteeDescisionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CommitteeDescisionDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CommitteeDescisionDelete Error on Creation'
GO
