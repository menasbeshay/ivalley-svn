use master 
create database Combo_db
Go

Use Combo_db
If Exists (select Name 
		   from sysobjects 
		   where name = 'AttachmentType' and
		        xtype = 'U')
Drop Table AttachmentType
Go
Create Table AttachmentType
(
	AttachmentTypeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	IconPath nvarchar(200)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Gender' and
		        xtype = 'U')
Drop Table Gender
Go
Create Table Gender
(
	GenderID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'ExternalIDType' and
		        xtype = 'U')
Drop Table ExternalIDType
Go
Create Table ExternalIDType
(
	ExternalIDTypeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'AttachmentType' and
		        xtype = 'U')
Drop Table AttachmentType
Go
Create Table AttachmentType
(
	AttachmentTypeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'Attachment' and
		        xtype = 'U')
Drop Table Attachment
Go
Create Table Attachment
(
	AttachmentID int not null
			identity(1,1)
			Primary Key,	
	Path Nvarchar(2000),
	AttachmentTypeID int foreign key references AttachmentType(AttachmentTypeID)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'ComboUser' and
		        xtype = 'U')
Drop Table ComboUser
Go
Create Table ComboUser
(
	ComboUserID int not null
			identity(1,1)			
			Primary Key,	
	UserName Nvarchar(200),
	DisplayName Nvarchar(200),
	Password Nvarchar(200),
	Email Nvarchar(200),
	ProfileImgID int foreign key references Attachment(AttachmentID),
	CoverImgID int foreign key references Attachment(AttachmentID),
	GenderID int foreign key references Gender(GenderID),
	Bio nvarchar(max),
	IsActivated bit,
	ActivationCode uniqueIdentifier, 
	ExternalID nvarchar(200),
	ExternalIDType int foreign key references ExternalIDType(ExternalIDTypeID),
	DeviceID nvarchar(200),
	PassResetCode uniqueIdentifier
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'ProfileFollower' and
		        xtype = 'U')
Drop Table ProfileFollower
Go
Create Table ProfileFollower
(		
	ComboUserID int foreign key references ComboUser(ComboUserID) not null,
	ComboFollowerID int foreign key references ComboUser(ComboUserID) not null,
	Primary key (ComboUserID,ComboFollowerID)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'ComboPost' and
		        xtype = 'U')
Drop Table ComboPost
Go
Create Table ComboPost
(
	ComboPostID int not null
			identity(1,1)			
			Primary Key,	
	ComboUserID int foreign key references ComboUser(ComboUserID),
	PostText Nvarchar(max),
	PostDate DateTime,
	IsDeleted bit
)
Go

alter table ComboPost
add IsDeleted bit


If Exists (select Name 
		   from sysobjects 
		   where name = 'ComboPostAttachment' and
		        xtype = 'U')
Drop Table ComboPostAttachment
Go
Create Table ComboPostAttachment
(
	ComboPostAttachmentID int not null
			identity(1,1)			
			Primary Key,	
	ComboPostID int foreign key references ComboPost(ComboPostID),
	AttachmentID int foreign key references Attachment(AttachmentID)
)
Go

alter table ComboPostAttachment
add constraint ComboPostAttachment_uniqueIndex unique (ComboPostID, AttachmentID)


If Exists (select Name 
		   from sysobjects 
		   where name = 'ComboPostLike' and
		        xtype = 'U')
Drop Table ComboPostLike
Go
Create Table ComboPostLike
(		
	ComboUserID int foreign key references ComboUser(ComboUserID) not null,
	ComboPostID int foreign key references ComboPost(ComboPostID) not null,
	Primary key (ComboUserID,ComboPostID)
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'ComboComment' and
		        xtype = 'U')
Drop Table ComboComment
Go
Create Table ComboComment
(
	ComboCommentID int not null
			identity(1,1)			
			Primary Key,	
	ComboUserID int foreign key references ComboUser(ComboUserID),
	ComboPostID int foreign key references ComboPost(ComboPostID),
	CommentText Nvarchar(max),
	CommentDate DateTime
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'ComboCommentAttachment' and
		        xtype = 'U')
Drop Table ComboCommentAttachment
Go
Create Table ComboCommentAttachment
(
	ComboCommentAttachmentID int not null
			identity(1,1)			
			Primary Key,	
	ComboCommnetID int foreign key references ComboComment(ComboCommentID),
	AttachmentID int foreign key references Attachment(AttachmentID)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'ComboCommentLike' and
		        xtype = 'U')
Drop Table ComboCommentLike
Go
Create Table ComboCommentLike
(		
	ComboUserID int foreign key references ComboUser(ComboUserID) not null,
	ComboCommentID int foreign key references ComboComment(ComboCommentID) not null,
	Primary key (ComboUserID,ComboCommentID)
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetUserByUserNameAndPassword' and
		        xtype = 'P')
Drop Procedure GetUserByUserNameAndPassword
Go
Create Procedure GetUserByUserNameAndPassword @UserName nvarchar(200),
											  @Password nvarchar(200)	
as

select * 
from ComboUser
where (UserName = @UserName Or Email = @UserName) and 
	  Password = @Password
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetUserByUserName' and
		        xtype = 'P')
Drop Procedure GetUserByUserName
Go
Create Procedure GetUserByUserName @UserName nvarchar(200)	
as

select * 
from ComboUser
where (UserName = @UserName Or Email = @UserName) 
Go

Alter table combousersettings
add ReceisveNotificationType smallint


If Exists (select Name 
		   from sysobjects 
		   where name = 'NotificationType' and
		        xtype = 'U')
Drop Table NotificationType
Go
Create Table NotificationType
(
	NotificationTypeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'NotificationUserSettings' and
		        xtype = 'U')
Drop Table NotificationUserSettings
Go
Create Table NotificationUserSettings
(
	ComboUserID int foreign key references ComboUser(ComboUserID) not null,
	NotificationTypeID int foreign key references NotificationType(NotificationTypeID) not null,
	Status smallint,
	Primary key (ComboUserID,NotificationTypeID)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'ComboPostFav' and
		        xtype = 'U')
Drop Table ComboPostFav
Go
Create Table ComboPostFav
(		
	ComboUserID int foreign key references ComboUser(ComboUserID) not null,
	ComboPostID int foreign key references ComboPost(ComboPostID) not null,
	Primary key (ComboUserID,ComboPostID)
)
Go




If Exists (select Name 
		   from sysobjects 
		   where name = 'BlockedUser' and
		        xtype = 'U')
Drop Table BlockedUser
Go
Create Table BlockedUser
(		
	ComboUserID int foreign key references ComboUser(ComboUserID) not null,
	BlockedUserID int foreign key references ComboUser(ComboUserID) not null,
	Primary key (ComboUserID,BlockedUserID)
)
Go