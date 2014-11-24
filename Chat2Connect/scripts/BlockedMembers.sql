/****** Object:  Table [dbo].[BlockedMembers]    Script Date: 11/24/2014 21:37:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BlockedMembers]') AND type in (N'U'))
DROP TABLE [dbo].[BlockedMembers]
GO

CREATE TABLE [dbo].[BlockedMembers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[BlockID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BlockedMembers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[BlockedMembers]  WITH CHECK ADD  CONSTRAINT [FK_BlockedMembers_BlockedMembers] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO

ALTER TABLE [dbo].[BlockedMembers] CHECK CONSTRAINT [FK_BlockedMembers_BlockedMembers]
GO

ALTER TABLE [dbo].[BlockedMembers]  WITH CHECK ADD  CONSTRAINT [FK_BlockedMembers_Member] FOREIGN KEY([BlockID])
REFERENCES [dbo].[Member] ([MemberID])
GO

ALTER TABLE [dbo].[BlockedMembers] CHECK CONSTRAINT [FK_BlockedMembers_Member]
GO

ALTER TABLE [dbo].[BlockedMembers] ADD  CONSTRAINT [DF_BlockedMembers_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

/****** Object:  StoredProcedure [proc_BlockedMembersLoadByPrimaryKey]    Script Date: 24/11/2014 9:40:41 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BlockedMembersLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BlockedMembersLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_BlockedMembersLoadByPrimaryKey]
(
	@ID bigint
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberID],
		[BlockID],
		[CreateDate]
	FROM [BlockedMembers]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_BlockedMembersLoadAll]    Script Date: 24/11/2014 9:40:41 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BlockedMembersLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BlockedMembersLoadAll];
GO

CREATE PROCEDURE [proc_BlockedMembersLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[MemberID],
		[BlockID],
		[CreateDate]
	FROM [BlockedMembers]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_BlockedMembersUpdate]    Script Date: 24/11/2014 9:40:41 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BlockedMembersUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BlockedMembersUpdate];
GO

CREATE PROCEDURE [proc_BlockedMembersUpdate]
(
	@ID bigint,
	@MemberID int,
	@BlockID int,
	@CreateDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [BlockedMembers]
	SET
		[MemberID] = @MemberID,
		[BlockID] = @BlockID,
		[CreateDate] = @CreateDate
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_BlockedMembersInsert]    Script Date: 24/11/2014 9:40:41 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BlockedMembersInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BlockedMembersInsert];
GO

CREATE PROCEDURE [proc_BlockedMembersInsert]
(
	@ID bigint = NULL output,
	@MemberID int,
	@BlockID int,
	@CreateDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [BlockedMembers]
	(
		[MemberID],
		[BlockID],
		[CreateDate]
	)
	VALUES
	(
		@MemberID,
		@BlockID,
		@CreateDate
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_BlockedMembersDelete]    Script Date: 24/11/2014 9:40:41 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_BlockedMembersDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_BlockedMembersDelete];
GO

CREATE PROCEDURE [proc_BlockedMembersDelete]
(
	@ID bigint
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [BlockedMembers]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO

