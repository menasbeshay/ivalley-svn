
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MailAds]') AND type in (N'U'))
DROP TABLE [MailAds]
GO

CREATE TABLE [dbo].[MailAds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdText] [nvarchar](max) NOT NULL,
	[AdImage] [nvarchar](500) NULL,
	[RowStatusID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[MemberTypes] [varchar](50) NOT NULL,
	[NumOfDays] [int] NOT NULL,
	[NuOfHours] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_MailAds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[MailAds] ADD  CONSTRAINT [DF_MailAds_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MailAdLog]') AND type in (N'U'))
DROP TABLE [dbo].[MailAdLog]
GO

CREATE TABLE [dbo].[MailAdLog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AdID] [int] NOT NULL,
	[LogTime] [datetime] NOT NULL,
 CONSTRAINT [PK_MailAdLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[MailAdLog] ADD  CONSTRAINT [DF_MailAdLog_LogTime]  DEFAULT (getdate()) FOR [LogTime]
GO

/****** Object:  StoredProcedure [proc_MailAdsLoadByPrimaryKey]    Script Date: 12/10/2014 11:45:20 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MailAdsLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MailAdsLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MailAdsLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[AdText],
		[AdImage],
		[RowStatusID],
		[StartDate],
		[MemberTypes],
		[NumOfDays],
		[NuOfHours],
		[Timestamp]
	FROM [MailAds]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MailAdsLoadAll]    Script Date: 12/10/2014 11:45:20 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MailAdsLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MailAdsLoadAll];
GO

CREATE PROCEDURE [proc_MailAdsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[AdText],
		[AdImage],
		[RowStatusID],
		[StartDate],
		[MemberTypes],
		[NumOfDays],
		[NuOfHours],
		[Timestamp]
	FROM [MailAds]

	SET @Err = @@Error

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MailAdsUpdate]    Script Date: 12/10/2014 11:45:20 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MailAdsUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MailAdsUpdate];
GO

CREATE PROCEDURE [proc_MailAdsUpdate]
(
	@ID int,
	@AdText nvarchar(MAX),
	@AdImage nvarchar(500) = NULL,
	@RowStatusID int,
	@StartDate datetime,
	@MemberTypes varchar(50),
	@NumOfDays int,
	@NuOfHours int,
	@Timestamp datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [MailAds]
	SET
		[AdText] = @AdText,
		[AdImage] = @AdImage,
		[RowStatusID] = @RowStatusID,
		[StartDate] = @StartDate,
		[MemberTypes] = @MemberTypes,
		[NumOfDays] = @NumOfDays,
		[NuOfHours] = @NuOfHours,
		[Timestamp] = @Timestamp
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
GO




/****** Object:  StoredProcedure [proc_MailAdsInsert]    Script Date: 12/10/2014 11:45:20 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MailAdsInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MailAdsInsert];
GO

CREATE PROCEDURE [proc_MailAdsInsert]
(
	@ID int = NULL output,
	@AdText nvarchar(MAX),
	@AdImage nvarchar(500) = NULL,
	@RowStatusID int,
	@StartDate datetime,
	@MemberTypes varchar(50),
	@NumOfDays int,
	@NuOfHours int,
	@Timestamp datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [MailAds]
	(
		[AdText],
		[AdImage],
		[RowStatusID],
		[StartDate],
		[MemberTypes],
		[NumOfDays],
		[NuOfHours],
		[Timestamp]
	)
	VALUES
	(
		@AdText,
		@AdImage,
		@RowStatusID,
		@StartDate,
		@MemberTypes,
		@NumOfDays,
		@NuOfHours,
		@Timestamp
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


/****** Object:  StoredProcedure [proc_MailAdsDelete]    Script Date: 12/10/2014 11:45:20 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MailAdsDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MailAdsDelete];
GO

CREATE PROCEDURE [proc_MailAdsDelete]
(
	@ID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [MailAds]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END
GO

