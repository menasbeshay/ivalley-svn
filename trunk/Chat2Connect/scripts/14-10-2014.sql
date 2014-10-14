IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proc_MailAdsSend]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proc_MailAdsSend]
GO
CREATE PROCEDURE [dbo].[proc_MailAdsSend]
AS
BEGIN

DECLARE @senderID INT
SELECT @senderID=MemberID FROM Member WHERE Name=N'التسويق والإعلان'
DECLARE @mailSubject NVARCHAR(1000)
SET @mailSubject=N'إعلانات الموقع'
DECLARE @adID INT,@adText NVARCHAR(MAX),@adImag NVARCHAR(1000),@members VARCHAR(50)
DECLARE @membersNames NVARCHAR(MAX)
DECLARE @receipents TABLE (MemberID INT)
DECLARE @msgID INT
DECLARE ads_cursor CURSOR FOR  
	SELECT MailAds.ID ,MailAds.AdText,MailAds.AdImage,MailAds.MemberTypes FROM MailAds 
	WHERE RowStatusID=1 --Enabled
		AND CAST(StartDate AS DATE)<=CAST(GETDATE() AS DATE) --Started
		AND CAST(DATEADD(day,NumOfDays,StartDate) AS DATE)>=CAST(GETDATE() AS DATE) -- number of days
		AND (SELECT COUNT(*) FROM MailAdLog 
				WHERE AdID=MailAds.ID AND 
					  DATEPART(day,LogTime)=DATEPART(DAY,GETDATE()) AND
					  DATEPART(MONTH,LogTime)=DATEPART(MONTH,GETDATE()) AND
					  DATEPART(YEAR,LogTime)=DATEPART(YEAR,GETDATE()) AND
					  DATEPART(HOUR,LogTime)=DATEPART(HOUR,GETDATE()) 
			)<NuOfHours

OPEN ads_cursor   
FETCH NEXT FROM ads_cursor INTO @adID,@adText,@adImag,@members

WHILE @@FETCH_STATUS = 0   
BEGIN   
       DELETE FROM @receipents
	   IF CHARINDEX(',1',@members) > 0
	   BEGIN
		SET @membersNames=N'الحسابات المجانية';
		INSERT INTO @receipents(MemberID)
		SELECT MemberID FROM Member WHERE (SELECT dbo.GetMemberTypeSpecID(MemberID))=1
	   END
	   IF CHARINDEX(',2',@members) > 0--upgraded members
	   BEGIN
		IF(LEN(@membersNames)>0)
			SET @membersNames=@membersNames+',';
		SET @membersNames=@membersNames+N'حسابات الترقية';
		INSERT INTO @receipents(MemberID)
		SELECT MemberID FROM Member WHERE (SELECT dbo.GetMemberTypeSpecID(MemberID))>1
	   END
	   IF CHARINDEX(',3',@members) > 0--VIP members
	   BEGIN
		IF(LEN(@membersNames)>0)
			SET @membersNames=@membersNames+',';
		SET @membersNames=@membersNames+N'حسابات مميزة';
		--INSERT INTO @receipents(MemberID)
		--SELECT MemberID FROM Member WHERE (SELECT dbo.GetMemberTypeSpecID(MemberID))>1
	   END
	   
	   IF((SELECT COUNT(*) FROM @receipents)>0)
	   BEGIN
			SET @adText=REPLACE(@adText,'\r\n','</br>');
			SET @adText=@adText+'<img src="'+@adImag+'"/>';
			--add message row
			INSERT INTO Message (SenderID,Subject,Body,ToMembers,CreateDate)
			VALUES (@senderID,@mailsubject,@adText,@membersNames,GETDATE())
			SET @msgID=SCOPE_IDENTITY();
			
			INSERT INTO MemberMessage(MemberID,MessageID)
			SELECT DISTINCT MemberID,@msgID FROM @receipents
			
			INSERT INTO MailAdLog(AdID,LogTime)
			VALUES(@adID,GETDATE()) 
			
	   END
	   
       FETCH NEXT FROM ads_cursor INTO @adID,@adText,@adImag,@members
END   

CLOSE ads_cursor   
DEALLOCATE ads_cursor

END