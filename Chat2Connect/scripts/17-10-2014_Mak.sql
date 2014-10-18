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

UPDATE Bot SET Description=N'ترحيب بالعضو عند الدخول وعند الخروج' WHERE ID=1
UPDATE Bot SET Description=N'عند تفعيل هذا البوت من قبل المالك أو المدير يحجب على أى شخص فى الغرفة أن يدعو أحد أصدقائه للغرفة وتكون خاصية دعوة صديق فى الغرفة غير مفعلة' WHERE ID=2
UPDATE Bot SET Description=N'هذا البوت يساعد مالك الغرفة على متابعة (المدير - المراقب) عند إتخاذ أى قرار (إسكات - طرد -تفعيل/تعطيل أى بوت) ويصل المالك تقرير يومى أو أسبوعى على البريد الخاص داخل حسابه' WHERE ID=3
UPDATE Bot SET Description=N'هذا البوت يساعد مالك الغرفة فى تحديد المسموح لهم بدخول غرفته (حساب مجانى - حساب ترقة - حساب مميز)' WHERE ID=4
UPDATE Bot SET Description=N'يستطيع أى شخص مراسلة مالك الغرفة بالضغط على بوت بريد المالك فى الغرفة حتى يتواصل مع المالك وتصل الرسالة لصندوق بريد المالك' WHERE ID=5
UPDATE Bot SET Description=N'هذا البوت يساعد المالك أو احد إدارة الغرفة فى إرسال رسالة إلى الذين جعلوا الغرفة مفضلة لديهم وتصل رسالة بإسم الغرفة ومالكها' WHERE ID=6
UPDATE Bot SET Description=N'يساعد هذا البوت إدارة الغرفة فى نشر قانون الغرفة للمتواجدين حسب تغذية مالك الغرفة للبوت وينشر القوانين كل 5 أو 10 أو 15 أو 30 دقيقة أو ساعة' WHERE ID=7
UPDATE Bot SET Description=N'يساعد هذا البوت فى نشر برامج الغرفة امام المتواجدين والنشر كل 5 أو 10 او 15 أو 30 دقيقة أو ساعة' WHERE ID=8

UPDATE BotPoints SET Points=0

UPDATE MemberTypeSpec SET CreatePrivateRoomCount=2 ,CreateTempRoomCount=1--WHERE ID=1
UPDATE MemberTypeSpec SET OpenedCamCount=8 ,OpenRoomCount=10,FriendsCount=1000,CreatePrivateRoomCount=2,CreateTempRoomCount=2 WHERE ID=4