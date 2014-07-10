
If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateStudentPassword' and
		        xtype = 'P')
Drop Procedure UpdateStudentPassword
Go
Create Procedure UpdateStudentPassword @StudentID int,
									   @SecretCode nvarchar(30)
as
  
Update Students set SecretCode = @SecretCode  
Where StudentID = @StudentID  
  
  
  GO
  
  
If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchStudentsBystudentAndFather' and
		        xtype = 'P')
Drop Procedure SearchStudentsBystudentAndFather
Go
CREATE Procedure SearchStudentsBystudentAndFather @ClassID int,    
        @ClassRoomID int,    
        @StudentName nvarchar(200)  ,  
        @FatherName nvarchar(200)    
as    
    
Select S.*, S.ARStudentName + ' ' + S.ARFatherName as ARDisplayName, S.EnStudentName + ' ' + S.ENFatherName as EnDisplayName , C.ArName ClassName, CR.ARNAme ClassRoomName
from Students S    
Inner Join ClassRooms CR on S.ClassRoomID = CR.ClassRoomID    
Inner Join Class C on C.ClassID = CR.ClassID    
where (@ClassID = 0 Or C.ClassID = @ClassID ) And    
   (@ClassRoomID = 0 Or CR.ClassRoomID = @ClassRoomID ) And     
   (S.ARStudentName  = @StudentName  OR @StudentName = '') And   
   (S.ARFatherName = @FatherName OR  @FatherName = '')   
Order by S.ARStudentName,S.ARFatherName        
    
    
    
    GO
    
Alter table news 
add picpath nvarchar(300)


If Exists (select Name 
		   from sysobjects 
		   where name = 'AddNews' and
		        xtype = 'P')
Drop Procedure AddNews
Go
Create Procedure AddNews 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@EnBody Nvarchar(max),
						@ArBody Nvarchar(max),
						@CreatedDate DateTime,
						@PicPath nvarchar(300)
as

Insert Into News ( EnTitle ,
					ArTitle ,
					EnBody ,
					ArBody,
					CreatedDate ,
					PicPath
					)
			Values 
			(
			@EnTitle ,
			@ArTitle ,
			@EnBody ,
			@ArBody,
			@CreatedDate, 
			@PicPath
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateNews' and
		        xtype = 'P')
Drop Procedure UpdateNews
Go
Create Procedure UpdateNews @NewsID int, 
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@EnBody Nvarchar(max),
						@ArBody Nvarchar(max),
						@CreatedDate DateTime,
						@PicPath nvarchar(300)
as
if(@PicPath <> '')
begin
Update News set EnTitle = @EnTitle,
					ArTitle  = @ArTitle,
					EnBody = @EnBody ,
					ArBody = @ArBody,
					CreatedDate = @CreatedDate,
					PicPath = @PicPath
Where NewsID = @NewsID
end 
else
begin 
Update News set EnTitle = @EnTitle,
					ArTitle  = @ArTitle,
					EnBody = @EnBody ,
					ArBody = @ArBody,
					CreatedDate = @CreatedDate
Where NewsID = @NewsID
end 
Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetTopNews' and
		        xtype = 'P')
Drop Procedure GetTopNews
Go
Create Procedure GetTopNews 
as

Select Top 6 * from News 
order by CreatedDate desc

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'PageGalleryPhoto' and
		        xtype = 'U')
Drop Table PageGalleryPhoto
Go
Create Table PageGalleryPhoto
(
	PageGalleryPhotoID int not null
			identity(1,1)
			Primary Key,
	PageID int ,
	ARTitle Nvarchar(200),
	ENTitle Nvarchar(200),
	PicPath nvarchar(500)
)
Go

/* Gallery photo Procedures  */

If Exists (select Name 
		   from sysobjects 
		   where name = 'AddPageGalleryPhoto' and
		        xtype = 'P')
