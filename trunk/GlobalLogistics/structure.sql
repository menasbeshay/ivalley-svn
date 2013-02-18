use master 
create database GlobalLogistics
Go

Use GlobalLogistics
If Exists (select Name 
		   from sysobjects 
		   where name = 'Pages' and
		        xtype = 'U')
Drop Table Pages
Go
Create Table Pages
(
	PageID int not null
			identity(1,1)
			Primary Key,
	EnTitle Nvarchar(200),
	ArTitle Nvarchar(200),
	EnContent Nvarchar(max),
	ArContent Nvarchar(max)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Magazine' and
		        xtype = 'U')
Drop Table Magazine
Go
Create Table Magazine
(
	MagazineID int not null
			identity(1,1)
			Primary Key,
	EnTitle Nvarchar(200),
	ArTitle Nvarchar(200),
	FilePath Nvarchar(500),
	CreatedDate dateTime
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'Sponsors' and
		        xtype = 'U')
Drop Table Sponsors
Go
Create Table Sponsors
(
	SponsorID int not null
			identity(1,1)
			Primary Key,
	EnTitle Nvarchar(200),
	ArTitle Nvarchar(200),
	EnFilePath Nvarchar(500),
	ArFilePath Nvarchar(500),
	URL Nvarchar(300),
	ViewOrder int
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Subscribers' and
		        xtype = 'U')
Drop Table Subscribers
Go
Create Table Subscribers
(
	SubscribersID int not null
			identity(1,1)
			Primary Key,
	Email Nvarchar(200)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'Categories' and
		        xtype = 'U')
Drop Table Categories
Go
Create Table Categories
(
	CategoryID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	EnDescription Nvarchar(500),
	ArDescription Nvarchar(500)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SubCategories' and
		        xtype = 'U')
Drop Table SubCategories
Go
Create Table SubCategories
(
	SubCategoryID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	EnDescription Nvarchar(500),
	ArDescription Nvarchar(500),
	CategoryID int	not null
		Foreign Key References Categories (CategoryID)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'ServiceTypes' and
		        xtype = 'U')
Drop Table ServiceTypes
Go
Create Table ServiceTypes
(
	ServiceTypeID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'Services' and
		        xtype = 'U')
Drop Table [Services]
Go
Create Table [Services]
(
	ServiceID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	EnDescription Nvarchar(max),
	ArDescription Nvarchar(max),
	CategoryID int	null
		Foreign Key References Categories (CategoryID),
	TypeID int	not null
		Foreign Key References ServiceTypes (ServiceTypeID),
	CreatedDate DateTime,
	CompanyID int 
		Foreign Key References Companies (CompanyID)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'AdsLocations' and
		        xtype = 'U')
Drop Table AdsLocations
Go
Create Table AdsLocations
(
	AdsLocationID int not null
			identity(1,1)
			Primary Key,
	EnTitle Nvarchar(200),
	ArTitle Nvarchar(200),
	AdsTimeout int,
	Description nvarchar(500),
	AdLocationPhoto nvarchar(150),
	width int,
	height int 
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'Ads' and
		        xtype = 'U')
Drop Table Ads
Go
Create Table Ads
(
	AdsID int not null
			identity(1,1)
			Primary Key,
	EnTitle Nvarchar(200),
	ArTitle Nvarchar(200),
	EnFilePath Nvarchar(500),
	ArFilePath Nvarchar(500),
	CategoryID int	null
		Foreign Key References Categories (CategoryID),
	StartDate DateTime,
	EndDate DateTime,
	URL nvarchar(200),
	AdsLocationID int 
		Foreign Key References AdsLocations (AdsLocationID)
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'VedioCategories' and
		        xtype = 'U')
Drop Table VedioCategories
Go
Create Table VedioCategories
(
	CategoryID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	EnDescription Nvarchar(500),
	ArDescription Nvarchar(500),
	IconPath nvarchar(250) null 
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'VedioLib' and
		        xtype = 'U')
Drop Table VedioLib
Go
Create Table VedioLib
(
	VedioID int not null
			identity(1,1)
			Primary Key,
	EnTitle Nvarchar(200),
	ArTitle Nvarchar(200),
	EnDescription Nvarchar(500),
	ArDescription Nvarchar(500),
	URL Nvarchar(500),
	CategoryID int	null
		Foreign Key References VedioCategories (CategoryID),
	CreatedDate DateTime,
	IconPath nvarchar(250) null 
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'Vedios' and
		        xtype = 'U')
Drop Table Vedios
Go
Create Table Vedios
(
	VedioID int not null
			identity(1,1)
			Primary Key,
	EnTitle Nvarchar(200),
	ArTitle Nvarchar(200),
	URL Nvarchar(500),
	CategoryID int	null
		Foreign Key References Categories (CategoryID),
	CreatedDate DateTime,
	CompanyID int 
		Foreign Key References Companies (CompanyID)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Photos' and
		        xtype = 'U')
Drop Table Photos
Go
Create Table Photos
(
	PhotoID int not null
			identity(1,1)
			Primary Key,
	EnTitle Nvarchar(200),
	ArTitle Nvarchar(200),
	PhotoPath Nvarchar(500),
	CategoryID int	null
		Foreign Key References Categories (CategoryID),
	CreatedDate DateTime,
	CompanyID int 
		Foreign Key References Companies (CompanyID)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'News' and
		        xtype = 'U')
Drop Table News
Go
Create Table News
(
	NewsID int not null
			identity(1,1)
			Primary Key,
	EnTitle Nvarchar(200),
	ArTitle Nvarchar(200),
	EnBrief Nvarchar(500),
	ArBrief Nvarchar(500),
	EnBody Nvarchar(max),
	ArBody Nvarchar(max),
	MainPicturePath nvarchar(200),
	CategoryID int	null
		Foreign Key References Categories (CategoryID),
	CreatedDate DateTime
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'ArNews' and
		        xtype = 'U')
Drop Table ArNews
Go
Create Table ArNews
(
	NewsID int not null
			identity(1,1)
			Primary Key,
	EnTitle Nvarchar(200),
	ArTitle Nvarchar(200),
	EnBrief Nvarchar(500),
	ArBrief Nvarchar(500),
	EnBody Nvarchar(max),
	ArBody Nvarchar(max),
	MainPicturePath nvarchar(200),
	CategoryID int	null
		Foreign Key References Categories (CategoryID),
	CreatedDate DateTime
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'AirLineCompanies' and
		        xtype = 'U')
Drop Table AirLineCompanies
Go
Create Table AirLineCompanies
(
	AirLineCompanyID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	EnDescription Nvarchar(500),
	ArDescription Nvarchar(500)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'ShippingCompanies' and
		        xtype = 'U')
Drop Table ShippingCompanies
Go
Create Table ShippingCompanies
(
	ShippingCompanyID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	EnDescription Nvarchar(500),
	ArDescription Nvarchar(500)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Countries' and
		        xtype = 'U')
Drop Table Countries
Go
Create Table Countries
(
	CountryID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	EnDescription Nvarchar(500),
	ArDescription Nvarchar(500)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Cities' and
		        xtype = 'U')
Drop Table Cities
Go
Create Table Cities
(
	CityID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	EnDescription Nvarchar(500),
	ArDescription Nvarchar(500)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Packages' and
		        xtype = 'U')
Drop Table Packages
Go
Create Table Packages
(
	PackageID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	EnDescription Nvarchar(500),
	ArDescription Nvarchar(500)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'PackageOptions' and
		        xtype = 'U')
Drop Table PackageOptions
Go
Create Table PackageOptions
(
	PackageOptionID int not null
					identity(1,1)
					Primary Key, 
	PackageID int null
			Foreign Key References Packages (PackageID),
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	EnDescription Nvarchar(500),
	ArDescription Nvarchar(500)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Companies' and
		        xtype = 'U')
Drop Table Companies
Go
Create Table Companies
(
	CompanyID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	EnAddress Nvarchar(500),
	ArAddress Nvarchar(500),
	UserName nvarchar(50),
	[password] nvarchar(50),
	CityID int null
		Foreign Key References Cities (CityID),
	CategoryID int null
		Foreign Key References Categories (CategoryID),
	SubCategoryID int null
		Foreign Key References SubCategories (SubCategoryID),
	Tele Nvarchar(120),
	Fax nvarchar(120),
	WebSite nvarchar(200),
	LogoPath nvarchar(300),
	EnBranches nvarchar(max),
	ArBranches nvarchar(max),	
	MapPath nvarchar(max),
	EnAbout nvarchar(max),
	ArAbout nvarchar(max),
	EnContact nvarchar(1000),
	ArContact nvarchar(1000),
	PackageTypeID int null
		Foreign Key References Packages (PackageID),
	SchedulePath nvarchar(300),
)
Go	

If Exists (select Name 
		   from sysobjects 
		   where name = 'CompanyEnabledOptions' and
		        xtype = 'U')
Drop Table CompanyEnabledOptions
Go
Create Table CompanyEnabledOptions
(
	CompanyEnabledOptionID int not null
					identity(1,1)
					Primary Key, 
	PackageOptionID int not null
			Foreign Key References PackageOptions (PackageOptionID),
	CompanyID int not null
			Foreign Key References Companies (CompanyID),
	[Enabled] bit
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'PackageOptionsLink' and
		        xtype = 'U')
Drop Table PackageOptionsLink
Go
Create Table PackageOptionsLink
(
	PackageID int not null
			Foreign Key References Packages (PackageID),
	PackageOptionID int not null
			Foreign Key References PackageOptions (PackageOptionID),
	Primary Key (PackageID,PackageOptionID) 
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'AirLines' and
		        xtype = 'U')
Drop Table AirLines
Go
Create Table AirLines
(
	AirLinesID int not null
					identity(1,1)
					Primary Key, 
	FromAirPortID int not null
			Foreign Key References AirPorts (AirPortID),
	ToAirPortID int not null
			Foreign Key References AirPorts (AirPortID),
	CompanyID int not null
			Foreign Key References Companies (CompanyID)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'ShippingLines' and
		        xtype = 'U')
Drop Table ShippingLines
Go
Create Table ShippingLines
(
	ShippingLinesID int not null
					identity(1,1)
					Primary Key, 
	FromSeaPortID int not null
			Foreign Key References SeaPorts (SeaPortID),
	ToSeaPortID int not null
			Foreign Key References SeaPorts (SeaPortID),
	CompanyID int not null
			Foreign Key References Companies (CompanyID)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Currency' and
		        xtype = 'U')
Drop Table Currency
Go
Create Table Currency
(
	CurrencyID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	Code nvarchar(10)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Mines' and
		        xtype = 'U')
Drop Table Mines
Go
Create Table Mines
(
	MinID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Mineral' and
		        xtype = 'U')
Drop Table Mineral
Go
Create Table Mineral
(
	MineralID int not null
					identity(1,1)
					Primary Key, 
	MinID int not null
			Foreign Key References Mines (MinID),
	CellPrice nvarchar(12),
	BuyPrice nvarchar(12),
	CreatedDate DateTime
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Exchange' and
		        xtype = 'U')
Drop Table Exchange
Go
Create Table Exchange
(
	ExchangeID int not null
					identity(1,1)
					Primary Key, 
	CurrencyID int not null
			Foreign Key References Currency (CurrencyID),
	CellPrice decimal(8,4),
	BuyPrice decimal(8,4),
	LastCellPrice decimal(8,4),
	CreatedDate DateTime
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'AirPorts' and
		        xtype = 'U')
Drop Table AirPorts
Go
Create Table AirPorts
(
	AirPortID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	AirPortCode nvarchar(10)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SeaPorts' and
		        xtype = 'U')
Drop Table SeaPorts
Go
Create Table SeaPorts
(
	SeaPortID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ArName Nvarchar(200),
	SeaPortCode nvarchar(10)
)
Go

Alter table companies
Add [Rank] int default(0)
Go


ALTER table Categories 
Add IconPath nvarchar(250) null 
Go

ALTER table SubCategories 
Add IconPath nvarchar(250) null 
Go


/*******************************************************************************************************/

/* pages procedures  */
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddPage' and
		        xtype = 'P')
Drop Procedure AddPage
Go
Create Procedure AddPage 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@EnContent Nvarchar(max),
						@ArContent Nvarchar(max)
as

Insert Into Pages ( EnTitle ,
					ArTitle ,
					EnContent ,
					ArContent 
					)
			Values 
			(
			@EnTitle ,
			@ArTitle ,
			@EnContent ,
			@ArContent
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdatePage' and
		        xtype = 'P')
Drop Procedure UpdatePage
Go
Create Procedure UpdatePage @PageID int, 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@EnContent Nvarchar(max),
						@ArContent Nvarchar(max)
as

Update Pages set EnTitle = @EnTitle,
					ArTitle  = @ArTitle,
					EnContent = @EnContent ,
					ArContent = @ArContent
Where PageID = @PageID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPage' and
		        xtype = 'P')
Drop Procedure GetPage
Go
Create Procedure GetPage @PageID int
as

Select * from Pages 
Where PageID = @PageID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPages' and
		        xtype = 'P')
Drop Procedure GetPages
Go
Create Procedure GetPages
as

Select * from Pages 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeletePage' and
		        xtype = 'P')
Drop Procedure DeletePage
Go
Create Procedure DeletePage @PageID int 
as

Delete Pages 
where PageID = @PageID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchPages' and
		        xtype = 'P')
Drop Procedure SearchPages
Go
Create Procedure SearchPages @filterText nvarchar(200)
as

Select * from Pages 
Where EnTitle like N'%' + @filterText + N'%' or 
	  ArTitle like N'%' + @filterText + N'%'	

Go



/***********************/

/* magazine Procedures */

If Exists (select Name 
		   from sysobjects 
		   where name = 'AddMagazine' and
		        xtype = 'P')
Drop Procedure AddMagazine
Go
Create Procedure AddMagazine 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@FilePath Nvarchar(500),
						@CreatedDate DateTime
as

Insert Into Magazine( EnTitle ,
					ArTitle ,
					FilePath ,
					CreatedDate 
					)
			Values 
			(
			@EnTitle ,
			@ArTitle ,
			@FilePath ,
			@CreatedDate
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateMagazine' and
		        xtype = 'P')
Drop Procedure UpdateMagazine
Go
Create Procedure UpdateMagazine @MagazineID int, 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@FilePath Nvarchar(500),
						@CreatedDate DateTime
as

Update Magazine set EnTitle = @EnTitle,
					ArTitle  = @ArTitle,
					FilePath = @FilePath,
					CreatedDate = @CreatedDate
Where MagazineID = @MagazineID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMagazine' and
		        xtype = 'P')
Drop Procedure GetMagazine
Go
Create Procedure GetMagazine @MagazineID int
as

Select * from Magazine 
Where MagazineID = @MagazineID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMagazines' and
		        xtype = 'P')
Drop Procedure GetMagazines
Go
Create Procedure GetMagazines 
as

Select * from Magazine 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteMagazine' and
		        xtype = 'P')
Drop Procedure DeleteMagazine
Go
Create Procedure DeleteMagazine @MagazineID int 
as

Delete Magazine 
where MagazineID = @MagazineID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchMagazines' and
		        xtype = 'P')
Drop Procedure SearchMagazines
Go
Create Procedure SearchMagazines @filterText nvarchar(200)
as

Select * from Magazine 
Where EnTitle like N'%' + @filterText + N'%' or 
	  ArTitle like N'%' + @filterText + N'%'	

Go

/********************************/

/* Sponsor Procedures */ 
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddSponsor' and
		        xtype = 'P')
Drop Procedure AddSponsor
Go
Create Procedure AddSponsor 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@EnFilePath Nvarchar(500),
						@ArFilePath Nvarchar(500),
						@URL nvarchar(300),
						@ViewOrder int
as

Insert Into Sponsors( EnTitle ,
					ArTitle ,
					EnFilePath ,
					ArFilePath ,
					URL,
					ViewOrder
					)
			Values 
			(
			@EnTitle ,
			@ArTitle ,
			@EnFilePath ,
			@ArFilePath ,
			@URL,
			@ViewOrder
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateSponsor' and
		        xtype = 'P')
Drop Procedure UpdateSponsor
Go
Create Procedure UpdateSponsor @SponsorID int, 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@EnFilePath Nvarchar(500),
						@ArFilePath Nvarchar(500),
						@URL nvarchar(300),
						@ViewOrder int
as

Update Sponsors set EnTitle = @EnTitle,
					ArTitle  = @ArTitle,
					EnFilePath = @EnFilePath,
					ArFilePath = @ArFilePath,
					URL= @URL,
					ViewOrder = @ViewOrder
Where SponsorID = @SponsorID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSponsor' and
		        xtype = 'P')
Drop Procedure GetSponsor
Go
Create Procedure GetSponsor @SponsorID int
as

Select * from Sponsors 
Where SponsorID = @SponsorID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSponsors' and
		        xtype = 'P')
Drop Procedure GetSponsors
Go
Create Procedure GetSponsors 
as

Select * from Sponsors 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteSponsor' and
		        xtype = 'P')
Drop Procedure DeleteSponsor
Go
Create Procedure DeleteSponsor @SponsorID int 
as

Delete Sponsors 
where SponsorID = @SponsorID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchSponsors' and
		        xtype = 'P')
Drop Procedure SearchSponsors
Go
Create Procedure SearchSponsors @filterText nvarchar(200)
as

Select * from Sponsors 
Where EnTitle like N'%' + @filterText + N'%' or 
	  ArTitle like N'%' + @filterText + N'%'	

Go

/********************************/

/* subscriber Procedures */ 
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddSubscriber' and
		        xtype = 'P')
Drop Procedure AddSubscriber
Go
Create Procedure AddSubscriber 
						@Email Nvarchar(200)
as

Insert Into Subscribers( Email
					)
			Values 
			(
			@Email
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateSubscriber' and
		        xtype = 'P')
Drop Procedure UpdateSubscriber
Go
Create Procedure UpdateSubscriber @SubscriberID int, 
						@Email Nvarchar(200)
as

Update Subscribers set Email = @Email
Where SubscribersID= @SubscriberID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSubsriber' and
		        xtype = 'P')
Drop Procedure GetSubsriber
Go
Create Procedure GetSubsriber @SubscriberID int
as

Select * from Subscribers	 
Where SubscribersID = @SubscriberID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSubscribers' and
		        xtype = 'P')
Drop Procedure GetSubscribers
Go
Create Procedure GetSubscribers 
as

Select * from Subscribers 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteSubscriber' and
		        xtype = 'P')
Drop Procedure DeleteSubscriber
Go
Create Procedure DeleteSubscriber @SubscriberID int 
as

Delete Subscribers 
where SubscribersID = @SubscriberID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchSubscribers' and
		        xtype = 'P')
Drop Procedure SearchSubscribers
Go
Create Procedure SearchSubscribers @filterText nvarchar(200)
as

Select * from Subscribers 
Where Email like N'%' + @filterText + N'%' 	

Go

/********************************/

/* Categories Procedures */ 
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddCategory' and
		        xtype = 'P')
Drop Procedure AddCategory
Go
Create Procedure AddCategory 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200),
						@EnDescribtion Nvarchar(500),
						@ArDescribtion Nvarchar(500)
as

Insert Into Categories( EnName ,
					ArName ,
					EnDescription ,
					ArDescription
					)
			Values 
			(
			@EnName ,
			@ArName ,
			@EnDescribtion ,
			@ArDescribtion
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateCategory' and
		        xtype = 'P')
Drop Procedure UpdateCategory
Go
Create Procedure UpdateCategory @CategoryID int, 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200),
						@EnDescribtion Nvarchar(500),
						@ArDescribtion Nvarchar(500)
as

Update Categories set EnName = @EnName,
					ArName  = @ArName,
					EnDescription = @EnDescribtion,
					ArDescription = @ArDescribtion
Where CategoryID = @CategoryID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCategory' and
		        xtype = 'P')
Drop Procedure GetCategory
Go
Create Procedure GetCategory @CategoryID int
as

Select * from Categories 
Where CategoryID = @CategoryID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCategories' and
		        xtype = 'P')
Drop Procedure GetCategories
Go
Create Procedure GetCategories 
as

Select * from Categories 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteCategory' and
		        xtype = 'P')
Drop Procedure DeleteCategory
Go
Create Procedure DeleteCategory @CategoryID int 
as

Delete Categories 
where CategoryID = @CategoryID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchCategories' and
		        xtype = 'P')
Drop Procedure SearchCategories
Go
Create Procedure SearchCategories @filterText nvarchar(200)
as

Select * from Categories 
Where EnName like N'%' + @filterText + N'%' or 
	  ArName like N'%' + @filterText + N'%'	or
	  EnDescription like N'%' + @filterText + N'%'	or
	  ArDescription like N'%' + @filterText + N'%'	
Go


/********************************/

/* SuhCategories Procedures */ 
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddSubCategory' and
		        xtype = 'P')
Drop Procedure AddSubCategory
Go
Create Procedure AddSubCategory 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200),
						@EnDescribtion Nvarchar(500),
						@ArDescribtion Nvarchar(500),
						@CategoryID int
as

Insert Into SubCategories( EnName ,
					ArName ,
					EnDescription ,
					ArDescription,
					CategoryID
					)
			Values 
			(
			@EnName ,
			@ArName ,
			@EnDescribtion ,
			@ArDescribtion,
			@CategoryID
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateSubCategory' and
		        xtype = 'P')
Drop Procedure UpdateSubCategory
Go
Create Procedure UpdateSubCategory
						@SubCategoryID int, 
						 @CategoryID int, 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200),
						@EnDescribtion Nvarchar(500),
						@ArDescribtion Nvarchar(500)
as

Update SubCategories set EnName = @EnName,
					ArName  = @ArName,
					EnDescription = @EnDescribtion,
					ArDescription = @ArDescribtion,
					 CategoryID = @CategoryID
where SubCategoryID = @SubCategoryID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSubCategory' and
		        xtype = 'P')
Drop Procedure GetSubCategory
Go
Create Procedure GetSubCategory @SubCategoryID int
as

Select * from SubCategories 
Where SubCategoryID = @SubCategoryID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSubCategories' and
		        xtype = 'P')
Drop Procedure GetSubCategories
Go
Create Procedure GetSubCategories @CategoryID int
as

Select * from subCategories 
Where CategoryID = @CategoryID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllSubCategories' and
		        xtype = 'P')
Drop Procedure GetAllSubCategories
Go
Create Procedure GetAllSubCategories 
as

Select * from subCategories 


Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllSubCategoriesByCategory' and
		        xtype = 'P')
Drop Procedure GetAllSubCategoriesByCategory
Go
Create Procedure GetAllSubCategoriesByCategory @CategoryID int
as

Select * from SubCategories 
where CategoryID = @CategoryID

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteSubCategory' and
		        xtype = 'P')
Drop Procedure DeleteSubCategory
Go
Create Procedure DeleteSubCategory @SubCategoryID int 
as

Delete SubCategories 
where SubCategoryID = @SubCategoryID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchSubCategories' and
		        xtype = 'P')
Drop Procedure SearchSubCategories
Go
Create Procedure SearchSubCategories @filterText nvarchar(200)
as

Select * from SubCategories 
Where EnName like N'%' + @filterText + N'%' or 
	  ArName like N'%' + @filterText + N'%'	or
	  EnDescription like N'%' + @filterText + N'%'	or
	  ArDescription like N'%' + @filterText + N'%'	
Go

/********************************/

/* ServiceTypes Procedures */ 
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddServiceType' and
		        xtype = 'P')
