


CREATE Schema Training
GO

If Exists (select Name 
		   from sysobjects 
		   where name = '[Training].[Training]' and
		        xtype = 'U')
Drop Table [Training].[Training]
GO
Create Table [Training].[Training]
(
	TrainingID int not null identity(1,1) primary key,	
	TrainingCode nvarchar(200),	
	AirPlaneModel int foreign key references dbo.AirPlane(AirPlaneID),
	TrainingPlace nvarchar(200),	
	AssignedByID int foreign key references dbo.Pilot(PilotID),
	IsSpecial bit,
	IsApproved bit,
	StartDate DateTime,
	EndDate DateTime,
	TravelDate DateTime,
	BackDate DateTime,
	TrainerID int foreign key references dbo.Pilot(PilotID),			
	TrainerTitleID int foreign key references dbo.Title(TitleID),
	CourseID int foreign key references [Training].[Course](CourseID)
)
GO

If Exists (select Name 
		   from sysobjects 
		   where name = '[Training].[Course]' and
		        xtype = 'U')
Drop Table [Training].[Course]
GO
Create Table [Training].[Course]
(
	CourseID int not null identity(1,1) primary key,	
	Name nvarchar(2000),
	Code nvarchar(100),
	Description nvarchar(2000),
	AlertDatePeriod int,								
	ExpiryDate_Period int
)

GO 


If Exists (select Name 
		   from sysobjects 
		   where name = '[Training].[PilotCourse]' and
		        xtype = 'U')
Drop Table [Training].[PilotCourse]
GO
Create Table [Training].[PilotCourse]
(
	PilotCourseID int not null identity(1,1) primary key,	
	CourseID int foreign key references [Training].[Course](CourseID),			
	PilotID int foreign key references dbo.Pilot(PilotID),			
	PilotTitleID int foreign key references dbo.Title(TitleID),
	TrainerID int foreign key references dbo.Pilot(PilotID),			
	TrainerTitleID int foreign key references dbo.Title(TitleID),
	ExaminerID int foreign key references dbo.Pilot(PilotID),	
	TrainingID int foreign key references [Training].[Training](TrainingID),				
	StartDate DateTime,
	EndDate DateTime,
	TravelDate DateTime,
	BackDate DateTime,				
	ExpiryDate DateTime,
	Result bit,
	Notes nvarchar(1000)
)

GO 


If Exists (select Name 
		   from sysobjects 
		   where name = '[Training].[CourseDetail]' and
		        xtype = 'U')
Drop Table [Training].[CourseDetail]
GO
Create Table [Training].[CourseDetail]
(
	CourseDetailID int not null identity(1,1) primary key,	
	PilotCourseID int foreign key references [Training].[PilotCourse](PilotCourseID),
	Notes nvarchar(1000)
)

GO


If Exists (select Name 
		   from sysobjects 
		   where name = '[Training].[TitleCourse]' and
		        xtype = 'U')
Drop Table [Training].[TitleCourse]
GO
Create Table [Training].[TitleCourse]
(
	CourseID int foreign key references [Training].[Course](CourseID),			
	TitleID int foreign key references dbo.Title(TitleID),
	primary key (CourseID, TitleID)
)

Go