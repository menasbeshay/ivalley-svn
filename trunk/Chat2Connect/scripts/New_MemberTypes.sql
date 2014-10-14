Update MemberTypeSpec SET OpenRoomCount=5 WHERE ID=1
Update MemberTypeSpec SET OpenRoomCount=10 WHERE ID in (2,3)

Update MemberTypeSpec SET OpenedCamCount=2 WHERE ID=1
Update MemberTypeSpec SET OpenedCamCount=8 WHERE ID in (2,3)

Update MemberTypeSpec SET FriendsCount=500 WHERE ID=1
Update MemberTypeSpec SET FriendsCount=1000 WHERE ID in (2,3)

Update MemberTypeSpec SET CanOpenFullRoom=1 WHERE ID in (2,3)
Update MemberTypeSpec SET IsMemberOfConnectionClup=1 WHERE ID in (2,3)
Update MemberTypeSpec SET MailSize=1024 WHERE ID in (2,3)

Update MemberTypeSpec SET Color='#ff00fe' Where ID=2
Update MemberTypeSpec SET Color='#880088' Where ID=3

Update MemberTypeSpec SET Name=N'أرجوانى فاتح' Where ID=2
Update MemberTypeSpec SET Name=N'أرجوانى غامق' Where ID=3
select * from MemberTypeSpec
IF EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'Price' AND [object_id] = OBJECT_ID(N'MemberTypeSpecDuration'))
BEGIN
    ALTER TABLE MemberTypeSpecDuration DROP COLUMN Price
    
END
IF NOT EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'Points' AND [object_id] = OBJECT_ID(N'MemberTypeSpecDuration'))
BEGIN
	ALTER TABLE MemberTypeSpecDuration Add Points INT    
END

UPDATE MemberTypeSpecDuration
SET Points=300 WHERE MemberTypeSpecID IN (2,3) AND TypeDurationID=1
UPDATE MemberTypeSpecDuration
SET Points=1200 WHERE MemberTypeSpecID IN (2,3) AND TypeDurationID=2
UPDATE MemberTypeSpecDuration
SET Points=2100 WHERE MemberTypeSpecID IN (2,3) AND TypeDurationID=3
GO
ALTER PROCEDURE [dbo].[proc_MemberTypeSpecDurationInsert]
(
	@ID int = NULL output,
	@MemberTypeSpecID int,
	@TypeDurationID int = NULL,
	@Points INT
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberTypeSpecDuration]
	(
		[MemberTypeSpecID],
		[TypeDurationID],
		[Points]
	)
	VALUES
	(
		@MemberTypeSpecID,
		@TypeDurationID,
		@Points
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO

ALTER PROCEDURE [dbo].[proc_MemberTypeSpecDurationLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberTypeSpecID],
		[TypeDurationID],
		[Points]
	FROM [MemberTypeSpecDuration]

	SET @Err = @@Error

	RETURN @Err
END
GO

ALTER PROCEDURE [dbo].[proc_MemberTypeSpecDurationLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberTypeSpecID],
		[TypeDurationID],
		[Points]
	FROM [MemberTypeSpecDuration]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO

ALTER PROCEDURE [dbo].[proc_MemberTypeSpecDurationUpdate]
(
	@ID int,
	@MemberTypeSpecID int,
	@TypeDurationID int = NULL,
	@Points INT
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MemberTypeSpecDuration]
	SET
		[MemberTypeSpecID] = @MemberTypeSpecID,
		[TypeDurationID] = @TypeDurationID,
		[Points] = @Points
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO