
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


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetItemsByItemGroupID' and
		        xtype = 'P')
Drop Procedure GetItemsByItemGroupID
Go
Create Procedure GetItemsByItemGroupID @ItemGroupID int
as

select I.* 
from ItemGroups G
Inner JOIN Items I ON G.ItemGroupID = I.GroupID
where I.GroupID = @ItemGroupID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchItems' and
		        xtype = 'P')
Drop Procedure SearchItems
Go
Create Procedure SearchItems @FilterText nvarchar(100),
							 @ItemGroupID int 
as

select I.* 
from ItemGroups G
Inner JOIN Items I ON G.ItemGroupID = I.GroupID
where I.GroupID = @ItemGroupID and 
	  (ISNULL(@FilterText,'') = '' OR I.Name LIKE N'%' + @FilterText + N'%' OR I.ItemCode Like N'%' + @FilterText + N'%')
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCitiesByLineID' and
		        xtype = 'P')
Drop Procedure GetCitiesByLineID
Go
Create Procedure GetCitiesByLineID @LineID int
as

select C.* 
from Cities C
Inner JOIN Lines L ON C.LineID = L.LineID
where C.LineID = @LineID
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPricesByItemID' and
		        xtype = 'P')
Drop Procedure GetPricesByItemID
Go
Create Procedure GetPricesByItemID @ItemID int
as

select P.* , T.Name TypeName
from ItemPrices P
Inner JOIN Items I ON P.ItemID = I.ItemID
Inner JOIN ClientTypes T ON P.ClientTypeID = T.ClientTypeID
where I.ItemID = @ItemID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSuppliersByItemID' and
		        xtype = 'P')
Drop Procedure GetSuppliersByItemID
Go
Create Procedure GetSuppliersByItemID @ItemID int
as

select ss.* , S.Name SuppName
from ItemSuppliers ss
Inner JOIN Items I ON ss.ItemID = I.ItemID
Inner JOIN Suppliers S ON S.SupplierID = ss.SupplierID
where I.ItemID = @ItemID
Go
