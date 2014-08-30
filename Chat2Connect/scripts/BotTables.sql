IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bot]') AND type in (N'U'))
DROP TABLE [dbo].[Bot]
GO

CREATE TABLE [dbo].[Bot](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[IconPath] [varchar](250) NULL,
	[IsOptional] [nchar](10) NULL,
	[RowStatusID] [tinyint] NOT NULL,
 CONSTRAINT [PK_Bot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[BotPoints](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BotID] [int] NOT NULL,
	[Points] [int] NOT NULL,
	[BotDurationID] [int] NULL,
 CONSTRAINT [PK_BotPoints] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[BotPoints]  WITH CHECK ADD  CONSTRAINT [FK_BotPoints_Bot] FOREIGN KEY([BotID])
REFERENCES [dbo].[Bot] ([ID])
GO

ALTER TABLE [dbo].[BotPoints] CHECK CONSTRAINT [FK_BotPoints_Bot]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoomBot_Bot]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoomBot]'))
ALTER TABLE [dbo].[RoomBot] DROP CONSTRAINT [FK_RoomBot_Bot]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoomBot_Room]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoomBot]'))
ALTER TABLE [dbo].[RoomBot] DROP CONSTRAINT [FK_RoomBot_Room]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RoomBot_TimeStamp]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RoomBot] DROP CONSTRAINT [DF_RoomBot_TimeStamp]
END

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoomBot]') AND type in (N'U'))
DROP TABLE [dbo].[RoomBot]
GO

CREATE TABLE [dbo].[RoomBot](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[BotID] [int] NOT NULL,
	[ShortcutKey] [varchar](50) NULL,
	[CreatedByMemberID] [int] NULL,
	[IsEnabled] [nchar](10) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_RoomBot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RoomBot]  WITH CHECK ADD  CONSTRAINT [FK_RoomBot_Bot] FOREIGN KEY([BotID])
REFERENCES [dbo].[Bot] ([ID])
GO

ALTER TABLE [dbo].[RoomBot] CHECK CONSTRAINT [FK_RoomBot_Bot]
GO

ALTER TABLE [dbo].[RoomBot]  WITH CHECK ADD  CONSTRAINT [FK_RoomBot_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO

ALTER TABLE [dbo].[RoomBot] CHECK CONSTRAINT [FK_RoomBot_Room]
GO

ALTER TABLE [dbo].[RoomBot] ADD  CONSTRAINT [DF_RoomBot_TimeStamp]  DEFAULT (getdate()) FOR [TimeStamp]
GO

CREATE TABLE [dbo].[EmailOwnerBot](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomBotID] [int] NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_EmailOwnerBot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[EmailOwnerBot]  WITH CHECK ADD  CONSTRAINT [FK_EmailOwnerBot_RoomBot] FOREIGN KEY([RoomBotID])
REFERENCES [dbo].[RoomBot] ([ID])
GO

ALTER TABLE [dbo].[EmailOwnerBot] CHECK CONSTRAINT [FK_EmailOwnerBot_RoomBot]
GO

CREATE TABLE [dbo].[InviteFriendBanBoot](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomBotID] [int] NOT NULL,
	[MemberLevels] [varchar](50) NOT NULL,
 CONSTRAINT [PK_InviteFriendBanBoot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[InviteFriendBanBoot]  WITH CHECK ADD  CONSTRAINT [FK_InviteFriendBanBoot_RoomBot] FOREIGN KEY([RoomBotID])
REFERENCES [dbo].[RoomBot] ([ID])
GO

ALTER TABLE [dbo].[InviteFriendBanBoot] CHECK CONSTRAINT [FK_InviteFriendBanBoot_RoomBot]
GO

CREATE TABLE [dbo].[LoginMembersBot](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomBotID] [int] NOT NULL,
	[MemberLevels] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LoginMembersBot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[LoginMembersBot]  WITH CHECK ADD  CONSTRAINT [FK_LoginMembersBot_RoomBot] FOREIGN KEY([RoomBotID])
REFERENCES [dbo].[RoomBot] ([ID])
GO

ALTER TABLE [dbo].[LoginMembersBot] CHECK CONSTRAINT [FK_LoginMembersBot_RoomBot]
GO

CREATE TABLE [dbo].[WelcomBot](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomBotID] [int] NOT NULL,
	[LoginMessage] [nvarchar](1000) NULL,
	[LogoutMessage] [nvarchar](1000) NULL,
 CONSTRAINT [PK_WelcomBot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[WelcomBot]  WITH CHECK ADD  CONSTRAINT [FK_WelcomBot_RoomBot] FOREIGN KEY([RoomBotID])
REFERENCES [dbo].[RoomBot] ([ID])
GO

ALTER TABLE [dbo].[WelcomBot] CHECK CONSTRAINT [FK_WelcomBot_RoomBot]
GO


