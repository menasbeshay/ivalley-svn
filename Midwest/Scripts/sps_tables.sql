/***********************/
/* Midwest Project SPs */
/***********************/

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotByUserName' and
		        xtype = 'P')
Drop Procedure GetPilotByUserName
Go
Create Procedure GetPilotByUserName @UserName nvarchar(50)
as

select * 
from Pilot 
where UserName = @UserName
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotReport' and
		        xtype = 'P')
Drop Procedure GetPilotReport
Go
Create Procedure GetPilotReport @PilotID int,
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
		@NightM int,
		@TotalMonthDayH int,
		@TotalMonthDayM int,
		@TotalMonthNightH int,
		@TotalMonthNightM int,
		@TotalMonthH int,
		@TotalMonthM int,
		@DayH_StartDate int,
		@DayM_StartDate int,
		@NightH_StartDate int,
		@NightM_StartDate int,
		@Total_TBF_H int,
		@Total_TBF_M int

/*
Select @CTotalH = P.TBF_Total_Hours , @CTotalMin =TBF_Total_Mins,
@DayH = case when isheavy = 1 then ((sum(datepart(hh,s.FlyAtDay )))*2)/3
else sum(datepart(hh,s.FlyAtDay ))  end ,

@DayM = case when isheavy = 1 then ((sum(datepart(MI,s.FlyAtDay )))*2)/3
else sum(datepart(MI,s.FlyAtDay )) end,

@NightH = case when isheavy = 1 then ((sum(datepart(hh,s.FlyAtNight )))*2)/3
else sum(datepart(hh,s.FlyAtNight )) end, 

@NightM = case when isheavy = 1 then ((sum(datepart(MI,s.FlyAtNight )))*2)/3
else sum(datepart(MI,s.FlyAtNight )) end

from Report R
Inner Join AirPlane AP on R.AirCraft_AirPlaneID = AP.AirPlaneID
Inner Join Sector S on S.ReportID = R.ReportID
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort A2 on S.To_AirportID = A2.AirPortID
Inner Join ReportPilot RP on R.ReportID = Rp.ReportID
Inner Join Pilot P on RP.PilotID = P.PilotID
Inner join Position PP on RP.PositionID = PP.PositionID
Where P.PilotID = @PilotID and 
	  MONTH(R.ReportDate) = 8
group by P.TBF_Total_Hours , TBF_Total_Mins*/
Select @DayH_StartDate = ISNULL(SUM(DayH),0),
		@DayM_StartDate = ISNULL(SUM(DayM),0),
		@NightH_StartDate = ISNULL(SUM(NightH),0),
		@NightM_StartDate = ISNULL(SUM (NightM),0)
		From (
Select 
case when isheavy = 1 then ((sum(datepart(hh,s.FlyAtDay )))*2)/3
else sum(datepart(hh,s.FlyAtDay ))  end DayH,

case when isheavy = 1 then ((sum(datepart(MI,s.FlyAtDay )))*2)/3
else sum(datepart(MI,s.FlyAtDay )) end DayM,

case when isheavy = 1 then ((sum(datepart(hh,s.FlyAtNight )))*2)/3
else sum(datepart(hh,s.FlyAtNight )) end NightH, 

case when isheavy = 1 then ((sum(datepart(MI,s.FlyAtNight )))*2)/3
else sum(datepart(MI,s.FlyAtNight )) end NightM

from Sector S
Inner Join AirPlane AP on S.AirCraft_AirPlaneID = AP.AirPlaneID
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort A2 on S.To_AirportID = A2.AirPortID
Inner Join SectorPilot SP on S.SectorID = SP.SectorID
Inner Join Pilot P on SP.PilotID = P.PilotID
Inner join Position PP on SP.PositionID = PP.PositionID
Where P.PilotID = @PilotID and 
	  S.SectorDate < ISNULL(@StartDate, '01/01/1900') AND	  
	  (S.IsPAX is null or S.IsPAX <> 1 )
group by S.IsHeavy) as B


