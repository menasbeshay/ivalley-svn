
If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchMembersFriends' and
		        xtype = 'P')
Drop Procedure SearchMembersFriends
Go
Create Procedure SearchMembersFriends @query nvarchar(50),
											@MemberID int
as

select M.MemberID, M.UserID, M.IsOnLine, M.Name MemberName, M.Credit_Point, M.Credit_Money, M.PicPath, M.BirthDate, M.ReligionID, M.CountryID, M.JobTitle, M.Interests, M.BestTeam, M.BestFood, M.BestCar, M.BestCounrty, M.MoreData, M.MemberStatus, M.MemberTypeExpiryDate, M.ProfilePic, M.likeCount, M.StatusMsg, M.Answer, M.Religion, M.fbURL, M.tURL, M.ytURL, M.Status, M.IP, M.RowStatusID, U.UserName Name
from Member M 
Inner join dbo.aspnet_Users U on M.UserID = U.UserID
where U.UserName like N'%' + @query + N'%'
	  and MemberID <> @MemberID
	  and M.MemberID in (Select FriendID
							 from MemberFriend where MemberID = @MemberID)
							 
Go
