
/****** Object:  StoredProcedure [proc_FavRoomLoadByPrimaryKey]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FavRoomLoadByPrimaryKey]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FavRoomLoadByPrimaryKey];
GO

CREATE PROCEDURE [proc_FavRoomLoadByPrimaryKey]
(
	@MemberID int,
	@RoomID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[RoomID]
	FROM [FavRoom]
	WHERE
		([MemberID] = @MemberID) AND
		([RoomID] = @RoomID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FavRoomLoadByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: proc_FavRoomLoadByPrimaryKey Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FavRoomLoadAll]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FavRoomLoadAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FavRoomLoadAll];
GO

CREATE PROCEDURE [proc_FavRoomLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[MemberID],
		[RoomID]
	FROM [FavRoom]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FavRoomLoadAll Succeeded'
ELSE PRINT 'Procedure Creation: proc_FavRoomLoadAll Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


/****** Object:  StoredProcedure [proc_FavRoomInsert]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FavRoomInsert]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FavRoomInsert];
GO

CREATE PROCEDURE [proc_FavRoomInsert]
(
	@MemberID int,
	@RoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [FavRoom]
	(
		[MemberID],
		[RoomID]
	)
	VALUES
	(
		@MemberID,
		@RoomID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FavRoomInsert Succeeded'
ELSE PRINT 'Procedure Creation: proc_FavRoomInsert Error on Creation'
GO

/****** Object:  StoredProcedure [proc_FavRoomDelete]    Script Date: 3/9/2014 11:33:57 AM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[proc_FavRoomDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [proc_FavRoomDelete];
GO

CREATE PROCEDURE [proc_FavRoomDelete]
(
	@MemberID int,
	@RoomID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [FavRoom]
	WHERE
		[MemberID] = @MemberID AND
		[RoomID] = @RoomID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: proc_FavRoomDelete Succeeded'
ELSE PRINT 'Procedure Creation: proc_FavRoomDelete Error on Creation'
GO