select @CTotalH = max(TBF_Total_Hours) , @CTotalMin = max(TBF_Total_Mins), @DayH = sum(DayH), @DayM = sum(DayM), @NightH = sum(NightH), @NightM = sum(NightM)
From(
Select TBF_Total_Hours , TBF_Total_Mins,
case when isheavy = 1 then ((sum(datepart(hh,s.FlyAtDay )))*2)/3
else sum(datepart(hh,s.FlyAtDay ))  end DayH,

case when isheavy = 1 then ((sum(datepart(MI,s.FlyAtDay )))*2)/3
else sum(datepart(MI,s.FlyAtDay )) end DayM,

case when isheavy = 1 then ((sum(datepart(hh,s.FlyAtNight )))*2)/3
else sum(datepart(hh,s.FlyAtNight )) end NightH, 

case when isheavy = 1 then ((sum(datepart(MI,s.FlyAtNight )))*2)/3
else sum(datepart(MI,s.FlyAtNight )) end NightM

from Sector S
Inner Join AirPlane AP on S.AirCraft_AirPlaneID = AP.AirPlaneID
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort A2 on S.To_AirportID = A2.AirPortID
Inner Join SectorPilot SP on S.SectorID = SP.SectorID
Inner Join Pilot P on SP.PilotID = P.PilotID
Inner join Position PP on SP.PositionID = PP.PositionID
Where P.PilotID = @PilotID and 
	  S.SectorDate >= ISNULL(@StartDate, '01/01/1900') and 
	  S.SectorDate <= ISNULL(@EndDate, '01/01/2500') AND	  
	  (S.IsPAX is null or S.IsPAX <> 1 )
group by IsHeavy, TBF_Total_Hours , TBF_Total_Mins
) as A

/* Totals for ( TBF + all times till start date ) */
Select @Total_TBF_H = @DayH_StartDate + @NightH_StartDate + ((@DayM_StartDate + @NightM_StartDate)/60)
Select @Total_TBF_M = @DayM_StartDate + @NightM_StartDate - (((@DayM_StartDate + @NightM_StartDate)/60)*60)


/* grand totals ( TBF + all times till start date + totals within start date and end date ) */
Select @TotalH = @Total_TBF_H + @DayH + @NightH  ,@TotalMin = @Total_TBF_M+ @DayM + @NightM
Select @TotalH =  @TotalH + (@TotalMin/ 60)
Select @TotalMin = @TotalMin - (@TotalMin/60)*60
/*Select @TotalH = @CTotalH + @DayH + @NightH  ,@TotalMin = @CTotalMin+ @DayM + @NightM
Select @TotalH =  @TotalH + (@TotalMin/ 60)
Select @TotalMin = @TotalMin - (@TotalMin/60)*60*/




/* Totals for current date range */
Select @TotalMonthDayH = @DayH + (@DayM/60)
Select @TotalMonthDayM = @DayM - (@DayM/60)*60

Select @TotalMonthNightH = @NightH + (@NightM/60)
Select @TotalMonthNightM = @NightM - (@NightM/60)*60

Select @TotalMonthH = @TotalMonthDayH + @TotalMonthNightH + ((@TotalMonthDayM+@TotalMonthNightM)/60)
Select @TotalMonthM = (@TotalMonthDayM+@TotalMonthNightM) - (((@TotalMonthDayM+@TotalMonthNightM)/60)*60)



Select P.FirstName , P.SecondName , P.SureName , P.LicenseNo,P.ShortName , @TotalH+TBF_Total_Hours+((TBF_Total_Mins+@TotalMin)/60) GrandTotalHours ,@Total_TBF_H+TBF_Total_Hours + ((@Total_TBF_M+TBF_Total_Mins)/60)  as TBF_Total_Hours, @TotalMin+TBF_Total_Mins-(((TBF_Total_Mins+@TotalMin)/60)*60) GrandTotalMin, @Total_TBF_M+TBF_Total_Mins - (((@Total_TBF_M+TBF_Total_Mins)/60)*60) as TBF_Total_Mins,@TotalMonthH MonthTotalH, @TotalMonthM MonthTotalMin, Ap.Name, A.IATACode, A2.IATACode , S.FlightNo, S.IsHeavy, S.SectorDate, AP.AirPlaneID, S.ChoxOff, S.ChoxOn, P.IsPilot,
/*Right('00'+ CONVERT(VARCHAR,DateDiff(Second ,S.ChoxOn, S.ChoxOff ) / 3600),2) + ':' + Right('00'+ CONVERT(VARCHAR,(DateDiff(Second ,S.ChoxOn, S.ChoxOff ) % 3600)/60),2) TimeBlock, */
Case isheavy when 1 then RIGHT('00' + Convert(varchar, Datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3),2) + ' : ' + RIGHT('00' + Convert(varchar, Datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3),2)
else RIGHT('00' + Convert(varchar,datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))),2) + ' : ' + RIGHT('00' + Convert(varchar,datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))),2) end TimeBlock, 

