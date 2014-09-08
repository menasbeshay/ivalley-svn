
USE [chat2connect]
GO

/****** Object:  StoredProcedure [proc_ProfileLikeLoadByPrimaryKey]    Script Date: 9/8/2014 3:45:52 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProfileLikeLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProfileLikeLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_ProfileLikeLoadByPrimaryKey]
(
	@MemberID int,
	@ProfileMemberID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[ProfileMemberID]
	FROM [ProfileLike]
	WHERE
		([MemberID] = @MemberID) AND
		([ProfileMemberID] = @ProfileMemberID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProfileLikeLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProfileLikeLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ProfileLikeLoadAll]    Script Date: 9/8/2014 3:45:52 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProfileLikeLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProfileLikeLoadAll];
GO

CREATE PROCEDURE [proc_ProfileLikeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[ProfileMemberID]
	FROM [ProfileLike]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProfileLikeLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProfileLikeLoadAll Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


/****** Object:  StoredProcedure [proc_ProfileLikeInsert]    Script Date: 9/8/2014 3:45:52 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProfileLikeInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProfileLikeInsert];
GO

CREATE PROCEDURE [proc_ProfileLikeInsert]
(
	@MemberID int,
	@ProfileMemberID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [ProfileLike]
	(
		[MemberID],
		[ProfileMemberID]
	)
	VALUES
	(
		@MemberID,
		@ProfileMemberID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProfileLikeInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProfileLikeInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_ProfileLikeDelete]    Script Date: 9/8/2014 3:45:52 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_ProfileLikeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_ProfileLikeDelete];
GO

CREATE PROCEDURE [proc_ProfileLikeDelete]
(
	@MemberID int,
	@ProfileMemberID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [ProfileLike]
	WHERE
		[MemberID] = @MemberID AND
		[ProfileMemberID] = @ProfileMemberID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_ProfileLikeDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_ProfileLikeDelete Error on Creation'
GO
