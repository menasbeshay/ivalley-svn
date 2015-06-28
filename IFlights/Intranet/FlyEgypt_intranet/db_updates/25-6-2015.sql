
If Exists (select Name 
		   from sysobjects 
		   where name = 'AnnouncementGroup' and
		        xtype = 'U')
Drop Table AnnouncementGroup
GO
Create Table AnnouncementGroup
(
	AnnouncementID int foreign key references Announcement(AnnouncementID),			
	GroupID int foreign key references Groups(GroupID),
	Primary key(AnnouncementID,GroupID)
)

GO


If Exists (select Name 
		   from sysobjects 
		   where name = 'Schedule' and
		        xtype = 'U')
Drop Table Schedule
GO
Create Table Schedule
(
	ScheduleID int not null identity(1,1) primary key,				
	Name nvarchar(300),
	StartDate Datetime, 
	EndDate Datetime,
	CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)

GO


If Exists (select Name 
		   from sysobjects 
		   where name = 'ScheduleVersion' and
		        xtype = 'U')
Drop Table ScheduleVersion
GO
Create Table ScheduleVersion
(
	ScheduleVersionID int not null identity(1,1) primary key,			
	ScheduleID int foreign key references Schedule(ScheduleID),
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
		   where name = 'Certificate' and
		        xtype = 'U')
Drop Table Certificate
GO
Create Table Certificate
(
	CertificateID int not null identity(1,1) primary key,				
	Name nvarchar(300),
	Path nvarchar(500), 	
	CreatedBy uniqueIdentifier,
	CreatedDate Datetime, 
	UpdatedBy uniqueIdentifier,
	LastUpdatedDate Datetime
)

GO


If Exists (select Name 
		   from sysobjects 
		   where name = 'DbLog' and
		        xtype = 'U')
Drop Table DbLog
GO
Create Table DbLog
(
	DbLogID int not null identity(1,1) primary key,				
	UserID uniqueidentifier foreign key references aspnet_users(userid),
	ItemID int,
	ItemType int, 	
	LogDate Datetime, 
	ActionType int
)

GO


alter table UsersNofications
add ScheduleID int, 
	ScheduleVersionID int