Drop Procedure AddServiceType
Go
Create Procedure AddServiceType 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200)
as

Insert Into ServiceTypes( EnName ,
					ArName 
					)
			Values 
			(
			@EnName ,
			@ArName 
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateServiceType' and
		        xtype = 'P')
Drop Procedure UpdateServiceType
Go
Create Procedure UpdateServiceType @ServiceTypeID int, 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200)
as

Update ServiceTypes set EnName = @EnName,
					ArName  = @ArName
Where ServiceTypeID = @ServiceTypeID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetServiceType' and
		        xtype = 'P')
Drop Procedure GetServiceType
Go
Create Procedure GetServiceType @ServiceTypeID int
as

Select * from ServiceTypes 
Where ServiceTypeID = @ServiceTypeID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetServiceTypes' and
		        xtype = 'P')
Drop Procedure GetServiceTypes
Go
Create Procedure GetServiceTypes 
as

Select * from ServiceTypes 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteServiceType' and
		        xtype = 'P')
Drop Procedure DeleteServiceType
Go
Create Procedure DeleteServiceType @ServiceTypeID int 
as

Delete ServiceTypes 
where ServiceTypeID = @ServiceTypeID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchServiceTypes' and
		        xtype = 'P')
Drop Procedure SearchServiceTypes
Go
Create Procedure SearchServiceTypes @filterText nvarchar(200)
as

Select * from ServiceTypes 
Where EnName like N'%' + @filterText + N'%' or 
	  ArName like N'%' + @filterText + N'%'	
Go



/********************************/

/* Services Procedures */ 
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddService' and
		        xtype = 'P')
Drop Procedure AddService
Go
Create Procedure AddService 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200),
						@EnDescribtion Nvarchar(500),
						@ArDescribtion Nvarchar(500),
						@CategoryID int,
						@TypeID int,
						@CreatedDate DateTime
as

Insert Into [Services]( EnName ,
					ArName ,
					EnDescription ,
					ArDescription,
					CategoryID,
					TypeID,
					CreatedDate
					)
			Values 
			(
			@EnName ,
			@ArName ,
			@EnDescribtion ,
			@ArDescribtion,
			@CategoryID,
			@TypeID,
			@CreatedDate
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateService' and
		        xtype = 'P')
Drop Procedure UpdateService
Go
Create Procedure UpdateService
						@ServiceID int, 
						 @CategoryID int, 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200),
						@EnDescribtion Nvarchar(500),
						@ArDescribtion Nvarchar(500),
						@TypeID int,
						@CreatedDate DateTime
as

Update [Services] set EnName = @EnName,
					ArName  = @ArName,
					EnDescription = @EnDescribtion,
					ArDescription = @ArDescribtion,
					 CategoryID = @CategoryID,
					 TypeID = @TypeID,
					 CreatedDate = @CreatedDate
where ServiceID = @ServiceID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetService' and
		        xtype = 'P')
Drop Procedure GetService
Go
Create Procedure GetService @ServiceID int
as

Select * from [Services]
Where ServiceID = @ServiceID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetServices' and
		        xtype = 'P')
Drop Procedure GetServices
Go
Create Procedure GetServices @TypeID int
as

Select * from [Services] 
Where TypeID = @TypeID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllServices' and
		        xtype = 'P')
Drop Procedure GetAllServices
Go
Create Procedure GetAllServices 
as

Select * from [Services] 


Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteService' and
		        xtype = 'P')
Drop Procedure DeleteService
Go
Create Procedure DeleteService @ServiceID int 
as

Delete [Services] 
where ServiceID = @ServiceID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllServicesByCategory' and
		        xtype = 'P')
Drop Procedure GetAllServicesByCategory
Go
Create Procedure GetAllServicesByCategory @CategoryID int
as

Select * from [Services] 
where CategoryID = @CategoryID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetTopServicesByType' and
		        xtype = 'P')
Drop Procedure GetTopServicesByType
Go
Create Procedure GetTopServicesByType @TypeID int
as

Select top 5 * from [Services] 
where TypeID = @TypeID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetServicesByType' and
		        xtype = 'P')
Drop Procedure GetServicesByType
Go
Create Procedure GetServicesByType @TypeID int
as

Select * from [Services] 
where TypeID = @TypeID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchServices' and
		        xtype = 'P')
Drop Procedure SearchServices
Go
Create Procedure SearchServices @filterText nvarchar(200)
as

Select * from [Services]
Where EnName like N'%' + @filterText + N'%' or 
	  ArName like N'%' + @filterText + N'%'	or
	  ArDescription like N'%' + @filterText + N'%'	or
	  EnDescription like N'%' + @filterText + N'%'	
Go

/*****************************/
	/* Ads Procedures */ 
	
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddAds' and
		        xtype = 'P')
Drop Procedure AddAds
Go
Create Procedure AddAds 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@EnFilePath Nvarchar(500),
						@ArFilePath Nvarchar(500),						
						@CategoryID int,
						@StartDate DateTime,
						@EndDate DateTime
as

Insert Into Ads( EnTitle ,
					ArTitle ,
					EnFilePath ,
					ArFilePath ,
					CategoryID,
					StartDate,
					EndDate
					)
			Values 
			(
			@EnTitle ,
			@ArTitle ,
			@EnFilePath ,
			@ArFilePath ,
			@CategoryID,
			@StartDate,
			@EndDate
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateAds' and
		        xtype = 'P')
Drop Procedure UpdateAds
Go
Create Procedure UpdateAds @AdsID int, 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@EnFilePath Nvarchar(500),
						@ArFilePath Nvarchar(500),
						@CategoryID int,
						@StartDate DateTime,
						@EndDate DateTime
as

Update Ads set EnTitle = @EnTitle,
					ArTitle  = @ArTitle,
					EnFilePath = @EnFilePath,
					ArFilePath = @ArFilePath,
					CategoryID= @CategoryID,
					StartDate = @StartDate,
					EndDate = @EndDate
Where AdsID = @AdsID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAds' and
		        xtype = 'P')
Drop Procedure GetAds
Go
Create Procedure GetAds @AdsID int
as

Select * from Ads 
Where AdsID = @AdsID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllAds' and
		        xtype = 'P')
Drop Procedure GetAllAds
Go
Create Procedure GetAllAds 
as

Select * from Ads 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteAds' and
		        xtype = 'P')
Drop Procedure DeleteAds
Go
Create Procedure DeleteAds @AdsID int 
as

Delete Ads 
where AdsID = @AdsID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllAdsByCategory' and
		        xtype = 'P')
Drop Procedure GetAllAdsByCategory
Go
Create Procedure GetAllAdsByCategory @CategoryID int
as

Select * from Ads 
where CategoryID = @CategoryID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllAdsByLocation' and
		        xtype = 'P')
Drop Procedure GetAllAdsByLocation
Go
Create Procedure GetAllAdsByLocation @LocationID int
as

Select * from Ads 
where AdsLocationID = @LocationID and 
	  ((GETDATE() between StartDate and EndDate) or (DATEDIFF(day, GETDATE(), EndDate) = 0 ))

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchAds' and
		        xtype = 'P')
Drop Procedure SearchAds
Go
Create Procedure SearchAds @filterText nvarchar(200),
						   @AdLocationID int = 0	
as

Select * from Ads
Where (EnTitle like N'%' + @filterText + N'%' or 
	  ArTitle like N'%' + @filterText + N'%') And 
	  ( @AdLocationID = 0 or AdsLocationID = @AdLocationID )
Go

/************************/

/* Vedios procedures */

If Exists (select Name 
		   from sysobjects 
		   where name = 'AddVedio' and
		        xtype = 'P')
Drop Procedure AddVedio
Go
Create Procedure AddVedio 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@URL Nvarchar(500),
						@CategoryID int,
						@CreatedDate DateTime
as

Insert Into Vedios( EnTitle ,
					ArTitle ,
					URL ,
					CategoryID,
					CreatedDate 
					)
			Values 
			(
			@EnTitle ,
			@ArTitle ,
			@URL ,
			@CategoryID,
			@CreatedDate
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateVedio' and
		        xtype = 'P')
