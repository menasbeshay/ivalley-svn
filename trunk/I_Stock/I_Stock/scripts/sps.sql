
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
		   where name = 'GetAllClientsByClientTypeID' and
		        xtype = 'P')
Drop Procedure GetAllClientsByClientTypeID
Go
Create Procedure GetAllClientsByClientTypeID @ClientTypeID int = 0 
as

select C.* , T.Name ClientTypeName
from Clients C 
inner JOIN ClientTypes T ON C.ClientTypeID = T.ClientTypeID
Where (@ClientTypeID = 0 OR C.ClientTypeID = @ClientTypeID)
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

select de.* , I.Name ItemName , I.ItemCode ItemCode , C.ReturnNo
from DeliveryOrder D
Inner JOIN DeliveryOrderDetails de ON D.DeliveryOrderID = de.DeliveryOrderID
inner JOIN Items I ON de.ItemID = I.ItemID
Left Join ClientReturns C on C.DeliveryOrderID = D.DeliveryOrderID
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
		   where name = 'GetDeliveryOrderInvoice' and
		        xtype = 'P')
Drop Procedure GetDeliveryOrderInvoice
Go
Create Procedure GetDeliveryOrderInvoice @DeliveryOrderID int
as

select * 
from Invoices I
where I.DeliveryOrderID = @DeliveryOrderID
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
Create Procedure GetDeliveryOrdersDetailsTotals @DeliveryOrderNoFrom nvarchar(10),
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
		   where name = 'GetLastPaymentNo' and
		        xtype = 'P')
Drop Procedure GetLastPaymentNo
Go
Create Procedure GetLastPaymentNo 
as

select PaymentNo
from Payments
order BY PaymentNo desc
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllPayments' and
		        xtype = 'P')
Drop Procedure GetAllPayments
Go
Create Procedure GetAllPayments 
as

select P.* , C.Name ClientName , E.Name EmployeeName
from Payments P
Inner JOIN Clients C ON P.ClientID = C.ClientID
inner JOIN Employees E ON P.EmployeeID = E.EmployeeID
order BY P.PaymentDate desc
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPurchaseOrderDetails' and
		        xtype = 'P')
Drop Procedure GetPurchaseOrderDetails
Go
Create Procedure GetPurchaseOrderDetails @PurchaseOrderID int
as

select de.* , I.Name ItemName , I.ItemCode ItemCode 
from PurchaseOrders P
Inner JOIN PurchaseOrderDetails de ON p.PurchaseOrderID = de.PurchaseOrderID
inner JOIN Items I ON de.ItemID = I.ItemID
where P.PurchaseOrderID = @PurchaseOrderID
Go




If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllPurchaseOrders' and
		        xtype = 'P')
Drop Procedure GetAllPurchaseOrders
Go
Create Procedure GetAllPurchaseOrders 
as

select D.* , C.Name SupplierName 
from PurchaseOrders D
Inner JOIN Suppliers C ON D.SupplierID = C.SupplierID
order BY PurchaseOrderDate desc
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPurchaseOrderTotals' and
		        xtype = 'P')
Drop Procedure GetPurchaseOrderTotals
Go
Create Procedure GetPurchaseOrderTotals @PurchaseOrderID int
as

SELECT sum(NoOfPackages * ItemOnPackages * PackagePrice) total from 
PurchaseOrderDetails DD
inner JOIN PurchaseOrders D ON D.PurchaseOrderID = DD.PurchaseOrderID
where D.PurchaseOrderID = @PurchaseOrderID

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetLastPurchaseOrderNo' and
		        xtype = 'P')
Drop Procedure GetLastPurchaseOrderNo
Go
Create Procedure GetLastPurchaseOrderNo 
as

select PurchaseOrderNo
from PurchaseOrders
order BY PurchaseOrderNo desc
Go

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




If Exists (select Name 
		   from sysobjects 
		   where name = 'GetClientReturnDetails' and
		        xtype = 'P')
Drop Procedure GetClientReturnDetails
Go
Create Procedure GetClientReturnDetails @ClientReturnID int
as

