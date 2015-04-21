exec GetPilotDHDWithinRange 7, '02/01/2015', '02/28/2015'
/*
 get pilot hours within range 
*/
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotReportWithinRange' and
		        xtype = 'P')
Drop Procedure GetPilotReportWithinRange
Go

CREATE Procedure GetPilotReportWithinRange @PilotID int,  
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
  @Total_TBF_H int,  
  @Total_TBF_M int  
  
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
   (S.IsPAX is null or S.IsPAX <> 1 )  AND  
   /* not Dead head */  
   --((SP.PositionID <> 12 ) and  -- trainee included in pilot hours
   (SP.PositionID <> 13)  
group by IsHeavy, TBF_Total_Hours , TBF_Total_Mins  
) as A  

  
/* grand totals ( totals within start date and end date ) */  
Select @TotalH = @DayH + @NightH  ,@TotalMin = @DayM + @NightM  
Select @TotalH =  @TotalH + (@TotalMin/ 60)  
Select @TotalMin = @TotalMin - (@TotalMin/60)*60  
  
  
/* Totals for current date range */  
Select @TotalMonthDayH = @DayH + (@DayM/60)  
Select @TotalMonthDayM = @DayM - (@DayM/60)*60  
  
Select @TotalMonthNightH = @NightH + (@NightM/60)  
Select @TotalMonthNightM = @NightM - (@NightM/60)*60  
  
Select @TotalMonthH = @TotalMonthDayH + @TotalMonthNightH + ((@TotalMonthDayM+@TotalMonthNightM)/60)  
Select @TotalMonthM = (@TotalMonthDayM+@TotalMonthNightM) - (((@TotalMonthDayM+@TotalMonthNightM)/60)*60)  
  
  
  
Select P.FirstName , P.SecondName , P.SureName , P.LicenseNo,P.ShortName , @TotalH+TBF_Total_Hours+((TBF_Total_Mins+@TotalMin)/60) GrandTotalHours ,@Total_TBF_H+TBF_Total_Hours + ((@Total_TBF_M+TBF_Total_Mins)/60)  as TBF_Total_Hours, @TotalMin+
TBF_Total_Mins -(((TBF_Total_Mins+@TotalMin)/60)*60) GrandTotalMin, @Total_TBF_M+TBF_Total_Mins - (((@Total_TBF_M+TBF_Total_Mins)/60)*60) as TBF_Total_Mins,@TotalMonthH MonthTotalH, @TotalMonthM MonthTotalMin, Ap.Name, A.IATACode, A2.IATACode , S.FlightNo, S.IsHeavy
, S.SectorDate, AP.AirPlaneID, S.ChoxOff, S.ChoxOn, P.IsPilot,  
/*Right('00'+ CONVERT(VARCHAR,DateDiff(Second ,S.ChoxOn, S.ChoxOff ) / 3600),2) + ':' + Right('00'+ CONVERT(VARCHAR,(DateDiff(Second ,S.ChoxOn, S.ChoxOff ) % 3600)/60),2) TimeBlock, */  
Case isheavy when 1 then RIGHT('00' + Convert(varchar, Datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3),2) + ' : ' + RIGHT('00' + Convert(varchar, Datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/
3),2)  
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
   (S.IsPAX is null or S.IsPAX <> 1 )  AND  
   /* not Dead head */  
   --((SP.PositionID <> 12 ) and  -- trainee included in pilot hours 
   (SP.PositionID <> 13)   
order by S.SectorDate  


Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotDHDWithinRange' and
		        xtype = 'P')
Drop Procedure GetPilotDHDWithinRange
Go

CREATE Procedure GetPilotDHDWithinRange @PilotID int,  
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
  @Total_TBF_H int,  
  @Total_TBF_M int  
  
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
     
   /* Dead head */  
   (SP.PositionID = 13 ) 
group by IsHeavy, TBF_Total_Hours , TBF_Total_Mins  
) as A  

  
/* grand totals ( totals within start date and end date ) */  
Select @TotalH = @DayH + @NightH  ,@TotalMin = @DayM + @NightM  
Select @TotalH =  @TotalH + (@TotalMin/ 60)  
Select @TotalMin = @TotalMin - (@TotalMin/60)*60  
  
  
/* Totals for current date range */  
Select @TotalMonthDayH = @DayH + (@DayM/60)  
Select @TotalMonthDayM = @DayM - (@DayM/60)*60  
  
Select @TotalMonthNightH = @NightH + (@NightM/60)  
Select @TotalMonthNightM = @NightM - (@NightM/60)*60  
  
Select @TotalMonthH = @TotalMonthDayH + @TotalMonthNightH + ((@TotalMonthDayM+@TotalMonthNightM)/60)  
Select @TotalMonthM = (@TotalMonthDayM+@TotalMonthNightM) - (((@TotalMonthDayM+@TotalMonthNightM)/60)*60)  
  
  
  
Select P.FirstName , P.SecondName , P.SureName , P.LicenseNo,P.ShortName , @TotalH+TBF_Total_Hours+((TBF_Total_Mins+@TotalMin)/60) GrandTotalHours ,@Total_TBF_H+TBF_Total_Hours + ((@Total_TBF_M+TBF_Total_Mins)/60)  as TBF_Total_Hours, @TotalMin+
TBF_Total_Mins -(((TBF_Total_Mins+@TotalMin)/60)*60) GrandTotalMin, @Total_TBF_M+TBF_Total_Mins - (((@Total_TBF_M+TBF_Total_Mins)/60)*60) as TBF_Total_Mins,@TotalMonthH MonthTotalH, @TotalMonthM MonthTotalMin, Ap.Name, A.IATACode, A2.IATACode , S.FlightNo, S.IsHeavy
, S.SectorDate, AP.AirPlaneID, S.ChoxOff, S.ChoxOn, P.IsPilot,  
/*Right('00'+ CONVERT(VARCHAR,DateDiff(Second ,S.ChoxOn, S.ChoxOff ) / 3600),2) + ':' + Right('00'+ CONVERT(VARCHAR,(DateDiff(Second ,S.ChoxOn, S.ChoxOff ) % 3600)/60),2) TimeBlock, */  
Case isheavy when 1 then RIGHT('00' + Convert(varchar, Datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3),2) + ' : ' + RIGHT('00' + Convert(varchar, Datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/
3),2)  
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
   
   /*  Dead head */  
   (SP.PositionID = 13 )  
order by S.SectorDate  


Go 
 



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
   (S.IsPAX is null or S.IsPAX <> 1 ) AND  
   /* not Dead head */  
   --((SP.PositionID <> 12 ) and  -- trainee included in crew hours 
   (SP.PositionID <> 13) 
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
Case IsHeavyCrew when 1 then RIGHT('00' + Convert(varchar, Datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3),2) + ' : ' + RIGHT('00' + Convert(varchar, Datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight)
)*2/3),2)  
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
   (S.IsPAX is null or S.IsPAX <> 1 ) AND  
   /* not Dead head */  
   --((SP.PositionID <> 12 ) and  -- trainee included in crew hours 
   (SP.PositionID <> 13)  
order by S.SectorDate  
  


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCrewDHDHours' and
		        xtype = 'P')
Drop Procedure GetCrewDHDHours
Go
Create Procedure GetCrewDHDHours @CrewID int,  
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
   /*  Dead head */  
   (SP.PositionID = 13 ) 
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
Case IsHeavyCrew when 1 then RIGHT('00' + Convert(varchar, Datepart(hh,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight))*2/3),2) + ' : ' + RIGHT('00' + Convert(varchar, Datepart(MI,DateAdd(MINUTE,Datediff(MINUTE,0 ,S.FlyAtDay) , S.FlyAtNight)
)*2/3),2)  
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
   /*  Dead head  */  
   (SP.PositionID = 13 ) 
order by S.SectorDate  
  GO
  
  
  
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotReportWithinRangeAsTable' and
		        xtype = 'FT')
Drop function GetPilotReportWithinRangeAsTable
Go

CREATE function GetPilotReportWithinRangeAsTable (@PilotID int,  
        @StartDate DateTime = null,  
        @EndDate DateTime = null)
