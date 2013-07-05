create database I_stockdb
go 

USE I_Stockdb
If Exists (select Name 
		   from sysobjects 
		   where name = 'ItemCategories' and
		        xtype = 'U')
Drop Table ItemCategories
Go
Create Table ItemCategories
(
	ItemCategoryID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	Description nvarchar(1000)	
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'ItemGroups' and
		        xtype = 'U')
Drop Table ItemGroups
Go
Create Table ItemGroups
(
	ItemGroupID int not null
			identity(1,1)
			Primary Key,	
	ItemCategoryID int Foreign Key References ItemCategories(ItemCategoryID),
	Name Nvarchar(200),
	Description nvarchar(1000)	
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Companies' and
		        xtype = 'U')
Drop Table Companies
Go
Create Table Companies
(
	CompanyID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	Description nvarchar(1000)	,
	Address nvarchar(1000)	
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Suppliers' and
		        xtype = 'U')
Drop Table Suppliers
Go
Create Table Suppliers
(
	SupplierID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	Description nvarchar(1000)	,
	Address nvarchar(1000)	,
	Telephone nvarchar(15)
)
Go
If Exists (select Name 
		   from sysobjects 
		   where name = 'Lines' and
		        xtype = 'U')
Drop Table Lines
Go
Create Table Lines
(
	LineID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	Description nvarchar(1000)	
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Cities' and
		        xtype = 'U')
Drop Table Cities
Go
Create Table Cities
(
	CityID int not null
			identity(1,1)
			Primary Key,	
	LineID int Foreign Key References Lines(LineID),
	Name Nvarchar(200),
	Description nvarchar(1000)	
)
Go
If Exists (select Name 
		   from sysobjects 
		   where name = 'ClientTypes' and
		        xtype = 'U')
Drop Table ClientTypes
Go
Create Table ClientTypes
(
	ClientTypeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	Description nvarchar(1000)	
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Clients' and
		        xtype = 'U')
Drop Table Clients
Go
Create Table Clients
(
	ClientID int not null
			identity(1,1)
			Primary Key,	
	ClientTypeID int Foreign Key References ClientTypes(ClientTypeID),
	CityID int Foreign Key References Cities(CityID),
	Name Nvarchar(200),
	Description nvarchar(1000),
	Address nvarchar(1000),
	Telephone nvarchar(15)	
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'Employees' and
		        xtype = 'U')
Drop Table Employees
Go
Create Table Employees
(
	EmployeeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	Description nvarchar(1000)	
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Items' and
		        xtype = 'U')
Drop Table Items
Go
Create Table Items
(
	ItemID int not null
			identity(1,1)
			Primary Key,
	ItemCode nvarchar(15),	
	CompanyID int Foreign Key References Companies(CompanyID),
	GroupID int Foreign Key References ItemGroups(ItemGroupID),
	Name Nvarchar(200),
	Description nvarchar(1000),
	Quantity int
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'ItemSuppliers' and
		        xtype = 'U')
Drop Table ItemSuppliers
Go
Create Table ItemSuppliers
(			
	ItemID int Foreign Key References Items(ItemID),
	SupplierID int Foreign Key References Suppliers(SupplierID),
	primary key (ItemID, SupplierID)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'ItemPrices' and
		        xtype = 'U')
Drop Table ItemPrices
Go
Create Table ItemPrices
(				
	ClientTypeID int Foreign Key References ClientTypes(ClientTypeID),
	ItemID int Foreign Key References Items(ItemID),
	Price decimal(10,4),
	primary key (ItemID, ClientTypeID)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'PurchaseOrders' and
		        xtype = 'U')
Drop Table PurchaseOrders
Go
Create Table PurchaseOrders
(			
	PurchaseOrderID int not null 
			identity(1,1)
			primary key,
	PurchaseOrderNo nvarchar(10),
	SupplierID int Foreign Key References Suppliers(SupplierID),
	PurchaseOrderDate Datetime	
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'PurchaseOrderDetails' and
		        xtype = 'U')
