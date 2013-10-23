CREATE PROCEDURE [dbo].[Rpt_ListDeadAprrovedCountGov] @StartDate varchar(100),    
@EndDate varchar(100)  ,  
@GovID smallint = -1,  
@CivilID smallint = -1 
AS    
BEGIN    
SELECT     G1.DESCR as GovName,CIVIL_OFFICE.Descr as CivilName, COUNT(Dead.DeadEventID) AS DeadCount,    
    
(sum(case when Dead.Approved = 1 then 1 else 0 end)) As ApprovedDead    
    
FROM         GOVERNORATE G1 LEFT OUTER JOIN    
                      Dead INNER JOIN    
                      CIVIL_OFFICE INNER JOIN    
                      Health_Office ON CIVIL_OFFICE.CD = Health_Office.CIVILCD ON Dead.OrgID = Health_Office.HEALTHCD ON     
                      G1.CD = CIVIL_OFFICE.FK_GOVCD    
    
and     
 (CAST(    
   (     
    STR( MONTH( Dead.RegisterDate ) ) + '/' +    
    STR(YEAR( Dead.RegisterDate ) ) + '/' +    
    STR( DAY( Dead.RegisterDate ) )    
   )    
   AS DATETIME    
 )    
  >= @StartDate and CAST(    
   (     
    STR( MONTH( Dead.RegisterDate ) ) + '/' +    
    STR(YEAR( Dead.RegisterDate ) ) + '/' +    
    STR( DAY( Dead.RegisterDate ) )    
   )    
   AS DATETIME ) <= @EndDate)    
  where (@GovID = -1 or G1.CD = @GovID )    
    
    
GROUP BY G1.DESCR, G1.CD  , CIVIL_OFFICE.CD, CIVIL_OFFICE.Descr 
Order by G1.DESCR    
END
Go

alter PROCEDURE [dbo].[Rpt_ListDeadAprrovedCountCivil] @StartDate varchar(100),    
@EndDate varchar(100)  ,  
@GovID smallint = -1,  
@CivilID smallint = -1 
AS    
BEGIN    
SELECT     G1.DESCR as GovName,CIVIL_OFFICE.Descr as CivilName,HEALTHDESCR as HealthOfficeName, COUNT(Dead.DeadEventID) AS DeadCount,    
    
(sum(case when Dead.Approved = 1 then 1 else 0 end)) As ApprovedDead    
    
FROM         GOVERNORATE G1 LEFT OUTER JOIN    
                      Dead INNER JOIN    
                      CIVIL_OFFICE INNER JOIN    
                      Health_Office ON CIVIL_OFFICE.CD = Health_Office.CIVILCD ON Dead.OrgID = Health_Office.HEALTHCD ON     
                      G1.CD = CIVIL_OFFICE.FK_GOVCD    
    
and     
 (CAST(    
   (     
    STR( MONTH( Dead.RegisterDate ) ) + '/' +    
    STR(YEAR( Dead.RegisterDate ) ) + '/' +    
    STR( DAY( Dead.RegisterDate ) )    
   )    
   AS DATETIME    
 )    
  >= @StartDate and CAST(    
   (     
    STR( MONTH( Dead.RegisterDate ) ) + '/' +    
    STR(YEAR( Dead.RegisterDate ) ) + '/' +    
    STR( DAY( Dead.RegisterDate ) )    
   )    
   AS DATETIME ) <= @EndDate)    
  where (@GovID = -1 or G1.CD = @GovID )  and   
  (@CivilID = -1 or CIVIL_OFFICE.CD = @CivilID )  
    
    
GROUP BY G1.DESCR, G1.CD  , CIVIL_OFFICE.CD, CIVIL_OFFICE.Descr , Health_Office.HEALTHCD,Health_Office.HealthDescr   
Order by G1.DESCR    
END



Go


CREATE PROCEDURE [dbo].[Rpt_ListDeadAprrovedCountHealthOffice] @StartDate varchar(100),    
@EndDate varchar(100)  ,  
@GovID smallint = -1,  
@CivilID smallint = -1,  
@HealthOfficeID smallint = -1  
AS    
BEGIN    
SELECT     G1.DESCR as GovName,CIVIL_OFFICE.Descr as CivilName,HEALTHDESCR as HealthOfficeName, COUNT(Dead.DeadEventID) AS DeadCount,    
    
(sum(case when Dead.Approved = 1 then 1 else 0 end)) As ApprovedDead    
    
FROM         GOVERNORATE G1 LEFT OUTER JOIN    
                      Dead INNER JOIN    
                      CIVIL_OFFICE INNER JOIN    
                      Health_Office ON CIVIL_OFFICE.CD = Health_Office.CIVILCD ON Dead.OrgID = Health_Office.HEALTHCD ON     
                      G1.CD = CIVIL_OFFICE.FK_GOVCD    
    
and     
 (CAST(    
   (     
    STR( MONTH( Dead.RegisterDate ) ) + '/' +    
    STR(YEAR( Dead.RegisterDate ) ) + '/' +    
    STR( DAY( Dead.RegisterDate ) )    
   )    
   AS DATETIME    
 )    
  >= @StartDate and CAST(    
   (     
    STR( MONTH( Dead.RegisterDate ) ) + '/' +    
    STR(YEAR( Dead.RegisterDate ) ) + '/' +    
    STR( DAY( Dead.RegisterDate ) )    
   )    
   AS DATETIME ) <= @EndDate)    
  where (@GovID = -1 or G1.CD = @GovID )  and   
  (@CivilID = -1 or CIVIL_OFFICE.CD = @CivilID )  and   
  (@HealthOfficeID = -1 or Health_Office.HEALTHCD = @HealthOfficeID )    
    
    
GROUP BY G1.DESCR, G1.CD   , CIVIL_OFFICE.CD, CIVIL_OFFICE.Descr  , Health_Office.HEALTHCD,Health_Office.HealthDescr  
Order by G1.DESCR    
END