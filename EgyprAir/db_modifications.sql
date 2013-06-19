/* 
1- A
2- B
3- C  */
ALTER table Airport
Add Class int 
GO 

ALTER table dbo.Pilot 
Add AirportClass int 
GO

If Exists (select Name 
		   from sysobjects 
		   where name = 'dbo.PilotAirCraft' and
		        xtype = 'U')
Drop Table dbo.PilotAirCraft
GO
Create Table PilotAirCraft
(
	PilotID int foreign key references Pilot(PilotID),			
	AirplaneID int foreign key references Airplane(AirplaneID),
	primary key (PilotID, AirplaneID)
)

GO

If Exists (select Name 
		   from sysobjects 
		   where name = 'Title' and
		        xtype = 'U')
Drop Table Title
GO
Create Table Title
(
	TitleID int not null identity(1,1) primary key,			
	Name nvarchar(200)
)

GO

If Exists (select Name 
		   from sysobjects 
		   where name = 'PilotTitle' and
		        xtype = 'U')
Drop Table PilotTitle
GO
Create Table PilotTitle
(
	PilotID int foreign key references Pilot(PilotID),			
	TitleID int foreign key references Title(TitleID),
	primary key (PilotID, TitleID)
)

GO

If Exists (select Name 
		   from sysobjects 
		   where name = 'SubTitle' and
		        xtype = 'U')
Drop Table SubTitle
GO
Create Table SubTitle
(
	SubTitleID int not null identity(1,1) primary key,	
	TitleID int foreign key references Title(TitleID),		
	Name nvarchar(200)
)

GO

If Exists (select Name 
		   from sysobjects 
		   where name = 'LogType' and
		        xtype = 'U')
Drop Table LogType
GO
Create Table LogType
(
	LogTypeID int not null identity(1,1) primary key,
	Name nvarchar(200)
)

GO

If Exists (select Name 
		   from sysobjects 
		   where name = 'PilotLog' and
		        xtype = 'U')
Drop Table PilotLog
GO
Create Table PilotLog
(
	PilotLogID int not null identity(1,1) primary key,
	LogTypeID int foreign key references LogType(LogTypeID),
	LogDate Datetime
)
GO