Drop Procedure AddPageGalleryPhoto
Go
Create Procedure AddPageGalleryPhoto
						@PageID int,  
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@PicPath nvarchar(500)
as

Insert Into PageGalleryPhoto ( PageID, EnTitle ,
					ArTitle , 
					PicPath
					)
			Values 
			(
			@PageID, 
			@EnTitle ,
			@ArTitle , 
			@PicPath
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdatePageGalleryPhoto' and
		        xtype = 'P')
Drop Procedure UpdatePageGalleryPhoto
Go
Create Procedure UpdatePageGalleryPhoto @PageGalleryPhotoID int, 
						@PageID int,  
						@EnTitle Nvarchar(200),
						@ArTitle Nvarchar(200),
						@PicPath nvarchar(500)
as

Update PageGalleryPhoto set EnTitle = @EnTitle,
					ArTitle  = @ArTitle,
					PageID = @PageID , 
					PicPath = @PicPath
					
Where PageGalleryPhotoID = @PageGalleryPhotoID 

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPageGalleryPhoto' and
		        xtype = 'P')
Drop Procedure GetPageGalleryPhoto
Go
Create Procedure GetPageGalleryPhoto @PageGalleryPhotoID int
as

Select * from PageGalleryPhoto 
Where PageGalleryPhotoID = @PageGalleryPhotoID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetPageGalleryPhotoByPageID' and
		        xtype = 'P')
Drop Procedure GetPageGalleryPhotoByPageID
Go
Create Procedure GetPageGalleryPhotoByPageID @PageID int
as

Select * from PageGalleryPhoto 
Where PageID = @PageID

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllPageGalleryPhoto' and
		        xtype = 'P')
Drop Procedure GetAllPageGalleryPhoto
Go
Create Procedure GetAllPageGalleryPhoto
as

Select * from PageGalleryPhoto 


Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'DeletePageGalleryPhoto' and
		        xtype = 'P')
Drop Procedure DeletePageGalleryPhoto
Go
Create Procedure DeletePageGalleryPhoto @PageGalleryPhotoID int 
as

Delete PageGalleryPhoto
Where PageGalleryPhotoID = @PageGalleryPhotoID

Go


/**************************************************************/


If Exists (select Name 
		   from sysobjects 
		   where name = 'ClassAttachment' and
		        xtype = 'U')
Drop Table ClassAttachment
Go
Create Table ClassAttachment
(
	ClassAttachmentID int not null
			identity(1,1)
			Primary Key,
	ClassID int ,
	SchoolYearID int,
	CourseID int,
	ArTitle Nvarchar(200),
	ENTitle Nvarchar(200),
	ArTeacherName Nvarchar(200),
	EnTeacherName Nvarchar(200),
	CreatedDate DateTime,
	FilePath nvarchar(300),
	IsVideo bit default(0)
)
Go


/* Class Attachment Procedures  */

If Exists (select Name 
		   from sysobjects 
		   where name = 'AddClassAttachment' and
		        xtype = 'P')
Drop Procedure AddClassAttachment
Go
Create Procedure AddClassAttachment
						@ClassID int ,
						@SchoolYearID int,
						@CourseID int,
						@ArTitle Nvarchar(200),
						@ENTitle Nvarchar(200),
						@ArTeacherName Nvarchar(200),
						@EnTeacherName Nvarchar(200),
						@CreatedDate DateTime,
						@FilePath nvarchar(300),
						@IsVideo bit = 0
as

Insert Into ClassAttachment ( ClassID  ,
							SchoolYearID ,
							CourseID ,
							ArTitle ,
							ENTitle ,
							ArTeacherName ,
							EnTeacherName ,
							CreatedDate ,
							FilePath ,
							IsVideo 
					)
			Values 
			(
			@ClassID  ,
			@SchoolYearID ,
			@CourseID ,
			@ArTitle ,
			@ENTitle ,
			@ArTeacherName ,
			@EnTeacherName ,
			@CreatedDate ,
			@FilePath ,
			@IsVideo 
			)

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'UpdateClassAttachment' and
		        xtype = 'P')
