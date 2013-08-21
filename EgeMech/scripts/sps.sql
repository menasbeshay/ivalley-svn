
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllOrders' and
		        xtype = 'P')
Drop Procedure GetAllOrders
Go
Create Procedure GetAllOrders 
as

select * , S.Name as [Status]
from [Order] O
Left JOIN OrderStatus S ON O.OrderStatusID = S.OrderStatusID
Inner JOIN Users U ON O.UserID = U.UserID
Order BY O.orderdate desc
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllOrdersByUserID' and
		        xtype = 'P')
Drop Procedure GetAllOrdersByUserID
Go
Create Procedure GetAllOrdersByUserID @UserID int
as

select * , S.Name as [Status]
from [Order] O
Left JOIN OrderStatus S ON O.OrderStatusID = S.OrderStatusID
Inner JOIN Users U ON O.UserID = U.UserID
Where U.UserID = @UserID
Order BY O.orderdate desc
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllUsers' and
		        xtype = 'P')
Drop Procedure GetAllUsers
Go
Create Procedure GetAllUsers 
as

select * , u.FirstName + ' ' + u.LastName as DisplayName
from users u
Order BY u.FirstName, u.LastName asc
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllProducts' and
		        xtype = 'P')
Drop Procedure GetAllProducts
Go
Create Procedure GetAllProducts 
as

select Distinct P.* , C.Name as CategoryName, SC.Name as SubCategoryName
from Product P
Left JOIN Category C ON C.CategoryID = P.CategoryID
Left JOIN SubCategory SC ON SC.SubCategoryID = P.SubCategoryID and 
							P.SubCategoryID is not null

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetOrderDetails' and
		        xtype = 'P')
Drop Procedure GetOrderDetails
Go
Create Procedure GetOrderDetails @OrderID int
as

select de.* , I.Name ProductName , I.ProductCode ItemCode 
from [Order] P
Inner JOIN OrderDetails de ON p.OrderID = de.OrderID
inner JOIN Product I ON de.ProductID = I.ProductID 
where P.OrderID = @OrderID
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetOrderStatusHistory' and
		        xtype = 'P')
Drop Procedure GetOrderStatusHistory
Go
Create Procedure GetOrderStatusHistory @OrderID int
as

select de.* , s.Name StatusName
from OrderStatusHistory de 
inner JOIN OrderStatus s ON de.OrderStatusID = s.OrderStatusID
where de.OrderID = @OrderID
order BY de.ChangeDate
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetLastOrderNo' and
		        xtype = 'P')
Drop Procedure GetLastOrderNo
Go
Create Procedure GetLastOrderNo 
as

select orderNumber
from [Order]
order BY orderNumber desc
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllPagesByParent' and
		        xtype = 'P')
Drop Procedure GetAllPagesByParent
Go
Create Procedure GetAllPagesByParent @PageID int 
as

select *
from Page
where (ParentID = @PageID) or(@PageID = 0 and ParentID IS NULL)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSubCategoryByCatID' and
		        xtype = 'P')
Drop Procedure GetSubCategoryByCatID
Go
Create Procedure GetSubCategoryByCatID @CategoryID int
as

select Scat.* , cat.Name CategoryName
from SubCategory Scat
Inner JOIN Category cat ON cat.CategoryID = Scat.CategoryID
where Scat.CategoryID = @CategoryID
Go




If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllSubCats' and
		        xtype = 'P')
Drop Procedure GetAllSubCats
Go
Create Procedure GetAllSubCats  
as

select SC.* , C.Name as CategoryName
from SubCategory SC
Inner JOIN Category C ON SC.CategoryID = C.CategoryID
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetUserByUserNameAndPassword' and
		        xtype = 'P')
Drop Procedure GetUserByUserNameAndPassword
Go
Create Procedure GetUserByUserNameAndPassword @UserName nvarchar(200),
											  @Password nvarchar(200)
as

select * , u.FirstName + ' ' + u.LastName as DisplayName
from users u
Where UserName = @UserName And 
	  [Password] = @Password 
Order BY u.FirstName, u.LastName asc
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetProductsBySubCatID' and
		        xtype = 'P')
Drop Procedure GetProductsBySubCatID
Go
Create Procedure GetProductsBySubCatID @SubCategoryID int
as

select Distinct P.* , C.Name as CategoryName, SC.Name as SubCategoryName
from Product P
Inner JOIN Category C ON C.CategoryID = P.CategoryID
Inner JOIN SubCategory SC ON SC.CategoryID = C.CategoryID 
Where P.SubCategoryID = @SubCategoryID

Go