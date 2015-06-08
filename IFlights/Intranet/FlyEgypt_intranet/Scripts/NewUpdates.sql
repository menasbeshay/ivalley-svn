ALTER Table FlightCrew 
ADD SectorID int
Go 

ALTER Table FlightPilot
ADD SectorID int
Go 

ALTER Table FlightCrew 
Alter column ReportID int null
Go 

ALTER Table FlightPilot
Alter column ReportID int null
Go 

ALTER Table Sector
Add IsHeavy bit,
	IsHeavyCrew bit,
	Comments nvarchar(500),
	AirCraft_AirPlaneID int Foreign Key references  AirPlane(AirPlaneID),
	SectorDate DateTime ,
	IsReturnSector bit,
	ReturnSectorID int 
GO

/*
BEGIN Tran 

DECLARE @ReportID int , 
		@SectorID int

Declare CustomCursor Cursor For 
SELECT F.ReportID , S.SectorID
From Flight F 
INNER JOIN Sector S ON F.ReportID = S.ReportID
ORDER BY F.ReportID


OPEN CustomCursor
FETCH NEXT FROM CustomCursor INTO @ReportID ,
								  @SectorID
							 
WHILE @@FETCH_STATUS = 0 
BEGIN

	insert INTO FlightCrew ( SectorID, CrewID , PositionID )  
	SELECT @SectorID , FC.CrewID , FC.PositionID 
	FROM Flight F 
	INNER JOIN FlightCrew FC ON F.ReportID = FC.ReportID
	where FC.ReportID = @ReportID
	
	insert INTO FlightPilot ( SectorID, PilotID , PositionID )  
	SELECT @SectorID , FP.PilotID , FP.PositionID 
	FROM Flight F 
	INNER JOIN FlightPilot FP ON F.ReportID = FP.ReportID
	where FP.ReportID = @ReportID

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		CLOSE CustomCursor
		DEALLOCATE CustomCursor
		return	
	END
End	

CLOSE CustomCursor
DEALLOCATE CustomCursor
*/

DELETE FlightCrew WHERE ReportID IS NOT NULL
DELETE FlightPilot WHERE ReportID IS NOT NULL
/*
IF @@ERROR <> 0
BEGIN
	ROLLBACK TRAN		
	return	
END
*/

ALTER Table FlightCrew 
Drop column ReportID 
/*
IF @@ERROR <> 0
BEGIN
	ROLLBACK TRAN		
	return	
END
*/
ALTER Table FlightPilot
Drop column ReportID 
/*
IF @@ERROR <> 0
BEGIN
	ROLLBACK TRAN		
	return	
END

COMMIT TRAN
*/

GO


UPDATE Sector 
SET Sector.AirCraft_AirPlaneID = Flight.AirCraft_AirPlaneID,
	Sector.SectorDate = Flight.ReportDate,
	Sector.IsHeavy = Flight.IsHeavy
FROM Sector 
INNER JOIN Flight ON Flight.ReportID = Sector.ReportID
Go


sp_RENAME 'FlightCrew', 'SectorCrew'
GO

sp_RENAME 'FlightPilot', 'SectorPilot'
GO


ALTER Table Sector
Drop Column ReportID 
Go
