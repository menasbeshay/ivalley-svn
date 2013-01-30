
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCrewHours' and
		        xtype = 'P')
Drop Procedure GetCrewHours
Go
Create Procedure GetCrewHours @CrewID int,
							  @StartDate DateTime = null,
							  @EndDate DateTime = null
as

Declare @TotalH int,
		@TotalMin int,
		@CTotalH int,
		@CTotalMin int,
		@DayH int, 
		@DayM int,
		@NightH int,
		@NightM int

select @DayH = sum(DayH), @DayM = sum(DayM), @NightH = sum(NightH), @NightM = sum(NightM)
From(
Select 
case when IsHeavyCrew = 1 then ((sum(datepart(hh,s.FlyAtDay )))*2)/3
else sum(datepart(hh,s.FlyAtDay ))  end DayH,

case when IsHeavyCrew = 1 then ((sum(datepart(MI,s.FlyAtDay )))*2)/3
else sum(datepart(MI,s.FlyAtDay )) end DayM,

case when IsHeavyCrew = 1 then ((sum(datepart(hh,s.FlyAtNight )))*2)/3
else sum(datepart(hh,s.FlyAtNight )) end NightH, 

case when IsHeavyCrew = 1 then ((sum(datepart(MI,s.FlyAtNight )))*2)/3
else sum(datepart(MI,s.FlyAtNight )) end NightM

from Sector S 
Inner Join AirPlane AP on S.AirCraft_AirPlaneID = AP.AirPlaneID
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort A2 on S.To_AirportID = A2.AirPortID
Inner Join SectorCrew SP on S.SectorID = SP.SectorID
Inner Join Crew C on SP.CrewID = C.CrewID
Inner join Position PP on SP.PositionID = PP.PositionID
Where C.CrewID = @CrewID and 
	  S.SectorDate >= ISNULL(@StartDate, '01/01/1900') and 
	  S.SectorDate <= ISNULL(@EndDate, '01/01/2500') AND
	  (S.IsPAX is null or S.IsPAX <> 1 )
group by IsHeavyCrew
) as A


/* grand totals ( TBF + all times till start date + totals within start date and end date ) */
Select @TotalH =  @DayH + @NightH  , @TotalMin = @DayM + @NightM
Select @TotalH =  @TotalH + (@TotalMin/ 60)
Select @TotalMin = @TotalMin - (@TotalMin/60)*60


Select C.Name , C.LicenseNo,c.IDNO,

	   @TotalH+(@TotalMin/60) GrandTotalHours ,	   
	   @TotalMin-((@TotalMin/60)*60) GrandTotalMin,
	   
	   Ap.Name PlaneName, A.IATACode, A2.IATACode , S.FlightNo, S.IsHeavy, S.SectorDate, AP.AirPlaneID, S.ChoxOff, S.ChoxOn, 
/*Right('00'+ CONVERT(VARCHAR,DateDiff(Second ,S.ChoxOn, S.ChoxOff ) / 3600),2) + ':' + Right('00'+ CONVERT(VARCHAR,(DateDiff(Second ,S.ChoxOn, S.ChoxOff ) % 3600)/60),2) TimeBlock, */
Case IsHeavyCrew when 1 then RIGHT('00' + Convert(varchar, Datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3),2) + ' : ' + RIGHT('00' + Convert(varchar, Datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3),2)
else RIGHT('00' + Convert(varchar,datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))),2) + ' : ' + RIGHT('00' + Convert(varchar,datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))),2) end TimeBlock
, IsHeavyCrew 
from Sector S
Inner Join AirPlane AP on S.AirCraft_AirPlaneID = AP.AirPlaneID
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort A2 on S.To_AirportID = A2.AirPortID
Inner Join SectorCrew SP on S.SectorID = SP.SectorID
Inner Join Crew C on SP.CrewID = C.CrewID
Inner join Position PP on SP.PositionID = PP.PositionID
Where C.CrewID = @CrewID and 
	  S.SectorDate >= ISNULL(@StartDate, '01/01/1900') and 
	  S.SectorDate <= ISNULL(@EndDate, '01/01/2500') AND	  
	  (S.IsPAX is null or S.IsPAX <> 1 )
