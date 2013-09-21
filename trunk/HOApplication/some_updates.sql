ALTER TABLE dbo.DeadMedicalInfo
ADD newCauseOfDeathB char(20) NULL  
GO

ALTER TABLE dbo.DeadMedicalInfo
ADD AbortionPlace nvarchar(200) NULL  
GO


UPDATE dbo.DeadMedicalInfo
SET newCauseOfDeathB = CAST([CauseOfDeathB] AS char(20)) 
GO

ALTER TABLE dbo.DeadMedicalInfo
	DROP CONSTRAINT DF_DeadMedicalInfo_CauseOfDeathB
GO

ALTER TABLE dbo.DeadMedicalInfo
DROP COLUMN [CauseOfDeathB]
GO

SP_RENAME 'NewCauseOfDeathB', 'CauseOfDeathB'
GO

ALTER TABLE dbo.Dead
ADD DeadJobDesc nvarchar(500) NULL  
GO

Create table Jobs 
(
id int identity (1,1) primary key ,
Name nvarchar(200)
)