case isheavy when 1 then RIGHT('00' + Convert(varchar, datepart(hh,S.FlyAtDay)*2/3),2) + ' : ' + RIGHT('00' + Convert(varchar, datepart(MI,S.FlyAtDay)*2/3),2)
else RIGHT('00' + Convert(varchar, datepart(hh,S.FlyAtDay)),2) + ' : ' + RIGHT('00' + Convert(varchar, datepart(MI,S.FlyAtDay)),2) end FlyAtDay, 

case isheavy when 1 then RIGHT('00' + Convert(varchar, datepart(hh,S.FlyAtNight)*2/3),2) + ' : ' + RIGHT('00' + Convert(varchar, datepart(MI,S.FlyAtNight)*2/3),2)
else RIGHT('00' + Convert(varchar, datepart(hh,S.FlyAtNight)),2) + ' : ' + RIGHT('00' + Convert(varchar, datepart(MI,S.FlyAtNight)),2) end FlyAtNight

, @TotalMonthDayH TotalMonthDayH, @TotalMonthDayM TotalMonthDayM, @TotalMonthNightH TotalMonthNightH, @TotalMonthNightM TotalMonthNightM
from Sector S
Inner Join AirPlane AP on S.AirCraft_AirPlaneID = AP.AirPlaneID
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort A2 on S.To_AirportID = A2.AirPortID
Inner Join SectorPilot SP on S.SectorID = SP.SectorID
Inner Join Pilot P on SP.PilotID = P.PilotID
Inner join Position PP on SP.PositionID = PP.PositionID
Where P.PilotID = @PilotID and 
	  S.SectorDate >= ISNULL(@StartDate, '01/01/1900') and 
	  S.SectorDate <= ISNULL(@EndDate, '01/01/2500') AND	  
	  (S.IsPAX is null or S.IsPAX <> 1 )
order by S.SectorDate

GO



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllPilots' and
		        xtype = 'P')
Drop Procedure GetAllPilots
Go
Create Procedure GetAllPilots 
as

Select *, ShortName + ' - ' + FirstName + ' ' + SecondName + ' ' + SureName  DisplayName from Pilot where ispilot = 1

Go 

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllCoPilots' and
		        xtype = 'P')
Drop Procedure GetAllCoPilots
Go
Create Procedure GetAllCoPilots 
as

Select *, ShortName + ' - ' + FirstName + ' ' + SecondName + ' ' + SureName  DisplayName from Pilot where (ispilot <> 1) or (ispilot is null)


Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchReports' and
		        xtype = 'P')
Drop Procedure SearchReports
Go
Create Procedure SearchReports @filterText nvarchar(30),
							   @FromDate DateTime = null,
							   @ToDate DateTime = null
as

Select * from Flight
where (ISNULL(@filterText,'') = '' Or FlightNo Like N'%' + @filterText + N'%') and 
	  ReportDate >= (ISNULL(@FromDate, '01/01/1900')) And 
	  ReportDate <= (ISNULL(@ToDate, '01/01/2500'))


Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchPAXReports' and
		        xtype = 'P')
Drop Procedure SearchPAXReports
Go
Create Procedure SearchPAXReports @filterText nvarchar(30),
							   @FromDate DateTime = null,
							   @ToDate DateTime = null
as

Select * from Flight F 
Inner Join Sector S on F.ReportID = S.ReportID 
where (ISNULL(@filterText,'') = '' Or F.FlightNo Like N'%' + @filterText + N'%') and 
	  ReportDate >= (ISNULL(@FromDate, '01/01/1900')) And 
	  ReportDate <= (ISNULL(@ToDate, '01/01/2500')) and 
	  F.IsPAX = 1


Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPAXReport' and
		        xtype = 'P')
Drop Procedure GetPAXReport
Go
Create Procedure GetPAXReport 	@StartDate DateTime = null,
								@EndDate DateTime = null,
								@AirPlaneID int = 0 
as



Select R.ReportDate, A.IATACode , A2.IATACode , S.NoOfPax_A , S.NoOfPax_C , S.NoOfPax_I , S.FuleUplifted , S.ActualBurnOff , S.StandardBurnOff , S.FlightNo, AP.Name AirPlane
from Flight R
Inner Join Sector S on S.ReportID = R.ReportID
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort A2 on S.To_AirportID = A2.AirPortID
inner JOIN AirPlane AP ON R.AirCraft_AirPlaneID = AP.AirPlaneID
Where R.ReportDate >= ISNULL(@StartDate, '01/01/1900') and 
	  R.ReportDate <= ISNULL(@EndDate, '01/01/2500') And 
	 (S.IsPAX <> 1 or S.IsPAX is null) and 
	 (@AirPlaneID = 0 or R.AirCraft_AirPlaneID = @AirPlaneID) 	 