Drop Procedure UpdateVedio
Go
Create Procedure UpdateVedio @VedioID int, 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@URL Nvarchar(500),
						@CategoryID int,
						@CreatedDate DateTime
as

Update Vedios set EnTitle = @EnTitle,
					ArTitle  = @ArTitle,
					URL = @URL,
					CategoryID = @CategoryID,
					CreatedDate = @CreatedDate
Where VedioID = @VedioID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetVedio' and
		        xtype = 'P')
Drop Procedure GetVedio
Go
Create Procedure GetVedio @VedioID int
as

Select * from Vedios 
Where VedioID = @VedioID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetVedioByCompanyID' and
		        xtype = 'P')
Drop Procedure GetVedioByCompanyID
Go
Create Procedure GetVedioByCompanyID @CompanyID int
as

Select * from Vedios 
Where CompanyID = @CompanyID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetVedios' and
		        xtype = 'P')
Drop Procedure GetVedios
Go
Create Procedure GetVedios 
as

Select * from Vedios 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteVedio' and
		        xtype = 'P')
Drop Procedure DeleteVedio
Go
Create Procedure DeleteVedio @VedioID int 
as

Delete Vedios 
where VedioID = @VedioID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllVediosByCategory' and
		        xtype = 'P')
Drop Procedure GetAllVediosByCategory
Go
Create Procedure GetAllVediosByCategory @CategoryID int
as

Select * from Vedios 
where CategoryID = @CategoryID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchVedios' and
		        xtype = 'P')
Drop Procedure SearchVedios
Go
Create Procedure SearchVedios @filterText nvarchar(200)
as

Select * from Vedios
Where EnTitle like N'%' + @filterText + N'%' or 
	  ArTitle like N'%' + @filterText + N'%'
Go
/***************************/

/* News Procedures  */

If Exists (select Name 
		   from sysobjects 
		   where name = 'AddNews' and
		        xtype = 'P')
Drop Procedure AddNews
Go
Create Procedure AddNews 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@EnBody Nvarchar(max),
						@ArBody Nvarchar(max),
						@CategoryID int ,
						@CreatedDate DateTime
as

Insert Into News ( EnTitle ,
					ArTitle ,
					EnBody ,
					ArBody,
					CategoryID,
					CreatedDate 
					)
			Values 
			(
			@EnTitle ,
			@ArTitle ,
			@EnBody ,
			@ArBody,
			@CategoryID,
			@CreatedDate
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateNews' and
		        xtype = 'P')
Drop Procedure UpdateNews
Go
Create Procedure UpdateNews @NewsID int, 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@EnBody Nvarchar(max),
						@ArBody Nvarchar(max),
						@CategoryID int ,
						@CreatedDate DateTime
as

Update News set EnTitle = @EnTitle,
					ArTitle  = @ArTitle,
					EnBody = @EnBody ,
					ArBody = @ArBody,
					CategoryID = @CategoryID,
					CreatedDate = @CreatedDate
Where NewsID = @NewsID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetNews' and
		        xtype = 'P')
Drop Procedure GetNews
Go
Create Procedure GetNews @NewsID int
as

Select * from News 
Where NewsID = @NewsID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllNews' and
		        xtype = 'P')
Drop Procedure GetAllNews
Go
Create Procedure GetAllNews 
as

Select * from News 

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetTopNews' and
		        xtype = 'P')
Drop Procedure GetTopNews
Go
Create Procedure GetTopNews 
as

Select top 4 * from News 
order by CreatedDate desc	

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetTopArNews' and
		        xtype = 'P')
Drop Procedure GetTopArNews
Go
Create Procedure GetTopArNews 
as

Select top 4 * from ArNews 
order by CreatedDate desc	

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteNews' and
		        xtype = 'P')
Drop Procedure DeleteNews
Go
Create Procedure DeleteNews @NewsID int 
as

Delete News
where NewsID = @NewsID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllNewsByCategory' and
		        xtype = 'P')
Drop Procedure GetAllNewsByCategory
Go
Create Procedure GetAllNewsByCategory @CategoryID int
as

Select * from News 
where CategoryID = @CategoryID

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchNews' and
		        xtype = 'P')
Drop Procedure SearchNews
Go
Create Procedure SearchNews @filterText nvarchar(200),
							@FromDate DateTime = null,
							@ToDate DateTime = null
							
as

Select * from News
Where (EnTitle like N'%' + @filterText + N'%' or 
	  ArTitle like N'%' + @filterText + N'%') and
	  (DATEDIFF(DAY,ISNULL(@FromDate, cast('1900-01-01' as datetime)), CreatedDate) >= 0 And  DATEDIFF(DAY,CreatedDate,ISNULL(@ToDate , cast('9999-01-01' as datetime))) >= 0 )	  	  	  
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchArNews' and
		        xtype = 'P')
Drop Procedure SearchArNews
Go
Create Procedure SearchArNews @filterText nvarchar(200),
							@FromDate DateTime = null,
							@ToDate DateTime = null
							
as

Select * from ArNews
Where (EnTitle like N'%' + @filterText + N'%' or 
	  ArTitle like N'%' + @filterText + N'%' )and
	  (DATEDIFF(DAY,ISNULL(@FromDate, cast('1900-01-01' as datetime)), CreatedDate) >= 0 And  DATEDIFF(DAY,CreatedDate,ISNULL(@ToDate , cast('9999-01-01' as datetime))) >= 0 )	  	  	  
Go
/*************************/
/* Countries procedures  */
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddCountry' and
		        xtype = 'P')
Drop Procedure AddCountry
Go
Create Procedure AddCountry 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200),
						@EnDesc Nvarchar(max),
						@ArDesc Nvarchar(max)
as

Insert Into Countries( EnName ,
					ArName  ,
					EnDescription  ,
					ArDescription 
					)
			Values 
			(
			@EnName ,
			@ArName ,
			@EnDesc ,
			@ArDesc
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateCountry' and
		        xtype = 'P')
Drop Procedure UpdateCountry
Go
Create Procedure UpdateCountry @CountryID int, 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200),
						@EnDesc Nvarchar(max),
						@ArDesc Nvarchar(max)
as

Update Countries set EnName = @EnName,
					ArName  = @ArName,
					EnDescription = @EnDesc ,
					ArDescription = @ArDesc
Where CountryID = @CountryID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCountry' and
		        xtype = 'P')
Drop Procedure GetCountry
Go
Create Procedure GetCountry @CountryID int
as

Select * from Countries 
Where CountryID = @CountryID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCountries' and
		        xtype = 'P')
Drop Procedure GetCountries
Go
Create Procedure GetCountries
as

Select * from Countries 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteCountry' and
		        xtype = 'P')
Drop Procedure DeleteCountry
Go
Create Procedure DeleteCountry @CountryID int 
as

Delete Countries 
where CountryID = @CountryID

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchCountries' and
		        xtype = 'P')
Drop Procedure SearchCountries
Go
Create Procedure SearchCountries @filterText nvarchar(200)
as

Select * from Countries
Where EnName like N'%' + @filterText + N'%' or 
	  ArName like N'%' + @filterText + N'%'or
	  EnDescription like N'%' + @filterText + N'%' or 
	  ArDescription like N'%' + @filterText + N'%'  
Go


/* Cities procedures  */
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddCity' and
		        xtype = 'P')
Drop Procedure AddCity
Go
Create Procedure AddCity 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200),
						@EnDesc Nvarchar(max),
						@ArDesc Nvarchar(max)
as

Insert Into Cities( EnName ,
					ArName  ,
					EnDescription  ,
					ArDescription 
					)
			Values 
			(
			@EnName ,
			@ArName ,
			@EnDesc ,
			@ArDesc
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateCity' and
		        xtype = 'P')
Drop Procedure UpdateCity
Go
Create Procedure UpdateCity @CityID int, 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200),
						@EnDesc Nvarchar(max),
						@ArDesc Nvarchar(max)
