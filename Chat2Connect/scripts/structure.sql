use master 
create database Chat2Connect_db
Go

Use Chat2Connect_db
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
	Name Nvarchar(200),
	IconPath nvarchar(200)
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
	Name Nvarchar(200),
	IconPath nvarchar(200)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'RoomType' and
		        xtype = 'U')
Drop Table RoomType
Go
Create Table RoomType
(
	RoomTypeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	IconPath nvarchar(200),
	Price_Money decimal(8,4),
	Price_Point int,
	Color nvarchar(7)
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'MemberType' and
		        xtype = 'U')
Drop Table MemberType
Go
Create Table MemberType
(
	MemberTypeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	IconPath nvarchar(200),
	Price_Money decimal(8,4),
	Price_Point int,
	Color nvarchar(7)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'AdminType' and
		        xtype = 'U')
Drop Table AdminType
Go
Create Table AdminType
(
	AdminTypeID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'Gift' and
		        xtype = 'U')
Drop Table Gift
Go
Create Table Gift
(
	GiftID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	Price_Point int,
	PicPath nvarchar(200)
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'Bot' and
		        xtype = 'U')
Drop Table Bot
Go
Create Table Bot
(
	BotID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200),
	Price_Point int,
	Price_Money decimal(8,4),
	Period int, /* months */
	PicPath nvarchar(200),
	WelcomeMsg bit,
	WelcomeMsgText nvarchar(1000),
	ByeMsg bit,
	ByeMsgText nvarchar(1000),
	DisableRepeat bit,
	DisableLinks bit,
	RoomLaw nvarchar(max),
	Poetry nvarchar(max),
	Qoutes nvarchar(max),
	ReligionAlerts nvarchar(max),
	Ads nvarchar(max),
	Voting nvarchar(max),
	AbuseWords nvarchar(max),
	MarkMembers bit
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'Religion' and
		        xtype = 'U')
Drop Table Religion
Go
Create Table Religion
(
	ReligionID int not null
			identity(1,1)
			Primary Key,	
	Name Nvarchar(200)
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
	Name Nvarchar(200)
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
	MemberID int not null
			identity(1,1)
			Primary Key,
	UserID uniqueidentifier foreign key references aspnet_Users(UserId),
	IsOnLine bit,
	Name Nvarchar(200),
	Credit_Point int,
	Credit_Money decimal(8,4),
	PicPath nvarchar(200),
	MemberTypeID int foreign key references MemberType(MemberTypeID),
	BirthDate DateTime, 
	ReligionID int foreign key references Religion(ReligionID) ,
	CountryID int foreign key references Country(CountryID),
	JobTitle nvarchar(200),
	Interests nvarchar(1000),
	BestTeam nvarchar(1000),
	BestFood nvarchar(1000),
	BestCar nvarchar(1000),
	BestCounrty nvarchar(1000),
	MoreData nvarchar(max),
	MemberStatus nvarchar(200),
	MemberTypeExpiryDate DateTime,
	ProfilePic nvarchar(200),
	likeCount int,
	StatusMsg nvarchar(100),
	Answer nvarchar(100),
	Religion nvarchar(50),
	fbURL nvarchar(400),
	tURL nvarchar(400),
	ytURL nvarchar(400),
	[Status] int
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'MemberSetting' and
		        xtype = 'U')
Drop Table MemberSetting
Go
Create Table MemberSetting
(
	MemberSettingID int not null
			identity(1,1)
			Primary Key,
	MemberID int foreign key references Member(MemberID),
	HidePics bit,
	HideRoomPics bit,
	HideProfile bit,
	NotifyOnPrivateChat bit,
	NotifyOnFriendsOnOff bit,
	NotifyOnFriendChangeStatus bit,
	NotifyOnGetMsg bit,
	NotifyOnVoiceMail bit,
	SearchMeByMail bit,
	VoiceNotfication bit,
	/* 1 :  from friends / else all  */
	AcceptPM bit,
	AcceptSMS bit,
	AcceptMSG bit,
	AcceptVoiceMail bit,
	AcceptFiles bit,
	AcceptInvitations bit,
	ChangeMyStatus bit,
	/* time in min */
	ChangeMyStatusMin int
)

If Exists (select Name 
		   from sysobjects 
		   where name = 'Room' and
		        xtype = 'U')