Order BY R.ReportDate	  
GO 


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetFlyHoursReport' and
		        xtype = 'P')
Drop Procedure GetFlyHoursReport
Go
Create Procedure GetFlyHoursReport 	@StartDate DateTime = null,
									@EndDate DateTime = null
as
/*
Declare @StartDate DateTime ,
									@EndDate DateTime  
Select @StartDate = Convert (DateTime,'08/01/2012', 101)
Select @EndDate = Convert (Datetime,'08/30/2012',101)
*/
Select Ap.Name , COUNT(S.SectorID) SectorCount/*,S.ATD, S.ATA*/,
/*Right('00'+ CONVERT(VARCHAR,DateDiff(Second ,S.ChoxOff, S.ChoxOn ) / 3600),2) + ':' + Right('00'+ CONVERT(VARCHAR,(DateDiff(Second ,S.ChoxOff, S.ChoxOn ) % 3600)/60),2)
,S.ChoxOn, S.ChoxOff,*/
sum(case when (DateDiff(Second ,S.ATD, S.ATA) / 3600) < 0 then (DateDiff(Second ,S.ATD, S.ATA) / 3600) + 24 else (DateDiff(Second ,S.ATD, S.ATA) / 3600) end) + 
sum(case when ((DateDiff(Second ,S.ATD, S.ATA ) % 3600)/60) < 0 then ((DateDiff(Second ,S.ATD, S.ATA ) % 3600)/60) + 60 else ((DateDiff(Second ,S.ATD, S.ATA ) % 3600)/60) end )/60 MOVH,
sum(case when ((DateDiff(Second ,S.ATD, S.ATA ) % 3600)/60) < 0 then ((DateDiff(Second ,S.ATD, S.ATA ) % 3600)/60) + 60 else ((DateDiff(Second ,S.ATD, S.ATA ) % 3600)/60) end ) - 
((sum(case when ((DateDiff(Second ,S.ATD, S.ATA ) % 3600)/60) < 0 then ((DateDiff(Second ,S.ATD, S.ATA ) % 3600)/60) + 60 else ((DateDiff(Second ,S.ATD, S.ATA ) % 3600)/60) end ))/60)*60 MOVM
,
sum(datepart(hh,s.FlyAtDay )) + sum(datepart(hh,s.FlyAtNight )) + (sum(datepart(MI,s.FlyAtDay )) + sum(datepart(MI,s.FlyAtNight )))/60 FH,
sum(datepart(MI,s.FlyAtDay )) + sum(datepart(MI,s.FlyAtNight )) - ((sum(datepart(MI,s.FlyAtDay )) + sum(datepart(MI,s.FlyAtNight )))/60)*60 FM

from Sector S
Inner Join AirPlane AP on S.AirCraft_AirPlaneID = AP.AirPlaneID
Where S.SectorDate >= ISNULL(@StartDate, '01/01/1900') and 
	  S.SectorDate <= ISNULL(@EndDate, '01/01/2500') And 
	  (S.IsPAX <> 1 or S.IsPAX is null) 
/*Where R.ReportDate >= @StartDate and 
	  R.ReportDate <= @EndDate*/
Group By Ap.Name
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotFlights' and
		        xtype = 'P')
Drop Procedure GetPilotFlights
Go
Create Procedure GetPilotFlights @PilotID int
as

Select S.SectorDate, A.IATACode [From], A2.IATACode [To], S.FlightNo
from Sector S
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort A2 on S.To_AirportID = A2.AirPortID
Inner Join SectorPilot SP on S.SectorID = SP.SectorID
Where SP.PilotID = @PilotID And 
	  (S.IsPAX <> 1 or S.IsPAX is null)
	  
GO 



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotSchedule' and
		        xtype = 'P')
Drop Procedure GetPilotSchedule
Go
Create Procedure GetPilotSchedule @PilotID int,
								  @StartDate DateTime = null,
								  @EndDate DateTime = null
