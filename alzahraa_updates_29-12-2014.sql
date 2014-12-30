alter table courses
add MinGradeFMT int, 
	MaxGradeFMT int,
	MinGradeFT int, 
	MaxGradeFT int, 
	MinGradeSMT int, 
	MaxGradeSMT int,
	MinGradeST int, 
	MaxGradeST int
	
GO
alter table courses
alter column classid int null
GO	

SET IDENTITY_INSERT Courses ON;
GO
insert into Courses(CourseID, ARName, ENName)
values (1000000, N'المجموع','Total')
GO

SET IDENTITY_INSERT Courses OFF;
GO


alter Procedure UpdateCourse @CourseID int,   
       @MaxGradeFMT int,  
       @MinGradeFMT int,  
       @MaxGradeFT int,  
       @MinGradeFT int,  
       @MaxGradeSMT int,  
       @MinGradeSMT int,  
       @MaxGradeST int,  
       @MinGradeST int,  
       @ARName nvarchar(100),  
       @ENName nvarchar(100),  
       @ClassID int,  
       @InTotal bit  
as  
  
Update Courses set MaxGradeFMT = @MaxGradeFMT ,  
      MinGradeFMT = @MinGradeFMT ,
      MaxGradeFT = @MaxGradeFT ,  
      MinGradeFT = @MinGradeFT ,
      MaxGradeSMT = @MaxGradeSMT ,  
      MinGradeSMT = @MinGradeSMT ,
      MaxGradeST = @MaxGradeST ,  
      MinGradeST = @MinGradeST ,  
      ENName = @ENName,  
      ARName = @ARName,  
      ClassID = @ClassID,  
      InTotal = @InTotal  
Where CourseID = @CourseID  

  GO
  
alter Procedure AddCourse  @MaxGradeFMT int,  
       @MinGradeFMT int,  
       @MaxGradeFT int,  
       @MinGradeFT int,  
       @MaxGradeSMT int,  
       @MinGradeSMT int,  
       @MaxGradeST int,  
       @MinGradeST int,   
       @ARName nvarchar(100),  
       @ENName nvarchar(100),  
       @ClassID int,  
       @InTotal bit  
as  
  
Insert Into Courses( MaxGradeFMT ,  
      MinGradeFMT ,  
      MaxGradeFT ,  
      MinGradeFT ,  
      MaxGradeSMT ,  
      MinGradeSMT ,  
      MaxGradeST ,  
      MinGradeST ,  
      ENName ,  
      ARName ,  
      ClassID,  
      InTotal  
      )  
   Values   
   (  
   @MaxGradeFMT ,  
   @MinGradeFMT ,
   @MaxGradeFT ,  
   @MinGradeFT ,
   @MaxGradeSMT ,  
   @MinGradeSMT ,
   @MaxGradeST ,  
   @MinGradeST ,  
   @ARName ,  
   @ENName ,  
   @ClassID,  
   @InTotal  
   )  
  