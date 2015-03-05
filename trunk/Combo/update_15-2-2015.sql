
If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchForFriends' and
		        xtype = 'P')
Drop Procedure SearchForFriends
Go
Create Procedure SearchForFriends @UserID int, 
								  @FilterText nvarchar(200) = ''
as

Select CU.*, A.Path ProfilePic from ComboUserFriend CF
Inner Join ComboUser CU on CF.ComboFriendID = CU.ComboUserID and 
                            (CU.IsDeactivated <> 1 or CU.IsDeactivated is null)
Left join Attachment A on CU.ProfileImgID = A.AttachmentID
where CF.ComboUserID = @UserID and CF.RequestApproved = 1 and (cf.isBanned = 1 or cf.isbanned is null) 
	  and CU.Username like '%'  + @FilterText +  '%'
union 
Select CU.*, A.Path ProfilePic from ComboUserFriend CF
Inner Join ComboUser CU on CF.ComboUserID = CU.ComboUserID and 
                            (CU.IsDeactivated <> 1 or CU.IsDeactivated is null)
Left join Attachment A on CU.ProfileImgID = A.AttachmentID
where CF.ComboFriendID = @UserID and CF.RequestApproved = 1 and (cf.isBanned = 1 or cf.isbanned is null)  
	  and CU.Username like '%'  + @FilterText +  '%'
union
Select CU.*, A.Path ProfilePic from ProfileFollower PF
Inner Join ComboUser CU on PF.ComboFollowerID = CU.ComboUserID and
                            (CU.IsDeactivated <> 1 or CU.IsDeactivated is null)
Left join Attachment A on CU.ProfileImgID = A.AttachmentID
Where PF.ComboUserID = @UserID and CU.Username like '%'  + @FilterText +  '%'
union
Select CU.*, A.Path ProfilePic from ProfileFollower PF
Inner Join ComboUser CU on PF.ComboUserID = CU.ComboUserID and
                            (CU.IsDeactivated <> 1 or CU.IsDeactivated is null)
Left join Attachment A on CU.ProfileImgID = A.AttachmentID
Where PF.ComboFollowerID = @UserID and CU.Username like '%'  + @FilterText +  '%'
union 
Select CU.*, A.Path ProfilePic from ComboUser CU                                                                                    
Left join Attachment A on CU.ProfileImgID = A.AttachmentID
where CU.Username like '%'  + @FilterText +  '%' and (CU.IsDeactivated <> 1 or CU.IsDeactivated is null)
order by Username asc



Go 

Alter table combouser
add SecurityQuestion nvarchar(200),
	SecurityAnswer nvarchar(200)
	
	
	

If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchOnFriends' and
		        xtype = 'P')
Drop Procedure SearchOnFriends
Go
Create Procedure SearchOnFriends @UserID int, 
								  @FilterText nvarchar(200) = ''
as

Select CU.*, A.Path ProfilePic from ComboUserFriend CF
Inner Join ComboUser CU on CF.ComboFriendID = CU.ComboUserID and 
                            (CU.IsDeactivated <> 1 or CU.IsDeactivated is null)
Left join Attachment A on CU.ProfileImgID = A.AttachmentID
where CF.ComboUserID = @UserID and CF.RequestApproved = 1 and (cf.isBanned = 1 or cf.isbanned is null) 
	  and CU.Username like '%'  + @FilterText +  '%'
union 
Select CU.*, A.Path ProfilePic from ComboUserFriend CF
Inner Join ComboUser CU on CF.ComboUserID = CU.ComboUserID and 
                            (CU.IsDeactivated <> 1 or CU.IsDeactivated is null)
Left join Attachment A on CU.ProfileImgID = A.AttachmentID
where CF.ComboFriendID = @UserID and CF.RequestApproved = 1 and (cf.isBanned = 1 or cf.isbanned is null)  
	  and CU.Username like '%'  + @FilterText +  '%'

Go	 





If Exists (select Name 
		   from sysobjects 
		   where name = 'UserRank' and
		        xtype = 'U')
Drop Table UserRank
Go
Create Table UserRank
(
	UserRankID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	IconPath nvarchar(200)
)
Go 



Alter table combouser
add --UserRankID int foreign key references UserRank(UserRankID),
	BirthDate Datetime, 
	Country nvarchar(100),
	Phone nvarchar(20),
	Website nvarchar(200)

alter table comboComment
add IsDeleted bit	




If Exists (select Name 
		   from sysobjects 
		   where name = 'ComboCommentReport' and
		        xtype = 'U')
Drop Table ComboCommentReport
Go
Create Table ComboCommentReport
(
	ComboCommentReportID int not null
			identity(1,1)
			Primary Key,	
	ComboUserID int foreign key references ComboUser(ComboUserID),
	ComboCommentID int foreign key references ComboComment(ComboCommentID),
	ReportText Nvarchar(200),
	ReportDate DateTime
)
Go 		
		



If Exists (select Name 
		   from sysobjects 
		   where name = 'ProfileLiker' and
		        xtype = 'U')
Drop Table ProfileLiker
Go
Create Table ProfileLiker
(
	ComboUserID int, 
	ComboLikerID int,
	Primary key(comboUserID, ComboLikerID)
)
Go 

		
If Exists (select Name 
		   from sysobjects 
		   where name = 'Country' and
		        xtype = 'U')
Drop Table Country
Go
Create Table Country
(
	CountryID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	IconPath nvarchar(200)
)
Go 

alter table ComboUser
add CountryID int foreign key references Country(CountryID),
	Location Nvarchar(100)


If Exists (select Name 
		   from sysobjects 
		   where name = 'UserActivityLog' and
		        xtype = 'U')
Drop Table UserActivityLog
Go
Create Table UserActivityLog
(
	UserActivityLogID int not null
			identity(1,1)
			Primary Key,	
	Date DateTime,
	ComboUserID int foreign key references ComboUser(ComboUserID),
	DaysToDiscount int,
	CONSTRAINT User_Activity_index UNIQUE (Date, ComboUserID)
)
Go 
		
