
CREATE TABLE [dbo].[RoomMessages](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[MessageDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RoomMessages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[RoomMessages]  WITH CHECK ADD  CONSTRAINT [FK_RoomMessages_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO

ALTER TABLE [dbo].[RoomMessages] CHECK CONSTRAINT [FK_RoomMessages_Member]
GO

ALTER TABLE [dbo].[RoomMessages]  WITH CHECK ADD  CONSTRAINT [FK_RoomMessages_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO

ALTER TABLE [dbo].[RoomMessages] CHECK CONSTRAINT [FK_RoomMessages_Room]
GO

ALTER TABLE [dbo].[RoomMessages] ADD  CONSTRAINT [DF_RoomMessages_MessageDate]  DEFAULT (getdate()) FOR [MessageDate]
GO


