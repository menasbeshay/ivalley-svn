If Exists (select Name 
		   from sysobjects 
		   where name = 'Dimension' and
		        xtype = 'U')
Drop Table Dimension
Go
Create Table Dimension
(
	DimensionID int not null
			identity(1,1)
			Primary Key,	
	Width int,
	Height int	
)
Go

alter table Dimension
alter column Width decimal(6,2)

alter table Dimension
alter column Height decimal(6,2)

If Exists (select Name 
		   from sysobjects 
		   where name = 'Color' and
		        xtype = 'U')
Drop Table Color
Go
Create Table Color
(
	ColorID int not null
			identity(1,1)
			Primary Key,	
	ColorCode nvarchar(6),
	ColorNameEng nvarchar(30),
	ColorNameAr nvarchar(30)
)
Go


alter table envelops
drop column Dimension


alter table cards
drop column Dimension


alter table CardLayouts
drop column LayoutColor

alter table Envelops
drop column EnvolopColor

alter table envelops
add DimensionID int foreign key references Dimension(DimensionID)

alter table cards
add DimensionID int foreign key references Dimension(DimensionID)

alter table envelops
add ColorID int foreign key references Color(ColorID)

alter table CardLayouts
add ColorID int foreign key references Color(ColorID)


alter table cardtext
add Width int ,
    Height int

 
 
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllDims' and
		        xtype = 'P')
Drop Procedure GetAllDims
Go
Create Procedure GetAllDims
as

select D.* , Cast(D.Width as nvarchar(50)) + N' × ' + cast(D.Height as nvarchar(50)) DisplayName
from Dimension D
Go

alter table cards 
add GeneralPreviewPhoto nvarchar(500)


alter table cards
add IsPartySupplier bit

alter table cards
add DefaultFont nvarchar(100)


alter table TopLevelCat
add IsPartySupplier bit

alter table MainCat
add IsPartySupplier bit

alter table Categories
add IsPartySupplier bit


If Exists (select Name 
		   from sysobjects 
		   where name = 'PartySupplierImages' and
		        xtype = 'U')
Drop Table PartySupplierImages
Go
Create Table PartySupplierImages
(
	PartySupplierImageID int not null
			identity(1,1)
			Primary Key,	
	CardID int foreign key references Cards(CardID),
	ImagePath nvarchar(200)
)
Go