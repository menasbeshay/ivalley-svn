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

Go 


    
Alter Procedure GetResultByStudentIDAndSchoolYearFHMT @StudentID int,  
               @SchoolYearID int  
as  
Declare @ClassId int   
  
select @ClassId = (Select C.ClassID from Students S   
Inner join ClassRooms Cr on S.ClassRoomID = Cr.ClassRoomID Inner join   
Class C on Cr.ClassID = C.ClassID  
where S.StudentID = @StudentID)  
  
Create Table #CurrentResult  
(  
ResultID int ,  
 StudentID int ,  
 CourseID int ,  
 Grade Decimal,  
 Evaluation nvarchar(50),  
 FirstHalfMidTerm bit,        
 FirstHalfFinal bit,  
 SecondHalfMidTerm bit,  
 SecondHalfFinal bit,  
 SchoolYearID int,  
 ArSchoolYearName Nvarchar(200),  
 EnSchoolYearName Nvarchar(200),  
 ArCourseName Nvarchar(200),  
 EnCourseName Nvarchar(200),  
 InTotal bit,  
 MaxGrade int  
)  
/*Select R.*, S.ARName as ArSchoolYearName ,s.ENName as EnSchoolYearName , C.ARName as ArCourseName , C.ENName as EnCourseName ,  C.InTotal , C.MaxGrade   
 from Results R  
Inner join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
Inner Join Courses C on R.CourseID = C.CourseID  
Where StudentID = @StudentID and   
   R.SchoolYearID = @SchoolYearID  
*/  
Insert into #CurrentResult  
Select R.*, S.ARName as ArSchoolYearName ,s.ENName as EnSchoolYearName , C.ARName as ArCourseName , C.ENName as EnCourseName ,  C.InTotal , C.MaxGradeFMT MaxGrade   
 from Courses C   
left join Results R on C.CourseID = R.CourseID   
left join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
left join Class Cl on C.ClassID = Cl.ClassID   
Inner join ClassRooms CR on Cl.ClassID = CR.ClassID  
Inner Join Students St on CR.ClassRoomID = St.ClassRoomID and   
         R.studentID = St.StudentID  