as

Update Cities set EnName = @EnName,
					ArName  = @ArName,
					EnDescription = @EnDesc ,
					ArDescription = @ArDesc
Where CityID = @CityID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCity' and
		        xtype = 'P')
Drop Procedure GetCity
Go
Create Procedure GetCity @CityID int
as

Select * from Cities 
Where CityID = @CityID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCityByName' and
		        xtype = 'P')
Drop Procedure GetCityByName
Go
Create Procedure GetCityByName @CityName nvarchar(200)
as

Select * from Cities 
Where EnName = @CityName

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCities' and
		        xtype = 'P')
Drop Procedure GetCities
Go
Create Procedure GetCities
as

Select * from Cities 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteCity' and
		        xtype = 'P')
Drop Procedure DeleteCity
Go
Create Procedure DeleteCity @CityID int 
as

Delete Cities 
where CityID = @CityID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchCities' and
		        xtype = 'P')
Drop Procedure SearchCities
Go
Create Procedure SearchCities @filterText nvarchar(200)
as

Select * from Cities
Where EnName like N'%' + @filterText + N'%' or 
	  ArName like N'%' + @filterText + N'%'or
	  EnDescription like N'%' + @filterText + N'%' or 
	  ArDescription like N'%' + @filterText + N'%'  
Go

/********************/
/* Companies procedures  */
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddCompany' and
		        xtype = 'P')
Drop Procedure AddCompany
Go
Create Procedure AddCompany @EnName Nvarchar(200),
							@ArName Nvarchar(200),
							@EnAddress Nvarchar(500),
							@ArAddress Nvarchar(500),
							@UserName nvarchar(50),
							@password nvarchar(50),
							@CityID int ,
							@CategoryID int ,
							@SubCategoryID int ,
							@Tele Nvarchar(120),
							@Fax nvarchar(120),
							@WebSite nvarchar(200),
							@LogoPath nvarchar(300),
							@EnBranches nvarchar(max),
							@ArBranches nvarchar(max),	
							@MapPath nvarchar(1000),
							@EnAbout nvarchar(1000),
							@ArAbout nvarchar(1000),
							@EnContact nvarchar(1000),
							@ArContact nvarchar(1000),
							@PackageTypeID int 
as

Insert Into companies ( EnName ,
						ArName ,
						EnAddress ,
						ArAddress ,
						UserName ,
						[password] ,
						CityID ,
						CategoryID ,
						SubCategoryID ,
						Tele ,
						Fax ,
						WebSite ,
						LogoPath ,
						EnBranches ,
						ArBranches ,	
						MapPath ,
						EnAbout ,
						ArAbout ,
						EnContact ,
						ArContact ,
						PackageTypeID 
						)
			Values 
			(			
			@EnName ,
			@ArName ,
			@EnAddress ,
			@ArAddress ,
			@UserName ,
			@password ,
			@CityID ,
			@CategoryID ,
			@SubCategoryID ,
			@Tele ,
			@Fax ,
			@WebSite ,
			@LogoPath ,
			@EnBranches ,
			@ArBranches ,	
			@MapPath ,
			@EnAbout ,
			@ArAbout ,
			@EnContact ,
			@ArContact ,
			@PackageTypeID 
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateCompany' and
		        xtype = 'P')
Drop Procedure UpdateCompany
Go
Create Procedure UpdateCompany @CompanyID int ,
								@EnName Nvarchar(200),
								@ArName Nvarchar(200),
								@EnAddress Nvarchar(500),
								@ArAddress Nvarchar(500),
								@UserName nvarchar(50),
								@password nvarchar(50),
								@CityID int ,
								@CategoryID int ,
								@SubCategoryID int ,
								@Tele Nvarchar(120),
								@Fax nvarchar(120),
								@WebSite nvarchar(200),
								@LogoPath nvarchar(300),
								@EnBranches nvarchar(max),
								@ArBranches nvarchar(max),	
								@MapPath nvarchar(1000),
								@EnAbout nvarchar(1000),
								@ArAbout nvarchar(1000),
								@EnContact nvarchar(1000),
								@ArContact nvarchar(1000),
								@PackageTypeID int 
as

Update Companies set EnName = @EnName ,
						ArName = @ArName,
						EnAddress = @EnAddress,
						ArAddress = @ArAddress,
						UserName = @UserName,
						[password] =@password,
						CityID = @CityID,
						CategoryID  =@CategoryID,
						SubCategoryID = @SubCategoryID,
						Tele = @Tele,
						Fax = @Fax,
						WebSite = @WebSite,
						LogoPath = @LogoPath,
						EnBranches = @EnBranches,
						ArBranches = @ArBranches ,	
						MapPath = @MapPath,
						EnAbout = @EnAbout,
						ArAbout = @ArAbout,
						EnContact = @EnContact,
						ArContact = @ArContact,
						PackageTypeID = @PackageTypeID 
Where CompanyID = @CompanyID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCompany' and
		        xtype = 'P')
Drop Procedure GetCompany
Go
Create Procedure GetCompany @CompanyID int
as

Select * from Companies
Where CompanyID = @CompanyID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCompanyByUserName' and
		        xtype = 'P')
Drop Procedure GetCompanyByUserName
Go
Create Procedure GetCompanyByUserName @UserName nvarchar(50)
as

Select * from Companies
Where UserName = @UserName

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCompanyByName' and
		        xtype = 'P')
Drop Procedure GetCompanyByName
Go
Create Procedure GetCompanyByName @Name nvarchar(200)
as

Select * from Companies
Where EnName = @Name

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCompanies' and
		        xtype = 'P')
Drop Procedure GetCompanies
Go
Create Procedure GetCompanies
as

Select * from Companies 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteCompany' and
		        xtype = 'P')
Drop Procedure DeleteCompany
Go
Create Procedure DeleteCompany @CompanyID int 
as

Delete Companies 
where CompanyID = @CompanyID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchCompanies' and
		        xtype = 'P')
Drop Procedure SearchCompanies
Go
Create Procedure SearchCompanies @filterText nvarchar(200)
as

Select * from Companies
Where EnName like N'%' + @filterText + N'%' or 
	  ArName like N'%' + @filterText + N'%'or
	  EnAddress like N'%' + @filterText + N'%' or 
	  ArAddress like N'%' + @filterText + N'%' or
	  UserName like N'%' + @filterText + N'%' or
	  Tele like N'%' + @filterText + N'%' or
	  Fax like N'%' + @filterText + N'%' or
	  WebSite like N'%' + @filterText + N'%' or
	  EnBranches like N'%' + @filterText + N'%' or
	  ArBranches like N'%' + @filterText + N'%' or
	  EnAbout like N'%' + @filterText + N'%' or
	  ArAbout like N'%' + @filterText + N'%' or
	  EnContact like N'%' + @filterText + N'%' or
	  ArContact like N'%' + @filterText + N'%' 
Go


/* Packages procedures  */
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddPackage' and
		        xtype = 'P')
Drop Procedure AddPackage
Go
Create Procedure AddPackage 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200),
						@EnDesc Nvarchar(500),
						@ArDesc Nvarchar(500)
as

Insert Into Packages( EnName ,
					ArName  ,
					EnDescription  ,
					ArDescription 
					)
			Values 
			(
			@EnName ,
			@ArName ,
			@EnDesc ,
			@ArDesc
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdatePackage' and
		        xtype = 'P')
Drop Procedure UpdatePackage
Go
Create Procedure UpdatePackage @PackageID int, 
						@EnName Nvarchar(200),
						@ArName Nvarchar(200),
						@EnDesc Nvarchar(500),
						@ArDesc Nvarchar(500)
as

Update Packages set EnName = @EnName,
					ArName  = @ArName,
					EnDescription = @EnDesc ,
					ArDescription = @ArDesc
Where PackageID = @PackageID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPackage' and
		        xtype = 'P')
Drop Procedure GetPackage
Go
Create Procedure GetPackage @PackageID int
as

