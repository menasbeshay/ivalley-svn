If Exists (select Name 
		   from sysobjects 
		   where name = 'IssueType' and
		        xtype = 'U')
Drop Table IssueType
Go
Create Table IssueType
(
	IssueTypeID int not null
			identity(1,1)
			Primary Key,
	TypeName nvarchar(100)	
)
Go

/********************/
If Exists (select Name 
		   from sysobjects 
		   where name = 'Network' and
		        xtype = 'U')
Drop Table Network
Go
Create Table Network
(
	NetworkID int not null
			identity(1,1)
			Primary Key,
	NetworkName nvarchar(100)	
)
Go
/******************/
If Exists (select Name 
		   from sysobjects 
		   where name = 'Status' and
		        xtype = 'U')
Drop Table [Status]
Go
Create Table [Status]
(
	StatusID int not null
			identity(1,1)
			Primary Key,
	StatusName nvarchar(100)	
)
Go
/******************/
If Exists (select Name 
		   from sysobjects 
		   where name = 'Priority' and
		        xtype = 'U')
Drop Table Priority
Go
Create Table Priority
(
	PriorityID int not null
			identity(1,1)
			Primary Key,
	PriorityName nvarchar(100)	
)
Go
/******************/


If Exists (select Name 
		   from sysobjects 
		   where name = 'Troubleshooting' and
		        xtype = 'U')
Drop Table Troubleshooting
Go
Create Table Troubleshooting
(
	TroubleshootingID int not null
			identity(1,1)
			Primary Key,
	GovID smallint Foreign Key References dbo.GOVERNORATE(CD),
	CivilID smallint Foreign Key References dbo.CIVIL_OFFICE(CD),
	HealthOfficeID int Foreign Key References dbo.Health_Office(HealthCD),
	[Date] DateTime,
	[Time] DateTime,
	IssueTypeID int Foreign Key References dbo.IssueType (IssueTypeID),
	MachineGovID smallint Foreign Key References dbo.GOVERNORATE(CD),
	MachineCivilID smallint Foreign Key References dbo.CIVIL_OFFICE(CD),
	MachineHealthOfficeID int Foreign Key References dbo.Health_Office(HealthCD),
	NetworkID int Foreign Key References dbo.Network (NetworkID),
	StatusID int Foreign Key References dbo.[Status] (StatusID),
	PriorityID int Foreign Key References dbo.Priority (PriorityID),
	Telephone nvarchar(20),
	Mobile nvarchar(20),
	USBSerial nvarchar(100),
	UserID uniqueIdentifier Foreign Key References dbo.OrgUser (UserID),
	[Description] nvarchar(3000) 
)
Go


/******************************************************************/
/* IssueType Procedures */

/** Create Stored Procedures **/


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.GetIssueTypes') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.GetIssueTypes
GO
create procedure dbo.GetIssueTypes

as

select IssueTypeID,						
	   TypeName 
from IssueType 

GO


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.GetIssueType') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.GetIssueType
GO
create procedure dbo.GetIssueType
        @IssueTypeID int
as
select IssueTypeID,						
	   TypeName 
from IssueType 

Where IssueTypeID = @IssueTypeID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'dbo.AddIssueType') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.AddIssueType
GO
create procedure dbo.AddIssueType

	@Name nvarchar(100)
as

insert into IssueType (
	TypeName
) 
values (
	@Name
)

GO


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.UpdateIssueType') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.UpdateIssueType
GO
create procedure dbo.UpdateIssueType

	@IssueTypeID int,
	@Name nvarchar(100)

as

update IssueType
set    TypeName       = @Name
where  IssueTypeID = @IssueTypeID


GO



if exists (select * from dbo.sysobjects where id = object_id(N'dbo.DeleteIssueType') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.DeleteIssueType
GO
create procedure dbo.DeleteIssueType
@IssueTypeID int
as

delete
from  IssueType
where  IssueTypeID = @IssueTypeID

GO
/* IssueType Procedures*/ 



/* Network Procedures */

/** Create Stored Procedures **/


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.GetNetworks') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.GetNetworks
GO
create procedure dbo.GetNetworks

as

select NetworkID,						
	   NetworkName 
from Network 

GO


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.GetNetwork') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.GetNetwork
GO
create procedure dbo.GetNetwork
        @NetworkID int
as
select NetworkID,						
	   NetworkName 
from Network 

Where NetworkID = @NetworkID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'dbo.AddNetwork') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.AddNetwork
GO
create procedure dbo.AddNetwork

	@Name nvarchar(100)