Drop Table Room
Go
Create Table Room
(
	RoomID int not null
			identity(1,1)
			Primary Key,
	CategoryID int null
			foreign Key references Category(CategoryID),
	SubCategoryID int null
			foreign Key references SubCategory(SubCategoryID),	
	Name Nvarchar(200),
	IconPath nvarchar(200),
	RoomTypeID int foreign key references RoomType(RoomTypeID),
	CreatedDate DateTime,
	WelcomeText nvarchar(max),
	RoomPassword nvarchar(50),
	RoomPasswordenabled bit,
	EnableCam bit,
	EnableMic bit,
	EnableOneMic bit,
	EnableTwoMic bit,
	EnableThreeMic bit,
	RoomAdminPassword nvarchar(50)
	EnableMicForAdminsOnly bit,
	MarkOnLoginWithWrite bit,
	MarkOnLoginWithoutWrite bit,	
	CreatedBy int not null
			foreign Key references Member(MemberID)
	
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'RoomBot' and
		        xtype = 'U')
Drop Table RoomBot
Go
Create Table RoomBot
(
	BotID int not null
			foreign Key references Bot(BotID),
	RoomID int not null
			foreign Key references Room(RoomID),	
	primary key(BotID,RoomID),
	ExpiryDate DateTime			
	
)
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'RoomMember' and
		        xtype = 'U')
Drop Table RoomMember
Go
Create Table RoomMember
(
	MemberID int not null
			foreign Key references Member(MemberID),
	RoomID int not null
			foreign Key references Room(RoomID),	
	primary key(MemberID,RoomID),
	IsAdmin bit,
	AdminTypeID int foreign key references AdminType(AdminTypeID),
	HasMic bit,
	HasCam bit,
	CanAccessMic bit,
	CanAccessCam bit,
	CanWrite bit,
	IsBanned bit,
	IsBannedFor24 bit,
	IsBannedFor7Days bit,
	IsBannedForMonth bit,
	IsMarked bit,
	AskForMic bit,
	QueueOrder int
	
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'FavRoom' and
		        xtype = 'U')
Drop Table FavRoom
Go
Create Table FavRoom
(
	MemberID int not null
			foreign Key references Member(MemberID),
	RoomID int not null
			foreign Key references Room(RoomID),	
	primary key(MemberID,RoomID)
)
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'RoomMemberSetting' and
		        xtype = 'U')
Drop Table RoomMemberSetting
Go
Create Table RoomMemberSetting
(
	RoomID int foreign key references Room(RoomID),
	MemberID int foreign key references Member(MemberID),
	primary key(RoomID, MemberID),		
	NotifyOnFriendsLogOn bit,
	NotifyOnFriendsLogOff bit,
	NotifyOnMicOn bit,
	NotifyOnMicOff bit,
	NotifyOnOpenCam bit,
	NotifyOnCloseCam bit	
)



If Exists (select Name 
		   from sysobjects 
		   where name = 'MemberGift' and
		        xtype = 'U')
Drop Table MemberGift
Go
Create Table MemberGift
(
	MemberGiftID int not null identity(1,1) primary key,
	MemberID int foreign key references Member(MemberID),
	GiftID int foreign key references Gift(GiftID),
	SenderID int foreign key references Member(MemberID),
	SendDate DateTime
)



If Exists (select Name 
		   from sysobjects 
		   where name = 'MessageFolder' and
		        xtype = 'U')
Drop Table MessageFolder
Go
Create Table MessageFolder
(
	MessageFolderID int not null identity(1,1) primary key,
	MemberID int foreign key references Member(MemberID),
	Name nvarchar(200)
)



If Exists (select Name 
		   from sysobjects 
		   where name = 'MemberMessage' and
		        xtype = 'U')
Drop Table MemberMessage
Go
Create Table MemberMessage
(
	MemberMessageID int not null identity(1,1) primary key,
	MemberID int foreign key references Member(MemberID),
	MessageFolderID int foreign key references MessageFolder(MessageFolderID),
	SenderID int foreign key references Member(MemberID),
	SendDate DateTime,
	MessageSubject nvarchar(3000),
	MessageContent nvarchar(max),
	IsDeleted bit
)