returns @result table
(
	GrandTotalHours int, 
	GrandTotalMins int
)
as  
Begin
  
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
  @Total_TBF_H int,  
  @Total_TBF_M int  
  
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
   (S.IsPAX is null or S.IsPAX <> 1 )  AND  
   /* not Dead head or trainee */  
   (SP.PositionID <> 12 ) AND  
   (SP.PositionID <> 13)  
group by IsHeavy, TBF_Total_Hours , TBF_Total_Mins  
) as A  

  
/* grand totals ( totals within start date and end date ) */  
Select @TotalH = @DayH + @NightH  ,@TotalMin = @DayM + @NightM  
Select @TotalH =  @TotalH + (@TotalMin/ 60)  
Select @TotalMin = @TotalMin - (@TotalMin/60)*60  
  
  
/* Totals for current date range */  
Select @TotalMonthDayH = @DayH + (@DayM/60)  
Select @TotalMonthDayM = @DayM - (@DayM/60)*60  
  
Select @TotalMonthNightH = @NightH + (@NightM/60)  
Select @TotalMonthNightM = @NightM - (@NightM/60)*60  
  
Select @TotalMonthH = @TotalMonthDayH + @TotalMonthNightH + ((@TotalMonthDayM+@TotalMonthNightM)/60)  
Select @TotalMonthM = (@TotalMonthDayM+@TotalMonthNightM) - (((@TotalMonthDayM+@TotalMonthNightM)/60)*60)  
  
  
  
insert @result
Select isnull(@TotalH+((@TotalMin)/60),0) GrandTotalHours , isnull(@TotalMin -(((@TotalMin)/60)*60),0) GrandTotalMin

return  
End

  
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotDHDWithinRangeAsTable' and
		        xtype = 'FT')
Drop function GetPilotDHDWithinRangeAsTable
Go

CREATE function GetPilotDHDWithinRangeAsTable (@PilotID int,  
        @StartDate DateTime = null,  
        @EndDate DateTime = null )
Returns @Result Table 
(
	GrandTotalDHDHours int, 
	GrandTotalDHDMins int
)
as  
Begin  
  
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
  @Total_TBF_H int,  
  @Total_TBF_M int  
  
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
     
   /* Dead head */  
   (SP.PositionID = 13 ) 
group by IsHeavy, TBF_Total_Hours , TBF_Total_Mins  
) as A  

  
/* grand totals ( totals within start date and end date ) */  
Select @TotalH = @DayH + @NightH  ,@TotalMin = @DayM + @NightM  
Select @TotalH =  @TotalH + (@TotalMin/ 60)  
Select @TotalMin = @TotalMin - (@TotalMin/60)*60  
  
  
/* Totals for current date range */  
Select @TotalMonthDayH = @DayH + (@DayM/60)  
Select @TotalMonthDayM = @DayM - (@DayM/60)*60  
  
Select @TotalMonthNightH = @NightH + (@NightM/60)  
Select @TotalMonthNightM = @NightM - (@NightM/60)*60  
  
Select @TotalMonthH = @TotalMonthDayH + @TotalMonthNightH + ((@TotalMonthDayM+@TotalMonthNightM)/60)  
Select @TotalMonthM = (@TotalMonthDayM+@TotalMonthNightM) - (((@TotalMonthDayM+@TotalMonthNightM)/60)*60)  
  
  
insert @Result  
Select  isnull(@TotalH+((@TotalMin)/60),0) GrandTotalDHDHours,  isnull(@TotalMin -(((@TotalMin)/60)*60), 0) GrandTotalDHDMin
return
End

Go   
  


  
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCrewHoursWithinRangeAsTable' and
		        xtype = 'FT')
Drop function GetCrewHoursWithinRangeAsTable
Go

CREATE function GetCrewHoursWithinRangeAsTable (@CrewID int,  
        @StartDate DateTime = null,  
        @EndDate DateTime = null)
