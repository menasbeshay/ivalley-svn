
/****** Object:  StoredProcedure [proc_ClientsLoadByPrimaryKey]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ClientsLoadByPrimaryKey]
(
	@ClientID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ClientID],
		[ClientName],
		[ClientPhone],
		[ClientEmail],
		[ClientCode]
	FROM [Clients]
	WHERE
		([ClientID] = @ClientID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ClientsLoadAll]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsLoadAll];
GO

CREATE PROCEDURE [proc_ClientsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ClientID],
		[ClientName],
		[ClientPhone],
		[ClientEmail],
		[ClientCode]
	FROM [Clients]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ClientsUpdate]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsUpdate];
GO

CREATE PROCEDURE [proc_ClientsUpdate]
(
	@ClientID int,
	@ClientName nvarchar(300) = NULL,
	@ClientPhone nvarchar(50) = NULL,
	@ClientEmail nvarchar(300) = NULL,
	@ClientCode nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Clients]
	SET
		[ClientName] = @ClientName,
		[ClientPhone] = @ClientPhone,
		[ClientEmail] = @ClientEmail,
		[ClientCode] = @ClientCode
	WHERE
		[ClientID] = @ClientID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_ClientsInsert]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsInsert];
GO

CREATE PROCEDURE [proc_ClientsInsert]
(
	@ClientID int = NULL output,
	@ClientName nvarchar(300) = NULL,
	@ClientPhone nvarchar(50) = NULL,
	@ClientEmail nvarchar(300) = NULL,
	@ClientCode nvarchar(300) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Clients]
	(
		[ClientName],
		[ClientPhone],
		[ClientEmail],
		[ClientCode]
	)
	VALUES
	(
		@ClientName,
		@ClientPhone,
		@ClientEmail,
		@ClientCode
	)

	SET @Err = @@Error

	SELECT @ClientID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ClientsDelete]    Script Date: 6/18/2015 3:31:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ClientsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ClientsDelete];
GO

CREATE PROCEDURE [proc_ClientsDelete]
(
	@ClientID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Clients]
	WHERE
		[ClientID] = @ClientID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ClientsDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ClientsDelete Error on Creation'
GO
