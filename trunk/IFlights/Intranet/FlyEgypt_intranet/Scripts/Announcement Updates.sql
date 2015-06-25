alter table Announcement 
Add UploadedFile nvarchar(500)

alter table Announcement
Add GroupID int Foreign key REFERENCES Groups(GroupID) 


