
If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchPilot' and
		        xtype = 'P')
Drop Procedure SearchPilot
Go
Create Procedure SearchPilot @filterText nvarchar(200)  
as  
  
select *   
from Pilot   
where UserName like N'%' + @filterText + N'%' or   
   FirstName like N'%' + @filterText + N'%' or
   SecondName like N'%' + @filterText + N'%'  or
   SureName like N'%' + @filterText + N'%'   