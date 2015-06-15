Create Table Categories
(
	CategoryID int not null identity(1,1) primary key,			
	CategoryName nvarchar(300),
	
)

GO

create table GeneralLookup
(
GeneralLookupID int not null identity(1,1) Primary key , 
CategoryID int foreign key references Categories(CategoryID),
Name nvarchar(300) , 
Address nvarchar(300) ,
Telephone nvarchar(300) ,
Email nvarchar(300) 
)
GO

create table JobOrderStatus
(
JobOrderStatusID int not null identity(1,1) Primary key ,
JobOrderStatusName nvarchar(300) 

)
GO

create table DeliveryOrderStatus
(
DeliveryOrderStatusID int not null identity(1,1) Primary key ,
DeliveryOrderStatusName nvarchar(300) 
)
GO

create table JobOrder
(
JobOrderID int not null identity(1,1) Primary key , 
JobOrderStatusID int foreign key references DeliveryOrderStatus(DeliveryOrderStatusID),
JobOrderCode nvarchar(300) , 
JobOrderDescription nvarchar(500) ,
CreatedBy uniqueIdentifier,
CreatedDate Datetime, 
UpdatedBy uniqueIdentifier,
LastUpdatedDate Datetime
)
GO

create table DesignDetails
(
DesignDetailsID int not null identity(1,1) Primary key , 
JobOrderID int foreign key references JobOrder(JobOrderID),
DesignerID int foreign key references GeneralLookup(GeneralLookupID),
JobOrderStatusID int foreign key references JobOrderStatus(JobOrderStatusID),
StartDate DateTime , 
EndDate DateTime ,
CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime

)
GO


create table DigitalPrintingDetails
(
DigitalPrintingDetailsID int not null identity(1,1) Primary key , 
JobOrderID int foreign key references JobOrder(JobOrderID),
PrintingTypeID int foreign key references GeneralLookup(GeneralLookupID) ,
IsRAndV Bit , 
SupplierID int foreign key references GeneralLookup(GeneralLookupID) , 
DeliveryDoneTo int foreign key references GeneralLookup(GeneralLookupID) , 
JobOrderStatusID int foreign key references JobOrderStatus(JobOrderStatusID) , 
CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)
GO
create table DesignservicesType
(
DesignservicesTypeID int not null identity (1,1) primary key ,
DigitalPrintingDetailsID int foreign key references DigitalPrintingDetails(DigitalPrintingDetailsID) ,
ServiceID int foreign key references GeneralLookup(GeneralLookupID) 
)
GO

create table Giveaways 
(
GiveawayID int not null identity (1,1) primary key , 
JobOrderID int foreign key references JobOrder(JobOrderID),
ItemName nvarchar(300) ,
GiveawayDescription nvarchar(300),
GiveawayQuantity int,
PricePerItem float ,
CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)
GO

create table OffsetPrintingDetails 
(
OffsetPrintingDetailsID int not null identity (1,1) primary key , 
JobOrderID int foreign key references JobOrder(JobOrderID),
PaperKindID int foreign key references GeneralLookup(GeneralLookupID) , 
GSMID int foreign key references GeneralLookup(GeneralLookupID) , 
PrintingHouseID int foreign key references GeneralLookup(GeneralLookupID) , 
FinishID int foreign key references GeneralLookup(GeneralLookupID) , 
JobOrderStatusID int foreign key references JobOrderStatus(JobOrderStatusID) , 
CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)
GO 

create table InAndOutDoorDetails
(
InAndOutDoorDetailsID int not null identity (1,1) primary key ,
Item nvarchar (500) , 
MaterialID int foreign key references GeneralLookup(GeneralLookupID) , 
LaminationID int foreign key references GeneralLookup(GeneralLookupID) , 
ServiceID int foreign key references GeneralLookup(GeneralLookupID) , 
Picture nvarchar (500),
DeliveryDate dateTime ,
Width Decimal(6,2) , 
Hight Decimal(6,2) ,
TotalSize Decimal(6,2) ,
DeliveryTo nvarchar(500),
JobOrderStatusID int foreign key references JobOrderStatus(JobOrderStatusID) , 
JobOrderID int foreign key references JobOrder(JobOrderID),
CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)
GO

create table Production
(
ProductionID int not null identity (1,1) primary key ,
JobOrderID int foreign key references JobOrder(JobOrderID),
ItemID int foreign key references GeneralLookup(GeneralLookupID) , 
Size decimal(6,2),
MaterialID int foreign key references GeneralLookup(GeneralLookupID) , 
DeliveryDate dateTime ,
SupplierID int foreign key references GeneralLookup(GeneralLookupID) ,
DeliveryTo nvarchar(500),
ISRemovable bit ,
RemovableDate datetime,
installationDate datetime,
ProductStatusID int foreign key references GeneralLookup(GeneralLookupID) ,
InstallStationID int foreign key references GeneralLookup(GeneralLookupID) ,
Note Nvarchar (500)  ,
CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)
GO

create table DeliveryOrder
(
DeliveryOrderID int not null identity (1,1) primary key ,
KilometerCounterBefore Decimal(8,2),
KilometerCounterAfter Decimal(8,2),
TotalPrice float ,
DeliveryOrderStatusID int foreign key references DeliveryOrderStatus(DeliveryOrderStatusID),
GeneralDeliveryCode nvarchar(300) , 
CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)
GO

create table DeliveryOrderDetails
(
DeliveryOrderDetailsID int not null identity (1,1) primary key , 
DeliveryOrderID int foreign key references DeliveryOrder(DeliveryOrderID) ,
DeliveryOrderStatusID int foreign key references DeliveryOrderStatus(DeliveryOrderStatusID),
DeliveryFrom nvarchar(300) ,
DeliveryTo nvarchar(300) ,
DateFrom Datetime ,
DateTo datetime ,
ReceivableName nvarchar(300),
ReceivableTelephone nvarchar(50),
Price Float ,
DeliveryOrderCode nvarchar(300),
DeliveryOrderDetailsStatusID int foreign key references DeliveryOrderStatus(DeliveryOrderStatusID),
CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)
GO

create table PurchaseOrder
(
PurchaseOrderID int not null identity (1,1) primary key ,
PurchaseOrderNumber nvarchar(300) ,
PurchaseOrderDate datetime,
Management nvarchar(500),
ISFinalProduct bit,
ISSample bit ,
ISProductUnderManufacturing bit,
DeliveryDate datetime ,
DeliveryPlace nvarchar(500) ,
PaymentRequierment nvarchar(500),
ManagerName nvarchar(300),
Signature nvarchar(300),
CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)
GO

create table PurchaseOrderDetails
(
PurchaseOrderDetailsID int not null identity (1,1) primary key ,
PurchaseOrderID int foreign key references PurchaseOrder(PurchaseOrderID) ,
TotalValue float ,
UnitPrice float,
QuantityRequired int ,
StockOnHand int,
Unit int , 
Description nvarchar (500),
Serial nvarchar ,
CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)
GO