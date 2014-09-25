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