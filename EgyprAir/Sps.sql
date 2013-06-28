
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotsByTrainingID' and
		        xtype = 'P')
Drop Procedure GetPilotsByTrainingID
Go
Create Procedure GetPilotsByTrainingID @TrainingID int
as

select P.* 
from Pilot P 
Inner JOIN Training.PilotCourse PC ON P.PilotID = PC.PilotID
where TrainingID = @TrainingID
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotTitlesByPilotID' and
		        xtype = 'P')
Drop Procedure GetPilotTitlesByPilotID
Go
Create Procedure GetPilotTitlesByPilotID @PilotID int
as

select T.* 
from Title T 
Inner JOIN PilotTitle PT ON T.TitleID = PT.TitleID
where PT.PilotID = @PilotID
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPilotCoursesByPilotID' and
		        xtype = 'P')
Drop Procedure GetPilotCoursesByPilotID
Go
Create Procedure GetPilotCoursesByPilotID @PilotID int
as
/*
declare @PilotID int 
select @PilotID = 40
*/
/* Approved trainings - In progress courses */
select PC.* , C.* , '1' as Approved 
from Training.Training T 
Inner JOIN Training.PilotCourse PC ON T.TrainingID = PC.TrainingID
Inner JOIN Training.Course C ON PC.CourseID = C.CourseID
where PC.PilotID = @PilotID and 
	  T.IsApproved = 1

Union 	  

/* Un-Approved trainings - not started courses */
select PC.* , C.* , '2' as Approved 
from Training.Training T 
Inner JOIN Training.PilotCourse PC ON T.TrainingID = PC.TrainingID
Inner JOIN Training.Course C ON PC.CourseID = C.CourseID
where PC.PilotID = @PilotID and 
	  (IsApproved <> 1 Or  IsApproved IS null)

Union 


/* Title courses  */
select '' PilotCourseID, TC.CourseID, PilotID, '' PilotTitleID, '' TrainerID, '' TrainerTitleID , '' ExaminerID, '' TrainingID , '' StartDate, '' EndDate, '' TravelDate, '' BackDate, '' ExpiryDate, '' Result, '' Notes , C.* , '3' as Approved
from Training.TitleCourse TC 
Inner JOIN PilotTitle PT ON PT.TitleID = TC.TitleID
Inner JOIN Training.Course C ON TC.CourseID = C.CourseID
where PT.PilotID = @PilotID	  
	  
order BY Approved	  
	  
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetTitleCoursesByTitleID' and
		        xtype = 'P')
Drop Procedure GetTitleCoursesByTitleID
Go
Create Procedure GetTitleCoursesByTitleID @TitleID int
as

select * 
from Training.TitleCourse T 
Inner JOIN Training.Course C ON T.CourseID = C.CourseID
where T.TitleID = @TitleID
Go