returns @result table
(
	GrandTotalHours int, 
	GrandTotalMins int
)
as  
Begin


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
   (S.IsPAX is null or S.IsPAX <> 1 ) AND  
   /* not Dead head */  
   --((SP.PositionID <> 12 ) and  -- trainee included in crew hours 
   (SP.PositionID <> 13) 
group by IsHeavyCrew  
) as A  
  
  
/* grand totals ( TBF + all times till start date + totals within start date and end date ) */  
Select @TotalH =  @DayH + @NightH  , @TotalMin = @DayM + @NightM  
Select @TotalH =  @TotalH + (@TotalMin/ 60)  
Select @TotalMin = @TotalMin - (@TotalMin/60)*60  
  
  insert @Result
Select @TotalH+(@TotalMin/60)  , @TotalMin-((@TotalMin/60)*60)        
  Return

End
  
  
  If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCrewDHDWithinRangeAsTable' and
		        xtype = 'FT')
Drop function GetCrewDHDWithinRangeAsTable
Go

CREATE function GetCrewDHDWithinRangeAsTable (@CrewID int,  
        @StartDate DateTime = null,  
        @EndDate DateTime = null)
returns @result table
(
	GrandTotalDHDHours int, 
	GrandTotalDHDMins int
)
as  
  
  Begin 
  
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
   /*  Dead head */  
   (SP.PositionID = 13 ) 
group by IsHeavyCrew  
) as A  
  
  
/* grand totals ( TBF + all times till start date + totals within start date and end date ) */  
Select @TotalH =  @DayH + @NightH  , @TotalMin = @DayM + @NightM  
Select @TotalH =  @TotalH + (@TotalMin/ 60)  
Select @TotalMin = @TotalMin - (@TotalMin/60)*60  
  
  insert @result
Select @TotalH+(@TotalMin/60)  ,      
    @TotalMin-((@TotalMin/60)*60) 
    return 
  End
  
  
/*
get all pilots hours - working / dhd 
*/  

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllPilotsHours_Summary' and
		        xtype = 'P')
Drop Procedure GetAllPilotsHours_Summary
Go
Create Procedure GetAllPilotsHours_Summary   
         @StartDate DateTime = null,  
         @EndDate DateTime = null  
as 


Select FirstName + ' ' + SureName Name,shortName,
(select grandtotalhours from GetPilotReportWithinRangeAsTable(PilotID,@StartDate, @EndDate)) WorkHours,
(select grandtotalmins from GetPilotReportWithinRangeAsTable(PilotID,@StartDate, @EndDate)) WorkMins,
(select GrandTotalDHDHours from GetPilotDHDWithinRangeAsTable(PilotID,@StartDate, @EndDate)) DHDHours,
(select GrandTotalDHDMins from GetPilotDHDWithinRangeAsTable(PilotID,@StartDate, @EndDate)) DHDMins,
(select GrandTotalSimHours from GetPilotSimulationWithinRangeAsTable(PilotID,@StartDate, @EndDate)) SimHours,
(select GrandTotalSimMins from GetPilotSimulationWithinRangeAsTable(PilotID,@StartDate, @EndDate)) SimMins
 from Pilot
 Go
 
 
 /*
get all pilots hours - working / dhd 
*/  

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllCrewHours_Summary' and
		        xtype = 'P')
Drop Procedure GetAllCrewHours_Summary
Go
Create Procedure GetAllCrewHours_Summary   
         @StartDate DateTime = null,  
         @EndDate DateTime = null  
as 


Select Name,shortName,
(select grandtotalhours from GetCrewHoursWithinRangeAsTable(CrewID,@StartDate, @EndDate)) WorkHours,
(select grandtotalmins from GetCrewHoursWithinRangeAsTable(CrewID,@StartDate, @EndDate)) WorkMins,
(select GrandTotalDHDHours from GetCrewDHDWithinRangeAsTable(CrewID,@StartDate, @EndDate)) DHDHours,
(select GrandTotalDHDMins from GetCrewDHDWithinRangeAsTable(CrewID,@StartDate, @EndDate)) DHDMins
 from Crew
 Go





/*
 get pilot hours within range 
*/
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotSimulationHoursWithinRange' and
		        xtype = 'P')
Drop Procedure GetPilotSimulationHoursWithinRange
Go

CREATE Procedure GetPilotSimulationHoursWithinRange @PilotID int,  
													@StartDate DateTime = null,  
													@EndDate DateTime = null  
