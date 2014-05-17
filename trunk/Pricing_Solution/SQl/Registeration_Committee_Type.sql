
/****** Object:  StoredProcedure [proc_Registeration_Committee_TypeLoadByPrimaryKey]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Registeration_Committee_TypeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Registeration_Committee_TypeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_Registeration_Committee_TypeLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[CommitteType],
		[Details],
		[Description]
	FROM [Registeration_Committee_Type]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Registeration_Committee_TypeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_Registeration_Committee_TypeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Registeration_Committee_TypeLoadAll]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Registeration_Committee_TypeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Registeration_Committee_TypeLoadAll];
GO

CREATE PROCEDURE [proc_Registeration_Committee_TypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[CommitteType],
		[Details],
		[Description]
	FROM [Registeration_Committee_Type]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Registeration_Committee_TypeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_Registeration_Committee_TypeLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Registeration_Committee_TypeUpdate]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Registeration_Committee_TypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Registeration_Committee_TypeUpdate];
GO

CREATE PROCEDURE [proc_Registeration_Committee_TypeUpdate]
(
	@ID int,
	@CommitteType nvarchar(255) = NULL,
	@Details int = NULL,
	@Description nvarchar(255) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Registeration_Committee_Type]
	SET
		[CommitteType] = @CommitteType,
		[Details] = @Details,
		[Description] = @Description
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Registeration_Committee_TypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_Registeration_Committee_TypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_Registeration_Committee_TypeInsert]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Registeration_Committee_TypeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Registeration_Committee_TypeInsert];
GO

CREATE PROCEDURE [proc_Registeration_Committee_TypeInsert]
(
	@ID int = NULL output,
	@CommitteType nvarchar(255) = NULL,
	@Details int = NULL,
	@Description nvarchar(255) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Registeration_Committee_Type]
	(
		[CommitteType],
		[Details],
		[Description]
	)
	VALUES
	(
		@CommitteType,
		@Details,
		@Description
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Registeration_Committee_TypeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_Registeration_Committee_TypeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_Registeration_Committee_TypeDelete]    Script Date: 5/17/2014 5:05:57 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_Registeration_Committee_TypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_Registeration_Committee_TypeDelete];
GO

CREATE PROCEDURE [proc_Registeration_Committee_TypeDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Registeration_Committee_Type]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_Registeration_Committee_TypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_Registeration_Committee_TypeDelete Error on Creation'
GO
