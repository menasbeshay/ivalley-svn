
/****** Object:  StoredProcedure [proc_GeneralLookupLoadByPrimaryKey]    Script Date: 6/16/2015 4:00:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_GeneralLookupLoadByPrimaryKey]
(
	@GeneralLookupID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GeneralLookupID],
		[CategoryID],
		[Name],
		[Address],
		[Telephone],
		[Email]
	FROM [GeneralLookup]
	WHERE
		([GeneralLookupID] = @GeneralLookupID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GeneralLookupLoadAll]    Script Date: 6/16/2015 4:00:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupLoadAll];
GO

CREATE PROCEDURE [proc_GeneralLookupLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GeneralLookupID],
		[CategoryID],
		[Name],
		[Address],
		[Telephone],
		[Email]
	FROM [GeneralLookup]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GeneralLookupUpdate]    Script Date: 6/16/2015 4:00:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupUpdate];
GO

CREATE PROCEDURE [proc_GeneralLookupUpdate]
(
	@GeneralLookupID int,
	@CategoryID int = NULL,
	@Name nvarchar(300) = NULL,
	@Address nvarchar(300) = NULL,
	@Telephone nvarchar(300) = NULL,
	@Email nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [GeneralLookup]
	SET
		[CategoryID] = @CategoryID,
		[Name] = @Name,
		[Address] = @Address,
		[Telephone] = @Telephone,
		[Email] = @Email
	WHERE
		[GeneralLookupID] = @GeneralLookupID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_GeneralLookupInsert]    Script Date: 6/16/2015 4:00:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupInsert];
GO

CREATE PROCEDURE [proc_GeneralLookupInsert]
(
	@GeneralLookupID int = NULL output,
	@CategoryID int = NULL,
	@Name nvarchar(300) = NULL,
	@Address nvarchar(300) = NULL,
	@Telephone nvarchar(300) = NULL,
	@Email nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [GeneralLookup]
	(
		[CategoryID],
		[Name],
		[Address],
		[Telephone],
		[Email]
	)
	VALUES
	(
		@CategoryID,
		@Name,
		@Address,
		@Telephone,
		@Email
	)

	SET @Err = @@Error

	SELECT @GeneralLookupID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GeneralLookupDelete]    Script Date: 6/16/2015 4:00:26 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GeneralLookupDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GeneralLookupDelete];
GO

CREATE PROCEDURE [proc_GeneralLookupDelete]
(
	@GeneralLookupID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [GeneralLookup]
	WHERE
		[GeneralLookupID] = @GeneralLookupID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GeneralLookupDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_GeneralLookupDelete Error on Creation'
GO