Select * from Packages 
Where PackageID = @PackageID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPackages' and
		        xtype = 'P')
Drop Procedure GetPackages
Go
Create Procedure GetPackages
as

Select * from Packages 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeletePackage' and
		        xtype = 'P')
Drop Procedure DeletePackage
Go
Create Procedure DeletePackage @PackageID int 
as

Delete Packages 
where PackageID = @PackageID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchPackages' and
		        xtype = 'P')
Drop Procedure SearchPackages
Go
Create Procedure SearchPackages @filterText nvarchar(200)
as

Select * from Packages
Where EnName like N'%' + @filterText + N'%' or 
	  ArName like N'%' + @filterText + N'%'or
	  EnDescription like N'%' + @filterText + N'%' or 
	  ArDescription like N'%' + @filterText + N'%'  
Go

/* Package options procedures  */
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddPackageOption' and
		        xtype = 'P')
Drop Procedure AddPackageOption
Go
Create Procedure AddPackageOption @PackageID int,
									@EnName Nvarchar(200),
									@ArName Nvarchar(200),
									@EnDesc Nvarchar(500),
									@ArDesc Nvarchar(500)
as

Insert Into PackageOptions( PackageID,
					EnName ,
					ArName  ,
					EnDescription  ,
					ArDescription 
					)
			Values 
			(
			@PackageID,
			@EnName ,
			@ArName ,
			@EnDesc ,
			@ArDesc
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdatePackageOption' and
		        xtype = 'P')
Drop Procedure UpdatePackageOption
Go
Create Procedure UpdatePackageOption @PackageOptionID int, 
									@PackageID int ,
									@EnName Nvarchar(200),
									@ArName Nvarchar(200),
									@EnDesc Nvarchar(500),
									@ArDesc Nvarchar(500)
as

Update PackageOptions set EnName = @EnName,
						ArName  = @ArName,
						EnDescription = @EnDesc ,
						ArDescription = @ArDesc,
						PackageID = @PackageID
Where PackageOptionID = @PackageOptionID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPackageOption' and
		        xtype = 'P')
Drop Procedure GetPackageOption
Go
Create Procedure GetPackageOption @PackageOptionID int
as

Select * from PackageOptions 
Where PackageOptionID = @PackageOptionID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPackageOptions' and
		        xtype = 'P')
Drop Procedure GetPackageOptions
Go
Create Procedure GetPackageOptions
as

Select * from PackageOptions 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPackageOptionsByPackageID' and
		        xtype = 'P')
Drop Procedure GetPackageOptionsByPackageID
Go
Create Procedure GetPackageOptionsByPackageID @PackageID int
as

Select * from PackageOptions 
Where PackageID = @PackageID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeletePackageOption' and
		        xtype = 'P')
Drop Procedure DeletePackageOption
Go
Create Procedure DeletePackageOption @PackageOptionID int 
as

Delete PackageOptions 
where PackageOptionID = @PackageOptionID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchPackageOptions' and
		        xtype = 'P')
Drop Procedure SearchPackageOptions
Go
Create Procedure SearchPackageOptions @filterText nvarchar(200),
									  @PackageID int 
as

Select * from PackageOptions
Where EnName like N'%' + @filterText + N'%' or 
	  ArName like N'%' + @filterText + N'%'or
	  EnDescription like N'%' + @filterText + N'%' or 
	  ArDescription like N'%' + @filterText + N'%' And
	  (@PackageID = 0 Or PackageID = @PackageID)
Go

/* CompanyEnabledOption procedures  */
If Exists (select Name 
		   from sysobjects 
		   where name = 'AddCompanyEnabledOption' and
		        xtype = 'P')
Drop Procedure AddCompanyEnabledOption
Go
Create Procedure AddCompanyEnabledOption @PackageOptionID int,
										@CompanyID int,
										@Enabled int
as

Insert Into CompanyEnabledOptions( PackageOptionID ,
										CompanyID ,
										[Enabled]
					)
			Values 
			(
			@PackageOptionID ,
			@CompanyID ,
			@Enabled
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateCompanyEnabledOption' and
		        xtype = 'P')
Drop Procedure UpdateCompanyEnabledOption
Go
Create Procedure UpdateCompanyEnabledOption @CompanyEnabledOptionID int, 
											@PackageOptionID int,
											@CompanyID int,
											@Enabled int
as

Update CompanyEnabledOptions set PackageOptionID = @PackageOptionID,
											CompanyID = @CompanyID,
											Enabled =@Enabled
Where CompanyEnabledOptionID = @CompanyEnabledOptionID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCompanyEnabledOption' and
		        xtype = 'P')
Drop Procedure GetCompanyEnabledOption
Go
Create Procedure GetCompanyEnabledOption @CompanyEnabledOptionID int
as

Select * from CompanyEnabledOptions 
Where CompanyEnabledOptionID= @CompanyEnabledOptionID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCompanyEnabledOptions' and
		        xtype = 'P')
Drop Procedure GetCompanyEnabledOptions
Go
Create Procedure GetCompanyEnabledOptions
as

Select * from CompanyEnabledOptions 

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCompanyEnabledOptionsByCompanyID' and
		        xtype = 'P')
Drop Procedure GetCompanyEnabledOptionsByCompanyID
Go
Create Procedure GetCompanyEnabledOptionsByCompanyID @CompanyID int
as

Select * from CompanyEnabledOptions 
where CompanyID = @CompanyID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteCompanyEnabledOption' and
		        xtype = 'P')
Drop Procedure DeleteCompanyEnabledOption
Go
Create Procedure DeleteCompanyEnabledOption @CompanyEnabledOptionID int 
as

Delete CompanyEnabledOptions 
where CompanyEnabledOptionID = @CompanyEnabledOptionID

Go


/***************/

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPackageOptionsLinksByPackageID' and
		        xtype = 'P')
Drop Procedure GetPackageOptionsLinksByPackageID
Go
Create Procedure GetPackageOptionsLinksByPackageID @PackageID int
as

Select * from PackageOptionsLink 
Where PackageID = @PackageID

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPhotosByCompanyID' and
		        xtype = 'P')
Drop Procedure GetPhotosByCompanyID
Go
Create Procedure GetPhotosByCompanyID @CompanyID int
as

Select * from Photos 
Where CompanyID = @CompanyID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetVediosByCompanyID' and
		        xtype = 'P')
Drop Procedure GetVediosByCompanyID
Go
Create Procedure GetVediosByCompanyID @CompanyID int
as

Select * from Vedios 
Where CompanyID = @CompanyID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetServicesByCompanyIDAndTypeID' and
		        xtype = 'P')
Drop Procedure GetServicesByCompanyIDAndTypeID
Go
Create Procedure GetServicesByCompanyIDAndTypeID @CompanyID int,
												 @TypeID int = 0 
as

Select * from Services 
Where CompanyID = @CompanyID and 
	  (@TypeID = 0 Or TypeID = @TypeID )

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchCompanies' and
		        xtype = 'P')
Drop Procedure SearchCompanies
Go
Create Procedure SearchCompanies @filterText nvarchar(200),
								 @CityID int = 0 ,
								 @CategoryID int = 0,
								 @SubCategoryID int = 0
as

Select * from Companies C
Left Join Packages P on C.PackageTypeID = P.PackageID
Where (C.EnName like N'%' + @filterText + N'%' or 
	  C.ArName like N'%' + @filterText + N'%'	or
	  EnAddress like N'%' + @filterText + N'%'	or
	  ArAddress like N'%' + @filterText + N'%'	) And 
	  (@CityID = 0 Or CityID = @CityID) and 
	  (@CategoryID = 0 Or CategoryID = @CategoryID) and 
	  (@SubCategoryID = 0 Or SubCategoryID = @SubCategoryID) 
Order by C.PackageTypeId desc
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchAirLineCompanies' and
		        xtype = 'P')
Drop Procedure SearchAirLineCompanies
Go
Create Procedure SearchAirLineCompanies @FromCityID int = 0 ,
										 @ToCityID int = 0
