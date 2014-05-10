
USE [chat2connect]
GO
CREATE TABLE [dbo].[RoomMemberBanning](
	[RoomID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[CreatedByMemberID] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_RoomMemberBanning] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC,
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RoomMemberBanning]  WITH CHECK ADD  CONSTRAINT [FK_RoomMemberBanning_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO

ALTER TABLE [dbo].[RoomMemberBanning] CHECK CONSTRAINT [FK_RoomMemberBanning_Member]
GO

ALTER TABLE [dbo].[RoomMemberBanning]  WITH CHECK ADD  CONSTRAINT [FK_RoomMemberBanning_Member1] FOREIGN KEY([CreatedByMemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO

ALTER TABLE [dbo].[RoomMemberBanning] CHECK CONSTRAINT [FK_RoomMemberBanning_Member1]
GO

ALTER TABLE [dbo].[RoomMemberBanning]  WITH CHECK ADD  CONSTRAINT [FK_RoomMemberBanning_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO

ALTER TABLE [dbo].[RoomMemberBanning] CHECK CONSTRAINT [FK_RoomMemberBanning_Room]
GO

ALTER TABLE [dbo].[RoomMemberBanning] ADD  CONSTRAINT [DF_RoomMemberBanning_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  StoredProcedure [proc_RoomMemberBanningLoadByPrimaryKey]    Script Date: 10/5/2014 2:17:00 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberBanningLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberBanningLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_RoomMemberBanningLoadByPrimaryKey]
(
	@RoomID int,
	@MemberID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomID],
		[MemberID],
		[StartDate],
		[EndDate],
		[CreatedByMemberID],
		[CreateDate]
	FROM [RoomMemberBanning]
	WHERE
		([RoomID] = @RoomID) AND
		([MemberID] = @MemberID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomMemberBanningLoadAll]    Script Date: 10/5/2014 2:17:00 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberBanningLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberBanningLoadAll];
GO

CREATE PROCEDURE [proc_RoomMemberBanningLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoomID],
		[MemberID],
		[StartDate],
		[EndDate],
		[CreatedByMemberID],
		[CreateDate]
	FROM [RoomMemberBanning]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomMemberBanningUpdate]    Script Date: 10/5/2014 2:17:00 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberBanningUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberBanningUpdate];
GO

CREATE PROCEDURE [proc_RoomMemberBanningUpdate]
(
	@RoomID int,
	@MemberID int,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@CreatedByMemberID int = NULL,
	@CreateDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [RoomMemberBanning]
	SET
		[StartDate] = @StartDate,
		[EndDate] = @EndDate,
		[CreatedByMemberID] = @CreatedByMemberID,
		[CreateDate] = @CreateDate
	WHERE
		[RoomID] = @RoomID
	AND	[MemberID] = @MemberID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_RoomMemberBanningInsert]    Script Date: 10/5/2014 2:17:00 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberBanningInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberBanningInsert];
GO

CREATE PROCEDURE [proc_RoomMemberBanningInsert]
(
	@RoomID int,
	@MemberID int,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@CreatedByMemberID int = NULL,
	@CreateDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [RoomMemberBanning]
	(
		[RoomID],
		[MemberID],
		[StartDate],
		[EndDate],
		[CreatedByMemberID],
		[CreateDate]
	)
	VALUES
	(
		@RoomID,
		@MemberID,
		@StartDate,
		@EndDate,
		@CreatedByMemberID,
		@CreateDate
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_RoomMemberBanningDelete]    Script Date: 10/5/2014 2:17:00 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_RoomMemberBanningDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_RoomMemberBanningDelete];
GO

CREATE PROCEDURE [proc_RoomMemberBanningDelete]
(
	@RoomID int,
	@MemberID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [RoomMemberBanning]
	WHERE
		[RoomID] = @RoomID AND
		[MemberID] = @MemberID
	SET @Err = @@Error

	RETURN @Err
END
GO

