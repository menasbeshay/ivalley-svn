alter Procedure GetAllApplications     
as    
    
select AD.* , C.CourseName, CL.Langauge,     
(Select Top 1 S.Status from ApplicationStatusHistory SH Inner join ApplicationStatus S on SH.ApplicationStatusID = S.ApplicationStatusID where SH.ApplicationDataID = AD.ApplicationDataID Order by StatusDate desc) LastStatusName ,     
(Select Top 1 StatusDate    from ApplicationStatusHistory SH where SH.ApplicationDataID = AD.ApplicationDataID Order by StatusDate desc) LastStatusDate     
from ApplicationData AD     
Inner Join Course C on AD.SelectedCourseID = C.CourseID    
Inner Join  CourseLangauge CL on C.CourseLangaugeID = CL.CourseLangaugeID   
--where AD.IsSubmit = 1   
Order by LastStatusDate desc    