If Exists (select Name 
		   from sysobjects 
		   where name = 'FriendGroup' and
		        xtype = 'U')
Drop Table FriendGroup
Go
Create Table FriendGroup
(
	FriendGroupID int not null identity(1,1) primary key,
	MemberID int foreign key references Member(MemberID),
	Name nvarchar(200)
)



If Exists (select Name 
		   from sysobjects 
		   where name = 'MemberFriend' and
		        xtype = 'U')
Drop Table MemberFriend
Go
Create Table MemberFriend
(
	MemberFriendID int not null identity(1,1) primary key,
	MemberID int foreign key references Member(MemberID),
	FriendID int foreign key references Member(MemberID),
	FriendGroupID int foreign key references FriendGroup(FriendGroupID)	
)



If Exists (select Name 
		   from sysobjects 
		   where name = 'MemberPic' and
		        xtype = 'U')
Drop Table MemberPic
Go
Create Table MemberPic
(
	MemberPicID int not null identity(1,1) primary key,
	MemberID int foreign key references Member(MemberID),
	Description nvarchar(200)
)


If Exists (select Name 
		   from sysobjects 
		   where name = 'UserTransLog' and
		        xtype = 'U')
Drop Table UserTransLog
Go
Create Table UserTransLog
(
	UserTransLogID int not null
			identity(1,1)
			Primary Key,	
	MemberID int foreign key references Member(MemberID),
	TransDate DateTime,
	TransType smallint , -- 1 add / 2 minus 
	AddedBy nvarchar(100),
	PaymentMethod nvarchar(100),
	Value decimal(10,4),
	Notes nvarchar(1000),
	AddedFrom int foreign key references Member(MemberID),
	AddedTo int foreign key references Member(MemberID)
)
Go


/*
 procedures 
*/



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetChatRoomsByCategoryID' and
		        xtype = 'P')
Drop Procedure GetChatRoomsByCategoryID
Go
Create Procedure GetChatRoomsByCategoryID @CategoryID int
as

select R.* , count(RM.MemberID) MemberCount
from Room R
Inner JOIN Category C ON R.CategoryID = C.CategoryID
Left Join RoomMember RM on RM.RoomID = R.RoomID
Left join Member M on M.MemberID = RM.MemberID
where R.CategoryID = @CategoryID /*and 
	  M.IsOnline = 1*/
Group By  R.RoomID,  R.CategoryID,  R.SubCategoryID,  R.Name,  R.IconPath,  R.RoomTypeID,  R.CreatedDate,  R.WelcomeText,  R.RoomPassword,  R.RoomPasswordenabled,  R.EnableCam,  R.EnableMic,  R.EnableMicForAdminsOnly,  R.MarkOnLoginWithWrite,  R.MarkOnLoginWithoutWrite,  R.CreatedBy,  R.EnableOneMic,  R.EnableTwoMic,  R.EnableThreeMic,  R.RoomAdminPassword, R.RowStatusID, R.OpenCams
order by R.RoomTypeID Desc , R.Name Asc
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

select R.* , count(RM.MemberID) MemberCount
from Room R
Inner JOIN Category C ON R.CategoryID = C.CategoryID
Inner Join SubCategory SC on C.CategoryID = SC.CategoryID
Left Join RoomMember RM on RM.RoomID = R.RoomID
Left join Member M on M.MemberID = RM.MemberID
where R.SubCategoryID = @SubCategoryID /*and 
	  M.IsOnline = 1*/
Group By  R.RoomID,  R.CategoryID,  R.SubCategoryID,  R.Name,  R.IconPath,  R.RoomTypeID,  R.CreatedDate,  R.WelcomeText,  R.RoomPassword,  R.RoomPasswordenabled,  R.EnableCam,  R.EnableMic,  R.EnableMicForAdminsOnly,  R.MarkOnLoginWithWrite,  R.MarkOnLoginWithoutWrite,  R.CreatedBy,  R.EnableOneMic,  R.EnableTwoMic,  R.EnableThreeMic,  R.RoomAdminPassword, R.RowStatusID, R.OpenCams
order by R.RoomTypeID Desc , R.Name Asc
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetChatRoomsByCreatorID' and
		        xtype = 'P')
Drop Procedure GetChatRoomsByCreatorID
Go
Create Procedure GetChatRoomsByCreatorID @CreatedBy int
as

