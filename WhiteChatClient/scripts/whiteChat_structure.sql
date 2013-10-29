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
		   where name = 'SubCategory' and
		        xtype = 'U')
Drop Table SubCategory
Go
Create Table SubCategory
(
	SubCategoryID int not null
			identity(1,1)
			Primary Key,
	CategoryID int not null
			foreign Key references Category(CategoryID),	
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
	CategoryID int null
			foreign Key references Category(CategoryID),
	SubCategoryID int null
			foreign Key references SubCategory(SubCategoryID)
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


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetChatRoomsByCategoryID' and
		        xtype = 'P')
Drop Procedure GetChatRoomsByCategoryID
Go
Create Procedure GetChatRoomsByCategoryID @CategoryID int
as

select CR.* 
from ChatRoom CR
Inner JOIN Category C ON CR.CategoryID = C.CategoryID
where C.CategoryID = @CategoryID
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetSubCategoryByCategoryID' and
		        xtype = 'P')
Drop Procedure GetSubCategoryByCategoryID
Go
Create Procedure GetSubCategoryByCategoryID @CategoryID int
as

select CR.* 
from SubCategory CR
Inner JOIN Category C ON CR.CategoryID = C.CategoryID
where C.CategoryID = @CategoryID
Go




If Exists (select Name 
		   from sysobjects 
		   where name = 'GetChatRoomsBySubCategoryID' and
		        xtype = 'P')
Drop Procedure GetChatRoomsBySubCategoryID
Go
Create Procedure GetChatRoomsBySubCategoryID @SubCategoryID int
as

select CR.* 
from ChatRoom CR
Inner JOIN SubCategory C ON CR.SubCategoryID = C.SubCategoryID
where C.SubCategoryID = @SubCategoryID
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMembersByChatRoomID' and
		        xtype = 'P')
Drop Procedure GetMembersByChatRoomID
Go
Create Procedure GetMembersByChatRoomID @ChatRoomID int
as

select M.* 
from Member M
Inner JOIN ChatRoom CR ON CR.ChatRoomID = M.ChatRoomID
where CR.ChatRoomID = @ChatRoomID
Go

