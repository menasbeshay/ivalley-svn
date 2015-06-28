
/****** Object:  StoredProcedure [proc_GiveawaysLoadByPrimaryKey]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_GiveawaysLoadByPrimaryKey]
(
	@GiveawayID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GiveawayID],
		[JobOrderID],
		[ItemName],
		[GiveawayDescription],
		[GiveawayQuantity],
		[PricePerItem],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [Giveaways]
	WHERE
		([GiveawayID] = @GiveawayID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiveawaysLoadAll]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysLoadAll];
GO

CREATE PROCEDURE [proc_GiveawaysLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[GiveawayID],
		[JobOrderID],
		[ItemName],
		[GiveawayDescription],
		[GiveawayQuantity],
		[PricePerItem],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	FROM [Giveaways]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiveawaysUpdate]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysUpdate];
GO

CREATE PROCEDURE [proc_GiveawaysUpdate]
(
	@GiveawayID int,
	@JobOrderID int = NULL,
	@ItemName nvarchar(300) = NULL,
	@GiveawayDescription nvarchar(300) = NULL,
	@GiveawayQuantity int = NULL,
	@PricePerItem float = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Giveaways]
	SET
		[JobOrderID] = @JobOrderID,
		[ItemName] = @ItemName,
		[GiveawayDescription] = @GiveawayDescription,
		[GiveawayQuantity] = @GiveawayQuantity,
		[PricePerItem] = @PricePerItem,
		[CreatedBy] = @CreatedBy,
		[CreatedDate] = @CreatedDate,
		[UpdatedBy] = @UpdatedBy,
		[LastUpdatedDate] = @LastUpdatedDate
	WHERE
		[GiveawayID] = @GiveawayID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_GiveawaysInsert]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysInsert];
GO

CREATE PROCEDURE [proc_GiveawaysInsert]
(
	@GiveawayID int = NULL output,
	@JobOrderID int = NULL,
	@ItemName nvarchar(300) = NULL,
	@GiveawayDescription nvarchar(300) = NULL,
	@GiveawayQuantity int = NULL,
	@PricePerItem float = NULL,
	@CreatedBy uniqueidentifier = NULL,
	@CreatedDate datetime = NULL,
	@UpdatedBy uniqueidentifier = NULL,
	@LastUpdatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Giveaways]
	(
		[JobOrderID],
		[ItemName],
		[GiveawayDescription],
		[GiveawayQuantity],
		[PricePerItem],
		[CreatedBy],
		[CreatedDate],
		[UpdatedBy],
		[LastUpdatedDate]
	)
	VALUES
	(
		@JobOrderID,
		@ItemName,
		@GiveawayDescription,
		@GiveawayQuantity,
		@PricePerItem,
		@CreatedBy,
		@CreatedDate,
		@UpdatedBy,
		@LastUpdatedDate
	)

	SET @Err = @@Error

	SELECT @GiveawayID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_GiveawaysDelete]    Script Date: 6/28/2015 1:14:11 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_GiveawaysDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_GiveawaysDelete];
GO

CREATE PROCEDURE [proc_GiveawaysDelete]
(
	@GiveawayID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Giveaways]
	WHERE
		[GiveawayID] = @GiveawayID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_GiveawaysDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_GiveawaysDelete Error on Creation'
GO
