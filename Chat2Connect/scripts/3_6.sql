
If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMemberGifts' and
		        xtype = 'P')
Drop Procedure GetMemberGifts
Go
Create Procedure GetMemberGifts @MemberID int
as

select U.UserName Name, MG.*, US.UserName SenderName, G.Name GiftName, G.PicPath
from Member M 
Inner join dbo.aspnet_Users U on M.UserID = U.UserID
Inner Join MemberGift MG on M.MemberID = MG.MemberID
Inner join Member S on MG.SenderID = S.MemberID
Inner join dbo.aspnet_Users US on S.UserID = US.UserID
Inner Join Gift G on G.GiftID = MG.GiftID 
where MG.MemberID = @MemberID							 
Go


If Exists (select Name 
		   from sysobjects 
		   where name = 'GetMemberSentGifts' and
		        xtype = 'P')
Drop Procedure GetMemberSentGifts
Go
Create Procedure GetMemberSentGifts @MemberID int
as

select U.UserName Name, MG.*, US.UserName SenderName, G.Name GiftName, G.PicPath
from Member M 
Inner join dbo.aspnet_Users U on M.UserID = U.UserID
Inner Join MemberGift MG on M.MemberID = MG.MemberID
Inner join Member S on MG.SenderID = S.MemberID
Inner join dbo.aspnet_Users US on S.UserID = US.UserID
Inner Join Gift G on G.GiftID = MG.GiftID 
where MG.SenderID = @MemberID							 
Go