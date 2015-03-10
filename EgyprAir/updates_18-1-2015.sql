If Exists (select Name 
		   from sysobjects 
		   where name = 'FlightType' and
		        xtype = 'U')
Drop Table FlightType
Go
Create Table FlightType
(
	FlightTypeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go

Alter Table Flight
Add FlightTypeID int Foreign key references FlightType(FlightTypeID)
Go

Alter Table sector
Add PilotCityID int foreign key references AirPort(AirportID)
Go

Alter Table Training.PilotCourse
Add PilotCityID int foreign key references AirPort(AirportID)
Go


Alter Table Pilot
add Email nvarchar(200),
    Mobile nvarchar(50)
Go


sp_RENAME 'Flight.ReportID', 'FlightID' , 'COLUMN'
Go


sp_RENAME 'Flight.ReportDate', 'FlightDate' , 'COLUMN'
Go

sp_RENAME 'Sector.ReportID', 'FlightID' , 'COLUMN'
Go



ALTER PROCEDURE [dbo].[SearchReports] @filterText nvarchar(30),
							   @FromDate DateTime = null,
							   @ToDate DateTime = null
as

Select * from Flight
where (ISNULL(@filterText,'') = '' Or FlightNo Like N'%' + @filterText + N'%') and 
	  FlightDate >= (ISNULL(@FromDate, '01/01/1900')) And 
	  FlightDate <= (ISNULL(@ToDate, '01/01/2500'))
	  Order by FlightDate Desc
	  
GO

Alter PROCEDURE [dbo].[GetSectorsByReportID] @ReportID int  
as  
  
Select * from Sector   
Where FlightID = @ReportID	 
Go 


If Exists (select Name 
		   from sysobjects 
		   where name = 'Transactions' and
		        xtype = 'U')
Drop Table Transactions
Go
Create Table Transactions
(
	TransactionsID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'PilotTransaction' and
		        xtype = 'U')
Drop Table PilotTransaction
Go
Create Table PilotTransaction
(
	PilotTransactionID int not null
			identity(1,1)
			Primary Key,	
	TransactionsID int foreign key references Transactions(TransactionsID),		
	PilotID int foreign key references Pilot(PilotID),
	DateFrom DateTime, 
	DateTo DateTime,
	PilotCityID int foreign key references Airport(airportID),
	Location nvarchar(500)
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'CrewTransaction' and
		        xtype = 'U')
Drop Table CrewTransaction
Go
Create Table CrewTransaction
(
	CrewTransactionID int not null
			identity(1,1)
			Primary Key,	
	TransactionsID int foreign key references Transactions(TransactionsID),		
	CrewID int foreign key references Crew(CrewID),
	DateFrom DateTime, 
	DateTo DateTime,
	CrewCityID int foreign key references Airport(airportID),
	Location nvarchar(500)
)
Go


Alter Table Crew
add Email nvarchar(200),
    Mobile nvarchar(50)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'SystemSettings' and
		        xtype = 'U')
Drop Table SystemSettings
Go
Create Table SystemSettings
(
	SystemSettingsID int not null
			identity(1,1)
			Primary Key,	
	FlightNoPrefix nvarchar(10)
)
Go




If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotsAndCrewToNotify' and
		        xtype = 'P')
Drop Procedure GetPilotsAndCrewToNotify
Go
Create Procedure GetPilotsAndCrewToNotify @FromDate DateTime = null,  
											@ToDate DateTime = null  
as
/*
declare   @FromDate DateTime = null,  
          @ToDate DateTime = null  
set @FromDate = '01/14/2015'          
set @ToDate = '01/19/2015'
*/
Select * from (  
Select P.FirstName + ' ' + P.SecondName DisplayName , p.Email, 
Stuff((Select '   <hr /><br />FlightNo. : ' + S.FlightNo + ' <br /> Date:  ' +  CONVERT(nvarchar(12), s.SectorDate) + '<br /> STD : ' + convert(nvarchar(8),s.STD,108) + '<br /> STA : ' + convert(nvarchar(8),s.STA,108) + '<br /> From : ' +  af.IATACode  + ' To : ' +  at.IATACode  from Sector  S
Inner Join AirPort af on s.From_AirportID = af.AirPortID
Inner Join AirPort at on s.To_AirportID = at.AirPortID
Inner Join SectorPilot SP on SP.SectorID = S.SectorID and 
								SP.PilotID = P.PilotID
where   
   S.SectorDate >= (ISNULL(@FromDate, '01/01/1900')) And   
   S.SectorDate <= (ISNULL(@ToDate, '01/01/2500')) And   
   (IsPAX is NULL Or IsPAX <> 1 )  
   order by S.SectorDate , DATEPART(hh, S.STD)
for XML path('')),1,3,'') as FlightInfo
from  Pilot P 
) A
Where A.FlightInfo is not null

union

