
/****** Object:  StoredProcedure [proc_AirPortLoadByPrimaryKey]    Script Date: 10/2/2014 1:05:14 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPortLoadAll]    Script Date: 10/2/2014 1:05:14 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPortUpdate]    Script Date: 10/2/2014 1:05:14 PM ******/
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




/****** Object:  StoredProcedure [proc_AirPortInsert]    Script Date: 10/2/2014 1:05:14 PM ******/
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

/****** Object:  StoredProcedure [proc_AirPortDelete]    Script Date: 10/2/2014 1:05:14 PM ******/
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