as
/*
declare @PilotID int
Select @PilotID = 20 
Declare @StartDate DateTime ,
		@EndDate DateTime  
Select @StartDate = Convert (DateTime,'11/01/2012', 101)
Select @EndDate = Convert (Datetime,'11/30/2012',101)
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
			Stuff(( Select ' / ' + ShortName 
		    From Sector SS2 
		    Inner Join SectorPilot RP2 on SS2.SectorID = RP2.SectorID 
		    inner join Pilot P2 on RP2.PilotID = P2.PilotID 
		    where SS2.SectorID = S.SectorID 
			for XML path('')),1,3,'') Pilots 
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
Inner Join SectorPilot SP on S.SectorID = SP.SectorID 
inner join Pilot P on SP.PilotID = P.PilotID 
inner join AirPlane AP on S.AirCraft_AirPlaneID = AP.AirPlaneID
where  (@PilotID = 0 Or P.PilotID = @PilotID) and 
	   S.SectorDate >= ISNULL(@StartDate, '01/01/1900') and 
	   S.SectorDate <= ISNULL(@EndDate, '01/01/2500') And 
	  (S.IsPAX <> 1 or S.IsPAX is null)
order by S.SectorDate

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPAXFlights' and
		        xtype = 'P')
Drop Procedure GetPAXFlights
Go
Create Procedure GetPAXFlights 
as

Select R.*
from Flight R
Where R.IsPAX = 1

Go 


/**************************************************************/

/*
table log per diem
( pilotid , from date , to date , per diem days , log date )
*/

If Exists (select Name 
		   from sysobjects 
		   where name = 'CalculatePerDiem' and
		        xtype = 'P')
Drop Procedure CalculatePerDiem
Go
Create Procedure CalculatePerDiem 	@StartDate DateTime = null,
									@EndDate DateTime = null,
									@PilotID int
as

Declare /*@StartDate DateTime ,
		@EndDate DateTime , 
		@PilotID int ,*/
		@FirstName Nvarchar(50),
		@SecondName Nvarchar(50),
		@ReportDate Datetime,
		@From_AirportID int,
		@To_AirportID int,
		@FirstName_Back Nvarchar(50),
		@SecondName_Back Nvarchar(50),
		@ReportDate_Back Datetime,
		@From_AirportID_Back int,
		@To_AirportID_Back int,
		@PerDiem int 	 
/*Select @StartDate = Convert (DateTime,'08/01/2012', 101)
Select @EndDate = Convert (Datetime,'08/30/2012',101)
select @PilotID = 3
*/

create table #PilotPerDiemLogCurrrentRun (
	LogID int identity(1,1) not null primary key,
	[PilotID] [int] NOT NULL,
	FromDate DateTime,
	ToDate DateTime,
	Days int,
	InsertedDate DateTime,
	StartDate DateTime,
	EndDate DateTime
	
	)

Declare AllFrom Cursor For 
Select P.FirstName ,
	   P.SecondName,
	   R.ReportDate,
	   S.From_AirportID,
	   S.To_AirportID	   

from Flight R
Inner Join FlightPilot RP on R.ReportID = RP.ReportID 
inner join Pilot P on RP.PilotID = P.PilotID 
Inner Join Sector S on S.ReportID = R.ReportID
Where R.ReportDate >= ISNULL(@StartDate, '01/01/1900') and 
	  R.ReportDate <= ISNULL(@EndDate, '01/01/2500') and 
	  (S.From_AirportID = 17) And 
	  (@PilotID = 0 OR P.PilotID = @PilotID) 
order by R.ReportDate Asc



OPEN AllFrom
FETCH NEXT FROM AllFrom INTO @FirstName ,
							 @SecondName ,
							 @ReportDate ,
							 @From_AirportID ,
							 @To_AirportID