select R.* , C.Name CategoryName , SC.Name SubCategoryName
from Room R
Left JOIN Category C ON R.CategoryID = C.CategoryID
Left JOIN SubCategory SC ON R.SubCategoryID = SC.SubCategoryID
where R.CreatedBy = @CreatedBy 
order by R.RoomTypeID Desc , R.Name Asc
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetOnlineMembersByRoomID' and
		        xtype = 'P')
Drop Procedure GetOnlineMembersByRoomID
Go
Create Procedure GetOnlineMembersByRoomID @RoomID int
as

select RM.* , M.*
from RoomMember RM
Inner Join Member M on RM.MemberId = M.MemberID
where RM.RoomID = @RoomID and 
	  M.IsOnline = 1
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMembersByRoomID' and
		        xtype = 'P')
Drop Procedure GetAllMembersByRoomID
Go
Create Procedure GetAllMembersByRoomID @RoomID int
as

select RM.* , M.*
from RoomMember RM
Inner Join Member M on RM.MemberId = M.MemberID
where RM.RoomID = @RoomID 
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMembersByRoomIDNoQueue' and
		        xtype = 'P')
Drop Procedure GetAllMembersByRoomIDNoQueue
Go
Create Procedure GetAllMembersByRoomIDNoQueue @RoomID int
as

select RM.* , M.*
from RoomMember RM
Inner Join Member M on RM.MemberId = M.MemberID
where RM.RoomID = @RoomID And 
	  RM.QueueOrder is null and 
	  M.IsOnline = 1
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMembersByRoomIDQueue' and
		        xtype = 'P')
Drop Procedure GetAllMembersByRoomIDQueue
Go
Create Procedure GetAllMembersByRoomIDQueue @RoomID int
as

select RM.* , M.*
from RoomMember RM
Inner Join Member M on RM.MemberId = M.MemberID
where RM.RoomID = @RoomID And 
	  RM.QueueOrder is not null and 
	  M.IsOnline = 1
order by RM.QueueOrder	  
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMemberFriendsByStatus' and
		        xtype = 'P')
Drop Procedure GetMemberFriendsByStatus
Go
Create Procedure GetMemberFriendsByStatus @MemberID int ,
										  @Status bit
as
If (@Status = 1)
begin
select F.*
from MemberFriend MF
Inner Join Member M on MF.MemberID = M.MemberID 
Inner Join Member F on MF.FriendID = F.MemberID 
where M.MemberID = @MemberID and 
	  F.IsOnline = @Status
End
else 
begin 
select F.*
from MemberFriend MF
Inner Join Member M on MF.MemberID = M.MemberID 
Inner Join Member F on MF.FriendID = F.MemberID 
where M.MemberID = @MemberID and 
	  (F.IsOnline = @Status or F.Isonline is null or F.Isonline = 0 )
end 
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMemberByUserId' and
		        xtype = 'P')
Drop Procedure GetMemberByUserId
Go
Create Procedure GetMemberByUserId @UserId UniqueIdentifier
as

select * from Member M 
where M.UserID = @UserId
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMemberSettingsByMemberID' and
		        xtype = 'P')
Drop Procedure GetMemberSettingsByMemberID
Go
Create Procedure GetMemberSettingsByMemberID @MemberID int
as

select MS.* , M.*
from MemberSetting MS
Inner Join Member M on MS.MemberId = M.MemberID
where M.MemberID = @MemberID 
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchMembers' and
		        xtype = 'P')
Drop Procedure SearchMembers
Go
Create Procedure SearchMembers @query nvarchar(50)
as

select * 
from Member M 
where M.Name like N'%' + @query + N'%'
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchMembersExceptFriends' and
		        xtype = 'P')
Drop Procedure SearchMembersExceptFriends
Go
Create Procedure SearchMembersExceptFriends @query nvarchar(50),
											@MemberID int
as

select * 
from Member M 
where M.Name like N'%' + @query + N'%'
	  and MemberID <> @MemberID
	  and M.MemberID not in (Select FriendID
							 from MemberFriend where MemberID = @MemberID)
							 
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllAdminMembersByRoomID' and
		        xtype = 'P')
Drop Procedure GetAllAdminMembersByRoomID
Go
Create Procedure GetAllAdminMembersByRoomID @RoomID int
as

select RM.* , M.*
from RoomMember RM
Inner Join Member M on RM.MemberId = M.MemberID
where RM.RoomID = @RoomID and 
	  RM.IsAdmin = 1
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMemberFriends' and
		        xtype = 'P')
Drop Procedure GetAllMemberFriends
Go
Create Procedure GetAllMemberFriends @MemberID int 
as
select MF.*, I.Name MemberName
from MemberFriend MF
Inner Join Member M on MF.MemberID = M.MemberID 
Inner Join Member I on MF.FriendID = I.MemberID 
where M.MemberID = @MemberID 

Go

exec GetAllMemberFriends 5

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMemberFriendsAndMember' and
		        xtype = 'P')
Drop Procedure GetAllMemberFriendsAndMember
Go
Create Procedure GetAllMemberFriendsAndMember @MemberID int 
as

Select 0 MemberFriendID, M.MemberID , M.MemberID FriendID, 0 FriendGroupID, M.Name MemberName
From Member M
Where M.MemberId = @MemberID

Union 

select MF.*, I.Name MemberName
from MemberFriend MF
Inner Join Member M on MF.MemberID = M.MemberID 
Inner Join Member I on MF.FriendID = I.MemberID 
where M.MemberID = @MemberID 

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetFavRoomsByMemberID' and
		        xtype = 'P')
Drop Procedure GetFavRoomsByMemberID
Go
Create Procedure GetFavRoomsByMemberID @MemberID int 
as
select R.*
from Room R 
Inner Join FavRoom F on R.RoomID = F.RoomID 
Inner Join Member M on F.MemberID = M.MemberID 
where M.MemberID = @MemberID 

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllRoomsByMemberID' and
		        xtype = 'P')
Drop Procedure GetAllRoomsByMemberID
Go
Create Procedure GetAllRoomsByMemberID @MemberID int
as

select RM.* , M.*
from RoomMember RM
Inner Join Member M on RM.MemberId = M.MemberID
where RM.MemberID = @MemberID
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMaxQueueOrderByRoomID' and
		        xtype = 'P')
Drop Procedure GetMaxQueueOrderByRoomID
Go
Create Procedure GetMaxQueueOrderByRoomID @RoomID int
as

select IsNull(max(RM.QueueOrder),0) MaxQueueOrder
from RoomMember RM
where RM.RoomID = @RoomID 
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMessagesBySenderID_Sent' and
		        xtype = 'P')
Drop Procedure GetMessagesBySenderID_Sent
Go
Create Procedure GetMessagesBySenderID_Sent @MemberID int
as

Select * 
from MemberMessage
where SenderID = @MemberID And 
	  (IsDeleted is null Or IsDeleted <> 1)
Order by SendDate desc

Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMessagesByMemberID_Received' and
		        xtype = 'P')
Drop Procedure GetMessagesByMemberID_Received
Go
Create Procedure GetMessagesByMemberID_Received @MemberID int
as

Select * 
from MemberMessage
where MemberID = @MemberID And 
	  (IsDeleted is null Or IsDeleted <> 1)
Order by SendDate desc
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMessagesByMemberID_Deleted' and
		        xtype = 'P')
Drop Procedure GetMessagesByMemberID_Deleted
Go
Create Procedure GetMessagesByMemberID_Deleted @MemberID int
as

Select * 
from MemberMessage
where MemberID = @MemberID And 
	  IsDeleted = 1
Order by SendDate desc
Go



If Exists (select Name 
		   from sysobjects 
		   where name = 'GetFavRoomsByCreatorID' and
		        xtype = 'P')
Drop Procedure GetFavRoomsByCreatorID
Go
Create Procedure GetFavRoomsByCreatorID @CreatedBy int
as

select R.* , C.Name CategoryName , SC.Name SubCategoryName
from Room R
Left JOIN Category C ON R.CategoryID = C.CategoryID
Left JOIN SubCategory SC ON R.SubCategoryID = SC.SubCategoryID
Inner Join FavRoom F on F.RoomID = R.RoomID 
where F.MemberID = @CreatedBy
order by R.RoomTypeID Desc , R.Name Asc
Go


exec GetFavRoomsByCreatorID 5