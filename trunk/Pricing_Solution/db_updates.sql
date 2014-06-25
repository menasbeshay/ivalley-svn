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


/*********************************************************************/ 
/*   25-6-2014 updates  */
/***********************************************************************/

alter table TicketHistory
add FileAttachement nvarchar(500)



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



/* new fields updates  */


if Exists (select Name 
		   from sysobjects 
		   where name = 'TradePricingStatus' and
		        xtype = 'U')
Drop Table TradePricingStatus
Go
Create Table TradePricingStatus
(
	TradePricingStatusID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go


if Exists (select Name 
		   from sysobjects 
		   where name = 'TradePricingLicenseType' and
		        xtype = 'U')
Drop Table TradePricingLicenseType
Go
Create Table TradePricingLicenseType
(
	TradePricingLicenseTypeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go

if Exists (select Name 
		   from sysobjects 
		   where name = 'SectorType' and
		        xtype = 'U')
Drop Table SectorType
Go
Create Table SectorType
(
	SectorTypeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go


alter table TradePricing
add RegNo nvarchar(100),
	Reference nvarchar(500),
	Indication nvarchar(500),
	Dose nvarchar(500),
	SubmittedToSpecialized bit, 
	SalesTaxes bit,
	EssentialDrugList bit,
	TradePricingStatusID int,
	TradePricingLicenseTypeID int,
	SectorTypeID int , 
	CommitteePrice nvarchar(500),
	CommiteeDate dateTime, 
	RationalForPricing nvarchar(500),
	NoInBox int, 
	LowestIntPrice nvarchar(500),
	PriceInEgy nvarchar(500),
	PriceAfter30 nvarchar(500),
	PriceAfter35HighTech nvarchar(500),
	PriceAfter35FirstGeneric nvarchar(500),
	PriceAfter40SecondGeneric nvarchar(500),
	LowestPriceGeneric nvarchar(500),
	FinalPrice nvarchar(500),
	IsPricedTo499 bit,
	Notes nvarchar(500),
	MainGroup nvarchar(500),
	Similar bit,
	MonthYear nvarchar(20), 
	PreviousPrice nvarchar(500),
	PreviousPack nvarchar(500)