WHILE @@FETCH_STATUS = 0 
BEGIN

	Select Top 1 @FirstName_Back = P.FirstName ,
				 @SecondName_Back = P.SecondName,
				 @ReportDate_Back = R.ReportDate,
				 @From_AirportID_Back = S.From_AirportID,
				 @To_AirportID_Back =  S.To_AirportID	   

	from Flight R
	Inner Join FlightPilot RP on R.ReportID = RP.ReportID 
	inner join Pilot P on RP.PilotID = P.PilotID 
	Inner Join Sector S on S.ReportID = R.ReportID
	Where R.ReportDate >= @ReportDate and 		  
		  (S.To_AirportID = 17) And 
		  (@PilotID = 0 OR P.PilotID = @PilotID) 
	order by R.ReportDate Asc	
	
	Select @PerDiem = DATEDIFF(day, @ReportDate , @ReportDate_Back) 
	
	if not exists(select LogID 
				  from PilotPerDiemLog 
				  where PilotID = @PilotID and 
						StartDate = @StartDate and 
						EndDate = @EndDate)
	Insert into PilotPerDiemLog (PilotID, FromDate , ToDate , Days, InsertedDate, StartDate, EndDate)
	values (@PilotID,@ReportDate , @ReportDate_Back, @PerDiem, GETDATE(), @StartDate, @EndDate )
	
	Insert into #PilotPerDiemLogCurrrentRun (PilotID, FromDate , ToDate , Days, InsertedDate, StartDate, EndDate)
	values (@PilotID,@ReportDate , @ReportDate_Back, @PerDiem, GETDATE(), @StartDate, @EndDate )
	
		
	FETCH NEXT FROM AllFrom INTO @FirstName ,
								 @SecondName ,
								 @ReportDate ,
								 @From_AirportID ,
								 @To_AirportID   
END
CLOSE AllFrom
DEALLOCATE AllFrom


Select L.*, P.FirstName, P.SecondName, P.ShortName , P.SureName from #PilotPerDiemLogCurrrentRun L
Inner join Pilot P on P.PilotID = L.PilotID
Where L.PilotID = @PilotID And 
	  (FromDate >= ISNULL(@StartDate, '01/01/1900') and 
	   ToDate <= ISNULL(@EndDate, '01/01/2500'))

--Select L.*, P.FirstName, P.SecondName, P.ShortName , P.SureName from PilotPerDiemLog L
--Inner join Pilot P on P.PilotID = L.PilotID
--Where L.PilotID = @PilotID And 
--	  (FromDate >= ISNULL(@StartDate, '01/01/1900') and 
--	   ToDate <= ISNULL(@EndDate, '01/01/2500'))
	   

DROP TABLE #PilotPerDiemLogCurrrentRun

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPerDiemLog' and
		        xtype = 'P')
Drop Procedure GetPerDiemLog
Go
Create Procedure GetPerDiemLog 	@StartDate DateTime = null,
								@EndDate DateTime = null,
								@PilotID int
as

Select L.*, P.FirstName, P.SecondName, P.ShortName , P.SureName from PilotPerDiemLog L
Inner join Pilot P on P.PilotID = L.PilotID
Where L.PilotID = @PilotID And 
	  (StartDate = ISNULL(@StartDate, '01/01/1900') and 
	   EndDate = ISNULL(@EndDate, '01/01/2500'))
	   
GO	   


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetFlightLog' and
		        xtype = 'P')
Drop Procedure GetFlightLog
Go
Create Procedure GetFlightLog @ReportID int
as

select * , datepart(hh,s.FlyAtDay ) + datepart(hh,s.FlyAtNight ) + ((datepart(MI,s.FlyAtDay ) + datepart(MI,s.FlyAtNight ))/60) As TotalHours , (datepart(MI,s.FlyAtDay ) + datepart(MI,s.FlyAtNight ))- (((datepart(MI,s.FlyAtDay ) + datepart(MI,s.FlyAtNight ))/60)*60) As TotalMins
from Sector S
Inner Join AirPlane AP on S.AirCraft_AirPlaneID = AP.AirPlaneID
Inner Join AirPort A on S.From_AirportID = A.AirPortID
Inner Join AirPort A2 on S.To_AirportID = A2.AirPortID
LEFT Join [Delay] D1 on S.DepDelayID1 = D1.DelayID
LEFT Join [Delay] D2 on S.DepDelayID2 = D2.DelayID
LEFT Join [Delay] D3 on S.DepDelayID3 = D3.DelayID
LEFT Join [Delay] D11 on S.ArrDelayID1 = D11.DelayID
LEFT Join [Delay] D22 on S.ArrDelayID2 = D22.DelayID
LEFT Join [Delay] D33 on S.ArrDelayID3 = D33.DelayID
--Left Join ReportPilot RP on R.ReportID = Rp.ReportID
--Left Join Pilot P on RP.PilotID = P.PilotID
--Left join Position PP on RP.PositionID = PP.PositionID
--Left Join ReportCrew RC on R.ReportID = RC.ReportID
--Left Join Crew C on RC.CrewID = C.CrewID
--Left join Position CP on RC.PositionID = CP.PositionID
where S.SectorID = @ReportID

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetFlightLogCrew' and
		        xtype = 'P')
Drop Procedure GetFlightLogCrew
Go
Create Procedure GetFlightLogCrew @ReportID int
as

