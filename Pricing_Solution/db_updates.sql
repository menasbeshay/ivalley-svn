if Exists (select Name 
		   from sysobjects 
		   where name = 'TicketStatus' and
		        xtype = 'U')
Drop Table TicketStatus
Go
Create Table TicketStatus
(
	TicketStatusID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go

if Exists (select Name 
		   from sysobjects 
		   where name = 'TicketType' and
		        xtype = 'U')
Drop Table TicketType
Go
Create Table TicketType
(
	TicketTypeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go

alter table Tickets
Add TicketStatusID int null

alter table Tickets
Add TradeName nvarchar(200) null


alter table TicketHistory
Add TicketStatusID int null



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllTicketsByCompanyID' and
		        xtype = 'P')
Drop Procedure GetAllTicketsByCompanyID
Go
Create Procedure GetAllTicketsByCompanyID @CompanyID int
as

select T.* , TT.Name TypeName , S.Name StatusName, P.TradeName MainTradeName
from Tickets T
Inner Join TicketType TT on T.TicketTypeID = TT.TicketTypeID
Inner join TicketStatus S on T.TicketStatusID = S.TicketStatusID
Left JOIN dbo.TradePricing P ON T.TradePricingID = P.TradePricingID 
where T.CompanyID = @CompanyID
order by T.InitiateDate Desc 
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllHistoryTicketsByTicketID' and
		        xtype = 'P')
Drop Procedure GetAllHistoryTicketsByTicketID
Go
Create Procedure GetAllHistoryTicketsByTicketID @TicketID int
as

select T.* , S.Name StatusName
from TicketHistory T
Inner join TicketStatus S on T.TicketStatusID = S.TicketStatusID
where T.TicketID = @TicketID
order by T.ResponseDate Desc 
Go