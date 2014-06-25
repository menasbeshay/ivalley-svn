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


alter table TicketHistory
add FileAttachement nvarchar(500)



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
		   where name = 'GetAllTickets' and
		        xtype = 'P')
Drop Procedure GetAllTickets
Go
Create Procedure GetAllTickets 
as

select T.* , TT.Name TypeName , S.Name StatusName, P.TradeName MainTradeName
from Tickets T
Inner Join TicketType TT on T.TicketTypeID = TT.TicketTypeID
Inner join TicketStatus S on T.TicketStatusID = S.TicketStatusID
Left JOIN dbo.TradePricing P ON T.TradePricingID = P.TradePricingID 
order by T.InitiateDate Desc 
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetTopTicketsByCompanyID' and
		        xtype = 'P')
Drop Procedure GetTopTicketsByCompanyID
Go
Create Procedure GetTopTicketsByCompanyID @CompanyID int
as

select top 5 T.* , TT.Name TypeName , S.Name StatusName, P.TradeName MainTradeName
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




If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchAllTickets' and
		        xtype = 'P')
Drop Procedure SearchAllTickets
Go
Create Procedure SearchAllTickets  @SearchTxt nvarchar(300),
								   @StatusID int
as

select T.* , TT.Name TypeName , S.Name StatusName, P.TradeName MainTradeName
from Tickets T
Inner Join TicketType TT on T.TicketTypeID = TT.TicketTypeID
Inner join TicketStatus S on T.TicketStatusID = S.TicketStatusID
Left JOIN dbo.TradePricing P ON T.TradePricingID = P.TradePricingID 
Inner join dbo.Companies C on T.CompanyID = C.CompanyID
where C.CompNameEng like N'%' + @SearchTxt + N'%' And 
	  T.TicketStatusID = @StatusID
order by T.InitiateDate Desc 
Go