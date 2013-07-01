
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetItemGroupsByCategoryID' and
		        xtype = 'P')
Drop Procedure GetItemGroupsByCategoryID
Go
Create Procedure GetItemGroupsByCategoryID @CategoryID int
as

select G.* 
from ItemGroups G
Inner JOIN ItemCategories C ON G.ItemCategoryID = C.ItemCategoryID
where C.ItemCategoryID = @CategoryID
Go
