
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
	  U.UserName like N'%' + @UserName + N'%' and 
	  Mem.Email like N'%' + @Email + N'%' and 
	  (Ms.SearchMeByMail = 1 OR Ms.SearchMeByMail is null) and 
	  M.MemberId <> @MemberID
Group by M.MemberId, U.UserName , Mem.Email, M.ProfilePic	  
Order by U.UserName
Go


alter table member 
add IsMailActivated bit ,
add ActivationCode uniqueidentifier 


If Exists (select Name 
		   from sysobjects 
		   where name = 'Proc_SearchMembersByMail' and
		        xtype = 'P')
Drop Procedure Proc_SearchMembersByMail
Go
Create Procedure Proc_SearchMembersByMail @Email nvarchar(256)
												
as

select M.MemberID, U.UserName , Mem.Email, isnull(M.ProfilePic,'/images/defaultavatar.png') ProfilePic 
from Member M 
Inner join dbo.aspnet_Users U on M.UserID = U.UserID
Inner join dbo.aspnet_Membership Mem on U.UserID = Mem.UserID
where Mem.Email = @Email 
Order by U.UserName
Go

Proc_SearchMembersByMail 'mena.samy@gmail.com'