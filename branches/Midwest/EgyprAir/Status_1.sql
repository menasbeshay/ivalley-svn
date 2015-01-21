


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotTransactions' and
		        xtype = 'P')
Drop Procedure GetPilotTransactions
Go
Create Procedure GetPilotTransactions @PilotID int, 
									  @StartDate DateTime = null ,  
									  @EndDate DateTime= null
as

/*
Declare @StartDate DateTime ,  
		@EndDate DateTime    
Select @StartDate = Convert (DateTime,'08/01/2012', 101)  
Select @EndDate = Convert (Datetime,'08/18/2012',101)  
*/

create table #PilotStatusInPeriod (	
	[PilotID] [int] NOT NULL,
	StatusDate DateTime,	
	StatusType nvarchar(50),
	FlightNo nvarchar(10),
	[Route] nvarchar(12),
	STD DateTime,
	STA DateTime,
	City nvarchar(10)	
	)

insert into #PilotStatusInPeriod
Select A.* From (
Select P.PilotID, S.SectorDate, 'WORK' as Status ,S.FlightNo , FromA.IATACode  + ' ' + ToA.IATACode as [Route] ,S.STD , S.STA , City.IATACode NightCity
from Sector S 
inner join AirPort FromA on S.From_AirportID = FromA.AirPortID
inner join AirPort ToA on S.To_AirportID = ToA.AirPortID
Left join AirPort City on S.PilotCityID = city.AirPortID
inner join SectorPilot SP on SP.SectorID = S.SectorID
inner join Pilot P on SP.PilotID = P.PilotID
                      OR SP.PilotID is null

where (Sp.PilotID = @PilotID) and
	  S.SectorDate between ISNULL(@StartDate, '01/01/1900') and 
       ISNULL(@EndDate, '01/01/2500')
      ) as A 

insert into #PilotStatusInPeriod
Select P.PilotID, PT.DateFrom, T.Name, null, null, null, null ,City.IATACode
from PilotTransaction PT 
Inner join Pilot P on PT.PilotID = P.PilotID
inner join [Transactions] T on PT.TransactionsID = T.TransactionsID
Left join AirPort City on PT.PilotCityID = city.AirPortID
Where PT.DateFrom between ISNULL(@StartDate, '01/01/1900') and 
       ISNULL(@EndDate, '01/01/2500') and 
      p.PilotID = @PilotID


;with amonth(day) as
(
    select @StartDate as day
        union all
    select day + 1
        from amonth
        where day < @EndDate
)
Select *, SUBSTRING(datename(dw,D.Day),0,4) [StatusDay] from #PilotStatusInPeriod PS
Right join amonth D on D.Day = CONVERT(date, PS.StatusDate)
order by D.Day

Drop Table #PilotStatusInPeriod

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotTrxByPilotID' and
		        xtype = 'P')
Drop Procedure GetPilotTrxByPilotID
Go
Create Procedure GetPilotTrxByPilotID @FromDate DateTime = null,  
									  @ToDate DateTime = null,             
									  @PilotID int = 0   
             
as  
/*  
Declare @FromDate DateTime ,  
  @ToDate DateTime ,  
  @ActivityID int   
Select @FromDate = Convert (DateTime,'10/05/2012', 101)  
Select @ToDate = Convert (Datetime,'10/07/2012',101)  
Select @ActivityID = 0  
*/  
Select PT.*, P.FirstName + ' ' + P.SecondName DisplayName, T.Name TrxName, A.IATACode
from PilotTransaction PT   
Inner JOIN transactions T ON T.TransactionsID = PT.TransactionsID  
Inner Join Pilot P on PT.PilotID = P.PilotID
left join AirPort A on A.AirPortID = PT.PilotCityID
Where (PT.DateFrom >= ISNULL(@FromDate, '01/01/1900') ) and   
	  (PT.DateFrom <= ISNULL(@ToDate, '01/01/2500') )  and 
	  (PT.PilotID = @PilotID Or @PilotID =0)
  
  
  
