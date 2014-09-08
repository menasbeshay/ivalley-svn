
If Exists (select Name 
		   from sysobjects 
		   where name = 'ProfileLike' and
		        xtype = 'U')
Drop Table ProfileLike
Go
Create Table ProfileLike
(
	MemberID int ,
	ProfileMemberID int,
	Primary key (MemberID , ProfileMemberID )
)
Go