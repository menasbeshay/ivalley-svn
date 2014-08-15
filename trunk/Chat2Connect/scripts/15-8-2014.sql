
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proc_MembershipSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proc_MembershipSearch]
GO
CREATE PROCEDURE [proc_MembershipSearch]
(
	@Email VARCHAR(256) = NULL,
	@CreatedDateFrom DATETIME = NULL,
	@CreatedDateTo DATETIME = NULL,
	@RoleName VARCHAR(256) = NULL
)
AS
BEGIN
	SELECT DISTINCT m.Email,u.UserName,m.CreateDate
	FROM aspnet_Membership m
	INNER JOIN aspnet_Users u on m.UserId=u.UserId
	LEFT JOIN aspnet_UsersInRoles ur on ur.UserId=u.UserId
	LEFT JOIN aspnet_Roles r on r.RoleId=ur.RoleId
	
	WHERE (@Email IS NULL OR m.Email=@Email)
	AND (@CreatedDateFrom IS NULL OR CONVERT(date, m.CreateDate)>=@CreatedDateFrom)
	AND (@CreatedDateTo IS NULL OR CONVERT(date, m.CreateDate)<=@CreatedDateTo)
	AND (@RoleName IS NULL OR r.RoleName=@RoleName)
	
	ORDER BY m.CreateDate DESC 
	
END