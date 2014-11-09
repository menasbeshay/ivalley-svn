If Exists (select Name 
		   from sysobjects 
		   where name = 'GetVIPMembersReport' and
		        xtype = 'P')
Drop Procedure GetVIPMembersReport 
Go
Create Procedure GetVIPMembersReport @StartDate DateTime = null ,
									 @EndDate DateTime = null
as

select M.Name, TS.Name TypeName, MT.StartDate, MT.EndDate, Created.Name createdby 
from Member M
inner join MemberType MT on m.MemberID = mt.MemberID and 
							not(mt.oldname is null)  -- special account
Inner join Member Created on mt.CreateBy = Created.MemberID
inner join MemberTypeSpecDuration SD on MT.MemberTypeSpecDurationID = SD.ID
Inner join MemberTypeSpec TS on SD.MemberTypeSpecID = TS.ID
 WHERE	( @StartDate IS NULL OR MT.StartDate >=@StartDate ) AND 
		( @EndDate IS NULL Or MT.StartDate <=@EndDate )  

GO

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetVIPRoomsReport' and
		        xtype = 'P')
Drop Procedure GetVIPRoomsReport 
Go
Create Procedure GetVIPRoomsReport @StartDate DateTime = null ,
								   @EndDate DateTime = null
as

select M.Name, TS.Name TypeName, MT.StartDate, MT.EndDate, Created.Name createdby 
from Room M
inner join RoomType MT on m.RoomID = mt.RoomID and 
							not(mt.oldname is null)  -- special account
Inner join Member Created on mt.CreateBy = Created.MemberID
inner join RoomTypeSpecDuration SD on MT.RoomTypeSpecDurationID = SD.ID
Inner join RoomTypeSpec TS on SD.RoomTypeSpecID = TS.ID
 WHERE	( @StartDate IS NULL OR MT.StartDate >=@StartDate ) AND 
		( @EndDate IS NULL Or MT.StartDate <=@EndDate )  