select de.* , I.Name ItemName , I.ItemCode ItemCode 
from ClientReturns D
Inner JOIN ClientReturnDetails de ON D.ClientReturnID = de.ClientReturnID
inner JOIN Items I ON de.ItemID = I.ItemID
where D.ClientReturnID = @ClientReturnID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetClientReturnTotals' and
		        xtype = 'P')
Drop Procedure GetClientReturnTotals
Go
Create Procedure GetClientReturnTotals @ClientReturnID int
as

SELECT sum(Quantity * itemprice) - sum(Quantity * itemprice) * isnull(D.discount/100, 0 )  total from 
ClientReturnDetails DD
inner JOIN ClientReturns D ON D.ClientReturnID = DD.ClientReturnID
where D.ClientReturnID = @ClientReturnID
GROUP by D.Discount

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetLastClientReturnNo' and
		        xtype = 'P')
Drop Procedure GetLastClientReturnNo
Go
Create Procedure GetLastClientReturnNo 
as

select ReturnNo 
from ClientReturns
order BY ReturnNo desc
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllClientReturns' and
		        xtype = 'P')
Drop Procedure GetAllClientReturns
Go
Create Procedure GetAllClientReturns 
as

select D.* , C.Name ClientName , E.Name EmployeeName
from ClientReturns D
Inner JOIN Clients C ON D.ClientID = C.ClientID
inner JOIN Employees E ON D.EmployeeID = E.EmployeeID
order BY ReturnDate desc
Go





If Exists (select Name 
		   from sysobjects 
		   where name = 'GetLastClientReturnForInvoice' and
		        xtype = 'P')
Drop Procedure GetLastClientReturnForInvoice
Go
Create Procedure GetLastClientReturnForInvoice @ClientID int
as

select top 1 *
from ClientReturns
where ClientID = @ClientID And InvoiceID is null
order BY ReturnDate desc
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetClientReturnByInvoiceID' and
		        xtype = 'P')
Drop Procedure GetClientReturnByInvoiceID
Go
Create Procedure GetClientReturnByInvoiceID @InvoiceID int
as

select top 1 *
from ClientReturns
where InvoiceID = @InvoiceID 
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetLastClientReturnForDeliveryOrder' and
		        xtype = 'P')
Drop Procedure GetLastClientReturnForDeliveryOrder
Go
Create Procedure GetLastClientReturnForDeliveryOrder @ClientID int
as

select top 1 *
from ClientReturns
where ClientID = @ClientID And DeliveryOrderID is null
order BY ReturnDate desc
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetClientReturnByDeliveryOrderID' and
		        xtype = 'P')
Drop Procedure GetClientReturnByDeliveryOrderID
Go
Create Procedure GetClientReturnByDeliveryOrderID @DeliveryOrderID int
as

select top 1 *
from ClientReturns
where DeliveryOrderID = @DeliveryOrderID 
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchItems_General' and
		        xtype = 'P')
Drop Procedure SearchItems_General
Go
Create Procedure SearchItems_General @FilterText nvarchar(100)		
							 
as

select I.* from Items I 
where (ISNULL(@FilterText,'') = '' OR I.Name LIKE N'%' + @FilterText + N'%' OR I.ItemCode Like N'%' + @FilterText + N'%') 
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchItems_GeneralAjax' and
		        xtype = 'P')
Drop Procedure SearchItems_GeneralAjax
Go
Create Procedure SearchItems_GeneralAjax @FilterText nvarchar(100),
										@ClientTypeID int
							 
as

select I.*, p.Price from Items I 
Left JOIN ItemPrices p ON I.ItemID = p.ItemID
where (ISNULL(@FilterText,'') = '' OR I.Name LIKE N'%' + @FilterText + N'%' OR I.ItemCode Like N'%' + @FilterText + N'%') and 
	  (isnull(@ClientTypeID, 0) = 0 OR  p.ClientTypeID = @ClientTypeID or p.ClientTypeID is null)
Go







If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_GetItemsBalances' and
		        xtype = 'P')
Drop Procedure Report_GetItemsBalances
Go
Create Procedure Report_GetItemsBalances @ItemID int
as