Where (R.StudentID = @StudentID or R.StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and   
   Cl.ClassID = @ClassId and  
   C.InTotal = 1 and   
   (FirstHalfMidTerm = 1 or FirstHalfMidTerm  is null)  
     
Insert INto #CurrentResult    
Select 0,R.StudentID, 0, Sum(IsNUll(R.Grade,0)), '', 0,0,0,0,S.SchoolYearID,'','', N'المجموع',N'Total', 1, Sum(IsNull(C.MaxGradeFMT,0) )  
 from Results R  
Inner join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
Inner Join Courses C on R.CourseID = C.CourseID  
Where (StudentID = @StudentID or StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and   
   C.InTotal = 1 and   
   (FirstHalfMidTerm = 1 or FirstHalfMidTerm  is null)  
Group by R.StudentID, S.SchoolYearID  


declare @totalEval nvarchar(50)
select @totaleval = R.Evaluation 
from results R
where (R.StudentID = @StudentID or R.StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and   
   R.CourseID = 1000000 and 
      (FirstHalfMidTerm = 1 or FirstHalfMidTerm  is null)  

update #currentResult
set Evaluation = @totaleval
where resultid = 0

  
insert into #CurrentResult  
Select R.*, S.ARName as ArSchoolYearName ,s.ENName as EnSchoolYearName , C.ARName as ArCourseName , C.ENName as EnCourseName ,  C.InTotal , C.MaxGradeFMT   
 from Courses C   
left join Results R on C.CourseID = R.CourseID   
left join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
left join Class Cl on C.ClassID = Cl.ClassID   
Inner join ClassRooms CR on Cl.ClassID = CR.ClassID  
Inner Join Students St on CR.ClassRoomID = St.ClassRoomID and   
         R.studentID = St.StudentID  
Where (R.StudentID = @StudentID or R.StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and  
   Cl.ClassID = @ClassId and      
   C.InTotal <> 1 and   
   (FirstHalfMidTerm = 1 or FirstHalfMidTerm  is null)  
     
     
Select * from #CurrentResult     



Go 



Alter Procedure GetResultByStudentIDAndSchoolYearFHF @StudentID int,  
               @SchoolYearID int  
as  
Declare @ClassId int   
  
select @ClassId = (Select C.ClassID from Students S   
Inner join ClassRooms Cr on S.ClassRoomID = Cr.ClassRoomID Inner join   
Class C on Cr.ClassID = C.ClassID  
where S.StudentID = @StudentID)  
  
Create Table #CurrentResult  
(  
ResultID int ,  
 StudentID int ,  
 CourseID int ,  
 Grade Decimal,  
 Evaluation nvarchar(50),  
 FirstHalfMidTerm bit,        
 FirstHalfFinal bit,  
 SecondHalfMidTerm bit,  
 SecondHalfFinal bit,  
 SchoolYearID int,  
 ArSchoolYearName Nvarchar(200),  
 EnSchoolYearName Nvarchar(200),  
 ArCourseName Nvarchar(200),  
 EnCourseName Nvarchar(200),  
 InTotal bit,  
 MaxGrade int  
)  
/*Select R.*, S.ARName as ArSchoolYearName ,s.ENName as EnSchoolYearName , C.ARName as ArCourseName , C.ENName as EnCourseName ,  C.InTotal , C.MaxGrade   
 from Results R  
Inner join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
Inner Join Courses C on R.CourseID = C.CourseID  
Where StudentID = @StudentID and   
   R.SchoolYearID = @SchoolYearID  
*/  
Insert into #CurrentResult  
Select R.*, S.ARName as ArSchoolYearName ,s.ENName as EnSchoolYearName , C.ARName as ArCourseName , C.ENName as EnCourseName ,  C.InTotal , C.MaxGradeFT MaxGrade   
 from Courses C   
left join Results R on C.CourseID = R.CourseID   
left join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
left join Class Cl on C.ClassID = Cl.ClassID   
Inner join ClassRooms CR on Cl.ClassID = CR.ClassID  
Inner Join Students St on CR.ClassRoomID = St.ClassRoomID and   
         R.studentID = St.StudentID  
Where (R.StudentID = @StudentID or R.StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and   
   Cl.ClassID = @ClassId and  
   C.InTotal = 1 and   
   (FirstHalfFinal = 1 or FirstHalfFinal is null)  
     
Insert INto #CurrentResult    
Select 0,R.StudentID, 0, Sum(IsNUll(R.Grade,0)), '', 0,0,0,0,S.SchoolYearID,'','', N'المجموع',N'Total', 1, Sum(IsNull(C.MaxGradeFT,0) )  
 from Results R  
Inner join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
Inner Join Courses C on R.CourseID = C.CourseID  
Where (StudentID = @StudentID or StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and   
   C.InTotal = 1 and   
   (FirstHalfFinal = 1 or FirstHalfFinal is null)     
Group by R.StudentID, S.SchoolYearID  
  

declare @totalEval nvarchar(50)
select @totaleval = R.Evaluation 
from results R
where (R.StudentID = @StudentID or R.StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and   
   R.CourseID = 1000000 and   
   (FirstHalfFinal = 1 or FirstHalfFinal is null)  
      

update #currentResult
set Evaluation = @totaleval
where resultid = 0

  
  
insert into #CurrentResult  
Select R.*, S.ARName as ArSchoolYearName ,s.ENName as EnSchoolYearName , C.ARName as ArCourseName , C.ENName as EnCourseName ,  C.InTotal , C.MaxGradeFT   
 from Courses C   
left join Results R on C.CourseID = R.CourseID   
left join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
left join Class Cl on C.ClassID = Cl.ClassID   
Inner join ClassRooms CR on Cl.ClassID = CR.ClassID  
Inner Join Students St on CR.ClassRoomID = St.ClassRoomID and   
         R.studentID = St.StudentID  
Where (R.StudentID = @StudentID or R.StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and  
   Cl.ClassID = @ClassId and      
   C.InTotal <> 1 and   
   (FirstHalfFinal = 1 or FirstHalfFinal is null)  
     
     
Select * from #CurrentResult   

GO



alter Procedure GetResultByStudentIDAndSchoolYearSHMT @StudentID int,  
               @SchoolYearID int  
as  
Declare @ClassId int   
  
select @ClassId = (Select C.ClassID from Students S   
Inner join ClassRooms Cr on S.ClassRoomID = Cr.ClassRoomID Inner join   
Class C on Cr.ClassID = C.ClassID  
where S.StudentID = @StudentID)  
  
Create Table #CurrentResult  
(  
ResultID int ,  
 StudentID int ,  
 CourseID int ,  
 Grade Decimal,  
 Evaluation nvarchar(50),  
 FirstHalfMidTerm bit,        
 FirstHalfFinal bit,  
 SecondHalfMidTerm bit,  
 SecondHalfFinal bit,  
 SchoolYearID int,  
 ArSchoolYearName Nvarchar(200),  
 EnSchoolYearName Nvarchar(200),  
 ArCourseName Nvarchar(200),  
 EnCourseName Nvarchar(200),  
 InTotal bit,  
 MaxGrade int  
)  
/*Select R.*, S.ARName as ArSchoolYearName ,s.ENName as EnSchoolYearName , C.ARName as ArCourseName , C.ENName as EnCourseName ,  C.InTotal , C.MaxGrade   
 from Results R  
Inner join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
Inner Join Courses C on R.CourseID = C.CourseID  
Where StudentID = @StudentID and   
   R.SchoolYearID = @SchoolYearID  
*/  
Insert into #CurrentResult  
Select R.*, S.ARName as ArSchoolYearName ,s.ENName as EnSchoolYearName , C.ARName as ArCourseName , C.ENName as EnCourseName ,  C.InTotal , C.MaxGradeSMT MaxGrade
 from Courses C   
left join Results R on C.CourseID = R.CourseID   
left join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
left join Class Cl on C.ClassID = Cl.ClassID   
Inner join ClassRooms CR on Cl.ClassID = CR.ClassID  
Inner Join Students St on CR.ClassRoomID = St.ClassRoomID and   
         R.studentID = St.StudentID  
Where (R.StudentID = @StudentID or R.StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and   
   Cl.ClassID = @ClassId and  
   C.InTotal = 1 and   
   (SecondHalfMidTerm = 1 or SecondHalfMidTerm is null)  
     
Insert INto #CurrentResult    
Select 0,R.StudentID, 0, Sum(IsNUll(R.Grade,0)), '', 0,0,0,0,S.SchoolYearID,'','', N'المجموع',N'Total', 1, Sum(IsNull(C.MaxGradeSMT,0) )  
 from Results R  
Inner join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
Inner Join Courses C on R.CourseID = C.CourseID  
Where (StudentID = @StudentID or StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and   
   C.InTotal = 1 and   
   (SecondHalfMidTerm = 1 or SecondHalfMidTerm is null)     
Group by R.StudentID, S.SchoolYearID  

declare @totalEval nvarchar(50)
select @totaleval = R.Evaluation 
from results R
where (R.StudentID = @StudentID or R.StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and   
   R.CourseID = 1000000 and   
   (SecondHalfMidTerm = 1 or SecondHalfMidTerm is null) 
      

update #currentResult
set Evaluation = @totaleval
where resultid = 0

  
  
insert into #CurrentResult  
Select R.*, S.ARName as ArSchoolYearName ,s.ENName as EnSchoolYearName , C.ARName as ArCourseName , C.ENName as EnCourseName ,  C.InTotal , C.MaxGradeSMT    
 from Courses C   
left join Results R on C.CourseID = R.CourseID   
left join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
left join Class Cl on C.ClassID = Cl.ClassID   
Inner join ClassRooms CR on Cl.ClassID = CR.ClassID  
Inner Join Students St on CR.ClassRoomID = St.ClassRoomID and   
         R.studentID = St.StudentID  
Where (R.StudentID = @StudentID or R.StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and  
   Cl.ClassID = @ClassId and      
   C.InTotal <> 1 and   
   (SecondHalfMidTerm = 1 or SecondHalfMidTerm is null)  
     
     
Select * from #CurrentResult  


GO

alter Procedure GetResultByStudentIDAndSchoolYearSHF @StudentID int,  
               @SchoolYearID int  
as  
Declare @ClassId int   
  
select @ClassId = (Select C.ClassID from Students S   
Inner join ClassRooms Cr on S.ClassRoomID = Cr.ClassRoomID Inner join   
Class C on Cr.ClassID = C.ClassID  
where S.StudentID = @StudentID)  
  
Create Table #CurrentResult  
(  
ResultID int ,  
 StudentID int ,  
 CourseID int ,  
 Grade Decimal,  
 Evaluation nvarchar(50),  
 FirstHalfMidTerm bit,        
 FirstHalfFinal bit,  
 SecondHalfMidTerm bit,  
 SecondHalfFinal bit,  
 SchoolYearID int,  
 ArSchoolYearName Nvarchar(200),  
 EnSchoolYearName Nvarchar(200),  
 ArCourseName Nvarchar(200),  
 EnCourseName Nvarchar(200),  
 InTotal bit,  
 MaxGrade int  
)  
/*Select R.*, S.ARName as ArSchoolYearName ,s.ENName as EnSchoolYearName , C.ARName as ArCourseName , C.ENName as EnCourseName ,  C.InTotal , C.MaxGrade   
 from Results R  
Inner join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
Inner Join Courses C on R.CourseID = C.CourseID  
Where StudentID = @StudentID and   
   R.SchoolYearID = @SchoolYearID  
*/  
Insert into #CurrentResult  
Select R.*, S.ARName as ArSchoolYearName ,s.ENName as EnSchoolYearName , C.ARName as ArCourseName , C.ENName as EnCourseName ,  C.InTotal , C.MaxGradeST MaxGrade  
 from Courses C   
left join Results R on C.CourseID = R.CourseID   
left join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
left join Class Cl on C.ClassID = Cl.ClassID   
Inner join ClassRooms CR on Cl.ClassID = CR.ClassID  
Inner Join Students St on CR.ClassRoomID = St.ClassRoomID and   
         R.studentID = St.StudentID  
Where (R.StudentID = @StudentID or R.StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and   
   Cl.ClassID = @ClassId and  
   C.InTotal = 1 and   
   (SecondHalfFinal = 1 or SecondHalfFinal is null)  
     
Insert INto #CurrentResult    
Select 0,R.StudentID, 0, Sum(IsNUll(R.Grade,0)), '', 0,0,0,0,S.SchoolYearID,'','', N'المجموع',N'Total', 1, Sum(IsNull(C.MaxGradeST,0) )  
 from Results R  
Inner join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
Inner Join Courses C on R.CourseID = C.CourseID  
Where (StudentID = @StudentID or StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and   
   C.InTotal = 1 and   
   (SecondHalfFinal = 1 or SecondHalfFinal is null)     
Group by R.StudentID, S.SchoolYearID  
  
 
 declare @totalEval nvarchar(50)
select @totaleval = R.Evaluation 
from results R
where (R.StudentID = @StudentID or R.StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and   
   R.CourseID = 1000000 and   
   (SecondHalfFinal = 1 or SecondHalfFinal is null)  
      

update #currentResult
set Evaluation = @totaleval
where resultid = 0
 
  
insert into #CurrentResult  
Select R.*, S.ARName as ArSchoolYearName ,s.ENName as EnSchoolYearName , C.ARName as ArCourseName , C.ENName as EnCourseName ,  C.InTotal , C.MaxGradeST   
 from Courses C   
left join Results R on C.CourseID = R.CourseID   
left join SchoolYear S on R.SchoolYearID = S.SchoolYearID  
left join Class Cl on C.ClassID = Cl.ClassID   
Inner join ClassRooms CR on Cl.ClassID = CR.ClassID  
Inner Join Students St on CR.ClassRoomID = St.ClassRoomID and   
         R.studentID = St.StudentID  
Where (R.StudentID = @StudentID or R.StudentID is null) and   
   (R.SchoolYearID = @SchoolYearID or R.SchoolYearID is null) and  
   Cl.ClassID = @ClassId and      
   C.InTotal <> 1 and   
   (SecondHalfFinal = 1 or SecondHalfFinal is null)  
     
     
Select * from #CurrentResult          