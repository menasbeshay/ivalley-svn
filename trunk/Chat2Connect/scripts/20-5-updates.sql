
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMembersByRoomIDNoQueue' and
		        xtype = 'P')
Drop Procedure GetAllMembersByRoomIDNoQueue
Go
Create Procedure GetAllMembersByRoomIDNoQueue @RoomID int
as

select RM.MemberID, RM.RoomID, Isnull(RM.IsAdmin,0) IsAdmin, RM.AdminTypeID, RM.HasMic, RM.HasCam, RM.CanAccessMic, RM.CanAccessCam, RM.CanWrite, RM.IsBanned, RM.IsBannedFor24, RM.IsBannedFor7Days, RM.IsBannedForMonth, RM.IsMarked, RM.AskForMic, RM.QueueOrder, RM.UserRate, RM.InRoom , M.*
from RoomMember RM
Inner Join Member M on RM.MemberId = M.MemberID
where RM.RoomID = @RoomID And 
	  RM.QueueOrder is null and 
	  M.IsOnline = 1 and 
	  Rm.InRoom = 1
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllMembersByRoomIDQueue' and
		        xtype = 'P')
Drop Procedure GetAllMembersByRoomIDQueue
Go
Create Procedure GetAllMembersByRoomIDQueue @RoomID int
as

select RM.MemberID, RM.RoomID, Isnull(RM.IsAdmin,0) IsAdmin, RM.AdminTypeID, RM.HasMic, RM.HasCam, RM.CanAccessMic, RM.CanAccessCam, RM.CanWrite, RM.IsBanned, RM.IsBannedFor24, RM.IsBannedFor7Days, RM.IsBannedForMonth, RM.IsMarked, RM.AskForMic, RM.QueueOrder, RM.UserRate, RM.InRoom , M.*
from RoomMember RM
Inner Join Member M on RM.MemberId = M.MemberID
where RM.RoomID = @RoomID And 
	  RM.QueueOrder is not null and 
	  M.IsOnline = 1 and 
	  Rm.InRoom = 1
order by RM.QueueOrder	  
Go


Alter Table Room 
Add RoomTopic nvarchar(500)