Drop Table PurchaseOrderDetails
Go
Create Table PurchaseOrderDetails
(			
	PurchaseOrderDetailID int not null 
						  identity(1,1)
						  primary key,
	PurchaseOrderID int Foreign Key References PurchaseOrders(PurchaseOrderID),
	ItemID int Foreign Key References Items(ItemID),
	NoOfPackages int,
	ItemOnPackages int, 
	PackagePrice decimal (10,4)	
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'ClientReturns' and
		        xtype = 'U')
Drop Table ClientReturns
Go
Create Table ClientReturns
(			
	ClientReturnID int not null 
			identity(1,1)
			primary key,
	ReturnNo nvarchar(10),
	ItemID int Foreign Key References Items(ItemID),	
	ClientID int Foreign Key References Clients(ClientID),
	Quantity int,
	Valid int	
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Invoices' and
		        xtype = 'U')
Drop Table Invoices
Go
Create Table Invoices
(			
	InvoiceID int not null 
			identity(1,1)
			primary key,
	InvoiceNo nvarchar(10),
	EmployeeID int Foreign Key References Employees(EmployeeID),
	ClientReturnID int Foreign Key References ClientReturns(ClientReturnID),
	ClientID int Foreign Key References Clients(ClientID),
	InvoiceDate Datetime	
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'InvoiceDetails' and
		        xtype = 'U')
Drop Table InvoiceDetails
Go
Create Table InvoiceDetails
(			
	InvoiceDetailID int not null 
						  identity(1,1)
						  primary key,
	InvoiceID int Foreign Key References Invoices(InvoiceID),
	ItemID int Foreign Key References Items(ItemID),
	Quantity int,
	Discount decimal(5,3)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Payments' and
		        xtype = 'U')
Drop Table Payments
Go
Create Table Payments
(			
	PaymentID int not null 
			identity(1,1)
			primary key,
	PaymentNo nvarchar(10),	
	ClientID int Foreign Key References Clients(ClientID),
	PaymentDate Datetime	,
	Amount decimal(10,2)
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'DeliveryOrder' and
		        xtype = 'U')
Drop Table DeliveryOrder
Go
Create Table DeliveryOrder
(			
	DeliveryOrderID int not null 
			identity(1,1)
			primary key,
	DeliveryOrderNo nvarchar(10),
	EmployeeID int Foreign Key References Employees(EmployeeID),
	ClientReturnID int Foreign Key References ClientReturns(ClientReturnID),
	ClientID int Foreign Key References Clients(ClientID),
	DeliveryOrderDate Datetime	
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'DeliveryOrderDetails' and
		        xtype = 'U')
Drop Table DeliveryOrderDetails
Go
Create Table DeliveryOrderDetails
(			
	DeliveryOrderDetailID int not null 
						  identity(1,1)
						  primary key,
	DeliveryOrderID int Foreign Key References DeliveryOrder(DeliveryOrderID),
	ItemID int Foreign Key References Items(ItemID),
	Quantity int,
	Discount decimal(5,3)
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'SupplyOrders' and
		        xtype = 'U')
Drop Table SupplyOrders
Go
Create Table SupplyOrders
(			
	SupplyOrderID int not null 
			identity(1,1)
			primary key,
	SupplyOrderNo nvarchar(10),
	SupplierID int Foreign Key References Suppliers(SupplierID),
	SupplyOrderDate Datetime	
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SupplyOrdersDetails' and
		        xtype = 'U')
Drop Table SupplyOrdersDetails
Go
Create Table SupplyOrdersDetails
(			
	SupplyOrderDetailID int not null 
						  identity(1,1)
						  primary key,
	SupplyOrderID int Foreign Key References SupplyOrders(SupplyOrderID),
	ItemID int Foreign Key References Items(ItemID),
	NoOfPackages int,
	ItemOnPackages int, 
	PackagePrice decimal (10,4)	
)
Go