Select * from (  
Select c.Name DisplayName , c.Email, 
Stuff((Select '   <hr /><br />FlightNo. : ' + S.FlightNo + ' <br /> Date:  ' +  CONVERT(nvarchar(12), s.SectorDate) + '<br /> STD : ' + convert(nvarchar(8),s.STD,108) + '<br /> STA : ' + convert(nvarchar(8),s.STA,108) + '<br /> From : ' +  af.IATACode  + ' To : ' +  at.IATACode  from Sector  S
Inner Join AirPort af on s.From_AirportID = af.AirPortID
Inner Join AirPort at on s.To_AirportID = at.AirPortID
Inner Join SectorCrew SP on SP.SectorID = S.SectorID and 
								SP.crewID = C.CrewID
where   
   S.SectorDate >= (ISNULL(@FromDate, '01/01/1900')) And   
   S.SectorDate <= (ISNULL(@ToDate, '01/01/2500')) And   
   (IsPAX is NULL Or IsPAX <> 1 )  
	order by S.SectorDate , DATEPART(hh, S.STD)
for XML path('')),1,3,'') as FlightInfo
from  crew C 
) A
Where A.FlightInfo is not null
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchBatchSectors' and
		        xtype = 'P')
Drop Procedure SearchBatchSectors
Go
Create Procedure SearchBatchSectors @filterText nvarchar(30),  
          @FromDate DateTime = null,  
          @ToDate DateTime = null  
as  
 /* declare   @FromDate DateTime = null,  
          @ToDate DateTime = null  ,
          @filterText nvarchar(30) = ''
set @FromDate = '01/01/2015'          
set @ToDate = '01/31/2015'*/
Select S.FlightNo, S.SectorDate, S.STD, S.STA,FromA.IATACode FromA, ToA.IATACode TOA ,Stuff(( Select '   <br />'+ po.Title + ' - ' + P2.ShortName    
      From Sector SS2   
      Inner Join SectorPilot RP2 on SS2.SectorID = RP2.SectorID   
      inner join Pilot P2 on RP2.PilotID = P2.PilotID   
      Inner Join Position po on RP2.PositionID = po.PositionID
      where SS2.SectorID = S.SectorID   
   for XML path('')),1,3,'') Pilots ,
    Stuff(( Select '   <br />' + po.Title + ' - ' + CC.ShortName 
      From Sector S2   
      Inner Join SectorCrew C on S2.SectorID = C.SectorID   
      inner join Crew CC on CC.CrewID = C.CrewID   
      Inner Join Position po on c.PositionID = po.PositionID
      where S2.SectorID = S.SectorID   
   for XML path('')),1,3,'') Crew
from Sector S
Inner Join AirPort FromA on FromA.AirPortID = S.From_AirportID
Inner join AirPort ToA on ToA.AirPortID = S.To_AirportID
where (ISNULL(@filterText,'') = '' Or FlightNo Like N'%' + @filterText + N'%') and   
   SectorDate >= (ISNULL(@FromDate, '01/01/1900')) And   
   SectorDate <= (ISNULL(@ToDate, '01/01/2500')) And   
   (IsPAX is NULL Or IsPAX <> 1 )  
  Order by S.SectorDate , datepart(hh,S.STD)
  GO



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllCrew' and
		        xtype = 'P')
Drop Procedure GetAllCrew
Go
 CREATE PROCEDURE GetAllCrew as  
  
Select *, ShortName + ' - ' + Name  DisplayName from Crew 
GO



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotsAndCrewInfoToNotify' and
		        xtype = 'P')
Drop Procedure GetPilotsAndCrewInfoToNotify
Go
Create Procedure GetPilotsAndCrewInfoToNotify @FromDate DateTime = null,  
												@ToDate DateTime = null  
as
/*
declare   @FromDate DateTime = null,  
          @ToDate DateTime = null  
set @FromDate = '01/14/2015'          
set @ToDate = '01/19/2015'
*/
Select distinct P.PilotID, P.FirstName + ' ' + P.SecondName DisplayName , p.Email, 1 as Pilot
from Sector  S
Inner Join AirPort af on s.From_AirportID = af.AirPortID
Inner Join AirPort at on s.To_AirportID = at.AirPortID
Inner Join SectorPilot SP on SP.SectorID = S.SectorID 
inner join Pilot P on SP.PilotID = P.PilotID
where   
   S.SectorDate >= (ISNULL(@FromDate, '01/01/1900')) And   
   S.SectorDate <= (ISNULL(@ToDate, '01/01/2500'))    

union
 
Select distinct c.CrewID, c.Name DisplayName , c.Email , 0
from Sector  S
Inner Join AirPort af on s.From_AirportID = af.AirPortID
Inner Join AirPort at on s.To_AirportID = at.AirPortID
Inner Join SectorCrew SP on SP.SectorID = S.SectorID 
Inner Join crew C on SP.crewID = C.CrewID
where   
   S.SectorDate >= (ISNULL(@FromDate, '01/01/1900')) And   
   S.SectorDate <= (ISNULL(@ToDate, '01/01/2500'))

Go

