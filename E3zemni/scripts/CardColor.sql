
USE [E3zemni]
GO

/****** Object:  StoredProcedure [proc_CardColorLoadByPrimaryKey]    Script Date: 8/4/2014 1:27:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardColorLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardColorLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_CardColorLoadByPrimaryKey]
(
	@ColorID int,
	@CardID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ColorID],
		[CardID]
	FROM [CardColor]
	WHERE
		([ColorID] = @ColorID) AND
		([CardID] = @CardID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardColorLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardColorLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardColorLoadAll]    Script Date: 8/4/2014 1:27:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardColorLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardColorLoadAll];
GO

CREATE PROCEDURE [proc_CardColorLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ColorID],
		[CardID]
	FROM [CardColor]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardColorLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardColorLoadAll Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


/****** Object:  StoredProcedure [proc_CardColorInsert]    Script Date: 8/4/2014 1:27:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardColorInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardColorInsert];
GO

CREATE PROCEDURE [proc_CardColorInsert]
(
	@ColorID int,
	@CardID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CardColor]
	(
		[ColorID],
		[CardID]
	)
	VALUES
	(
		@ColorID,
		@CardID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardColorInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardColorInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_CardColorDelete]    Script Date: 8/4/2014 1:27:56 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_CardColorDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_CardColorDelete];
GO

CREATE PROCEDURE [proc_CardColorDelete]
(
	@ColorID int,
	@CardID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CardColor]
	WHERE
		[ColorID] = @ColorID AND
		[CardID] = @CardID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_CardColorDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_CardColorDelete Error on Creation'
GO