select * 
from Sector S
--Left Join ReportPilot RP on R.ReportID = Rp.ReportID
--Left Join Pilot P on RP.PilotID = P.PilotID
--Left join Position PP on RP.PositionID = PP.PositionID
inner Join SectorCrew SC on S.SectorID = SC.SectorID
inner Join Crew C on SC.CrewID = C.CrewID
inner join Position CP on SC.PositionID = CP.PositionID
where S.SectorID = @ReportID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetFlightLogPilot' and
		        xtype = 'P')
Drop Procedure GetFlightLogPilot
Go
Create Procedure GetFlightLogPilot @ReportID int
as

select * 
from Sector S
inner Join SectorPilot SP on S.SectorID = SP.SectorID
inner Join Pilot P on SP.PilotID = P.PilotID
inner join Position PP on SP.PositionID = PP.PositionID
--inner Join ReportCrew RC on R.ReportID = RC.ReportID
--inner Join Crew C on RC.CrewID = C.CrewID
--inner join Position CP on RC.PositionID = CP.PositionID
where S.SectorID = @ReportID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetFlightLogTotalTime' and
		        xtype = 'P')
Drop Procedure GetFlightLogTotalTime
Go
Create Procedure GetFlightLogTotalTime @ReportID int
as
Declare	@DayH int, 
		@DayM int,
		@NightH int,
		@NightM int,
		@TotalH int,
		@TotalM int

select @DayH=SUM(datepart(hh,s.FlyAtDay)),@DayM=SUM(datepart(MI,s.FlyAtDay)),@NightH=SUM(datepart(hh,s.FlyAtNight)), @NightM=SUM(datepart(MI,s.FlyAtNight))
from Sector S 
where S.SectorID = @ReportID

Select @DayH = @DayH + (@DayM/60)
Select @DayM = @DayM - ((@DayM/60)*60)

Select @NightH = @NightH + (@NightM/60)
Select @NightM = @NightM - ((@NightM/60)*60)

select @TotalH  = @DayH + @NightH + (@NightM + @DayM)/60
select @TotalM = (@DayM + @NightM) - ((@NightM + @DayM)/60)

Select @DayH DayH , 
		@DayM DayM ,
		@NightH NightH ,
		@NightM NightM ,
		@TotalH TotalH  ,
		@TotalM TotalM
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCrewByReportID' and
		        xtype = 'P')
Drop Procedure GetCrewByReportID
Go
Create Procedure GetCrewByReportID @ReportID int  
as  
  
Select * from SectorCrew   
Where SectorID = @ReportID  
Go 

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotByReportID' and
		        xtype = 'P')
Drop Procedure GetPilotByReportID
Go
Create Procedure GetPilotByReportID @ReportID int  
as  
  
Select * from SectorPilot   
Where SectorID = @ReportID  
GO

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSectorsByReportID' and
		        xtype = 'P')
Drop Procedure GetSectorsByReportID
Go
Create Procedure GetSectorsByReportID @ReportID int  
as  
  
Select * from Sector   
Where ReportID = @ReportID  
GO  

    

/************** per diem table **********************/
If Exists (select Name 
		   from sysobjects 
		   where name = 'PilotPerDiemLog' and
		        xtype = 'U')
Drop Table PilotPerDiemLog
Go

CREATE TABLE PilotPerDiemLog(
	LogID int identity(1,1) not null primary key,
	[PilotID] [int] NOT NULL,
	FromDate DateTime,
	ToDate DateTime,
	Days int,
	InsertedDate DateTime,
	StartDate DateTime,
	EndDate DateTime
	
	)
Go 

/******* rename reportpilot and crew *******/ 
sp_RENAME 'ReportCrew', 'FlightCrew'
GO

sp_RENAME 'ReportPilot', 'FlightPilot'
GO



/******************************************************/


If Exists (select Name 
		   from sysobjects 
		   where name = 'CalculateCrewPerDiem' and
		        xtype = 'P')
Drop Procedure CalculateCrewPerDiem
Go
Create Procedure CalculateCrewPerDiem 	@StartDate DateTime = null,
										@EndDate DateTime = null,
										@CrewID int
as

Declare /*@StartDate DateTime ,
		@EndDate DateTime , 
		@CrewID int ,*/
		@FirstName Nvarchar(50),
		@SecondName Nvarchar(50),
		@ReportDate Datetime,
		@From_AirportID int,
		@To_AirportID int,
		@FirstName_Back Nvarchar(50),
		@SecondName_Back Nvarchar(50),
		@ReportDate_Back Datetime,
		@From_AirportID_Back int,
		@To_AirportID_Back int,
		@PerDiem int 	 
