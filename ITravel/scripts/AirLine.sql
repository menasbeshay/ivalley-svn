
USE [ITravel]
GO

/****** Object:  StoredProcedure [proc_AirLineLoadByPrimaryKey]    Script Date: 10/7/2014 4:05:04 PM ******/
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

/****** Object:  StoredProcedure [proc_AirLineLoadAll]    Script Date: 10/7/2014 4:05:04 PM ******/
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

/****** Object:  StoredProcedure [proc_AirLineUpdate]    Script Date: 10/7/2014 4:05:04 PM ******/
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




/****** Object:  StoredProcedure [proc_AirLineInsert]    Script Date: 10/7/2014 4:05:04 PM ******/
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

/****** Object:  StoredProcedure [proc_AirLineDelete]    Script Date: 10/7/2014 4:05:04 PM ******/
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