select I.* , C.Name ItemCategoryName , C.ItemCategoryID ItemCategoryID , G.Name ItemGroupName, G.ItemGroupID ItemGroupID
from Items I 
Inner JOIN ItemGroups G ON G.ItemGroupID = I.GroupID
Inner JOIN ItemCategories C ON G.ItemCategoryID = C.ItemCategoryID
where isnull(@ItemID,0) = 0 OR I.ItemID = @ItemID
order by C.ItemCategoryID , G.ItemGroupID
Go




If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_GetClientCredit' and
		        xtype = 'P')
Drop Procedure Report_GetClientCredit
Go
Create Procedure Report_GetClientCredit @ClientID int
as

select C.*, ct.Name TypeName, ci.Name CityName, L.Name LineName
from Clients C
Inner Join ClientTypes CT on C.ClientTypeID = CT.ClientTypeID
Inner Join Cities ci on c.CityID = ci.CityID
Inner Join Lines L on ci.LineID = L.LineID
where isnull(@ClientID,0) = 0 OR C.ClientID = @ClientID
Go




If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_DeliveryOrder' and
		        xtype = 'P')
Drop Procedure Report_DeliveryOrder
Go
Create Procedure Report_DeliveryOrder @DeliveryOrderID int
as

select D.*, C.Name ClientName , E.Name EmployeeName , R.ReturnNo, C.StartCredit
from DeliveryOrder D
Inner JOIN Clients C ON D.ClientID = C.ClientID
Inner Join Employees E on E.EmployeeID = D.EmployeeID
Left Join ClientReturns R on D.DeliveryOrderID = R.DeliveryOrderID
where D.DeliveryOrderID = @DeliveryOrderID
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_ClientReturn' and
		        xtype = 'P')
Drop Procedure Report_ClientReturn
Go
Create Procedure Report_ClientReturn @ClientReturnID int
as

select CR.*, C.Name ClientName , E.Name EmployeeName 
from ClientReturns CR
Inner JOIN Clients C ON CR.ClientID = C.ClientID
Inner Join Employees E on E.EmployeeID = CR.EmployeeID
where Cr.ClientReturnID = @ClientReturnID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_PurchaseOrder' and
		        xtype = 'P')
Drop Procedure Report_PurchaseOrder
Go
Create Procedure Report_PurchaseOrder @PurchaseOrderID int
as

select CR.*, C.Name ClientName  
from PurchaseOrders CR
Inner JOIN Suppliers C ON CR.SupplierID = C.SupplierID
where Cr.PurchaseOrderID = @PurchaseOrderID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_Payments' and
		        xtype = 'P')
Drop Procedure Report_Payments
Go
Create Procedure Report_Payments @PaymentID int
as

select P.*, C.Name ClientName , E.Name EmployeeName 
from Payments P
Inner JOIN Clients C ON P.ClientID = C.ClientID
Inner Join Employees E on E.EmployeeID = P.EmployeeID
where P.PaymentID = @PaymentID
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_ItemPrices' and
		        xtype = 'P')
Drop Procedure Report_ItemPrices
Go
Create Procedure Report_ItemPrices @ItemID int, 
								   @ClientTypeID int
as

select P.Price, P.ClientTypeID, P.ItemID, I.Name ItemName , I.ItemCode ItemCode, T.Name ClientTypeName
from Items I 
Left JOIN ItemPrices P ON P.ItemID = I.ItemID
Left Join ClientTypes T on T.ClientTypeID = P.ClientTypeID
where (T.ClientTypeID = @ClientTypeID ) and 
		(isnull(@ItemID,0) = 0 OR I.ItemID = @ItemID)
order by I.ItemCode		
Go
 
 
 
 
If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_GetDeliveryOrdersDetailsTotals' and
		        xtype = 'P')
Drop Procedure Report_GetDeliveryOrdersDetailsTotals
Go
Create Procedure Report_GetDeliveryOrdersDetailsTotals @DeliveryOrderNoFrom nvarchar(10) = null,
													   @DeliveryOrderNoTo nvarchar(10) = null
as

