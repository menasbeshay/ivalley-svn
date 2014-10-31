
IF NOT EXISTS(SELECT * FROM MemberTypeSpec WHERE ID=5)
BEGIN
SET IDENTITY_INSERT MemberTypeSpec ON
INSERT INTO MemberTypeSpec(ID,Name,Color,OpenRoomCount,OpenedCamCount,FriendsCount,MailSize,CreatePrivateRoomCount,CreateTempRoomCount,CanOpenFullRoom,IsMemberOfConnectionClup)
SELECT 5,N'أحمر','#F00',OpenRoomCount,OpenedCamCount,FriendsCount,MailSize,CreatePrivateRoomCount,CreateTempRoomCount,CanOpenFullRoom,IsMemberOfConnectionClup FROM MemberTypeSpec WHERE ID=4
SET IDENTITY_INSERT MemberTypeSpec OFF

INSERT INTO MemberTypeSpecDuration (MemberTypeSpecID,TypeDurationID,Points) VALUES(5,1,0)
END

IF NOT EXISTS(SELECT * FROM RoomTypeSpec WHERE ID=5)
BEGIN
SET IDENTITY_INSERT RoomTypeSpec ON
INSERT INTO RoomTypeSpec(ID,Name,Color,OrderInRoomList,MicCount,MicQuality,CamQuality,ExtraMembersCount)
SELECT 5,N'أحمر','#F00',OrderInRoomList,MicCount,MicQuality,CamQuality,ExtraMembersCount FROM RoomTypeSpec WHERE ID=4
SET IDENTITY_INSERT RoomTypeSpec OFF

INSERT INTO RoomTypeSpecDuration (RoomTypeSpecID,TypeDurationID,OpenMemberCount,Points) VALUES(5,1,1000,0)
END