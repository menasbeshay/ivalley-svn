
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

from Flight R
Inner Join AirPlane AP on R.AirCraft_AirPlaneID = AP.AirPlaneID
Inner Join Sector S on S.ReportID = R.ReportID
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort A2 on S.To_AirportID = A2.AirPortID
Inner Join FlightCrew RP on R.ReportID = Rp.ReportID
Inner Join Crew C on RP.CrewID = C.CrewID
Inner join Position PP on RP.PositionID = PP.PositionID
Where C.CrewID = @CrewID and 
	  R.ReportDate >= ISNULL(@StartDate, '01/01/1900') and 
	  R.ReportDate <= ISNULL(@EndDate, '01/01/2500') AND
	  (R.IsPAX IS NULL OR R.IsPAX <> 1) AND 
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
	   
	   Ap.Name PlaneName, A.IATACode, A2.IATACode , S.FlightNo, R.IsHeavy, R.ReportDate, AP.AirPlaneID, S.ChoxOff, S.ChoxOn, 
/*Right('00'+ CONVERT(VARCHAR,DateDiff(Second ,S.ChoxOn, S.ChoxOff ) / 3600),2) + ':' + Right('00'+ CONVERT(VARCHAR,(DateDiff(Second ,S.ChoxOn, S.ChoxOff ) % 3600)/60),2) TimeBlock, */
Case IsHeavyCrew when 1 then RIGHT('00' + Convert(varchar, Datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3),2) + ' : ' + RIGHT('00' + Convert(varchar, Datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3),2)
else RIGHT('00' + Convert(varchar,datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))),2) + ' : ' + RIGHT('00' + Convert(varchar,datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))),2) end TimeBlock
, IsHeavyCrew 
from Flight R
Inner Join AirPlane AP on R.AirCraft_AirPlaneID = AP.AirPlaneID
Inner Join Sector S on S.ReportID = R.ReportID
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort A2 on S.To_AirportID = A2.AirPortID
Inner Join FlightCrew RP on R.ReportID = Rp.ReportID
Inner Join Crew C on RP.CrewID = C.CrewID
Inner join Position PP on RP.PositionID = PP.PositionID
Where C.CrewID = @CrewID and 
	  R.ReportDate >= ISNULL(@StartDate, '01/01/1900') and 
	  R.ReportDate <= ISNULL(@EndDate, '01/01/2500') AND
	  (R.IsPAX IS NULL OR R.IsPAX <> 1) AND 
	  (S.IsPAX is null or S.IsPAX <> 1 )
order by R.ReportDate

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
Select distinct F.ReportID, F.ReportDate , S.IsPAX,
CASE DATEPART(weekday,F.ReportDate)
WHEN 1 THEN 'SUN'
WHEN 2 THEN 'MON'
WHEN 3 THEN 'TUE'
WHEN 4 THEN 'WED'
WHEN 5 THEN 'THU'
WHEN 6 THEN 'FRI'
WHEN 7 THEN 'SAT'
END [Day], 
F.FlightNo, 
			Stuff(( Select ' / ' + Name 
		    From Flight FF2 
		    Inner Join FlightCrew RP2 on FF2.ReportID = RP2.ReportID 
		    inner join Crew P2 on RP2.CrewID = P2.CrewID 
		    where FF2.ReportID = F.ReportID 
			for XML path('')),1,3,'') Crew 
			,
			(select min(SS1.STD) 
			from Flight FF11
			Inner Join Sector SS1 on SS1.ReportID = FF11.ReportID
			where FF11.ReportID = F.ReportID)  STD
			 , 
			(select max(SS2.STA) 
			from Flight FF12
			Inner Join Sector SS2 on SS2.ReportID = FF12.ReportID
			where FF12.ReportID = F.ReportID) STA
			, 
			Stuff(( Select ' * ' + A.IATACode + ' - ' + A2.IATACode 
		    From Flight FF3 
		    Inner Join Sector SS on SS.ReportID = FF3.ReportID
			Inner Join AirPort A on SS.From_AirportID = A.AirPortID
			Inner Join AirPort A2 on SS.To_AirportID = A2.AirPortID
		    where FF3.ReportID = F.ReportID 
			for XML path('')),1,3,'') [From_TO]  ,
			S.ChoxOff,
			S.ChoxOn,
			AP.AirPlaneID AirPlane