select D.DeliveryOrderNo, sum(de.Quantity) Number, I.Name ItemName , I.ItemCode ItemCode, C.Name ClientName /*, D.DeliveryOrderNo*/
from DeliveryOrder D
Inner Join Clients C on C.ClientID = D.ClientID
Inner JOIN DeliveryOrderDetails de ON D.DeliveryOrderID = de.DeliveryOrderID
inner JOIN Items I ON de.ItemID = I.ItemID

where (isnull(@DeliveryOrderNoFrom,'')= '' or D.DeliveryOrderNo >= @DeliveryOrderNoFrom) And
	  (isnull(@DeliveryOrderNoTo,'')= '' or  D.DeliveryOrderNo <= @DeliveryOrderNoTo)
Group BY I.Name , I.ItemCode , D.DeliveryOrderNo, C.Name
Order by D.DeliveryOrderNo asc
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_GetDeliveryOrdersDetailsTotalsWithinPeriod' and
		        xtype = 'P')
Drop Procedure Report_GetDeliveryOrdersDetailsTotalsWithinPeriod
Go
Create Procedure Report_GetDeliveryOrdersDetailsTotalsWithinPeriod @From DateTime = null,
																   @To DateTime = null
as

select D.DeliveryOrderNo,D.DeliveryOrderDate,  sum(de.Quantity * itemprice) - sum(de.Quantity * itemprice) * isnull(D.discount/100, 0 )  total,  C.Name ClientName /*, D.DeliveryOrderNo*/
from DeliveryOrder D
Inner Join Clients C on C.ClientID = D.ClientID
Inner JOIN DeliveryOrderDetails de ON D.DeliveryOrderID = de.DeliveryOrderID
inner JOIN Items I ON de.ItemID = I.ItemID

where (isNull(@From,cast('1900-01-01' as datetime)) <= D.DeliveryOrderDate) And
	  (isNull(@To,cast('3000-01-01' as datetime)) >= D.DeliveryOrderDate)
Group BY  D.DeliveryOrderNo, C.Name, D.discount, D.DeliveryOrderDate
Order by D.DeliveryOrderDate asc, D.DeliveryOrderNo asc
Go




If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_PaymentsWithinPeriod' and
		        xtype = 'P')
Drop Procedure Report_PaymentsWithinPeriod
Go
Create Procedure Report_PaymentsWithinPeriod @From DateTime = null,
											 @To DateTime = null
as

select P.*, C.Name ClientName , E.Name EmployeeName 
from Payments P
Inner JOIN Clients C ON P.ClientID = C.ClientID
Inner Join Employees E on E.EmployeeID = P.EmployeeID
where (isNull(@From,cast('1900-01-01' as datetime)) <= P.PaymentDate) And
	  (isNull(@To,cast('3000-01-01' as datetime)) >= P.PaymentDate)
Group BY  P.PaymentNo, C.Name, E.Name, P.PaymentDate, P.Amount, P.ClientID, P.PaymentID, P.EmployeeID, P.PaymentTypeID, P.Confirmed
Order by P.PaymentDate asc, P.PaymentNo asc
Go

exec Report_PaymentsWithinPeriod



If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_GetItemTranHistory' and
		        xtype = 'P')
Drop Procedure Report_GetItemTranHistory
Go
Create Procedure Report_GetItemTranHistory @From DateTime = null,
										   @To DateTime = null,
										   @ItemID int = 0 
as

select D.DeliveryOrderNo OrderNumber,D.DeliveryOrderDate OrderDate,  sum(de.Quantity) ItemTotal, I.Name ItemName , I.ItemCode ItemCode, C.Name ClientName ,I.ItemID , 1 as OrderType 
from DeliveryOrder D
Inner Join Clients C on C.ClientID = D.ClientID
Inner JOIN DeliveryOrderDetails de ON D.DeliveryOrderID = de.DeliveryOrderID
inner JOIN Items I ON de.ItemID = I.ItemID

where (isNull(@From,cast('1900-01-01' as datetime)) <= D.DeliveryOrderDate) And
	  (isNull(@To,cast('3000-01-01' as datetime)) >= D.DeliveryOrderDate) And 
	  (@ItemID = 0 Or I.ItemID = @ItemID)
