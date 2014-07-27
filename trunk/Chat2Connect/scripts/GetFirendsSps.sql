
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMemberFriendsByStatus' and
		        xtype = 'P')
Drop Procedure GetMemberFriendsByStatus 
Go
Create Procedure GetMemberFriendsByStatus @MemberID int ,
										  @Status bit
as
If (@Status = 1)
begin
select F.*, MTSpec.MemberTypeSpecID MemberTypeID, aspnet_Users.UserName
from MemberFriend MF
Inner Join Member M on MF.MemberID = M.MemberID 
Inner Join Member F on MF.FriendID = F.MemberID 
Inner Join aspnet_Users on F.UserID = aspnet_Users.UserID
Left Join MemberType T on F.MemberID = T.MemberID
LEFT JOIN MemberTypeSpecDuration MTSpec ON MTSpec.ID=ISNULL(T.MemberTypeSpecDurationID,1) 

where M.MemberID = @MemberID and 
	  F.IsOnline = @Status
End
else 
begin 
select F.*, MTSpec.MemberTypeSpecID MemberTypeID, aspnet_Users.UserName
from MemberFriend MF
Inner Join Member M on MF.MemberID = M.MemberID 
Inner Join Member F on MF.FriendID = F.MemberID 
Inner Join aspnet_Users on F.UserID = aspnet_Users.UserID
Left Join MemberType T on F.MemberID = T.MemberID
LEFT JOIN MemberTypeSpecDuration MTSpec ON MTSpec.ID=ISNULL(T.MemberTypeSpecDurationID,1) 
where M.MemberID = @MemberID and 
	  (F.IsOnline = @Status or F.Isonline is null or F.Isonline = 0 )
end 
Go