order by S.SectorDate

GO




If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCrewSchedule' and
		        xtype = 'P')
Drop Procedure GetCrewSchedule
Go
Create Procedure GetCrewSchedule  @CrewID int,
								  @StartDate DateTime = null,
								  @EndDate DateTime = null
as
/*
declare @CrewID int
Select @CrewID = 4 
Declare @StartDate DateTime ,
		@EndDate DateTime  
Select @StartDate = Convert (DateTime,'10/10/2012', 101)
Select @EndDate = Convert (Datetime,'10/18/2012',101)
*/
Select distinct S.SectorID, S.SectorDate , S.IsPAX,
CASE DATEPART(weekday,S.SectorDate)
WHEN 1 THEN 'SUN'
WHEN 2 THEN 'MON'
WHEN 3 THEN 'TUE'
WHEN 4 THEN 'WED'
WHEN 5 THEN 'THU'
WHEN 6 THEN 'FRI'
WHEN 7 THEN 'SAT'
END [Day], 
S.FlightNo, 
			Stuff(( Select ' / ' + Name 
		    From Sector SS2 
		    Inner Join SectorCrew SP2 on SS2.SectorID = SP2.SectorID 
		    inner join Crew P2 on SP2.CrewID = P2.CrewID 
		    where SS2.SectorID = S.SectorID 
			for XML path('')),1,3,'') Crew 
			,
			(select min(SS1.STD) 
			from Sector SS1 
			where SS1.SectorID = S.SectorID)  STD
			 , 
			(select max(SS22.STA) 
			from Sector SS22 
			where SS22.SectorID = S.SectorID) STA
			, 
			Stuff(( Select ' * ' + A.IATACode + ' - ' + A2.IATACode 
		    From Sector SS 
			Inner Join AirPort A on SS.From_AirportID = A.AirPortID
			Inner Join AirPort A2 on SS.To_AirportID = A2.AirPortID
		    where SS.SectorID = S.SectorID 
			for XML path('')),1,3,'') [From_TO]  ,
			S.ChoxOff,
			S.ChoxOn,
			AP.AirPlaneID AirPlane
From Sector S 
Inner Join SectorCrew SP on S.SectorID = SP.SectorID 
inner join Crew P on SP.CrewID = P.CrewID 
inner join AirPlane AP on S.AirCraft_AirPlaneID = AP.AirPlaneID
where  (@CrewID = 0 Or P.CrewID = @CrewID) and 
	   S.SectorDate >= ISNULL(@StartDate, '01/01/1900') and 
	   S.SectorDate <= ISNULL(@EndDate, '01/01/2500') /*And 
	  (S.IsPAX <> 1 or S.IsPAX is null)*/
order by S.SectorDate

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllCrewHours' and
		        xtype = 'P')
Drop Procedure GetAllCrewHours
Go
Create Procedure GetAllCrewHours  @StartDate DateTime = null,
								  @EndDate DateTime = null
as
/*Declare @StartDate DateTime ,
		@EndDate DateTime  
Select @StartDate = Convert (DateTime,'11/01/2012', 101)
Select @EndDate = Convert (Datetime,'11/30/2012',101)*/
Select A.* ,
Case S.IsHeavyCrew when 1 then 
ISNULL(SUM(Datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3) , '')
else 
ISNULL(SUM(datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))), '') end TimeBlockHH 
,
Case S.IsHeavyCrew when 1 then 
ISNULL(SUM(Datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3) , '')
else 
ISNULL(SUM(datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))), '') end TimeBlockMM
From 
(
Select Crew.CrewID, Crew.Name , [Days].[Day] , Crew.IDNO
from Crew Cross join [Days]) as A 
Left join SectorCrew SC on A.CrewID = SC.CrewID
Left Join Sector S on Day(S.SectorDate) = A.[Day] AND S.SectorID = SC.SectorID