Group BY I.Name , I.ItemCode , D.DeliveryOrderNo, C.Name, D.DeliveryOrderDate,I.ItemID


Union 

select D.PurchaseOrderNo OrderNumber,D.PurchaseOrderDate OrderDate, sum(de.NoOfPackages * de.ItemOnPackages) ItemTotal, I.Name ItemName , I.ItemCode ItemCode, C.Name ClientName ,I.ItemID, 2 as OrderType
from PurchaseOrders D
Inner Join Suppliers C on C.SupplierID = D.SupplierID
Inner JOIN PurchaseOrderDetails de ON D.PurchaseOrderID = de.PurchaseOrderDetailID
inner JOIN Items I ON de.ItemID = I.ItemID

where (isNull(@From,cast('1900-01-01' as datetime)) <= D.PurchaseOrderDate) And
	  (isNull(@To,cast('3000-01-01' as datetime)) >= D.PurchaseOrderDate) And 
	  (@ItemID = 0 Or I.ItemID = @ItemID)
Group BY I.Name , I.ItemCode , D.PurchaseOrderNo, C.Name, D.PurchaseOrderDate,I.ItemID

Union

select D.ReturnNo OrderNumber,D.ReturnDate OrderDate, sum(de.Quantity) ItemTotal, I.Name ItemName , I.ItemCode ItemCode, C.Name ClientName ,I.ItemID, 3 as OrderType
from ClientReturns D
Inner Join Clients C on C.ClientID = D.ClientID
Inner JOIN ClientReturnDetails de ON D.ClientReturnID = de.ClientReturnID
inner JOIN Items I ON de.ItemID = I.ItemID

where (isNull(@From,cast('1900-01-01' as datetime)) <= D.ReturnDate) And
	  (isNull(@To,cast('3000-01-01' as datetime)) >= D.ReturnDate) And 
	  (@ItemID = 0 Or I.ItemID = @ItemID)
Group BY I.Name , I.ItemCode , D.ReturnNo, C.Name, D.ReturnDate,I.ItemID

Order by OrderDate asc
Go






If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_GetOrdersHistoryByClientID' and
		        xtype = 'P')
Drop Procedure Report_GetOrdersHistoryByClientID
Go
Create Procedure Report_GetOrdersHistoryByClientID @From DateTime = null,
												   @To DateTime = null,
												   @ItemID int = 0,
												   @ClientID int = 0 
as

select D.DeliveryOrderNo OrderNumber,D.DeliveryOrderDate OrderDate,  sum(de.Quantity) ItemTotal, I.Name ItemName , I.ItemCode ItemCode, C.Name ClientName ,I.ItemID , 1 as OrderType 
from DeliveryOrder D
Inner Join Clients C on C.ClientID = D.ClientID
Inner JOIN DeliveryOrderDetails de ON D.DeliveryOrderID = de.DeliveryOrderID
inner JOIN Items I ON de.ItemID = I.ItemID

where (isNull(@From,cast('1900-01-01' as datetime)) <= D.DeliveryOrderDate) And
	  (isNull(@To,cast('3000-01-01' as datetime)) >= D.DeliveryOrderDate) And 
	  (@ItemID = 0 Or I.ItemID = @ItemID) And 
	  (@ClientID = 0 Or D.ClientID = @ClientID) 
Group BY I.Name , I.ItemCode , D.DeliveryOrderNo, C.Name, D.DeliveryOrderDate,I.ItemID


Union

select D.ReturnNo OrderNumber,D.ReturnDate OrderDate, sum(de.Quantity) ItemTotal, I.Name ItemName , I.ItemCode ItemCode, C.Name ClientName ,I.ItemID, 3 as OrderType
from ClientReturns D
Inner Join Clients C on C.ClientID = D.ClientID
Inner JOIN ClientReturnDetails de ON D.ClientReturnID = de.ClientReturnID
inner JOIN Items I ON de.ItemID = I.ItemID

where (isNull(@From,cast('1900-01-01' as datetime)) <= D.ReturnDate) And
	  (isNull(@To,cast('3000-01-01' as datetime)) >= D.ReturnDate) And 
	  (@ItemID = 0 Or I.ItemID = @ItemID) And 
	  (@ClientID = 0 Or D.ClientID = @ClientID)