/****** Object:  StoredProcedure [proc_RoomLoadByPrimaryKey]    Script Date: 5/20/2014 4:16:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomLoadByPrimaryKey]
(
	@RoomID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomID],
		[CategoryID],
		[SubCategoryID],
		[Name],
		[IconPath],
		[CreatedDate],
		[WelcomeText],
		[RoomPassword],
		[RoomPasswordenabled],
		[EnableCam],
		[EnableMic],
		[EnableMicForAdminsOnly],
		[MarkOnLoginWithWrite],
		[MarkOnLoginWithoutWrite],
		[CreatedBy],
		[EnableOneMic],
		[EnableTwoMic],
		[EnableThreeMic],
		[RoomAdminPassword],
		[RowStatusID],
		[OpenCams],
		[RoomTopic]
	FROM [Room]
	WHERE
		([RoomID] = @RoomID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomLoadAll]    Script Date: 5/20/2014 4:16:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomLoadAll];
GO

CREATE PROCEDURE [proc_RoomLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomID],
		[CategoryID],
		[SubCategoryID],
		[Name],
		[IconPath],
		[CreatedDate],
		[WelcomeText],
		[RoomPassword],
		[RoomPasswordenabled],
		[EnableCam],
		[EnableMic],
		[EnableMicForAdminsOnly],
		[MarkOnLoginWithWrite],
		[MarkOnLoginWithoutWrite],
		[CreatedBy],
		[EnableOneMic],
		[EnableTwoMic],
		[EnableThreeMic],
		[RoomAdminPassword],
		[RowStatusID],
		[OpenCams],
		[RoomTopic]
	FROM [Room]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomLoadAll Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomUpdate]    Script Date: 5/20/2014 4:16:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomUpdate];
GO

CREATE PROCEDURE [proc_RoomUpdate]
(
	@RoomID int,
	@CategoryID int = NULL,
	@SubCategoryID int = NULL,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL,
	@CreatedDate datetime = NULL,
	@WelcomeText nvarchar(MAX) = NULL,
	@RoomPassword nvarchar(50) = NULL,
	@RoomPasswordenabled bit = NULL,
	@EnableCam bit = NULL,
	@EnableMic bit = NULL,
	@EnableMicForAdminsOnly bit = NULL,
	@MarkOnLoginWithWrite bit = NULL,
	@MarkOnLoginWithoutWrite bit = NULL,
	@CreatedBy int = NULL,
	@EnableOneMic bit = NULL,
	@EnableTwoMic bit = NULL,
	@EnableThreeMic bit = NULL,
	@RoomAdminPassword nvarchar(50) = NULL,
	@RowStatusID tinyint,
	@OpenCams smallint = NULL,
	@RoomTopic nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Room]
	SET
		[CategoryID] = @CategoryID,
		[SubCategoryID] = @SubCategoryID,
		[Name] = @Name,
		[IconPath] = @IconPath,
		[CreatedDate] = @CreatedDate,
		[WelcomeText] = @WelcomeText,
		[RoomPassword] = @RoomPassword,
		[RoomPasswordenabled] = @RoomPasswordenabled,
		[EnableCam] = @EnableCam,
		[EnableMic] = @EnableMic,
		[EnableMicForAdminsOnly] = @EnableMicForAdminsOnly,
		[MarkOnLoginWithWrite] = @MarkOnLoginWithWrite,
		[MarkOnLoginWithoutWrite] = @MarkOnLoginWithoutWrite,
		[CreatedBy] = @CreatedBy,
		[EnableOneMic] = @EnableOneMic,
		[EnableTwoMic] = @EnableTwoMic,
		[EnableThreeMic] = @EnableThreeMic,
		[RoomAdminPassword] = @RoomAdminPassword,
		[RowStatusID] = @RowStatusID,
		[OpenCams] = @OpenCams,
		[RoomTopic] = @RoomTopic
	WHERE
		[RoomID] = @RoomID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomUpdate Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [proc_RoomInsert]    Script Date: 5/20/2014 4:16:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomInsert];
GO

CREATE PROCEDURE [proc_RoomInsert]
(
	@RoomID int = NULL output,
	@CategoryID int = NULL,
	@SubCategoryID int = NULL,
	@Name nvarchar(200) = NULL,
	@IconPath nvarchar(200) = NULL,
	@CreatedDate datetime = NULL,
	@WelcomeText nvarchar(MAX) = NULL,
	@RoomPassword nvarchar(50) = NULL,
	@RoomPasswordenabled bit = NULL,
	@EnableCam bit = NULL,
	@EnableMic bit = NULL,
	@EnableMicForAdminsOnly bit = NULL,
	@MarkOnLoginWithWrite bit = NULL,
	@MarkOnLoginWithoutWrite bit = NULL,
	@CreatedBy int = NULL,
	@EnableOneMic bit = NULL,
	@EnableTwoMic bit = NULL,
	@EnableThreeMic bit = NULL,
	@RoomAdminPassword nvarchar(50) = NULL,
	@RowStatusID tinyint,
	@OpenCams smallint = NULL,
	@RoomTopic nvarchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Room]
	(
		[CategoryID],
		[SubCategoryID],
		[Name],
		[IconPath],
		[CreatedDate],
		[WelcomeText],
		[RoomPassword],
		[RoomPasswordenabled],
		[EnableCam],
		[EnableMic],
		[EnableMicForAdminsOnly],
		[MarkOnLoginWithWrite],
		[MarkOnLoginWithoutWrite],
		[CreatedBy],
		[EnableOneMic],
		[EnableTwoMic],
		[EnableThreeMic],
		[RoomAdminPassword],
		[RowStatusID],
		[OpenCams],
		[RoomTopic]
	)
	VALUES
	(
		@CategoryID,
		@SubCategoryID,
		@Name,
		@IconPath,
		@CreatedDate,
		@WelcomeText,
		@RoomPassword,
		@RoomPasswordenabled,
		@EnableCam,
		@EnableMic,
		@EnableMicForAdminsOnly,
		@MarkOnLoginWithWrite,
		@MarkOnLoginWithoutWrite,
		@CreatedBy,
		@EnableOneMic,
		@EnableTwoMic,
		@EnableThreeMic,
		@RoomAdminPassword,
		@RowStatusID,
		@OpenCams,
		@RoomTopic
	)

	SET @Err = @@Error

	SELECT @RoomID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_RoomDelete]    Script Date: 5/20/2014 4:16:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomDelete];
GO

CREATE PROCEDURE [proc_RoomDelete]
(
	@RoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Room]
	WHERE
		[RoomID] = @RoomID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_RoomDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_RoomDelete Error on Creation'
GO


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
Group By  R.RoomID,  R.CategoryID,  R.SubCategoryID,  R.Name,  R.IconPath,  R.CreatedDate,  R.WelcomeText,  R.RoomPassword,  R.RoomPasswordenabled,  R.EnableCam,  R.EnableMic,  R.EnableMicForAdminsOnly,  R.MarkOnLoginWithWrite,  R.MarkOnLoginWithoutWrite,  R.CreatedBy,  R.EnableOneMic,  R.EnableTwoMic,  R.EnableThreeMic,  R.RoomAdminPassword, R.RowStatusID, R.OpenCams, R.RoomTopic
order by  R.Name Asc
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
Group By  R.RoomID,  R.CategoryID,  R.SubCategoryID,  R.Name,  R.IconPath,  R.CreatedDate,  R.WelcomeText,  R.RoomPassword,  R.RoomPasswordenabled,  R.EnableCam,  R.EnableMic,  R.EnableMicForAdminsOnly,  R.MarkOnLoginWithWrite,  R.MarkOnLoginWithoutWrite,  R.CreatedBy,  R.EnableOneMic,  R.EnableTwoMic,  R.EnableThreeMic,  R.RoomAdminPassword, R.RowStatusID, R.OpenCams, R.RoomTopic
order by R.Name Asc
Go