as

insert into Network (
	NetworkName
) 
values (
	@Name
)

GO


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.UpdateNetwork') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.UpdateNetwork
GO
create procedure dbo.UpdateNetwork

	@NetworkID int,
	@Name nvarchar(100)

as

update Network
set    NetworkName       = @Name
where  NetworkID = @NetworkID


GO



if exists (select * from dbo.sysobjects where id = object_id(N'dbo.DeleteNetwork') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.DeleteNetwork
GO
create procedure dbo.DeleteNetwork
@NetworkID int
as

delete
from  Network
where  NetworkID = @NetworkID

GO
/* Network Procedures*/ 


/* Status Procedures */

/** Create Stored Procedures **/


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.GetStatuses') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.GetStatuses
GO
create procedure dbo.GetStatuses

as

select StatusID,						
	   StatusName 
from Status 

GO


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.GetStatus') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.GetStatus
GO
create procedure dbo.GetStatus
        @StatusID int
as
select StatusID,						
	   StatusName 
from Status 

Where StatusID = @StatusID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'dbo.AddStatus') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.AddStatus
GO
create procedure dbo.AddStatus

	@Name nvarchar(100)
as

insert into Status (
	StatusName
) 
values (
	@Name
)

GO


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.UpdateStatus') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.UpdateStatus
GO
create procedure dbo.UpdateStatus

	@StatusID int,
	@Name nvarchar(100)

as

update Status
set    StatusName       = @Name
where  StatusID = @StatusID


GO



if exists (select * from dbo.sysobjects where id = object_id(N'dbo.DeleteStatus') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.DeleteStatus
GO
create procedure dbo.DeleteStatus
@StatusID int
as

delete
from  Status
where  StatusID = @StatusID

GO
/* Status Procedures*/ 


/* Priority Procedures */

/** Create Stored Procedures **/


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.GetPrioritys') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.GetPrioritys
GO
create procedure dbo.GetPrioritys

as

select PriorityID,						
	   PriorityName 
from Priority 

GO


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.GetPriority') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.GetPriority
GO
create procedure dbo.GetPriority
        @PriorityID int
as
select PriorityID,						
	   PriorityName 
from Priority 

Where PriorityID = @PriorityID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'dbo.AddPriority') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.AddPriority
GO
create procedure dbo.AddPriority

	@Name nvarchar(100)
as

insert into Priority (
	PriorityName
) 
values (
	@Name
)

GO


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.UpdatePriority') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.UpdatePriority
GO
create procedure dbo.UpdatePriority

	@PriorityID int,
	@Name nvarchar(100)

as

update Priority
set    PriorityName       = @Name
where  PriorityID = @PriorityID


GO



