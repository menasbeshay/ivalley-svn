If Exists (select Name 
		   from sysobjects 
		   where name = 'Category' and
		        xtype = 'U')
Drop Table Category
Go
Create Table Category
(
	CategoryID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)	
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SubCategory' and
		        xtype = 'U')
Drop Table SubCategory
Go
Create Table SubCategory
(
	SubCategoryID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	CategoryID int Foreign key references Category(CategoryID)
)	
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'Product' and
		        xtype = 'U')
Drop Table Product
Go
Create Table Product
(
	ProductID int not null
			identity(1,1)
			Primary Key,
	ProductCode nvarchar(10),				
	Name Nvarchar(200),		
	Description nvarchar(max)	,	
	PicPath nvarchar(200),		
	Notes nvarchar(500),	
	CategoryID int Foreign key references Category(CategoryID),
	SubCategoryID int Foreign key references SubCategory(SubCategoryID),
	Price decimal (10,4)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Page' and
		        xtype = 'U')
Drop Table Page
Go
Create Table Page
(
	PageID int not null
			identity(1,1)
			Primary Key,
	Title nvarchar(300),				
	Name Nvarchar(200),		
	Content nvarchar(max),	
	ParentID int Foreign key references page(pageid),
	InMenu bit
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Users' and
		        xtype = 'U')
Drop Table Users
Go
Create Table Users
(
	UserID int not null
			identity(1,1)
			Primary Key,
	FirstName Nvarchar(200),		
	LastName Nvarchar(200),	
	Address  Nvarchar(200),	      
    City Nvarchar(200),	
    State Nvarchar(200),	
    PostalCode Nvarchar(20),	
    Country Nvarchar(200),	       
    Phone Nvarchar(20),	
    Fax Nvarchar(20),	
    Mail Nvarchar(200),
    UserName Nvarchar(200),
    Password Nvarchar(200),
    IsAdmin bit
	
)
Go





If Exists (select Name 
		   from sysobjects 
		   where name = 'OrderStatus' and
		        xtype = 'U')
Drop Table OrderStatus 
Go
Create Table OrderStatus
(
	OrderStatusID int not null
			identity(1,1)
			Primary Key,
	Name nvarchar(50)	
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Order' and
		        xtype = 'U')
Drop Table [Order] 
Go
Create Table [Order]
(
	OrderID int not null
			identity(1,1)
			Primary Key,
	ProductID int Foreign key references Product(ProductID),				
	Quantity int,		
	ShippingPrice decimal(10,4),		
	UserID int foreign key references users (UserID),
	FirstName Nvarchar(200),		
	LastName Nvarchar(200),	
	Address  Nvarchar(200),	      
    City Nvarchar(200),	
    State Nvarchar(200),	
    PostalCode Nvarchar(20),	
    Country Nvarchar(200),	       
    Phone Nvarchar(20),	
    Fax Nvarchar(20),	
    Mail Nvarchar(200),
	OrderStatusID int Foreign key references OrderStatus(OrderStatusID)	,
	OrderDate DateTime ,
	OrderNumber nvarchar(8)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'OrderStatusHistory' and
		        xtype = 'U')
Drop Table OrderStatusHistory 
Go
Create Table OrderStatusHistory
(
	OrderStatusHistoryID int not null
			identity(1,1)
			Primary Key,
	OrderID int Foreign key references [Order](OrderID),	
	OrderStatusID int Foreign key references OrderStatus(OrderStatusID),
	ChangeDate DateTime
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'OrderDetails' and
		        xtype = 'U')
Drop Table OrderDetails
Go
Create Table OrderDetails
(			
	OrderDetailID int not null 
						  identity(1,1)
						  primary key,
	OrderID int Foreign Key References [Order](OrderID),
	ProductID int Foreign Key References Product(ProductID),
	Quantity int,
	ItemPrice decimal(10,4)	
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'Project' and
		        xtype = 'U')
Drop Table Project
Go
Create Table Project
(
	ProjectID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(500),		
	Description nvarchar(max)	,	
	PicPath nvarchar(200),
	IsEPC bit	
	
)
Go