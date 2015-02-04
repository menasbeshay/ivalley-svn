
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using Combo.DAL;
using System.Data;
namespace Combo.BLL
{
	public class ComboComment : _ComboComment
	{
		public ComboComment()
		{
		
		}

        public virtual bool GetPostCommentsByPostID(int pid)
        {
            //this.Where.ComboPostID.Value = pid;
            //this.Where.ComboPostID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;            
            //return this.Query.Load();

            return LoadFromRawSql(@"Select C.*, U.UserName, A.Path ProfilePic from ComboComment C
                                    Inner Join ComboUser U on C.ComboUserID = U.ComboUserID and 
                                                         U.IsDeactivated <> 1
                                    Left join Attachment A on U.ProfileImgID = A.AttachmentID
                                    Where C.ComboPostID = {0}
                                    order by C.CommentDate Desc", pid);
        }

        public virtual bool GetTopPostCommentsByPostID(int pid)
        {
            //this.Where.ComboPostID.Value = pid;
            //this.Where.ComboPostID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            //this.Query.Top = 3;
            //return this.Query.Load();

            return LoadFromRawSql(@"Select top 3 C.*, U.UserName, A.Path ProfilePic from ComboComment C
                                    Inner Join ComboUser U on C.ComboUserID = U.ComboUserID and 
                                                              U.IsDeactivated <> 1
                                    Left join Attachment A on U.ProfileImgID = A.AttachmentID
                                    Where C.ComboPostID = {0}
                                    order by C.CommentDate Desc", pid);
        }

        public virtual bool GetPostCommentsCount(int pid)
        {
            //this.Where.ComboPostID.Value = pid;
            //this.Where.ComboPostID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;            
            //return this.Query.Load();

            return LoadFromRawSql(@"Select count(C.ComboCommentID) TotalCount from ComboComment C                                    
                                    Where C.ComboPostID = {0}", pid);
        }


        public virtual bool GetTopMsgsCommentsByPostID(int mid)
        {
            //this.Where.ComboPostID.Value = pid;
            //this.Where.ComboPostID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            //this.Query.Top = 3;
            //return this.Query.Load();

            return LoadFromRawSql(@"Select top 3 C.*, U.UserName, A.Path ProfilePic from ComboComment C
                                    Inner Join ComboUser U on C.ComboUserID = U.ComboUserID and 
                                                              U.IsDeactivated <> 1
                                    Left join Attachment A on U.ProfileImgID = A.AttachmentID
                                    Where C.ComboMsgID = {0}
                                    order by C.CommentDate Desc", mid);
        }

        public virtual bool GetMsgCommentsCount(int mid)
        {
            //this.Where.ComboPostID.Value = pid;
            //this.Where.ComboPostID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;            
            //return this.Query.Load();

            return LoadFromRawSql(@"Select count(C.ComboCommentID) TotalCount from ComboComment C                                    
                                    Where C.ComboMsgID = {0}", mid);
        }

        public virtual bool GetMsgsCommentsByPostID(int mid)
        {
            //this.Where.ComboPostID.Value = pid;
            //this.Where.ComboPostID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;            
            //return this.Query.Load();

            return LoadFromRawSql(@"Select C.*, U.UserName, A.Path ProfilePic from ComboComment C
                                    Inner Join ComboUser U on C.ComboUserID = U.ComboUserID and 
                                                              U.IsDeactivated <> 1
                                    Left join Attachment A on U.ProfileImgID = A.AttachmentID
                                    Where C.ComboMsgID = {0}
                                    order by C.CommentDate Desc", mid);
        }

	}
}
