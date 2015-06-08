
If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchSectors' and
		        xtype = 'P')
Drop Procedure SearchSectors
Go
Create Procedure SearchSectors @filterText nvarchar(30),
							   @FromDate DateTime = null,
							   @ToDate DateTime = null
as

Select * from Sector
where (ISNULL(@filterText,'') = '' Or FlightNo Like N'%' + @filterText + N'%') and 
	  SectorDate >= (ISNULL(@FromDate, '01/01/1900')) And 
	  SectorDate <= (ISNULL(@ToDate, '01/01/2500')) And 
	  (IsPAX is NULL Or IsPAX <> 1 )


Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCrewBySectorID' and
		        xtype = 'P')
Drop Procedure GetCrewBySectorID
Go
Create Procedure GetCrewBySectorID @SectorID int  
as  
  
Select * from SectorCrew   
Where SectorID = @SectorID  
Go 

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotBySectorID' and
		        xtype = 'P')
Drop Procedure GetPilotBySectorID
Go
Create Procedure GetPilotBySectorID @SectorID int  
as  
  
Select * from SectorPilot   
Where SectorID = @SectorID  
GO


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPAXSectors' and
		        xtype = 'P')
Drop Procedure GetPAXSectors
Go
Create Procedure GetPAXSectors 
as

Select R.*
from Sector R
Where R.IsPAX = 1

Go 



If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchPAXSectors' and
		        xtype = 'P')
Drop Procedure SearchPAXSectors
Go
Create Procedure SearchPAXSectors @filterText nvarchar(30),
							   @FromDate DateTime = null,
							   @ToDate DateTime = null
as

Select * from Sector S 
where (ISNULL(@filterText,'') = '' Or S.FlightNo Like N'%' + @filterText + N'%') and 
	  S.SectorDate >= (ISNULL(@FromDate, '01/01/1900')) And 
	  S.SectorDate <= (ISNULL(@ToDate, '01/01/2500')) and 
	  S.IsPAX = 1


Go