Where (S.SectorDate >= ISNULL(@StartDate, '01/01/1900') and 
	  S.SectorDate <= ISNULL(@EndDate, '01/01/2500')) OR
	  S.SectorID IS null	  
Group by A.CrewID , A.Name , A.Day, A.IDNO , S.IsHeavyCrew
order BY A.CrewID, A.Day
GO 

/*****************************************/
/*****************************************/
Alter table Crew
Add Username nvarchar(50),
	[RANK]	nvarchar(10),
	IDNO nvarchar(10),
	LicenseNo nvarchar(10),
	Competenecycheck DateTime,
	MEDICALLICENSEEXPIRYFrom DateTime,
	MEDICALLICENSEEXPIRYTo DateTime,
	InstructorRenewal DateTime,
	TRANSITIONCOURSE DateTime,
	RECURRENT12 dateTime,
	RECURRENT24 DateTime,
	SMS DateTime,
	[security] DateTime						

Go

Alter Table Flight
Add IsHeavyCrew bit
GO


If Exists (select Name 
		   from sysobjects 
		   where name = 'Days' and
		        xtype = 'U')
Drop Table [Days]
Go
create table [Days] (
	DayID int identity(1,1) not null primary key,
	[Day] int	
	)
GO 



/************ Actual Burn Off Reports ******************/

/*** Air craft  ***/ 

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAirPlaneActualBurnOff' and
		        xtype = 'P')
Drop Procedure GetAirPlaneActualBurnOff
Go
Create Procedure GetAirPlaneActualBurnOff  @AirPlaneID int = 0,
										   @StartDate DateTime = null,
										   @EndDate DateTime = null
as
/*
Declare @StartDate DateTime ,
		@EndDate DateTime ,
		@AirPlaneID int 
Select @StartDate = Convert (DateTime,'10/01/2012', 101)
Select @EndDate = Convert (Datetime,'10/10/2012',101)
Select @AirPlaneID = 0*/
Select SUM(IsNull(S.ActualBurnOff, 0)) ActualBurnOFF , A.Name 
From  Sector S 
Inner Join AirPlane A on A.AirPlaneID = S.AirCraft_AirPlaneID
Where S.SectorDate >= ISNULL(@StartDate, '01/01/1900') and 
	  S.SectorDate <= ISNULL(@EndDate, '01/01/2500') And 
	  (@AirPlaneID = 0 OR A.AirPlaneID = @AirPlaneID)
Group by A.AirPlaneID,  A.Name

GO
/** Fuel per sector ***/

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSectorsActualBurnOff' and
		        xtype = 'P')
Drop Procedure GetSectorsActualBurnOff
Go
Create Procedure GetSectorsActualBurnOff  @From int = 0,
										 @To int = 0,
										 @StartDate DateTime = null,
										 @EndDate DateTime = null
as
/*
Declare @StartDate DateTime ,
		@EndDate DateTime ,
		@From int ,
		@To int 
Select @StartDate = Convert (DateTime,'10/05/2012', 101)
Select @EndDate = Convert (Datetime,'10/07/2012',101)
Select @From = 2
Select @To = 0*/
Select IsNull(S.ActualBurnOff, 0) ActualBurnOff, S.SectorDate , A.IATACode [From] , AA.IATACode [To],
			Stuff(( Select ' / ' + ShortName 
		    From Sector SS2 
		    Inner Join SectorPilot SP2 on SS2.SectorID = SP2.SectorID 
		    inner join Pilot P2 on SP2.PilotID = P2.PilotID 
		    where SS2.SectorID = S.SectorID 
			for XML path('')),1,3,'') Pilots 
			
