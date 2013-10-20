
/****** Object:  StoredProcedure [proc_MemberLoadByPrimaryKey]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_MemberLoadByPrimaryKey]
(
	@MemberID nvarchar(200),
	@ChatRoomID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[ChatRoomID]
	FROM [Member]
	WHERE
		([MemberID] = @MemberID) AND
		([ChatRoomID] = @ChatRoomID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberLoadAll]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberLoadAll];
GO

CREATE PROCEDURE [proc_MemberLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[ChatRoomID]
	FROM [Member]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberLoadAll Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


/****** Object:  StoredProcedure [proc_MemberInsert]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberInsert];
GO

CREATE PROCEDURE [proc_MemberInsert]
(
	@MemberID nvarchar(200),
	@ChatRoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Member]
	(
		[MemberID],
		[ChatRoomID]
	)
	VALUES
	(
		@MemberID,
		@ChatRoomID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_MemberDelete]    Script Date: 10/20/2013 11:38:43 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_MemberDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_MemberDelete];
GO

CREATE PROCEDURE [proc_MemberDelete]
(
	@MemberID nvarchar(200),
	@ChatRoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Member]
	WHERE
		[MemberID] = @MemberID AND
		[ChatRoomID] = @ChatRoomID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_MemberDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_MemberDelete Error on Creation'
GO
