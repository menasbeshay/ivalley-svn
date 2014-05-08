
alter table RoomMember
add InRoom bit 


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetOnlineMembersByRoomID' and
		        xtype = 'P')
Drop Procedure GetOnlineMembersByRoomID
Go
Create Procedure GetOnlineMembersByRoomID @RoomID int
as

select RM.* , M.*
from RoomMember RM
Inner Join Member M on RM.MemberId = M.MemberID
where RM.RoomID = @RoomID and 
	  M.IsOnline = 1 and 
	  Rm.InRoom = 1
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMembersByRoomID' and
		        xtype = 'P')
Drop Procedure GetAllMembersByRoomID
Go
Create Procedure GetAllMembersByRoomID @RoomID int
as

select RM.* , M.*
from RoomMember RM
Inner Join Member M on RM.MemberId = M.MemberID
where RM.RoomID = @RoomID 
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMembersByRoomIDNoQueue' and
		        xtype = 'P')
Drop Procedure GetAllMembersByRoomIDNoQueue
Go
Create Procedure GetAllMembersByRoomIDNoQueue @RoomID int
as

select RM.* , M.*
from RoomMember RM
Inner Join Member M on RM.MemberId = M.MemberID
where RM.RoomID = @RoomID And 
	  RM.QueueOrder is null and 
	  M.IsOnline = 1 and 
	  Rm.InRoom = 1
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMembersByRoomIDQueue' and
		        xtype = 'P')
Drop Procedure GetAllMembersByRoomIDQueue
Go
Create Procedure GetAllMembersByRoomIDQueue @RoomID int
as

select RM.* , M.*
from RoomMember RM
Inner Join Member M on RM.MemberId = M.MemberID
where RM.RoomID = @RoomID And 
	  RM.QueueOrder is not null and 
	  M.IsOnline = 1 and 
	  Rm.InRoom = 1
order by RM.QueueOrder	  
Go
