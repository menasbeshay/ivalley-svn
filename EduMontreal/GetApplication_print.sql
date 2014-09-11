
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetApplication_print' and
		        xtype = 'P')
Drop Procedure GetApplication_print 
Go
Create Procedure GetApplication_print @ApplicationDataID int 
As 
Select A.* , C.CourseName, C.CoursePeriod, L.Langauge, G.GenderType, COB.CountryName, Ciz.CountryName CitizenshipName, COI.CountryName CountryOfIssue, CO.CountryName Country
From ApplicationData A
Left Join Course C on A.SelectedCourseID = C.CourseID
Left join CourseLangauge L on C.CourseLangaugeID = L.CourseLangaugeID
Left Join Gender G on G.GenderID = A.GenderID
Left Join Country COB on A.CountryOfBirthID = COB.CountryID
Left Join Country Ciz on A.CitizenShipID = Ciz.CountryID
Left Join Country COI on A.CountryOfIssueID = COI.CountryID
Left Join Country CO on A.CountryID = CO.CountryID		
Where ApplicationDataId = @ApplicationDataID

