
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using WhiteChat.DAL;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Data;
namespace WhiteChat.BLL
{
	public class Member : _Member
	{
		public Member()
		{
		
		}

        public virtual bool GetMembersByChatRoomID(int ChatRoomID)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@ChatRoomID", SqlDbType.Int, 0), ChatRoomID);

            return LoadFromSql("GetMembersByChatRoomID", parameters);

        }
	}
}