
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



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetLastDeliveryOrderNo' and
		        xtype = 'P')
Drop Procedure GetLastDeliveryOrderNo
Go
Create Procedure GetLastDeliveryOrderNo 
as

select DeliveryOrderNo
from DeliveryOrder
order BY DeliveryOrderNo desc
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllDeliveryOrders' and
		        xtype = 'P')
Drop Procedure GetAllDeliveryOrders
Go
Create Procedure GetAllDeliveryOrders 
as

select D.* , C.Name ClientName , E.Name EmployeeName
from DeliveryOrder D
Inner JOIN Clients C ON D.ClientID = C.ClientID
inner JOIN Employees E ON D.EmployeeID = E.EmployeeID
order BY DeliveryOrderDate desc
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllClients' and
		        xtype = 'P')
Drop Procedure GetAllClients
Go
Create Procedure GetAllClients 
as

select C.* , T.Name ClientTypeName
from Clients C 
inner JOIN ClientTypes T ON C.ClientTypeID = T.ClientTypeID
order BY C.Name
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetDeliveryOrderDetails' and
		        xtype = 'P')
Drop Procedure GetDeliveryOrderDetails
Go
Create Procedure GetDeliveryOrderDetails @DeliveryOrderID int
as

select de.* , I.Name ItemName , I.ItemCode ItemCode 
from DeliveryOrder D
Inner JOIN DeliveryOrderDetails de ON D.DeliveryOrderID = de.DeliveryOrderID
inner JOIN Items I ON de.ItemID = I.ItemID
where D.DeliveryOrderID = @DeliveryOrderID
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetDeliveryOrderTotals' and
		        xtype = 'P')
Drop Procedure GetDeliveryOrderTotals
Go
Create Procedure GetDeliveryOrderTotals @DeliveryOrderID int
as

SELECT sum(Quantity * itemprice) - sum(Quantity * itemprice) * isnull(D.discount/100, 0 )  total from 
DeliveryOrderDetails DD
inner JOIN DeliveryOrder D ON D.DeliveryOrderID = DD.DeliveryOrderID
where D.DeliveryOrderID = @DeliveryOrderID
GROUP by D.Discount

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetInvoiceDetails' and
		        xtype = 'P')
Drop Procedure GetInvoiceDetails
Go
Create Procedure GetInvoiceDetails @InvoiceID int
as

select de.* , I.Name ItemName , I.ItemCode ItemCode 
from Invoices D
Inner JOIN InvoiceDetails de ON D.InvoiceID = de.InvoiceID
inner JOIN Items I ON de.ItemID = I.ItemID
where D.InvoiceID = @InvoiceID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetInvoiceTotals' and
		        xtype = 'P')
Drop Procedure GetInvoiceTotals
Go
Create Procedure GetInvoiceTotals @InvoiceID int
as

SELECT sum(Quantity * itemprice) - sum(Quantity * itemprice) * isnull(D.discount/100, 0 )  total from 
InvoiceDetails DD
inner JOIN Invoices D ON D.InvoiceID = DD.InvoiceID
where D.InvoiceID = @InvoiceID
GROUP by D.Discount

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetLastInvoiceNo' and
		        xtype = 'P')
Drop Procedure GetLastInvoiceNo
Go
Create Procedure GetLastInvoiceNo 
as

select InvoiceNo
from Invoices
order BY InvoiceNo desc
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllInvoices' and
		        xtype = 'P')
Drop Procedure GetAllInvoices
Go
Create Procedure GetAllInvoices 
as

select D.* , C.Name ClientName , E.Name EmployeeName
from Invoices D
Inner JOIN Clients C ON D.ClientID = C.ClientID
inner JOIN Employees E ON D.EmployeeID = E.EmployeeID
order BY InvoiceDate desc
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetDeliveryOrdersDetailsTotals' and
		        xtype = 'P')
Drop Procedure GetDeliveryOrdersDetailsTotals
Go
Create Procedure GetDeliveryOrdersDetailsTotals		 nvarchar(10),
												@DeliveryOrderNoTo nvarchar(10)
as

select /*de.* ,*/ sum(de.Quantity) Number, I.Name ItemName , I.ItemCode ItemCode /*, D.DeliveryOrderNo*/
from DeliveryOrder D
Inner JOIN DeliveryOrderDetails de ON D.DeliveryOrderID = de.DeliveryOrderID
inner JOIN Items I ON de.ItemID = I.ItemID

where D.DeliveryOrderNo >= @DeliveryOrderNoFrom And
	  D.DeliveryOrderNo <= @DeliveryOrderNoTo
Group BY I.Name , I.ItemCode 	  
Go

/*
exec GetDeliveryOrdersDetailsTotals	'3000010001' , '3000010003'
*/

If Exists (select Name 
		   from sysobjects 
		   where name = 'GenerateItemCode' and
		        xtype = 'P')
Drop Procedure GenerateItemCode
Go
Create Procedure GenerateItemCode @ItemGroupID int 
as
declare @LastItemID int ,
		@NewItemCode nvarchar(15)

select @LastItemID = isnull(max(ItemID),0) + 1
From Items

Select @NewItemCode =  left(convert(varchar(10), @ItemGroupID) + '00000', 3) + 
					   left(convert(varchar(10), @LastItemID) + '000000', 4)

Select @NewItemCode				   
					 					    
--return @NewItemCode

Go

exec GenerateItemCode 2