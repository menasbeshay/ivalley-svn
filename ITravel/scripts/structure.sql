use master 
create database ITravel
Go

Use ITravel


If Exists (select Name 
		   from sysobjects 
		   where name = 'Title' and
		        xtype = 'U')
Drop Table Title
Go
Create Table Title
(
	TitleID int identity(1,1) primary key ,
	Name nvarchar(40)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'TicketStatus' and
		        xtype = 'U')
Drop Table TicketStatus
Go
Create Table TicketStatus
(
	TicketStatusID int identity(1,1) primary key ,
	ArName nvarchar(40),
	EnName nvarchar(40)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'AirPort' and
		        xtype = 'U')
Drop Table AirPort
Go

CREATE TABLE AirPort(
	AirPortID int IDENTITY(1,1) NOT NULL primary key,
	Name nvarchar(100) NULL,
	IATACode nvarchar(5) NULL,
	ACAICode nvarchar(10) NULL,
	Description nvarchar(2000) NULL,
	Notes nvarchar(max) NULL,
	CreatedBy uniqueidentifier NULL,
	UpdatedBy uniqueidentifier NULL,
	CreatedDate datetime NULL,
	LastUpdatedDate datetime NULL
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'AirLine' and
		        xtype = 'U')
Drop Table AirLine
Go

CREATE TABLE AirLine(
	AirLineID int IDENTITY(1,1) NOT NULL primary key,
	Name nvarchar(100) NULL,	
	Description nvarchar(2000) NULL,
	Notes nvarchar(max) NULL,
	CreatedBy uniqueidentifier NULL,
	UpdatedBy uniqueidentifier NULL,
	CreatedDate datetime NULL,
	LastUpdatedDate datetime NULL
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'TicketInfo' and
		        xtype = 'U')
Drop Table TicketInfo
Go
Create Table TicketInfo
(
	TicketID int not null
			identity(1,1)
			Primary Key,
	From_AirportID int foreign key references AirPort(AirportID),
	To_AirportID int foreign key references AirPort(AirportID),
	AirLineID int,
	FromDate DateTime,
	ToDate DateTime,
	ActualPrice decimal(9,3),
	FinalPrice decimal(9,3),
	AddedValue decimal(9,3),
	AddedPercentage decimal(4,2),	
	IsCanceled bit,
	IsRefunded bit,
	IsConfirmed bit,	
	CreatedDate DateTime,
	CreatedBy UniqueIdentifier,
	LastUpdatedDate DateTime,
	LastUpdatedBy UniqueIdentifier
	
	
)
Go

alter table TicketInfo
add TicketNo nvarchar(20),
	PassengerID int foreign key references Passenger(PassengerID),
	FlightNo nvarchar(20),
	SeatNo int,
	cabin_type nvarchar(30),
	CreditCardID int foreign key references CreditCard(CreditCardID),
	TicketStatusID int foreign key references TicketStatus(TicketStatusID)
	
	


If Exists (select Name 
		   from sysobjects 
		   where name = 'TicketHistory' and
		        xtype = 'U')
Drop Table TicketHistory
Go
Create Table TicketHistory
(
	TicketHistoryID int not null
			identity(1,1)
			Primary Key,
	TicketID int foreign key references TicketInfo(TicketID),
	From_AirportID int foreign key references AirPort(AirportID),
	To_AirportID int foreign key references AirPort(AirportID),
	AirLineID int,
	FromDate DateTime,
	ToDate DateTime,
	ActualPrice decimal(9,3),
	FinalPrice decimal(9,3),
	AddedValue decimal(9,3),
	AddedPercentage decimal(4,2),	
	IsCanceled bit,
	IsRefunded bit,
	IsConfirmed bit,		
	UpdatedDate DateTime,
	UpdatedBy UniqueIdentifier
	
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'Passenger' and
		        xtype = 'U')
Drop Table Passenger
Go
Create Table Passenger
(
	PassengerID int not null
			identity(1,1)
			Primary Key,
	TitleID int foreign key references Title(TitleID),
	FirstName nvarchar(200),
	LastName nvarchar(200),
	DateOfBirth DateTime,
	IsChild bit,
	TicketID int foreign key references TicketInfo(TicketID)
	
)

alter table Passenger
drop column TicketID

alter table Passenger
add Email nvarchar(200),
    Mobile nvarchar(15)
    
drop table ContactInfo    

If Exists (select Name 
		   from sysobjects 
		   where name = 'ContactInfo' and
		        xtype = 'U')
Drop Table ContactInfo
Go
Create Table ContactInfo
(
ContactInfoID int not null identity (1,1) primary key,
	PassengerID int  foreign key references Passenger(PassengerID),
	TitleID int foreign key references Title(TitleID),
	FirstName nvarchar(200),
	LastName nvarchar(200),
	Email nvarchar(200),
	CountryCode nvarchar(7),
	Mobile nvarchar(10)
	
)


If Exists (select Name 
		   from sysobjects 
		   where name = 'PaymentVoucher' and
		        xtype = 'U')
Drop Table PaymentVoucher
Go
Create Table PaymentVoucher
(
	PaymentVoucherID int not null
			identity(1,1)
			Primary Key,
	VoucherNumber nvarchar(10),	
	Amount decimal(10,3),
	PaidFor nvarchar(200),
	PassengerId int foreign key references Passenger(PassengerID),
	IsCheque bit, 
	BankName nvarchar(200),
	ChuqueDate DateTime, 
	Reason nvarchar(400),
	VoucherDate DateTime ,
	CreatedBy UniqueIdentifier,
	LastUpdatedDate DateTime,
	LastUpdatedBy UniqueIdentifier
	
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'ReceivingVoucher' and
		        xtype = 'U')
Drop Table ReceivingVoucher
Go
Create Table ReceivingVoucher
(
	ReceivingVoucherID int not null
			identity(1,1)
			Primary Key,
	VoucherNumber nvarchar(10),	
	Amount decimal(10,3),
	PaidFor nvarchar(200),
	PassengerId int foreign key references Passenger(PassengerID),
	IsCheque bit, 
	BankName nvarchar(200),
	ChuqueDate DateTime, 
	Reason nvarchar(400),
	VoucherDate DateTime ,
	CreatedBy UniqueIdentifier,
	LastUpdatedDate DateTime,
	LastUpdatedBy UniqueIdentifier
	
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'CreditCard' and
		        xtype = 'U')
Drop Table CreditCard
Go
Create Table CreditCard
(
	CreditCardID int not null
			identity(1,1)
			Primary Key,
	
	Name nvarchar(200),
	CardNumber nvarchar(20),
	ExpiryMonthYear nvarchar(10),
	CVV nvarchar(5)
)


If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchCustomers' and
		        xtype = 'P')
Drop Procedure SearchCustomers
Go
Create Procedure SearchCustomers @FilterText nvarchar(200)
as

select * 
from Passenger 
where FirstName like @FilterText + N'%' OR 
	  LastName like @FilterText + N'%' OR 
	  Email like @FilterText + N'%' OR 
	  @FilterText = ''
Go




If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchTickets' and
		        xtype = 'P')
Drop Procedure SearchTickets
Go
Create Procedure SearchTickets @FilterText nvarchar(200)
as

select * 
from TicketInfo TI
Left Join Passenger P on TI.PassengerID = P.PassengerID
where TI.TicketNo like @FilterText + N'%' OR 
	  P.LastName like @FilterText + N'%' OR 
	  P.FirstName like @FilterText + N'%' OR 
	  @FilterText = ''
Go