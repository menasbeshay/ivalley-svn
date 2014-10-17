IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SplitString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[SplitString]
GO

CREATE FUNCTION [dbo].[SplitString] 
( 
    @string NVARCHAR(MAX), 
    @delimiter CHAR(1) 
) 
RETURNS @output TABLE(Value NVARCHAR(MAX) 
) 
BEGIN 
    DECLARE @start INT, @end INT 
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string) 
    WHILE @start < LEN(@string) + 1 BEGIN 
        IF @end = 0  
            SET @end = LEN(@string) + 1
       
        INSERT INTO @output (Value)  
        VALUES(SUBSTRING(@string, @start, @end - @start)) 
        SET @start = @end + 1 
        SET @end = CHARINDEX(@delimiter, @string, @start)
        
    END 
    RETURN 
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proc_MemberLogGetPointsReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proc_MemberLogGetPointsReport]
GO
CREATE PROCEDURE proc_MemberLogGetPointsReport
(
	@MemberID INT,
	@PointsLogTypes VARCHAR(MAX),
	@StartDate DATETIME =NULL,
	@EndDate DATETIME=NULL
)
AS 
BEGIN
	SELECT * FROM MemberLog
	WHERE
		(MemberID=@MemberID OR RelatedMemberID=@MemberID) AND
		(LogTypeID IN (select CAST(Value AS INT) FROM dbo.SplitString(@PointsLogTypes,','))) AND
		(@StartDate IS NULL OR CreateDate>=@StartDate) AND
		(@EndDate IS NULL OR CAST(CreateDate AS DATE)<=@EndDate)
	ORDER BY CreateDate DESC
END
GO

