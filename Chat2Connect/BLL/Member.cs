
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using DAL;
using System.Collections.Generic;
using System.Linq;

namespace BLL
{
    public class Member : _Member
    {
        #region Extended Properties
        private System.Web.Security.MembershipUser _membershipUser;
        private bool isLoaded;
        private System.Web.Security.MembershipUser _MembershipUser
        {
            get
            {
                if (!isLoaded)
                {
                    _membershipUser = System.Web.Security.Membership.GetUser(this.UserID);
                    isLoaded = true;
                }
                return _membershipUser;
            }
        }

        public string Email
        {
            get
            {
                if (_MembershipUser != null)
                    return _MembershipUser.Email;
                return "";
            }
        }

        public string UserName
        {
            get
            {
                if (_MembershipUser != null)
                    return _MembershipUser.UserName;
                return "";
            }
        }

        public string Password
        {
            get
            {
                if (_MembershipUser != null)
                    return _MembershipUser.GetPassword(this.Answer);
                return "";
            }
        }
        //PasswordQuestion
        public string PasswordQuestion
        {
            get
            {
                if (_MembershipUser != null)
                    return _MembershipUser.PasswordQuestion;
                return "";
            }
        }
        //CreationDate
        public DateTime CreationDate
        {
            get
            {
                if (_MembershipUser != null)
                    return _MembershipUser.CreationDate;
                return DateTime.MinValue;
            }
        }

        private MemberType _memberType;
        public string MemberTypeColor
        {
            get
            {
                if (string.IsNullOrEmpty(this.s_MemberTypeID))
                    return "";
                if (_memberType == null)
                {
                    _memberType = new MemberType();
                    _memberType.LoadByPrimaryKey(this.MemberTypeID);
                }

                return _memberType.Color;
            }
        }

        public string StatusName
        {
            get
            {
                if (!String.IsNullOrEmpty(this.s_Status))
                {
                    return Helper.StringEnum.GetStringValue((Helper.Enums.MemberStatus)this.Status);
                }
                return "";
            }
        }

        #endregion

        #region Extended Methods
        public int FriendsCount()
        {
            MemberFriend friends = new MemberFriend();
            friends.GetAllMemberFriends(this.MemberID);

            return friends.RowCount;
        }
        #endregion
        public Member()
        {

        }

        public virtual bool GetMemberByUserId(Guid UserId)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@UserId", SqlDbType.UniqueIdentifier, 0), UserId);

            return LoadFromSql("GetMemberByUserId", parameters);

        }

        public virtual bool GetMemberByUserName(string userName)
        {
            _membershipUser = System.Web.Security.Membership.GetUser(userName);
            isLoaded = true;
            if (_membershipUser == null)
                return false;

            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@UserId", SqlDbType.UniqueIdentifier, 0), new Guid(_membershipUser.ProviderUserKey.ToString()));

            return LoadFromSql("GetMemberByUserId", parameters);

        }

        public virtual bool GetMemberFriendsByStatus(int MemberID, bool Status)
        {
            ListDictionary parameters = new ListDictionary();
            parameters.Add(new SqlParameter("@MemberID", SqlDbType.Int, 0), MemberID);
            parameters.Add(new SqlParameter("@Status", SqlDbType.Bit, 0), Status);
            return LoadFromSql("GetMemberFriendsByStatus", parameters);

        }


        public virtual bool SearchMembers(string query)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@query", SqlDbType.NVarChar, 50), query);

            return LoadFromSql("SearchMembers", parameters);

        }

        public virtual bool SearchMembersExceptFriends(string query, int MemberID)
        {
            ListDictionary parameters = new ListDictionary();
            parameters.Add(new SqlParameter("@MemberID", SqlDbType.Int, 0), MemberID);
            parameters.Add(new SqlParameter("@query", SqlDbType.NVarChar, 50), query);

            return LoadFromSql("SearchMembersExceptFriends", parameters);

        }

        public bool GetByName(string name)
        {
            Where.Name.Value = name;
            return Query.Load();

        }

        public bool GetByAliase(Helper.Enums.AdminMailAddressAlias aliase)
        {
            bool result = false;
            switch (aliase)
            {
                case Helper.Enums.AdminMailAddressAlias.All:
                    result = Query.Load();
                    break;
                case Helper.Enums.AdminMailAddressAlias.Offline:
                    Where.IsOnLine.Value = false;
                    result = Query.Load();
                    break;
                case Helper.Enums.AdminMailAddressAlias.Online:
                    Where.IsOnLine.Value = true;
                    result = Query.Load();
                    break;
                case Helper.Enums.AdminMailAddressAlias.TypedAccount:
                    //Where.MemberTypeID.Value = DBNull.Value;
                    Where.MemberTypeID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.IsNotNull;
                    result = Query.Load();
                    break;
                default:
                    break;
            }

            return result;
        }

        private static List<Member> lstSiteMembers;
        public static List<Member> SiteMembers
        {
            get
            {
                if (lstSiteMembers == null)
                {
                    lstSiteMembers = Helper.EnumUtil.GetValues<Helper.Enums.SiteMembers>().Select(m => GetSiteMember(Helper.StringEnum.GetStringValue(m))
                        ).ToList();
                }
                return lstSiteMembers;
            }
        }
        private static Member GetSiteMember(string name)
        {
            Member member = new Member();
            if (!member.GetByName(name))
            {
                member.AddNew();
                member.Name = name;
                // throwing exception when insert rowstatusid = null
                member.RowStatusID = 1;
                member.Save();
            }
            return member;
        }
    }
}