Drop Procedure UpdateClassAttachment
Go
Create Procedure UpdateClassAttachment @ClassAttachmentID int, 
						@ClassID int ,
						@SchoolYearID int,
						@CourseID int,
						@ArTitle Nvarchar(200),
						@ENTitle Nvarchar(200),
						@ArTeacherName Nvarchar(200),
						@EnTeacherName Nvarchar(200),
						@CreatedDate DateTime,
						@FilePath nvarchar(300),
						@IsVideo bit 
as
if (@FilePath <> '')
begin
Update ClassAttachment set ClassID = (case when (@ClassID = 0) then ClassID else @ClassID end) ,
							SchoolYearID  = @SchoolYearID ,
							CourseID  = (case when (@CourseID = 0) then CourseID else @CourseID end),
							ArTitle  = @ArTitle ,
							ENTitle  = @ENTitle ,
							ArTeacherName  = @ArTeacherName ,
							EnTeacherName  = @EnTeacherName ,
							CreatedDate  = @CreatedDate ,
							FilePath  = @FilePath ,
							IsVideo  = @IsVideo 
					
Where ClassAttachmentID = @ClassAttachmentID 
end 
else 
begin 
Update ClassAttachment set ClassID =  (case  when (@ClassID = 0 ) then ClassID else @ClassID end) ,
							SchoolYearID  = @SchoolYearID ,
							CourseID  = (case  when (@CourseID = 0) then CourseID else @CourseID end) ,
							ArTitle  = @ArTitle ,
							ENTitle  = @ENTitle ,
							ArTeacherName  = @ArTeacherName ,
							EnTeacherName  = @EnTeacherName ,
							CreatedDate  = @CreatedDate ,							
							IsVideo  = @IsVideo 
					
Where ClassAttachmentID = @ClassAttachmentID 
end
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetClassAttachment' and
		        xtype = 'P')
Drop Procedure GetClassAttachment
Go
Create Procedure GetClassAttachment @ClassAttachmentID int
as

Select A.*, C.ArName , CC.ArName ArClassName from ClassAttachment A
Inner Join Courses C on A.CourseId = C.CourseID
inner join Class CC on CC.ClassID = A.ClassID
Where ClassAttachmentID = @ClassAttachmentID

Go

If Exists (select Name 
		   from sysobjects 
		   where name = 'GetGetClassAttachmentByClassIDAndYearIDAndCourseIDAndType' and
		        xtype = 'P')
Drop Procedure GetGetClassAttachmentByClassIDAndYearIDAndCourseIDAndType
Go
Create Procedure GetGetClassAttachmentByClassIDAndYearIDAndCourseIDAndType @ClassID int,
																	@SchoolYearID int,
																	@CourseID int,
																	@IsVideo bit
as

Select *, CC.ArName ArClassName , CC.EnName ENClassName from ClassAttachment A
Inner Join Courses C on A.CourseId = C.CourseID
inner join Class CC on CC.ClassID = A.ClassID

Where (@ClassID = 0 Or A.ClassID = @ClassID ) And
	  (@SchoolYearID = 0 Or A.SchoolYearID = @SchoolYearID ) And 
	  (@CourseID = 0 Or A.CourseID = @CourseID ) and
	  (A.IsVideo = @IsVideo )
order by CreatedDate desc	  

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetAllClassAttachment' and
		        xtype = 'P')
Drop Procedure GetAllClassAttachment
Go
Create Procedure GetAllClassAttachment
as

Select * from ClassAttachment 
order by CreatedDate desc

Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'DeleteClassAttachment' and
		        xtype = 'P')
Drop Procedure DeleteClassAttachment
Go
Create Procedure DeleteClassAttachment @ClassAttachmentID int 
as

Delete ClassAttachment
Where ClassAttachmentID = @ClassAttachmentID

Go
