Alter table MemberFriend
ADD CONSTRAINT FriendOnce UNIQUE (MemberID,FriendID)

alter table RoomMessages
add MemberLevel int