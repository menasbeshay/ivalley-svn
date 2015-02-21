
If Exists (select Name 
		   from sysobjects 
		   where name = 'SearchForFriends' and
		        xtype = 'P')
Drop Procedure SearchForFriends
Go
Create Procedure SearchForFriends @UserID int, 
								  @FilterText nvarchar(200) = ''
as

Select CU.*, A.Path ProfilePic from ComboUserFriend CF
Inner Join ComboUser CU on CF.ComboFriendID = CU.ComboUserID and 
                            (CU.IsDeactivated <> 1 or CU.IsDeactivated is null)
Left join Attachment A on CU.ProfileImgID = A.AttachmentID
where CF.ComboUserID = @UserID and CF.RequestApproved = 1 and (cf.isBanned = 1 or cf.isbanned is null) 
	  and CU.Username like '%'  + @FilterText +  '%'
union 
Select CU.*, A.Path ProfilePic from ComboUserFriend CF
Inner Join ComboUser CU on CF.ComboUserID = CU.ComboUserID and 
                            (CU.IsDeactivated <> 1 or CU.IsDeactivated is null)
Left join Attachment A on CU.ProfileImgID = A.AttachmentID
where CF.ComboFriendID = @UserID and CF.RequestApproved = 1 and (cf.isBanned = 1 or cf.isbanned is null)  
	  and CU.Username like '%'  + @FilterText +  '%'
union
Select CU.*, A.Path ProfilePic from ProfileFollower PF
Inner Join ComboUser CU on PF.ComboFollowerID = CU.ComboUserID and
                            (CU.IsDeactivated <> 1 or CU.IsDeactivated is null)
Left join Attachment A on CU.ProfileImgID = A.AttachmentID
Where PF.ComboUserID = @UserID and CU.Username like '%'  + @FilterText +  '%'
union
Select CU.*, A.Path ProfilePic from ProfileFollower PF
Inner Join ComboUser CU on PF.ComboUserID = CU.ComboUserID and
                            (CU.IsDeactivated <> 1 or CU.IsDeactivated is null)
Left join Attachment A on CU.ProfileImgID = A.AttachmentID
Where PF.ComboFollowerID = @UserID and CU.Username like '%'  + @FilterText +  '%'
union 
Select CU.*, A.Path ProfilePic from ComboUser CU                                                                                    
Left join Attachment A on CU.ProfileImgID = A.AttachmentID
where CU.Username like '%'  + @FilterText +  '%' and (CU.IsDeactivated <> 1 or CU.IsDeactivated is null)
order by Username asc



Go 

Alter table combouser
add SecurityQuestion nvarchar(200),
	SecurityAnswer nvarchar(200)