if exists (select * from dbo.sysobjects where id = object_id(N'dbo.DeletePriority') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.DeletePriority
GO
create procedure dbo.DeletePriority
@PriorityID int
as

delete
from  Priority
where  PriorityID = @PriorityID

GO
/* Priority Procedures*/ 

/* Troubleshooting Procedures */

/** Create Stored Procedures **/


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.GetTroubleshootings') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.GetTroubleshootings
GO
create procedure dbo.GetTroubleshootings

as

select TroubleshootingID ,
		T.GovID ,
		G1.DESCR as GovName,
		T.CivilID ,
		C1.CD as CivilName,
		T.HealthOfficeID ,
		F1.HEALTHDESCR as HealthOfficeName,
		[Date] ,
		[Time] ,
		T.IssueTypeID ,
		I1.TypeName as IssueTypeName,
		MachineGovID,
		G2.DESCR as MachineGovName,
		MachineCivilID ,
		C2.DESCR as MachineCivilName,
		MachineHealthOfficeID,
		F2.HEALTHDESCR as MachineHealthOfficeName,
		T.NetworkID ,
		NetworkName,
		T.StatusID ,
		StatusName,
		T.PriorityID ,
		PriorityName,
		Telephone,
		Mobile ,
		USBSerial ,
		T.UserID ,
		Description,
		LTrim(RTRIM(FirstName)) + ' ' + LTRIM(Rtrim(FatherName)) as UserName
from Troubleshooting T
Left Join GOVERNORATE G1 On T.GovID = G1.CD 
Left Join CIVIL_OFFICE C1 On T.CivilID = C1.CD 
Left Join Health_Office F1 On T.HealthOfficeID = F1.HEALTHCD 
Left Join IssueType I1 On T.IssueTypeID = I1.IssueTypeID 
Left Join GOVERNORATE G2 On T.MachineGovID = G2.CD 
Left Join CIVIL_OFFICE C2 On T.MachineCivilID = C2.CD 
Left Join Health_Office F2 On T.MachineHealthOfficeID = F2.HEALTHCD 
Left Join Network N On T.NetworkID= N.NetworkID
Left Join Status S On T.StatusID= S.StatusID
Left Join Priority P On T.PriorityID= P.PriorityID
Left Join OrgUser U On T.UserID= U.UserId
Order by Date Desc,Time Desc
GO


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.GetTroubleshooting') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.GetTroubleshooting
GO
create procedure dbo.GetTroubleshooting
        @TroubleshootingID int
as
select TroubleshootingID ,
		T.GovID ,
		G1.DESCR as GovName,
		T.CivilID ,
		C1.CD as CivilName,
		T.HealthOfficeID ,
		F1.HEALTHDESCR as HealthOfficeName,
		[Date] ,
		[Time] ,
		T.IssueTypeID ,
		I1.TypeName as IssueTypeName,
		MachineGovID,
		G2.DESCR as MachineGovName,
		MachineCivilID ,
		C2.DESCR as MachineCivilName,
		MachineHealthOfficeID,
		F2.HEALTHDESCR as MachineHealthOfficeName,
		T.NetworkID ,
		NetworkName,
		T.StatusID ,
		StatusName,
		T.PriorityID ,
		PriorityName,
		Telephone,
		Mobile ,
		USBSerial ,
		T.UserID ,
		Description,
		LTrim(RTRIM(FirstName)) + ' ' + LTRIM(Rtrim(FatherName)) as UserName
from Troubleshooting T
Left Join GOVERNORATE G1 On T.GovID = G1.CD 
Left Join CIVIL_OFFICE C1 On T.CivilID = C1.CD 
Left Join Health_Office F1 On T.HealthOfficeID = F1.HEALTHCD 
Left Join IssueType I1 On T.IssueTypeID = I1.IssueTypeID 
Left Join GOVERNORATE G2 On T.MachineGovID = G2.CD 
Left Join CIVIL_OFFICE C2 On T.MachineCivilID = C2.CD 
Left Join Health_Office F2 On T.MachineHealthOfficeID = F2.HEALTHCD 
Left Join Network N On T.NetworkID= N.NetworkID
Left Join Status S On T.StatusID= S.StatusID
Left Join Priority P On T.PriorityID= P.PriorityID
Left Join OrgUser U On T.UserID= U.UserId

Where TroubleshootingID = @TroubleshootingID
order by [DATE]  desc
GO

if exists (select * from dbo.sysobjects where id = object_id(N'dbo.AddTroubleshooting') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.AddTroubleshooting
GO
create procedure dbo.AddTroubleshooting
    @GovID smallint,
	@CivilID smallint ,
	@HealthOfficeID int ,
	@Date DateTime,
	@Time DateTime,
	@IssueTypeID int ,
	@MachineGovID smallint ,
	@MachineCivilID smallint ,
	@MachineHealthOfficeID int ,
	@NetworkID int ,
	/*@StatusID int ,*/
	@PriorityID int ,
	@Telephone nvarchar(20),
	@Mobile nvarchar(20),
	@USBSerial nvarchar(100),
	@UserID uniqueIdentifier,
	@Description nvarchar(3000)
as

insert into Troubleshooting (
	    GovID ,
		CivilID ,
		HealthOfficeID ,
		[Date] ,
		[Time] ,
		IssueTypeID ,
		MachineGovID,
		MachineCivilID ,
		MachineHealthOfficeID,
		NetworkID ,
		/*StatusID ,*/
		PriorityID ,
		Telephone,
		Mobile ,
		USBSerial ,
		UserID ,
		[Description]
) 
values (
	@GovID ,
	@CivilID  ,
	@HealthOfficeID  ,
	@Date ,
	@Time ,
	@IssueTypeID  ,
	@MachineGovID  ,
	@MachineCivilID  ,
	@MachineHealthOfficeID  ,
	@NetworkID  ,
	/*@StatusID  ,*/
	@PriorityID  ,
	@Telephone ,
	@Mobile ,
	@USBSerial ,
	@UserID ,
	@Description
)

GO


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.UpdateTroubleshooting') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.UpdateTroubleshooting
GO
create procedure dbo.UpdateTroubleshooting

	@TroubleshootingID int,
	@GovID smallint,
	@CivilID smallint ,
	@HealthOfficeID int ,
	@Date DateTime,
	@Time DateTime,
	@IssueTypeID int ,
	@MachineGovID smallint ,
	@MachineCivilID smallint ,
	@MachineHealthOfficeID int ,
	@NetworkID int ,
	@StatusID int ,
	@PriorityID int ,
	@Telephone nvarchar(20),
	@Mobile nvarchar(20),
	@USBSerial nvarchar(100),
	@UserID uniqueIdentifier,
	@Description nvarchar(3000)

as

update Troubleshooting
set GovID = @GovID ,
	CivilID =@CivilID ,
	HealthOfficeID = @HealthOfficeID,
	[Date] =@Date,
	[Time] =@Time,
	IssueTypeID  =@IssueTypeID,
	MachineGovID  =@MachineGovID,
	MachineCivilID = @MachineCivilID,
	MachineHealthOfficeID  =@MachineHealthOfficeID,
	NetworkID  =@NetworkID,
	StatusID  =@StatusID,
	PriorityID =@PriorityID ,
	Telephone =@Telephone,
	Mobile =@Mobile,
	USBSerial =@USBSerial,
	UserID =@UserID,
	[Description]= @Description
where  TroubleshootingID = @TroubleshootingID


GO



if exists (select * from dbo.sysobjects where id = object_id(N'dbo.DeleteTroubleshooting') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.DeleteTroubleshooting
GO
create procedure dbo.DeleteTroubleshooting
@TroubleshootingID int
as

delete
from  Troubleshooting
where  TroubleshootingID = @TroubleshootingID

GO


if exists (select * from dbo.sysobjects where id = object_id(N'dbo.GetTroubleshootingsByUser') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure dbo.GetTroubleshootingsByUser
GO
create procedure dbo.GetTroubleshootingsByUser
@UserID uniqueidentifier
as

select TroubleshootingID ,
		T.GovID ,
		G1.DESCR as GovName,
		T.CivilID ,
		C1.CD as CivilName,
		T.HealthOfficeID ,
		F1.HEALTHDESCR as HealthOfficeName,
		[Date] ,
		[Time] ,
		T.IssueTypeID ,
		I1.TypeName as IssueTypeName,
		MachineGovID,
		G2.DESCR as MachineGovName,
		MachineCivilID ,
		C2.DESCR as MachineCivilName,
		MachineHealthOfficeID,
		F2.HEALTHDESCR as MachineHealthOfficeName,
		T.NetworkID ,
		NetworkName,
		T.StatusID ,
		StatusName,
		T.PriorityID ,
		PriorityName,
		Telephone,
		Mobile ,
		USBSerial ,
		T.UserID ,
		Description,
		LTrim(RTRIM(FirstName)) + ' ' + LTRIM(Rtrim(FatherName)) as UserName
from Troubleshooting T
Left Join GOVERNORATE G1 On T.GovID = G1.CD 
Left Join CIVIL_OFFICE C1 On T.CivilID = C1.CD 
Left Join Health_Office F1 On T.HealthOfficeID = F1.HEALTHCD 
Left Join IssueType I1 On T.IssueTypeID = I1.IssueTypeID 
Left Join GOVERNORATE G2 On T.MachineGovID = G2.CD 
Left Join CIVIL_OFFICE C2 On T.MachineCivilID = C2.CD 
Left Join Health_Office F2 On T.MachineHealthOfficeID = F2.HEALTHCD 
Left Join Network N On T.NetworkID= N.NetworkID
Left Join Status S On T.StatusID= S.StatusID
Left Join Priority P On T.PriorityID= P.PriorityID
Left Join OrgUser U On T.UserID= U.UserId
Where T.UserID = @UserID
Order by Date Desc

GO

/* Troubleshooting Procedures*/ 