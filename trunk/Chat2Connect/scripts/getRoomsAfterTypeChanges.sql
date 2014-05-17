

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

