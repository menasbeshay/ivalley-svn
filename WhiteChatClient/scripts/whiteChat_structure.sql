use master 
create database WhiteChat_db
Go

Use WhiteChat_db
If Exists (select Name 
		   from sysobjects 
		   where name = 'Category' and
		        xtype = 'U')
Drop Table Category
Go
Create Table Category
(
	CategoryID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'ChatRoom' and
		        xtype = 'U')
Drop Table ChatRoom
Go
Create Table ChatRoom
(
	ChatRoomID int not null
			identity(1,1)
			Primary Key,
	Name Nvarchar(200),			
	CategoryID int not null
			foreign Key references Category(CategoryID)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'Member' and
		        xtype = 'U')
Drop Table Member
Go
Create Table Member
(
	MemberID nvarchar(200),
	ChatRoomID int not null
			foreign Key references ChatRoom(ChatRoomID),
	Primary key (MemberID, ChatRoomID)
)
Go