/*Select @StartDate = Convert (DateTime,'08/01/2012', 101)
Select @EndDate = Convert (Datetime,'08/30/2012',101)
select @CrewID = 3
*/

create table #CrewPerDiemLogCurrrentRun (
	LogID int identity(1,1) not null primary key,
	[CrewID] [int] NOT NULL,
	FromDate DateTime,
	ToDate DateTime,
	Days int,
	InsertedDate DateTime,
	StartDate DateTime,
	EndDate DateTime
	
	)

Declare AllFrom Cursor For 
Select P.Name ,
	   R.ReportDate,
	   S.From_AirportID,
	   S.To_AirportID	   

from Flight R
Inner Join FlightCrew RP on R.ReportID = RP.ReportID 
inner join Crew P on RP.CrewID = P.CrewID 
Inner Join Sector S on S.ReportID = R.ReportID
Where R.ReportDate >= ISNULL(@StartDate, '01/01/1900') and 
	  R.ReportDate <= ISNULL(@EndDate, '01/01/2500') and 
	  (S.From_AirportID = 17) And 
	  (@CrewID = 0 OR P.CrewID = @CrewID) 
order by R.ReportDate Asc



OPEN AllFrom
FETCH NEXT FROM AllFrom INTO @FirstName ,							 
							 @ReportDate ,
							 @From_AirportID ,
							 @To_AirportID


WHILE @@FETCH_STATUS = 0 
BEGIN

	Select Top 1 @FirstName_Back = P.FirstName ,
				 @SecondName_Back = P.SecondName,
				 @ReportDate_Back = R.ReportDate,
				 @From_AirportID_Back = S.From_AirportID,
				 @To_AirportID_Back =  S.To_AirportID	   

	from Flight R
	Inner Join FlightPilot RP on R.ReportID = RP.ReportID 
	inner join Pilot P on RP.PilotID = P.PilotID 
	Inner Join Sector S on S.ReportID = R.ReportID
	Where R.ReportDate >= @ReportDate and 		  
		  (S.To_AirportID = 17) And 
		  (@PilotID = 0 OR P.PilotID = @PilotID) 
	order by R.ReportDate Asc	
	
	Select @PerDiem = DATEDIFF(day, @ReportDate , @ReportDate_Back) 
	
	if not exists(select LogID 
				  from PilotPerDiemLog 
				  where PilotID = @PilotID and 
						StartDate = @StartDate and 
						EndDate = @EndDate)
		
	Insert into #PilotPerDiemLogCurrrentRun (PilotID, FromDate , ToDate , Days, InsertedDate, StartDate, EndDate)
	values (@PilotID,@ReportDate , @ReportDate_Back, @PerDiem, GETDATE(), @StartDate, @EndDate )
	
		
	FETCH NEXT FROM AllFrom INTO @FirstName ,
								 @SecondName ,
								 @ReportDate ,
								 @From_AirportID ,
								 @To_AirportID   
END
CLOSE AllFrom
DEALLOCATE AllFrom


Select L.*, P.FirstName, P.SecondName, P.ShortName , P.SureName from #PilotPerDiemLogCurrrentRun L
Inner join Pilot P on P.PilotID = L.PilotID
Where L.PilotID = @PilotID And 
	  (FromDate >= ISNULL(@StartDate, '01/01/1900') and 
	   ToDate <= ISNULL(@EndDate, '01/01/2500'))


DROP TABLE #PilotPerDiemLogCurrrentRun

Go



/********************************* add new table **********************************************************/
If Exists (select Name 
		   from sysobjects 
		   where name = 'SectorClients' and
		        xtype = 'U')
Drop Table SectorClients
Go

CREATE TABLE SectorClients(
	ClientID int identity(1,1) not null primary key,
	Name nvarchar(200),
	Tele nvarchar(50),
	Fax nvarchar(50),
	Mail nvarchar(100),
	[Address] nvarchar(300),
	Website nvarchar(100),
	ContactName nvarchar(200),
	ContactTele nvarchar(50),
	ContactMail nvarchar(100),
	ContactMobile nvarchar(100),
	LogoPath nvarchar(200)
	)
Go 


ALTER table sector 
Add ClientID int Foreign Key References SectorClients(ClientID) null 
Go