Group BY I.Name , I.ItemCode , D.ReturnNo, C.Name, D.ReturnDate,I.ItemID

Order by OrderDate asc
Go




If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_GetItemPriceByClientTypeID' and
		        xtype = 'P')
Drop Procedure Report_GetItemPriceByClientTypeID
Go
Create Procedure Report_GetItemPriceByClientTypeID @ItemID int, 
												   @ClientTypeID int
as

select P.ClientTypeID, P.ItemID, IsNull(P.Price,0) Price, I.Name ItemName , I.ItemCode ItemCode
from Items I 
Left JOIN ItemPrices P ON P.ItemID = I.ItemID
Left Join ClientTypes T on T.ClientTypeID = P.ClientTypeID
where (isnull(@ClientTypeID,0) = 0 OR T.ClientTypeID = @ClientTypeID ) and 
		(isnull(@ItemID,0) = 0 OR I.ItemID = @ItemID)
Go






If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_GetPurchaseOrderDetails' and
		        xtype = 'P')
Drop Procedure Report_GetPurchaseOrderDetails
Go
Create Procedure Report_GetPurchaseOrderDetails @ItemID int= 0, 
												@SupplierID int= 0 ,
												@From DateTime = null,
												@To DateTime = null
as

select D.PurchaseOrderNo OrderNumber,D.PurchaseOrderDate OrderDate, sum(de.NoOfPackages * de.ItemOnPackages) ItemTotal, I.Name ItemName , I.ItemCode ItemCode, C.Name ClientName ,I.ItemID
from PurchaseOrders D
Inner Join Suppliers C on C.SupplierID = D.SupplierID
Inner JOIN PurchaseOrderDetails de ON D.PurchaseOrderID = de.PurchaseOrderID
inner JOIN Items I ON de.ItemID = I.ItemID

where (isNull(@From,cast('1900-01-01' as datetime)) <= D.PurchaseOrderDate) And
	  (isNull(@To,cast('3000-01-01' as datetime)) >= D.PurchaseOrderDate) And 
	  (@ItemID = 0 Or I.ItemID = @ItemID) and 
	  (@SupplierID = 0 Or D.SupplierID = @SupplierID)
Group BY I.Name , I.ItemCode , D.PurchaseOrderNo, C.Name, D.PurchaseOrderDate,I.ItemID
Order by D.PurchaseOrderDate



Declare @from datetime,
		@to datetime
		
select @from = cast('2013-08-01' as datetime),
	   @to =  cast('2013-09-01' as datetime)



If Exists (select Name 
		   from sysobjects 
		   where name = 'Report_GetPurchaseOrders' and
		        xtype = 'P')
Drop Procedure Report_GetPurchaseOrders
Go
Create Procedure Report_GetPurchaseOrders @ItemID int= 0, 
											@SupplierID int= 0 ,
											@From DateTime = null,
											@To DateTime = null
as
select D.PurchaseOrderNo OrderNumber,D.PurchaseOrderDate OrderDate, sum(de.NoOfPackages * de.ItemOnPackages) ItemTotal, I.Name ItemName , I.ItemCode ItemCode, C.Name SupplierName ,I.ItemID
from PurchaseOrders D
Inner Join Suppliers C on C.SupplierID = D.SupplierID
Inner JOIN PurchaseOrderDetails de ON D.PurchaseOrderID = de.PurchaseOrderID
inner JOIN Items I ON de.ItemID = I.ItemID

where (isNull(@From,cast('1900-01-01' as datetime)) <= D.PurchaseOrderDate) And
	  (isNull(@To,cast('3000-01-01' as datetime)) >= D.PurchaseOrderDate) And 
	  (@ItemID = 0 Or I.ItemID = @ItemID) And 
	  (@SupplierID = 0 Or D.SupplierID = @SupplierID)
Group BY I.Name , I.ItemCode , D.PurchaseOrderNo, C.Name, D.PurchaseOrderDate,I.ItemID
order by D.PurchaseOrderDate DESC


exec Report_GetPurchaseOrders 


