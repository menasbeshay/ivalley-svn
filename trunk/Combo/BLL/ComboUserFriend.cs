
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using Combo.DAL;
namespace Combo.BLL
{
	public class ComboUserFriend : _ComboUserFriend
	{
		public ComboUserFriend()
		{
		
		}

        public virtual bool GetFriendsByUserID(int userid)
        {
            return LoadFromRawSql(@"Select CU.*, A.Path ProfilePic from ComboUserFriend CF
                                    Inner Join ComboUser CU on CF.ComboFriendID = CU.ComboUserID
                                    Left join Attachment A on CU.ProfileImgID = A.AttachmentID
                                    where CF.ComboUserID = {0} and CF.RequestApproved = 1
                                    union 
                                    Select CU.*, A.Path ProfilePic from ComboUserFriend CF
                                    Inner Join ComboUser CU on CF.ComboUserID = CU.ComboUserID
                                    Left join Attachment A on CU.ProfileImgID = A.AttachmentID
                                    where CF.ComboFriendID = {0} and CF.RequestApproved = 1", userid);
        }

        public virtual bool SearchForFriendsByUserID(int userid, string searchText)
        {
            // get friends - followers - followings - users 
            return LoadFromRawSql(@"Select CU.*, A.Path ProfilePic from ComboUserFriend CF
                                    Inner Join ComboUser CU on CF.ComboFriendID = CU.ComboUserID
                                    Left join Attachment A on CU.ProfileImgID = A.AttachmentID
                                    where CF.ComboUserID = {0} and CF.RequestApproved = 1 and CU.Username like '%{1}%'
                                    union 
                                    Select CU.*, A.Path ProfilePic from ComboUserFriend CF
                                    Inner Join ComboUser CU on CF.ComboUserID = CU.ComboUserID
                                    Left join Attachment A on CU.ProfileImgID = A.AttachmentID
                                    where CF.ComboFriendID = {0} and CF.RequestApproved = 1 and CU.Username like '%{1}%'
                                    union
                                    Select CU.*, A.Path ProfilePic from ProfileFollower PF
                                    Inner Join ComboUser CU on PF.ComboFollowerID = CU.ComboUserID
                                    Left join Attachment A on CU.ProfileImgID = A.AttachmentID
                                    Where PF.ComboUserID = {0} and CU.Username like '%{1}%'
                                    union
                                    Select CU.*, A.Path ProfilePic from ProfileFollower PF
                                    Inner Join ComboUser CU on PF.ComboUserID = CU.ComboUserID
                                    Left join Attachment A on CU.ProfileImgID = A.AttachmentID
                                    Where PF.ComboFollowerID = {0} and CU.Username like '%{1}%'
                                    union 
                                    Select CU.*, A.Path ProfilePic ComboUser CU on CF.ComboFriendID = CU.ComboUserID
                                    Left join Attachment A on CU.ProfileImgID = A.AttachmentID
                                    where CU.Username like '%{1}%'
                                    order by Username asc
                                    ", userid, searchText);
        }
	}
}
