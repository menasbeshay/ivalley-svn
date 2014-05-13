
CREATE TABLE [dbo].[Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SenderID] [int] NOT NULL,
	[Subject] [nvarchar](1000) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[ToMembers] [nvarchar](1000) NOT NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Member] FOREIGN KEY([SenderID])
REFERENCES [dbo].[Member] ([MemberID])
GO

ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Member]
GO

ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

DROP TABLE [MemberMessage]
GO
CREATE TABLE [dbo].[MemberMessage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NULL,
	[MessageID] [int] NOT NULL,
	[MessageFolderID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[IsRead] [bit] NULL,
 CONSTRAINT [PK__MemberMe__7089D5E0531856C7] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[MemberMessage]  WITH CHECK ADD  CONSTRAINT [FK_MemberMessage_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO

ALTER TABLE [dbo].[MemberMessage] CHECK CONSTRAINT [FK_MemberMessage_Member]
GO

ALTER TABLE [dbo].[MemberMessage]  WITH CHECK ADD  CONSTRAINT [FK_MemberMessage_Message] FOREIGN KEY([MessageID])
REFERENCES [dbo].[Message] ([ID])
GO

ALTER TABLE [dbo].[MemberMessage] CHECK CONSTRAINT [FK_MemberMessage_Message]
GO

ALTER TABLE [dbo].[MemberMessage]  WITH CHECK ADD  CONSTRAINT [FK_MemberMessage_MessageFolder] FOREIGN KEY([MessageFolderID])
REFERENCES [dbo].[MessageFolder] ([MessageFolderID])
GO

ALTER TABLE [dbo].[MemberMessage] CHECK CONSTRAINT [FK_MemberMessage_MessageFolder]
GO

ALTER TABLE [dbo].[MemberMessage] ADD  CONSTRAINT [DF_MemberMessage_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO