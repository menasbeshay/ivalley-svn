alter table ApplicationStatusHistory
add WireTranseferReceipt nvarchar(300)


If Exists (select Name 
		   from sysobjects 
		   where name = 'TextItems' and
		        xtype = 'U')
Drop Table TextItems
Go
Create Table TextItems
(
	TextItemsID int not null
			identity(1,1)
			Primary Key,
	EnName Nvarchar(200),
	ItemType smallint
)
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'AdminAttachment' and
		        xtype = 'U')
Drop Table AdminAttachment
Go
Create Table AdminAttachment
(
	AdminAttachmentID int not null
			identity(1,1)
			Primary Key,
	ApplicationDataID int,
	ApplicationStatusID int,
	AttachmentPath nvarchar(200)
)
Go