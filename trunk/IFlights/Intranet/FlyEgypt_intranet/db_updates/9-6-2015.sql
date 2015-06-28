
update manual
set CreatedBy = null
Go 
alter table Manual
alter column CreatedBy uniqueIdentifier
Go

update Announcement
set CreatedBy = null
Go 
alter table Announcement
alter column CreatedBy uniqueIdentifier
Go


alter table Announcement
add IsBlog bit
Go

alter table Manual
add UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
Go


alter table UsersNofications
add ManualVersionID int foreign key references ManualVersion(ManualVersionID),
	FromVersionID int foreign key references FromVersion(FromVersionID)

alter table UsersProfiles
alter column Photo nvarchar(1000)
Go
	

If Exists (select Name 
		   from sysobjects 
		   where name = 'ManualForm' and
		        xtype = 'U')
Drop Table ManualForm
GO
Create Table ManualForm
(
	ManualFormID int not null identity(1,1) primary key,			
	ManualID int foreign key references Manual(ManualID),
	Name nvarchar(300),
	CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)

GO


If Exists (select Name 
		   from sysobjects 
		   where name = 'ManualVersion' and
		        xtype = 'U')
Drop Table ManualVersion
GO
Create Table ManualVersion
(
	ManualVersionID int not null identity(1,1) primary key,			
	ManualID int foreign key references Manual(ManualID),
	Title nvarchar(300),
	Path nvarchar(300),
	CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime,
	IssueNumber nvarchar(10),
	IssueDate DateTime,
	RevisionNumber nvarchar(10),
	RevisionDate Datetime,
	Notes nvarchar(max)
)

GO


If Exists (select Name 
		   from sysobjects 
		   where name = 'FromVersion' and
		        xtype = 'U')
Drop Table FromVersion
GO
Create Table FromVersion
(
	FromVersionID int not null identity(1,1) primary key,			
	ManualFromID int foreign key references ManualForm(ManualFormID),
	Title nvarchar(300),
	Path nvarchar(300),
	CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime,
	IssueNumber nvarchar(10),
	IssueDate DateTime,
	RevisionNumber nvarchar(10),
	RevisionDate Datetime,
	Notes nvarchar(max)
)

GO





If Exists (select Name 
		   from sysobjects 
		   where name = 'GetTopMostParent' and
		        xtype = 'P')
Drop Procedure GetTopMostParent
Go
Create Procedure GetTopMostParent @ManualCategoryID int  
as  
;WITH CTE AS
(   SELECT  *, 0 [Level]
    FROM    ManualCategory M
    UNION ALL
    SELECT  CTE.ManualCategoryID, CTE.Title, M.ParentCategoryID, Level + 1
    FROM    CTE
            INNER JOIN ManualCategory M
                ON CTE.ParentCategoryID = M.ManualCategoryID
    WHERE   M.ParentCategoryID IS NOT NULL
)

SELECT  top 1 c.ManualCategoryID, c.Title, c.ParentCategoryID
FROM    (   SELECT  *, MAX([Level]) OVER (PARTITION BY Level) [MaxLevel]
            FROM    CTE
        ) c
WHERE   MaxLevel = Level and 
		ManualCategoryID = @ManualCategoryID
order by ParentCategoryID asc		



exec GetTopMostParent 1




If Exists (select Name 
		   from sysobjects 
		   where name = 'UsefulLink' and
		        xtype = 'U')
Drop Table UsefulLink
GO
Create Table UsefulLink
(
	UsefulLinkID int not null identity(1,1) primary key,				
	Title nvarchar(300),
	Description nvarchar(1000),
	CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)

GO

alter Table UsefulLink
add URL nvarchar(500)