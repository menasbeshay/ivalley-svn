
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MemberType_Member]') AND parent_object_id = OBJECT_ID(N'[dbo].[MemberType]'))
ALTER TABLE [dbo].[MemberType] DROP CONSTRAINT [FK_MemberType_Member]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MemberType_MemberTypeSpecDuration]') AND parent_object_id = OBJECT_ID(N'[dbo].[MemberType]'))
ALTER TABLE [dbo].[MemberType] DROP CONSTRAINT [FK_MemberType_MemberTypeSpecDuration]
GO

/****** Object:  Table [dbo].[MemberType]    Script Date: 10/20/2014 00:49:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberType]') AND type in (N'U'))
DROP TABLE [dbo].[MemberType]
GO

CREATE TABLE [dbo].[MemberType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[MemberTypeSpecDurationID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[CreateBy] [int] NOT NULL,
 CONSTRAINT [PK_MemberType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[MemberType]  WITH CHECK ADD  CONSTRAINT [FK_MemberType_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO

ALTER TABLE [dbo].[MemberType] CHECK CONSTRAINT [FK_MemberType_Member]
GO

ALTER TABLE [dbo].[MemberType]  WITH CHECK ADD  CONSTRAINT [FK_MemberType_MemberTypeSpecDuration] FOREIGN KEY([MemberTypeSpecDurationID])
REFERENCES [dbo].[MemberTypeSpecDuration] ([ID])
GO

ALTER TABLE [dbo].[MemberType] CHECK CONSTRAINT [FK_MemberType_MemberTypeSpecDuration]
GO

ALTER PROCEDURE [dbo].[proc_MemberTypeInsert]
(
	@ID int = NULL output,
	@MemberID int,
	@MemberTypeSpecDurationID int,
	@StartDate datetime,
	@EndDate datetime = NULL,
	@CreateBy int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MemberType]
	(
		[MemberID],
		[MemberTypeSpecDurationID],
		[StartDate],
		[EndDate],
		[CreateBy]
	)
	VALUES
	(
		@MemberID,
		@MemberTypeSpecDurationID,
		@StartDate,
		@EndDate,
		@CreateBy
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
