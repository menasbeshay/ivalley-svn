

ALTER Procedure [dbo].[GetFavRoomsByCreatorID] @CreatedBy int
as

select R.* , C.Name CategoryName , SC.Name SubCategoryName
from Room R
LEFT JOIN RoomType on RoomType.RoomID=R.RoomID
LEFT Join RoomTypeSpecDuration ON RoomTypeSpecDuration.ID=RoomType.RoomTypeSpecDurationID
LEFT JOIN RoomTypeSpec ON RoomTypeSpec.ID=RoomTypeSpecDuration.RoomTypeSpecID
Left JOIN Category C ON R.CategoryID = C.CategoryID
Left JOIN SubCategory SC ON R.SubCategoryID = SC.SubCategoryID
Inner Join FavRoom F on F.RoomID = R.RoomID 
where F.MemberID = @CreatedBy
order by ISNULL(RoomTypeSpec.OrderInRoomList,10000) ASC , R.Name Asc

GO
ALTER Procedure [dbo].[GetChatRoomsByCreatorID] @CreatedBy int
as

select R.* , C.Name CategoryName , SC.Name SubCategoryName
from Room R
LEFT JOIN RoomType on RoomType.RoomID=R.RoomID
LEFT Join RoomTypeSpecDuration ON RoomTypeSpecDuration.ID=RoomType.RoomTypeSpecDurationID
LEFT JOIN RoomTypeSpec ON RoomTypeSpec.ID=RoomTypeSpecDuration.RoomTypeSpecID
Left JOIN Category C ON R.CategoryID = C.CategoryID
Left JOIN SubCategory SC ON R.SubCategoryID = SC.SubCategoryID
where R.CreatedBy = @CreatedBy 
order by ISNULL(RoomTypeSpec.OrderInRoomList,10000) ASC , R.Name Asc



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetChatRoomsByCategoryID' and
		        xtype = 'P')
Drop Procedure GetChatRoomsByCategoryID
Go
Create Procedure GetChatRoomsByCategoryID @CategoryID int
as

select R.* , count(RM.MemberID) MemberCount
from Room R
LEFT JOIN RoomType on RoomType.RoomID=R.RoomID
LEFT Join RoomTypeSpecDuration ON RoomTypeSpecDuration.ID=RoomType.RoomTypeSpecDurationID
LEFT JOIN RoomTypeSpec ON RoomTypeSpec.ID=RoomTypeSpecDuration.RoomTypeSpecID
Left JOIN Category C ON R.CategoryID = C.CategoryID
Left Join RoomMember RM on RM.RoomID = R.RoomID
Left join Member M on M.MemberID = RM.MemberID
where R.CategoryID = @CategoryID /*and 
	  M.IsOnline = 1*/
Group By  R.RoomID,  R.CategoryID,  R.SubCategoryID,  R.Name,  R.IconPath,   R.CreatedDate,  R.WelcomeText,  R.RoomPassword,  R.RoomPasswordenabled,  R.EnableCam,  R.EnableMic,  R.EnableMicForAdminsOnly,  R.MarkOnLoginWithWrite,  R.MarkOnLoginWithoutWrite,  R.CreatedBy,  R.EnableOneMic,  R.EnableTwoMic,  R.EnableThreeMic,  R.RoomAdminPassword, R.RowStatusID, R.OpenCams
order by R.Name Asc
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetChatRoomsBySubCategoryID' and
		        xtype = 'P')
Drop Procedure GetChatRoomsBySubCategoryID
Go
Create Procedure GetChatRoomsBySubCategoryID @SubCategoryID int
as

select R.* , count(RM.MemberID) MemberCount
from Room R
LEFT JOIN RoomType on RoomType.RoomID=R.RoomID
LEFT Join RoomTypeSpecDuration ON RoomTypeSpecDuration.ID=RoomType.RoomTypeSpecDurationID
LEFT JOIN RoomTypeSpec ON RoomTypeSpec.ID=RoomTypeSpecDuration.RoomTypeSpecID
Left JOIN Category C ON R.CategoryID = C.CategoryID
Left JOIN SubCategory SC ON R.SubCategoryID = SC.SubCategoryID
Left Join RoomMember RM on RM.RoomID = R.RoomID
Left join Member M on M.MemberID = RM.MemberID
where R.SubCategoryID = @SubCategoryID /*and 
	  M.IsOnline = 1*/
Group By  R.RoomID,  R.CategoryID,  R.SubCategoryID,  R.Name,  R.IconPath,   R.CreatedDate,  R.WelcomeText,  R.RoomPassword,  R.RoomPasswordenabled,  R.EnableCam,  R.EnableMic,  R.EnableMicForAdminsOnly,  R.MarkOnLoginWithWrite,  R.MarkOnLoginWithoutWrite,  R.CreatedBy,  R.EnableOneMic,  R.EnableTwoMic,  R.EnableThreeMic,  R.RoomAdminPassword, R.RowStatusID, R.OpenCams
order by R.Name Asc
Go