as

Select * from Companies C
Inner Join AirLines A on C.CompanyID = A.CompanyID
Where (@FromCityID = 0 Or A.FromAirPortID = @FromCityID) and 
	  (@ToCityID = 0 Or a.ToAirPortID = @ToCityID) 
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchShippingLineCompanies' and
		        xtype = 'P')
Drop Procedure SearchShippingLineCompanies
Go
Create Procedure SearchShippingLineCompanies @FromCityID int = 0 ,
											@ToCityID int = 0
as

Select * from Companies C
Inner Join ShippingLines A on C.CompanyID = A.CompanyID
Where (@FromCityID = 0 Or a.FromSeaPortID = @FromCityID) and 
	  (@ToCityID = 0 Or a.ToSeaPortID = @ToCityID) 
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetTopExchange' and
		        xtype = 'P')
Drop Procedure GetTopExchange
Go
Create Procedure GetTopExchange
as
 
Select * from Exchange Ex
Inner Join Currency C on Ex.CurrencyID = C.CurrencyID
where CONVERT(VARCHAR(10),CreatedDate,111) = (Select CONVERT(VARCHAR(10),MAX(CreatedDate),111) from Exchange)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetTopMinerals' and
		        xtype = 'P')
Drop Procedure GetTopMinerals
Go
Create Procedure GetTopMinerals
as
 
Select * from Mineral Ex
Inner Join Mines C on Ex.MinID = C.MinID
where CONVERT(VARCHAR(10),CreatedDate,111) = (Select CONVERT(VARCHAR(10),MAX(CreatedDate),111) from Mineral)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetCompanyByCategoryIDAndSubCategoryID' and
		        xtype = 'P')
Drop Procedure GetCompanyByCategoryIDAndSubCategoryID
Go
Create Procedure GetCompanyByCategoryIDAndSubCategoryID @CategoryID int = 0,
														@SubCategoryID int =0
as

Select * from Companies C 
inner Join SubCategories SC on C.SubCategoryID = SC.SubCategoryID 
Inner Join Categories CC on CC.CategoryID = SC.CategoryID
Where (@SubCategoryID = 0 Or SC.SubCategoryID = @SubCategoryID  ) And 
	  (@CategoryID = 0 Or C.CategoryID = @CategoryID  )  

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchAirPorts' and
		        xtype = 'P')
Drop Procedure SearchAirPorts
Go
Create Procedure SearchAirPorts @filterText nvarchar(200)
as

Select * from AirPorts 
Where EnName like N'%' + @filterText + N'%' or 
	  ArName like N'%' + @filterText + N'%'	or
	  AirPortCode like N'%' + @filterText + N'%'
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchSeaPorts' and
		        xtype = 'P')
Drop Procedure SearchSeaPorts
Go
Create Procedure SearchSeaPorts @filterText nvarchar(200)
as

Select * from SeaPorts 
Where EnName like N'%' + @filterText + N'%' or 
	  ArName like N'%' + @filterText + N'%'	or
	  SeaPortCode like N'%' + @filterText + N'%'
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAirPortByName' and
		        xtype = 'P')
Drop Procedure GetAirPortByName
Go
Create Procedure GetAirPortByName @Name nvarchar(200)
as

Select * from AirPorts 
Where EnName = @Name or 
	  ArName = @Name 	  
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSeaPortByName' and
		        xtype = 'P')
Drop Procedure GetSeaPortByName
Go
Create Procedure GetSeaPortByName @Name nvarchar(200)
as

Select * from SeaPorts 
Where EnName = @Name or 
	  ArName = @Name 	  
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAirPortByCode' and
		        xtype = 'P')
Drop Procedure GetAirPortByCode
Go
Create Procedure GetAirPortByCode @Name nvarchar(200)
as

Select * from AirPorts 
Where AirPortCode = @Name 
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSeaPortByCode' and
		        xtype = 'P')
Drop Procedure GetSeaPortByCode
Go
Create Procedure GetSeaPortByCode @Name nvarchar(200)
as

Select * from SeaPorts 
Where SeaPortCode = @Name 
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchCompaniesForAirLines' and
		        xtype = 'P')
Drop Procedure SearchCompaniesForAirLines
Go
Create Procedure SearchCompaniesForAirLines  @FromAirPortID int = 0,
											 @ToAirPortID int = 0
as

Select C.* from Companies C
Inner join AirLines A on A.CompanyID = C.CompanyID
Where A.FromAirPortID = @FromAirPortID and 
	  A.ToAirPortID = @ToAirPortID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchCompaniesForSeaLines' and
		        xtype = 'P')
Drop Procedure SearchCompaniesForSeaLines
Go
Create Procedure SearchCompaniesForSeaLines  @FromSeaPortID int = 0,
											 @ToSeaPortID int = 0
as

Select C.* from Companies C
Inner join ShippingLines S on S.CompanyID = C.CompanyID
Where S.FromSeaPortID = @FromSeaPortID and 
	  S.ToSeaPortID = @ToSeaPortID
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSubCategoriesForOtherTypes' and
		        xtype = 'P')
Drop Procedure GetSubCategoriesForOtherTypes
Go
Create Procedure GetSubCategoriesForOtherTypes 
as

Select * from subCategories 
Where SubCategoryID in (4,5,8,10,11,12,13,14,15,17,18)

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchCompaniesForShipping' and
		        xtype = 'P')
Drop Procedure SearchCompaniesForShipping
Go
Create Procedure SearchCompaniesForShipping  @SubCategoryID int = 0
as

Select C.* from Companies C
Where C.CategoryID = 1 and 
	  (@SubCategoryID= 0 Or C.SubCategoryID = @SubCategoryID )
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSubCategoriesForShipping' and
		        xtype = 'P')
Drop Procedure GetSubCategoriesForShipping
Go
Create Procedure GetSubCategoriesForShipping @CategoryID int = 0  
as

Select * from subCategories 
Where CategoryID = 1 and 
	  (SubCategoryID = 1 OR SubCategoryID = 3 )
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchCompaniesForOffers' and
		        xtype = 'P')
Drop Procedure SearchCompaniesForOffers
Go
Create Procedure SearchCompaniesForOffers  @CategoryID int = 0,
										   @SubCategoryID int =0
as

Select C.* from Companies C
inner Join SubCategories SC on C.SubCategoryID = SC.SubCategoryID 
Inner Join Categories CC on CC.CategoryID = SC.CategoryID
Inner JOIN [Services] S ON C.CompanyID = S.CompanyID
Where (@SubCategoryID = 0 Or SC.SubCategoryID = @SubCategoryID  ) And 
	  (@CategoryID = 0 Or CC.CategoryID = @CategoryID  )  and 
	  S.TypeID = 1
	  
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllVediosLibByCategory' and
		        xtype = 'P')
Drop Procedure GetAllVediosLibByCategory
Go
Create Procedure GetAllVediosLibByCategory @CategoryID int = 0
as

Select * from VedioLib
where (@CategoryID = 0 Or CategoryID = @CategoryID  )

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchVedioLib' and
		        xtype = 'P')
Drop Procedure SearchVedioLib
Go
Create Procedure SearchVedioLib @filterText nvarchar(250)
as

Select * from VedioLib
Where EnTitle like N'%' + @filterText + N'%' or 
	  ArTitle like N'%' + @filterText + N'%'
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchVedioCat' and
		        xtype = 'P')
Drop Procedure SearchVedioCat
Go
Create Procedure SearchVedioCat @filterText nvarchar(250)
as

Select * from VedioCategories
Where EnName like N'%' + @filterText + N'%' or 
	  ArName like N'%' + @filterText + N'%'
Go

/*


SELECT CONVERT(VARCHAR(10),GETDATE(),111)
AirLinesID int not null
					identity(1,1)
					Primary Key, 
	FromCityID int not null
			Foreign Key References Cities (CityID),
	ToCityID int not null
			Foreign Key References Cities (CityID),
	CompanyID int not n
*/