Alter Procedure [dbo].[GetNotCompletedApplications]       
as      
      
select * from student   
Where Student.StudentID not in (select ApplicationData.StudentID from ApplicationData  ) and 
	Email <> 'Admin' 
Order by FirstName     