From Flight F 
Inner Join Sector S on S.ReportID = F.ReportID
Inner Join FlightCrew RP on F.ReportID = RP.ReportID 
inner join Crew P on RP.CrewID = P.CrewID 
inner join AirPlane AP on F.AirCraft_AirPlaneID = AP.AirPlaneID
where  (@CrewID = 0 Or P.CrewID = @CrewID) and 
	   F.ReportDate >= ISNULL(@StartDate, '01/01/1900') and 
	   F.ReportDate <= ISNULL(@EndDate, '01/01/2500') /*And 
	  (S.IsPAX <> 1 or S.IsPAX is null)*/
order by F.ReportDate

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
Select A.* ,
Case F.IsHeavyCrew when 1 then 
ISNULL(SUM(Datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3) , '')
else 
ISNULL(SUM(datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))), '') end TimeBlockHH 
,
Case F.IsHeavyCrew when 1 then 
ISNULL(SUM(Datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3) , '')
else 
ISNULL(SUM(datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))), '') end TimeBlockMM
From 
(
Select Crew.CrewID, Crew.Name , [Days].[Day] , Crew.IDNO
from Crew Cross join [Days]) as A 
Left join FlightCrew FC on A.CrewID = FC.CrewID
Left Join Flight F on F.ReportID = FC.ReportID and Day(F.ReportDate) = A.[Day] 
Left Join Sector S on S.ReportID = F.ReportID
Where (F.ReportDate >= ISNULL(@StartDate, '01/01/1900') and 
	  F.ReportDate <= ISNULL(@EndDate, '01/01/2500')) OR 
	  F.ReportDate is NULL
Group by A.CrewID , A.Name , A.Day, A.IDNO , F.IsHeavyCrew
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
From Flight F
Inner Join Sector S on F.ReportID = S.ReportID
Inner Join AirPlane A on A.AirPlaneID = F.AirCraft_AirPlaneID
Where F.ReportDate >= ISNULL(@StartDate, '01/01/1900') and 
	  F.ReportDate <= ISNULL(@EndDate, '01/01/2500') And 
	  (@AirPlaneID = 0 OR A.AirPlaneID = @AirPlaneID)
Group by A.AirPlaneID,  A.Name

GO
/** Fuel per sector ***/

If Exists (select Name 
		   from sysobjects 
		   where name = '[dbo].GetSectorActualBurnOff' and
		        xtype = 'P')
Drop Procedure [dbo].GetSectorActualBurnOff
Go
Create Procedure [dbo].GetSectorActualBurnOff  @From int = 0,
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
Select IsNull(S.ActualBurnOff, 0) ActualBurnOff, F.ReportDate , A.IATACode [From] , AA.IATACode [To],
			Stuff(( Select ' / ' + ShortName 
		    From Flight FF2 
		    Inner Join FlightPilot RP2 on FF2.ReportID = RP2.ReportID 
		    inner join Pilot P2 on RP2.PilotID = P2.PilotID 
		    where FF2.ReportID = F.ReportID 
			for XML path('')),1,3,'') Pilots 
			
From Flight F
Inner Join Sector S on F.ReportID = S.ReportID
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort AA on S.To_AirportID = AA.AirPortID
Where F.ReportDate >= ISNULL(@StartDate, '01/01/1900') and 
	  F.ReportDate <= ISNULL(@EndDate, '01/01/2500') and 
	  (@From = 0 Or S.From_AirportID = @From) And 
	  (@To = 0 Or S.To_AirportID = @To) 
Order by F.ReportDate	 

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