as  
  
  
Declare @TotalH int,  
  @TotalMin int  
  
select  @TotalMin = sum(DiffM)
From(  
Select   
  sum(DATEDIFF(MINUTE, DateFrom,DateTo)) DiffM
from PilotTransaction PT
Inner join Pilot P on PT.PilotID = P.PilotID
Where P.PilotID = @PilotID and   
   PT.DateFrom >= ISNULL(@StartDate, '01/01/1900') and   
   PT.DateTo <= ISNULL(@EndDate, '01/01/2500') and 
   TransactionsID = 11
   
) as A  

  
/* grand totals ( totals within start date and end date ) */  
Select @TotalH = (@TotalMin/ 60)  
Select @TotalMin = @TotalMin - (@TotalMin/60)*60  
  
  
  
Select P.FirstName , P.SecondName , P.SureName , P.LicenseNo,P.ShortName , P.IsPilot,
@TotalH GrandTotalHours , @TotalMin GrandTotalMin
, DateFrom, DateTo, DATEDIFF(MINUTE,DateFrom, DateTo )/60 TotalHours, (DATEDIFF(MINUTE,DateFrom, DateTo )) - (DATEDIFF(MINUTE,DateFrom, DateTo )/60)*60 TotalMin
from PilotTransaction PT
Inner join Pilot P on PT.PilotID = P.PilotID
Where P.PilotID = @PilotID and   
   PT.DateFrom >= ISNULL(@StartDate, '01/01/1900') and   
   PT.DateTo <= ISNULL(@EndDate, '01/01/2500') and 
   TransactionsID = 11
Order by DateFrom

Go



  If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotSimulationWithinRangeAsTable' and
		        xtype = 'FT')
Drop function GetPilotSimulationWithinRangeAsTable
Go

CREATE function GetPilotSimulationWithinRangeAsTable (@PilotID int,  
        @StartDate DateTime = null,  
        @EndDate DateTime = null)
returns @result table
(
	GrandTotalSimHours int, 
	GrandTotalSimMins int
)
as  
Begin
Declare @TotalH int,  
  @TotalMin int  
  
select  @TotalMin = sum(DiffM)
From(  
Select   
  sum(DATEDIFF(MINUTE, DateFrom,DateTo)) DiffM
from PilotTransaction PT
Inner join Pilot P on PT.PilotID = P.PilotID
Where P.PilotID = @PilotID and   
   PT.DateFrom >= ISNULL(@StartDate, '01/01/1900') and   
   PT.DateTo <= ISNULL(@EndDate, '01/01/2500') and 
   TransactionsID = 11
) as A  

  
/* grand totals ( totals within start date and end date ) */  
Select @TotalH = (@TotalMin/ 60)  
Select @TotalMin = @TotalMin - (@TotalMin/60)*60 

 insert @result
Select isnull(@TotalH,0)  ,      
    isnull(@TotalMin ,0)
    return 
End

GO

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSectorInfo' and
		        xtype = 'P')
Drop Procedure GetSectorInfo
Go

CREATE Procedure GetSectorInfo @SectorID int  
as  

Select S.SectorDate, S.FlightNo, A.Name AirCraft, FA.IATACode FromA, TA.IATACode ToA  from Sector S
Inner Join AirPlane A on S.AirCraft_AirPlaneID =A.AirPlaneID
Inner Join AirPort FA on S.From_AirportID = FA.AirPortID
Inner Join AirPort TA on S.To_AirportID = TA.AirPortID
where S.SectorID = @SectorID

GO

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSectorPilotInfo' and
		        xtype = 'P')
Drop Procedure GetSectorPilotInfo
Go

CREATE Procedure GetSectorPilotInfo @SectorID int  
as  
Select S.SectorDate, S.FlightNo , p.FirstName + ' ' + p.SureName PilotName, pos.Title, P.PassportNo from Sector S
Inner join SectorPilot SP on S.SectorID = SP.SectorID
Inner Join Pilot P on SP.PilotID = P.PilotID
Inner Join Position pos on pos.PositionID = sp.PositionID
where S.SectorID = @SectorID
GO