From Sector S 
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort AA on S.To_AirportID = AA.AirPortID
Where S.SectorDate >= ISNULL(@StartDate, '01/01/1900') and 
	  S.SectorDate <= ISNULL(@EndDate, '01/01/2500') and 
	  (@From = 0 Or S.From_AirportID = @From) And 
	  (@To = 0 Or S.To_AirportID = @To) 
Order by S.SectorDate	 

GO
 If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCrewByUserName' and
		        xtype = 'P')
Drop Procedure GetCrewByUserName
Go
Create Procedure GetCrewByUserName @UserName nvarchar(50)
as

select * 
from Crew 
where UserName = @UserName
Go



/*************** tickets *********************/
ALTER Table Flight
Add IsPAX bit null,
    IsReturnFlight bit null,
    ReturnFlightID int null
GO



If Exists (select Name 
		   from sysobjects 
		   where name = 'Activities' and
		        xtype = 'U')
Drop Table Activities
Go
create table Activities (
	ActivityID int identity(1,1) not null primary key,
	Name nvarchar(30),
	ShortName nvarchar(5)
	)
GO 



If Exists (select Name 
		   from sysobjects 
		   where name = 'ActivitiesLog' and
		        xtype = 'U')
Drop Table ActivitiesLog
Go
create table ActivitiesLog (
	ActivitiesLogID int identity(1,1) not null primary key,
	Date DateTime,
	ActivityID int Foreign Key References Activities (ActivityID),
	CrewID int Foreign Key References Crew (CrewID),
	FromDate DateTime,
	TODate DateTime
	)
GO 



If Exists (select Name 
		   from sysobjects 
		   where name = '[dbo].GetAllActivityLog' and
		        xtype = 'P')
Drop Procedure [dbo].GetAllActivityLog
Go
Create Procedure [dbo].GetAllActivityLog @FromDate DateTime = null,
										 @ToDate DateTime = null,
										 @ActivityID int = 0,
										 @CrewID int = 0 
										 
as
/*
Declare @FromDate DateTime ,
		@ToDate DateTime ,
		@ActivityID int 
Select @FromDate = Convert (DateTime,'10/05/2012', 101)
Select @ToDate = Convert (Datetime,'10/07/2012',101)
Select @ActivityID = 0
*/
Select DISTINCT AL.FromDate, AL.TODate , AL.CrewID, AL.ActivityID
from ActivitiesLog AL 
Inner JOIN Activities A ON A.ActivityID = AL.ActivityID
Inner JOIN Crew C ON C.CrewID = AL.CrewID
Where (@ActivityID = 0 OR A.ActivityID = @ActivityID) And 
	  (AL.Date >= ISNULL(@FromDate, '01/01/1900') ) and 
	  (AL.Date <= ISNULL(@ToDate, '01/01/2500') )



Go


If Exists (select Name 
		   from sysobjects 
		   where name = '[dbo].GetAllActivityLogForDelete' and
		        xtype = 'P')
Drop Procedure [dbo].GetAllActivityLogForDelete
Go
Create Procedure [dbo].GetAllActivityLogForDelete @FromDate DateTime = null,
												  @ToDate DateTime = null,
												  @ActivityID int = 0,
												  @CrewID int = 0 
										 
as
/*
Declare @FromDate DateTime ,
		@ToDate DateTime ,
		@ActivityID int 
Select @FromDate = Convert (DateTime,'10/05/2012', 101)
Select @ToDate = Convert (Datetime,'10/07/2012',101)
Select @ActivityID = 0
*/
Select AL.*
from ActivitiesLog AL 
Inner JOIN Activities A ON A.ActivityID = AL.ActivityID
Inner JOIN Crew C ON C.CrewID = AL.CrewID
Where (@ActivityID = 0 OR A.ActivityID = @ActivityID) And 
	  (AL.Date >= ISNULL(@FromDate, '01/01/1900') ) and 
	  (AL.Date <= ISNULL(@ToDate, '01/01/2500') )



Go