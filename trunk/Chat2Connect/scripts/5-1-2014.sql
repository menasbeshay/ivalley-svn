 alter PROCEDURE [dbo].[GetSubCategoryByCategoryID] @CategoryID int  
as  
  
select CR.SubCategoryID, CR.CategoryID, CR.Name, CR.IconPath, Count(R.RoomID) RoomCount  
from SubCategory CR  
Inner JOIN Category C ON CR.CategoryID = C.CategoryID  
left join Room R on CR.SubCategoryID = R.SubCategoryID
where C.CategoryID = @CategoryID and (R.RowStatusID = 1 Or R.RowStatusID is null)
group by CR.SubCategoryID, CR.CategoryID, CR.Name, CR.IconPath