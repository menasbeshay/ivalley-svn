CREATE PROCEDURE proc_StatsReport
(
@StartDate DATETIME=NULL,
@EndDate DATETIME=NULL
)

AS

SELECT [Title]='Members'
	,[Value]=Count(*)
	FROM aspnet_Membership
	WHERE (@StartDate IS NULL OR aspnet_Membership.CreateDate>=@StartDate)
	AND (@EndDate IS NULL Or aspnet_Membership.CreateDate<=@EndDate)
UNION ALL
SELECT [Title]='Rooms'
	,[Value]=Count(*)
	FROM Room
	WHERE (@StartDate IS NULL OR Room.CreatedDate>=@StartDate)
	AND (@EndDate IS NULL Or Room.CreatedDate<=@EndDate)
UNION ALL
SELECT [Title]='TypedRooms'
	,[Value]=Count(*)
	FROM Room
	WHERE (@StartDate IS NULL OR Room.CreatedDate>=@StartDate)
	AND (@EndDate IS NULL Or Room.CreatedDate<=@EndDate)
	AND Room.RoomTypeID IS NOT NULL
UNION ALL
SELECT [Title]='TypedMembers'
	,[Value]=Count(*)
	FROM aspnet_Membership inner join Member on aspnet_Membership.UserId=Member.UserID
	WHERE (@StartDate IS NULL OR aspnet_Membership.CreateDate>=@StartDate)
	AND (@EndDate IS NULL Or aspnet_Membership.CreateDate<=@EndDate)
	AND Member.MemberTypeID IS NOT NULL
UNION ALL
SELECT [Title]='MembersOnline'
	,[Value]=Count(*)
	FROM Member
	WHERE Member.IsOnLine=1
UNION ALL
SELECT [Title]='Messages'
	,[Value]=Count(*)
	FROM MemberMessage
	WHERE (@StartDate IS NULL OR MemberMessage.SendDate>=@StartDate)
	AND (@EndDate IS NULL Or MemberMessage.SendDate<=@EndDate)
	
	
