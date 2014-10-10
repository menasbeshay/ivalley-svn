Update RoomTypeSpec SET Color='#ff00fe' Where ID=2
Update RoomTypeSpec SET Color='#880088' Where ID=3

DELETE FROM RoomType
DELETE FROM RoomTypeSpecDuration
DBCC CHECKIDENT ('RoomType', RESEED, 0);
DBCC CHECKIDENT ('RoomTypeSpecDuration', RESEED, 0);

Delete from RoomTypeSpec where ID=4


update RoomTypeSpec
set OrderInRoomList=1 where id>1

update RoomTypeSpec
set OrderInRoomList=2 where ID=1


IF EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'Price' AND [object_id] = OBJECT_ID(N'RoomTypeSpecDuration'))
BEGIN
    ALTER TABLE RoomTypeSpecDuration DROP COLUMN Price
    
END
IF NOT EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'Points' AND [object_id] = OBJECT_ID(N'RoomTypeSpecDuration'))
BEGIN
	ALTER TABLE RoomTypeSpecDuration Add Points INT    
END

INSERT INTO RoomTypeSpecDuration(RoomTypeSpecID,TypeDurationID,Points,OpenMemberCount)
	VALUES (1,NULL,0,500)
INSERT INTO RoomTypeSpecDuration(RoomTypeSpecID,TypeDurationID,Points,OpenMemberCount)
	VALUES (2,1,1500,2000)
INSERT INTO RoomTypeSpecDuration(RoomTypeSpecID,TypeDurationID,Points,OpenMemberCount)
	VALUES (2,2,6000,2000)
INSERT INTO RoomTypeSpecDuration(RoomTypeSpecID,TypeDurationID,Points,OpenMemberCount)
	VALUES (2,3,10000,2000)
INSERT INTO RoomTypeSpecDuration(RoomTypeSpecID,TypeDurationID,Points,OpenMemberCount)
	VALUES (3,1,1500,2000)
INSERT INTO RoomTypeSpecDuration(RoomTypeSpecID,TypeDurationID,Points,OpenMemberCount)
	VALUES (3,2,6000,2000)
INSERT INTO RoomTypeSpecDuration(RoomTypeSpecID,TypeDurationID,Points,OpenMemberCount)
	VALUES (3,3,10000,2000)

GO
ALTER PROCEDURE [dbo].[proc_RoomTypeSpecDurationInsert]
(
	@ID int = NULL output,
	@RoomTypeSpecID int,
	@TypeDurationID int = NULL,
	@Points INT,
	@OpenMemberCount int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomTypeSpecDuration]
	(
		[RoomTypeSpecID],
		[TypeDurationID],
		[Points],
		[OpenMemberCount]
	)
	VALUES
	(
		@RoomTypeSpecID,
		@TypeDurationID,
		@Points,
		@OpenMemberCount
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO

ALTER PROCEDURE [dbo].[proc_RoomTypeSpecDurationLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomTypeSpecID],
		[TypeDurationID],
		[Points],
		[OpenMemberCount]
	FROM [RoomTypeSpecDuration]

	SET @Err = @@Error

	RETURN @Err
END
GO

ALTER PROCEDURE [dbo].[proc_RoomTypeSpecDurationLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[RoomTypeSpecID],
		[TypeDurationID],
		[Points],
		[OpenMemberCount]
	FROM [RoomTypeSpecDuration]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO

ALTER PROCEDURE [dbo].[proc_RoomTypeSpecDurationUpdate]
(
	@ID int,
	@RoomTypeSpecID int,
	@TypeDurationID int = NULL,
	@Points INT,
	@OpenMemberCount int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomTypeSpecDuration]
	SET
		[RoomTypeSpecID] = @RoomTypeSpecID,
		[TypeDurationID] = @TypeDurationID,
		[Points] = @Points,
		[OpenMemberCount] = @OpenMemberCount
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO