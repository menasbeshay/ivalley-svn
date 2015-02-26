
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
add UserRankID int foreign key references UserRank(UserRankID)
		
		
		

If Exists (select Name 
		   from sysobjects 
		   where name = 'PilotNightCity' and
		        xtype = 'U')
Drop Table PilotNightCity
Go
Create Table PilotNightCity
(
	PilotNightCityID int not null
			identity(1,1)
			Primary Key,	
	AirportID int foreign key references airport(airportid),
	PilotID int foreign key references Pilot(PilotID),
	CityDate DateTime,
	CONSTRAINT Pilot_City_index UNIQUE(PilotID,AirportID,CityDate)
)
Go 	


If Exists (select Name 
		   from sysobjects 
		   where name = 'CrewNightCity' and
		        xtype = 'U')
Drop Table CrewNightCity
Go
Create Table CrewNightCity
(
	CrewNightCityID int not null
			identity(1,1)
			Primary Key,	
	AirportID int foreign key references airport(airportid),
	CrewID int foreign key references Crew(CrewID),
	CityDate DateTime,
	CONSTRAINT Crew_City_index UNIQUE(CrewID,AirportID,CityDate)
)
Go 		