
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAdminUserByUserNameAndPassword' and
		        xtype = 'P')
Drop Procedure GetAdminUserByUserNameAndPassword
Go
Create Procedure GetAdminUserByUserNameAndPassword @UserName nvarchar(50),
												   @Password nvarchar(50)

as

Select * from AdminUsers 
Where UserName = @UserName and 
	  UserPassword = @Password

GO




If Exists (select Name 
		   from sysobjects 
		   where name = 'GetUserByUserNameAndPassword' and
		        xtype = 'P')
Drop Procedure GetUserByUserNameAndPassword
Go
Create Procedure GetUserByUserNameAndPassword @UserName nvarchar(50),
											  @Password nvarchar(50)

as

Select * from SiteUsers
Where UserName = @UserName and 
	  UserPassword = @Password

GO


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetUserByEmail' and
		        xtype = 'P')
Drop Procedure GetUserByEmail
Go
Create Procedure GetUserByEmail @Email nvarchar(150)
as

Select * from SiteUsers
Where Email = @Email 

GO


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetRequesetsByUserID' and
		        xtype = 'P')
Drop Procedure GetRequesetsByUserID
Go
Create Procedure GetRequesetsByUserID @UserID int

as

Select * from UserRequests
Where SiteUserID = @UserID

GO

