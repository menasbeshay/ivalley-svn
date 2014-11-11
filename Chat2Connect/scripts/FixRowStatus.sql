If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMemberFriendsByStatus' and
		        xtype = 'P')
Drop Procedure GetMemberFriendsByStatus 
Go
 CREATE PROCEDURE GetMemberFriendsByStatus @MemberID int ,  
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
   F.IsOnline = @Status and 
   F.RowStatusID = 1
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
   (F.IsOnline = @Status or F.Isonline is null or F.Isonline = 0 ) and 
   F.RowStatusID = 1  
end

Go 

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchMembers' and
		        xtype = 'P')
Drop Procedure SearchMembers 
Go
 CREATE PROCEDURE SearchMembers @query nvarchar(50)  
as  
  
select *   
from Member M   
Inner join dbo.aspnet_Users U on M.UserID = U.UserID  
where U.UserName like N'%' + @query + N'%' and
	  M.RowStatusID = 1
	  
	  
Go 

If Exists (select Name 
		   from sysobjects 
		   where name = 'Proc_AddFriends_SearchMembers' and
		        xtype = 'P')
Drop Procedure Proc_AddFriends_SearchMembers 
Go
Create Procedure Proc_AddFriends_SearchMembers @Email nvarchar(256),    
              @UserName nvarchar(256),    
              @MemberID int    
                
as    
    
select M.MemberID, U.UserName , Mem.Email, isnull(M.ProfilePic,'/images/defaultavatar.png') ProfilePic , count(MF.FriendID) FriendsCount    
from Member M     
Inner join dbo.aspnet_Users U on M.UserID = U.UserID    
Inner join dbo.aspnet_Membership Mem on U.UserID = Mem.UserID    
Left join MemberSetting MS on M.MemberID = MS.MemberID     
left Join MemberFriend MF on M.MemberID = MF.MemberID    
where M.MemberID not in (select FriendID from MemberFriend where MemberId = @MemberID) and     
   (U.UserName like @UserName + N'%'  OR     
   Mem.Email like @Email + N'%' ) and     
   (Ms.SearchMeByMail = 1 OR Ms.SearchMeByMail is null) and     
   M.MemberId <> @MemberID  and 
   M.RowStatusID = 1  
Group by M.MemberId, U.UserName , Mem.Email, M.ProfilePic       
Order by U.UserName 


  
Go 

If Exists (select Name 
		   from sysobjects 
		   where name = 'Proc_SearchMembersByMail' and
		        xtype = 'P')
Drop Procedure Proc_SearchMembersByMail 
Go   
  
 CREATE PROCEDURE Proc_SearchMembersByMail @Email nvarchar(256)  
              
as  
  
select M.MemberID, U.UserName , Mem.Email, isnull(M.ProfilePic,'/images/defaultavatar.png') ProfilePic , Mem.UserID, M.Answer  
from Member M   
Inner join dbo.aspnet_Users U on M.UserID = U.UserID  
Inner join dbo.aspnet_Membership Mem on U.UserID = Mem.UserID  
where Mem.Email = @Email and
	  M.RowStatusID = 1  
Order by U.UserName


Go 

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchMembersExceptFriends' and
		        xtype = 'P')
Drop Procedure SearchMembersExceptFriends 
Go

 CREATE PROCEDURE SearchMembersExceptFriends @query nvarchar(50),  
           @MemberID int  
as  
  
select *   
from Member M   
Inner join dbo.aspnet_Users U on M.UserID = U.UserID  
where U.UserName like N'%' + @query + N'%'  
   and MemberID <> @MemberID  and
   M.RowStatusID =1 
   and M.MemberID not in (Select FriendID  
        from MemberFriend where MemberID = @MemberID)
        

Go 

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchMembersFriends' and
		        xtype = 'P')
Drop Procedure SearchMembersFriends 
Go
 CREATE PROCEDURE SearchMembersFriends @query nvarchar(50),  
           @MemberID int  
as  
  
select M.MemberID, M.UserID, M.IsOnLine, M.Name MemberName, M.Credit_Point, M.Credit_Money, M.PicPath, M.BirthDate, M.ReligionID, M.CountryID, M.JobTitle, M.Interests, M.BestTeam, M.BestFood, M.BestCar, M.BestCounrty, M.MoreData, M.MemberStatus, M.MemberTypeExpiryDate, M.ProfilePic, M.likeCount, M.StatusMsg, M.Answer, M.Religion, M.fbURL, M.tURL, M.ytURL, M.Status, M.IP, M.RowStatusID, U.UserName Name  
from Member M   
Inner join dbo.aspnet_Users U on M.UserID = U.UserID  
where U.UserName like N'%' + @query + N'%'  
   and MemberID <> @MemberID and
   M.RowStatusID = 1 
   and M.MemberID in (Select FriendID  
        from MemberFriend where MemberID = @MemberID)


Go 

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMemberFriends' and
		        xtype = 'P')
Drop Procedure GetAllMemberFriends 
Go

  
 CREATE PROCEDURE GetAllMemberFriends @MemberID int       
as      
select MF.*, I.Name MemberName  , U.UserName    
from MemberFriend MF      
Inner Join Member M on MF.MemberID = M.MemberID      
Inner Join Member I on MF.FriendID = I.MemberID     
Inner join dbo.aspnet_Users U on I.UserID = U.UserID       
where M.MemberID = @MemberID  and
	  I.RowStatusID = 1
	   
 
Go 

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMemberOnlineFriends' and
		        xtype = 'P')
Drop Procedure GetAllMemberOnlineFriends 
Go

    
 CREATE PROCEDURE GetAllMemberOnlineFriends @MemberID int       
as      
select MF.*, I.Name MemberName  , U.UserName    
from MemberFriend MF      
Inner Join Member M on MF.MemberID = M.MemberID      
Inner Join Member I on MF.FriendID = I.MemberID     
Inner join dbo.aspnet_Users U on I.UserID = U.UserID       
where M.MemberID = @MemberID and  
      I.IsOnLine = 1 and
      I.RowStatusID = 1     
     
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMemberFriendsAndMember' and
		        xtype = 'P')
Drop Procedure GetAllMemberFriendsAndMember 
Go

 CREATE PROCEDURE GetAllMemberFriendsAndMember @MemberID int   
as  
  
Select 0 MemberFriendID, M.MemberID , M.MemberID FriendID, 0 FriendGroupID, M.Name MemberName  
From Member M  
Where M.MemberId = @MemberID  
  
Union   
  
select MF.*, I.Name MemberName  
from MemberFriend MF  
Inner Join Member M on MF.MemberID = M.MemberID   
Inner Join Member I on MF.FriendID = I.MemberID   
where M.MemberID = @MemberID and
	  I.RowStatusID= 1
	  
    
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMembersByRoomID' and
		        xtype = 'P')
Drop Procedure GetAllMembersByRoomID 
Go
 CREATE PROCEDURE GetAllMembersByRoomID @RoomID int  
as  
  
select RM.* , M.*  
from RoomMember RM  
Inner Join Member M on RM.MemberId = M.MemberID  
where RM.RoomID = @RoomID and 
	  M.RowStatusID = 1

Go