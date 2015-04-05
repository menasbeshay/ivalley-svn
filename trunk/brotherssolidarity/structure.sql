
If Exists (select Name 
		   from sysobjects 
		   where name = 'InvestorCat' and
		        xtype = 'U')
Drop Table InvestorCat
Go
Create Table InvestorCat
(
	InvestorCatID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go 
If Exists (select Name 
		   from sysobjects 
		   where name = 'InvestorFile' and
		        xtype = 'U')
Drop Table InvestorFile
Go
Create Table InvestorFile
(
	InvestorFileID int not null
			identity(1,1)
			Primary Key,
	InvestorCatID int foreign key references InvestorCat(InvestorCatID),				
	Name Nvarchar(200),
	FilePath nvarchar(500),
	WordFilePath nvarchar(500)
)
Go 

