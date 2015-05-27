
If Exists (select Name 
		   from sysobjects 
		   where name = 'TimeZone' and
		        xtype = 'U')
Drop Table TimeZone
GO
Create Table TimeZone
(
	TimeZoneID int not null identity(1,1) primary key,			
	DisplayName nvarchar(10),
	Hours int, 
	Mins int
)

GO

alter table Airport
add TimeZoneID int foreign key references TimeZone(TimeZoneID)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'AircraftRoute' and
		        xtype = 'U')
Drop Table AircraftRoute
GO
Create Table AircraftRoute
(
	AircraftRouteID int not null identity(1,1) primary key,			
	Name nvarchar(10),
	AircraftRouteDate Datetime,
	CONSTRAINT aircraftrouteName unique(Name)
)

GO

alter table AircraftRoute
add AirPlaneID int foreign key references AirPlane(AirPlaneID)
Go

if Exists (select Name 
		   from sysobjects 
		   where name = 'AircraftRouteDetails' and
		        xtype = 'U')
Drop Table AircraftRouteDetails
GO
Create Table AircraftRouteDetails
(
	AircraftRouteDetailsID int not null identity(1,1) primary key,			
	AircraftRouteID int foreign key references AircraftRoute(AircraftRouteID),
	SectorID int foreign key references Sector(SectorID),
	CONSTRAINT uc_AircraftRouteSectors UNIQUE (AircraftRouteID,SectorID)
)

GO

If Exists (select Name 
		   from sysobjects 
		   where name = 'CrewRoute' and
		        xtype = 'U')
Drop Table CrewRoute
GO
Create Table CrewRoute
(
	CrewRouteID int not null identity(1,1) primary key,				
	Name nvarchar(10),
	CrewRouteDate Datetime,
	CONSTRAINT crewrouteName unique(Name)
)

GO



if Exists (select Name 
		   from sysobjects 
		   where name = 'CrewRouteDetails' and
		        xtype = 'U')
Drop Table CrewRouteDetails
GO
Create Table CrewRouteDetails
(
	CrewRouteDetailsID int not null identity(1,1) primary key,			
	CrewRouteID int foreign key references CrewRoute(CrewRouteID),
	SectorID int foreign key references Sector(SectorID),
	CONSTRAINT uc_CrewRouteSectors UNIQUE (CrewRouteID,SectorID)
)

GO


alter table manual
add IssueNumber nvarchar(10),
	IssueDate DateTime,
	RevisionNumber nvarchar(10),
	RevisionDate Datetime 