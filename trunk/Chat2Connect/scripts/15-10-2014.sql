UPDATE MemberTypeSpecDuration SET Points=2000 WHERE MemberTypeSpecID=4
UPDATE MemberTypeSpecDuration SET Points=3500 WHERE MemberTypeSpecID=4

CREATE PROCEDURE proc_TypesValidate
AS
BEGIN
		
	UPDATE Member SET RowStatusID=3 --disable
	FROM Member	
	INNER JOIN MemberType ON Member.MemberID=MemberType.MemberID
	INNER JOIN MemberTypeSpecDuration ON MemberType.MemberTypeSpecDurationID=MemberTypeSpecDuration.ID
	WHERE MemberTypeSpecID=4 AND EndDate<GETDATE()
	
	UPDATE Room SET RowStatusID=3 --disable
	FROM Room	
	INNER JOIN RoomType ON Room.RoomID=RoomType.RoomID
	INNER JOIN RoomTypeSpecDuration ON RoomType.RoomTypeSpecDurationID=RoomTypeSpecDuration.ID
	WHERE RoomTypeSpecID=4 AND EndDate<GETDATE()
	
	DELETE FROM MemberType
	WHERE EndDate<GETDATE()
	
	DELETE FROM RoomType
	WHERE EndDate<GETDATE()
END
GO

SET IDENTITY_INSERT RoomTypeSpec ON;
GO
INSERT INTO RoomTypeSpec (ID,Name,Color,OrderInRoomList,MicCount,MicQuality,CamQuality,ExtraMembersCount)
	VALUES(4,N'مميز','#DBDB4D',0,4,N'صوت نقى',N'رؤية مباشرة',20)
SET IDENTITY_INSERT RoomTypeSpec OFF;
GO

INSERT INTO RoomTypeSpecDuration(RoomTypeSpecID,TypeDurationID,OpenMemberCount,Points)
	VALUES (4,2,2000,8000)
INSERT INTO RoomTypeSpecDuration(RoomTypeSpecID,TypeDurationID,OpenMemberCount,Points)
	VALUES (4,3,2000,15000)
