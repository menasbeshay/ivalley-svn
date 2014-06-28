
/****** Object:  StoredProcedure [proc_CardTextLoadByPrimaryKey]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardTextLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardTextLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CardTextLoadByPrimaryKey]
(
	@CardTextID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CardTextID],
		[CardID],
		[PosX],
		[PosY],
		[TextLabel],
		[IsMultiLine],
		[Width],
		[Height]
	FROM [CardText]
	WHERE
		([CardTextID] = @CardTextID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardTextLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardTextLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardTextLoadAll]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardTextLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardTextLoadAll];
GO

CREATE PROCEDURE [proc_CardTextLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[CardTextID],
		[CardID],
		[PosX],
		[PosY],
		[TextLabel],
		[IsMultiLine],
		[Width],
		[Height]
	FROM [CardText]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardTextLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardTextLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardTextUpdate]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardTextUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardTextUpdate];
GO

CREATE PROCEDURE [proc_CardTextUpdate]
(
	@CardTextID int,
	@CardID int = NULL,
	@PosX int = NULL,
	@PosY int = NULL,
	@TextLabel nvarchar(150) = NULL,
	@IsMultiLine bit = NULL,
	@Width int = NULL,
	@Height int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CardText]
	SET
		[CardID] = @CardID,
		[PosX] = @PosX,
		[PosY] = @PosY,
		[TextLabel] = @TextLabel,
		[IsMultiLine] = @IsMultiLine,
		[Width] = @Width,
		[Height] = @Height
	WHERE
		[CardTextID] = @CardTextID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardTextUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardTextUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_CardTextInsert]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardTextInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardTextInsert];
GO

CREATE PROCEDURE [proc_CardTextInsert]
(
	@CardTextID int = NULL output,
	@CardID int = NULL,
	@PosX int = NULL,
	@PosY int = NULL,
	@TextLabel nvarchar(150) = NULL,
	@IsMultiLine bit = NULL,
	@Width int = NULL,
	@Height int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CardText]
	(
		[CardID],
		[PosX],
		[PosY],
		[TextLabel],
		[IsMultiLine],
		[Width],
		[Height]
	)
	VALUES
	(
		@CardID,
		@PosX,
		@PosY,
		@TextLabel,
		@IsMultiLine,
		@Width,
		@Height
	)

	SET @Err = @@Error

	SELECT @CardTextID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardTextInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardTextInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardTextDelete]    Script Date: 6/28/2014 3:09:10 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardTextDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardTextDelete];
GO

CREATE PROCEDURE [proc_CardTextDelete]
(
	@CardTextID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CardText]
	WHERE
		[CardTextID] = @CardTextID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardTextDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardTextDelete Error on Creation'
GO
