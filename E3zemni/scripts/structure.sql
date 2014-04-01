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

exec GetAllDims