ALTER TABLE RoomTypeSpec
ADD MicQuality NVARCHAR(200), CamQuality NVARCHAR(200), ExtraMembersCount INT
GO
update RoomTypeSpec SET CamQuality=N'رؤية مباشرة',MicQuality=N'صوت نقى' ,ExtraMembersCount=0
UPDATE RoomTypeSpec SET CamQuality=N'رؤية واضحة',MicQuality=N'صوت واضح' WHERE ID=1
UPDATE RoomTypeSpec SET ExtraMembersCount=10 WHERE ID=2
UPDATE RoomTypeSpec SET ExtraMembersCount=15 WHERE ID=3
UPDATE RoomTypeSpec SET ExtraMembersCount=20 WHERE ID=4
GO
/****** Object:  StoredProcedure [proc_RoomTypeSpecLoadByPrimaryKey]    Script Date: 20/5/2014 3:24:43 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomTypeSpecLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[Name],
		[Color],
		[OrderInRoomList],
		[MicCount],
		[MicQuality],
		[CamQuality],
		[ExtraMembersCount]
	FROM [RoomTypeSpec]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeSpecLoadAll]    Script Date: 20/5/2014 3:24:43 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecLoadAll];
GO

CREATE PROCEDURE [proc_RoomTypeSpecLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[Name],
		[Color],
		[OrderInRoomList],
		[MicCount],
		[MicQuality],
		[CamQuality],
		[ExtraMembersCount]
	FROM [RoomTypeSpec]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeSpecUpdate]    Script Date: 20/5/2014 3:24:43 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecUpdate];
GO

CREATE PROCEDURE [proc_RoomTypeSpecUpdate]
(
	@ID int,
	@Name nvarchar(50),
	@Color varchar(50) = NULL,
	@OrderInRoomList int,
	@MicCount int,
	@MicQuality nvarchar(200) = NULL,
	@CamQuality nvarchar(200) = NULL,
	@ExtraMembersCount int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomTypeSpec]
	SET
		[Name] = @Name,
		[Color] = @Color,
		[OrderInRoomList] = @OrderInRoomList,
		[MicCount] = @MicCount,
		[MicQuality] = @MicQuality,
		[CamQuality] = @CamQuality,
		[ExtraMembersCount] = @ExtraMembersCount
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_RoomTypeSpecInsert]    Script Date: 20/5/2014 3:24:43 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecInsert];
GO

CREATE PROCEDURE [proc_RoomTypeSpecInsert]
(
	@ID int = NULL output,
	@Name nvarchar(50),
	@Color varchar(50) = NULL,
	@OrderInRoomList int,
	@MicCount int,
	@MicQuality nvarchar(200) = NULL,
	@CamQuality nvarchar(200) = NULL,
	@ExtraMembersCount int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomTypeSpec]
	(
		[Name],
		[Color],
		[OrderInRoomList],
		[MicCount],
		[MicQuality],
		[CamQuality],
		[ExtraMembersCount]
	)
	VALUES
	(
		@Name,
		@Color,
		@OrderInRoomList,
		@MicCount,
		@MicQuality,
		@CamQuality,
		@ExtraMembersCount
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomTypeSpecDelete]    Script Date: 20/5/2014 3:24:43 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomTypeSpecDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomTypeSpecDelete];
GO

CREATE PROCEDURE [proc_RoomTypeSpecDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomTypeSpec]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO

