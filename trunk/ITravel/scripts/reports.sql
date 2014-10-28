
If Exists (select Name 
		   from sysobjects 
		   where name = 'RPT_GetTickets_Canceled' and
		        xtype = 'P')
Drop Procedure RPT_GetTickets_Canceled 
Go
Create Procedure RPT_GetTickets_Canceled @DateFrom DateTime = null,
										 @DateTo DateTime = null					 
As 
Select * from 
TicketInfo T
Where (T.CreatedDate >= ISNULL(@DateFrom, '01/01/1900'))  and 
	  (T.CreatedDate <= ISNULL(@DateTo, '01/01/2500')) AND	  
	  (T.TicketStatusID > 2 )
	
GO

If Exists (select Name 
		   from sysobjects 
		   where name = 'RPT_GetTicketsByStatusID' and
		        xtype = 'P')
Drop Procedure RPT_GetTicketsByStatusID 
Go
Create Procedure RPT_GetTicketsByStatusID @DateFrom DateTime = null,
										  @DateTo DateTime = null,
										  @StatusID int= 0					 
As 
Select * from 
TicketInfo T
Where (T.CreatedDate >= ISNULL(@DateFrom, '01/01/1900'))  and 
	  (T.CreatedDate <= ISNULL(@DateTo, '01/01/2500')) AND	  
	  (T.TicketStatusID = @StatusID or @StatusID = 0 )
		  
GO	  
	  
If Exists (select Name 
		   from sysobjects 
		   where name = 'RPT_GetTickets_NetIncome' and
		        xtype = 'P')
Drop Procedure RPT_GetTickets_NetIncome 
Go
Create Procedure RPT_GetTickets_NetIncome @DateFrom DateTime = null,
										  @DateTo DateTime = null							 
As 
Declare @ConfirmedTotal int,
		@CanceledTotal int,
		@NetIncome decimal(10,2)
Select sum(case when (T.TicketStatusID = 1 or T.TicketStatusID = 2) then 1 else 0 end) ConfirmedTotal, 
	   Sum(case when (T.TicketStatusID = 3 or T.TicketStatusID = 4) then 1 else 0 end) CanceledTotal,
	   SUM(case when (T.TicketStatusID = 3 or T.TicketStatusID = 4) then 0 else T.AddedValue end) NetIncome from 
TicketInfo T
Where (T.CreatedDate >= ISNULL(@DateFrom, '01/01/1900'))  and 
	  (T.CreatedDate <= ISNULL(@DateTo, '01/01/2500')) 
	  
	  
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'RPT_GetTickets_Sold' and
		        xtype = 'P')
Drop Procedure RPT_GetTickets_Sold 
Go
Create Procedure RPT_GetTickets_Sold @DateFrom DateTime = null,
									 @DateTo DateTime = null							 
As 
Select * from 
TicketInfo T
Where (T.CreatedDate >= ISNULL(@DateFrom, '01/01/1900'))  and 
	  (T.CreatedDate <= ISNULL(@DateTo, '01/01/2500'))  and
	  (T.TicketStatusID = 1 or T.TicketStatusID = 2)

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'RPT_GetTicketInfo' and
		        xtype = 'P')
Drop Procedure RPT_GetTicketInfo 
Go
Create Procedure RPT_GetTicketInfo @TicketID int							 
As 
Select T.*, S.ArName StatusName, AF.Name FromName, AT.Name ToName , A.Name AirLineName, P.FirstName +  ' ' + P.LastName as PassName from  
TicketInfo T 
Inner Join TicketStatus S on T.TicketStatusID = S.TicketStatusID
Inner Join AirPort AF on T.From_AirportID = AF.AirPortID 
Inner Join AirPort AT on T.To_AirportID = AT.AirPortID 
Inner Join AirLine A on T.AirLineID = A.AirLineID 
Inner Join Passenger P on T.PassengerID = P.PassengerID

Where T.TicketID = @TicketID

Go


	  