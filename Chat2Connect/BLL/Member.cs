
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using DAL;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class Member : _Member
    {
        public override decimal Credit_Money
        {
            get
            {
                if (IsColumnNull(Member.ColumnNames.Credit_Money))
                    return 0;
                return base.Credit_Money;
            }
            set
            {
                base.Credit_Money = value;
            }
        }

        public override int Credit_Point
        {
            get
            {
                if (IsColumnNull(Member.ColumnNames.Credit_Point))
                    return 0;
                return base.Credit_Point;
            }
            set
            {
                base.Credit_Point = value;
            }
        }

        public override bool IsOnLine
        {
            get
            {
                if (String.IsNullOrEmpty(s_IsOnLine))
                    return false;
                return base.Getbool(ColumnNames.IsOnLine);
            }
            set
            {
                base.Setbool(ColumnNames.IsOnLine, value);
            }
        }

        public override int Status
        {
            get
            {
                if (IsColumnNull(ColumnNames.Status))
                    return (int)Helper.Enums.MemberStatus.Online;
                return base.Getint(ColumnNames.Status);
            }
            set
            {
                base.Setint(ColumnNames.Status, value);
            }
        }

        public Helper.Enums.MemberStatus StatusValue
        {
            get
            {
                return Helper.EnumUtil.ParseEnum<Helper.Enums.MemberStatus>(Status);
            }
        }

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
        public MemberType MemberType
        {
            get
            {
                if (_memberType == null)
                {
                    _memberType = new MemberType();
                    _memberType.LoadByMemberID(this.MemberID);
                }
                if (_memberType.MemberID != this.MemberID)
                {
                    _memberType.LoadByMemberID(this.MemberID);
                }
                return _memberType;
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

        public static int CurrentMemberID
        {
            get
            {
                return CurrentMember.MemberID;
            }
        }

        private static BLL.Member currentMember;
        public static Member CurrentMember
        {
            get
            {
                if (HttpContext.Current.Items["CurrentMember"] == null)
                {
                    currentMember = new Member();
                    currentMember.LoadCurrentMember();
                    HttpContext.Current.Items["CurrentMember"] = currentMember;
                    return currentMember;
                }
                else
                {
                    return (BLL.Member)HttpContext.Current.Items["CurrentMember"];
                }
                
                
            }
        }

        public Member()
        {
        }

        public override void AddNew()
        {
            base.AddNew();
            RowStatusID = (int)Helper.Enums.RowStatus.Enabled;
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

        public virtual bool GetMemberByActivationCode(Guid ac)
        {
            this.Where.ActivationCode.Value = ac;
            this.Where.ActivationCode.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            return this.Query.Load();            

        }

        public virtual bool GetMemberFriendsByStatus(int MemberID, bool Status)
        {
            ListDictionary parameters = new ListDictionary();
            parameters.Add(new SqlParameter("@MemberID", SqlDbType.Int, 0), MemberID);
            parameters.Add(new SqlParameter("@Status", SqlDbType.Bit, 0), Status);
            return LoadFromSql("GetMemberFriendsByStatus", parameters);

        }

        public bool LoadCurrentMember()
        {
            System.Web.Security.MembershipUser user=System.Web.Security.Membership.GetUser();
            if (user != null)
            {
                return GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
            }
            return false;
        }
        public virtual bool SearchMembers(string query)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@query", SqlDbType.NVarChar, 50), query);

            return LoadFromSql("SearchMembers", parameters);

        }

        public bool SearchForAddFriend(int memberID, string query)
        {
            return LoadFromRawSql(@"SELECT m.*,[MemberTypeSpecID]=ISNULL(mtd.MemberTypeSpecID,1)
                                    FROM Member m INNER JOIN aspnet_Users u on u.UserId=m.UserID
	                                    LEFT JOIN MemberType mt on m.MemberID=mt.MemberID
	                                    LEFT JOIN MemberTypeSpecDuration mtd on mtd.ID=mt.MemberTypeSpecDurationID
                                    WHERE m.RowStatusID={2}
	                                    AND m.MemberID NOT IN (SELECT FriendID FROM MemberFriend WHERE MemberID={0})
	                                    AND m.Name like N'%{1}%'",memberID,query,(int)Helper.Enums.RowStatus.Enabled);
        }

        public virtual bool Proc_SearchMembers( int MemberID ,string query)
        {
            ListDictionary parameters = new ListDictionary();
            parameters.Add(new SqlParameter("@MemberID", SqlDbType.Int, 0), MemberID);
            parameters.Add(new SqlParameter("@Email", SqlDbType.NVarChar, 256), query);
            parameters.Add(new SqlParameter("@UserName", SqlDbType.NVarChar, 256), query);

            return LoadFromSql("Proc_AddFriends_SearchMembers", parameters);

        }

        public virtual bool Proc_SearchMembersByMail(string email)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@Email", SqlDbType.NVarChar, 256), email);


            return LoadFromSql("Proc_SearchMembersByMail", parameters);

        }

        public virtual bool SearchMembersExceptFriends(string query, int MemberID)
        {
            ListDictionary parameters = new ListDictionary();
            parameters.Add(new SqlParameter("@MemberID", SqlDbType.Int, 0), MemberID);
            parameters.Add(new SqlParameter("@query", SqlDbType.NVarChar, 50), query);

            return LoadFromSql("SearchMembersExceptFriends", parameters);

        }

        public virtual bool SearchMembersFriends(string query, int MemberID)
        {
            ListDictionary parameters = new ListDictionary();
            parameters.Add(new SqlParameter("@MemberID", SqlDbType.Int, 0), MemberID);
            parameters.Add(new SqlParameter("@query", SqlDbType.NVarChar, 50), query);

            return LoadFromSql("SearchMembersFriends", parameters);

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
                    result=LoadFromRawSql(@"Select * FROM Member
                                            INNER JOIN MemberType ON MemberType.MemberID=Member.MemberID
                                            INNER JOIN MemberTypeSpecDuration ON MemberType.MemberTypeSpecDurationID=MemberTypeSpecDuration.ID
                                            WHERE MemberTypeSpecDurationID!={0}",Helper.Defaults.MemberTypeSpecDurationID);
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
        public static Member GetSiteMember(string name)
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

        public bool GetFriends(int mid)
        {
            return LoadFromRawSql(@"select [MemberTypeSpecID]=ISNULL(d.MemberTypeSpecID,1),M.*
                                    from MemberFriend MF INNER JOIN Member M ON MF.FriendID=M.MemberID
	                                    INNER JOIN aspnet_Users ON aspnet_Users.UserId=M.UserID
	                                    LEFT JOIN MemberType MT ON MT.MemberID=M.MemberID
	                                    LEFT JOIN MemberTypeSpecDuration d ON MT.MemberTypeSpecDurationID=d.ID 
                                        Left Join MemberFriend MF2 on MF.MemberID = MF2.FriendID And
                                                                      MF.FriendID = MF2.MemberID 
                                    WHERE M.RowStatusID={0} AND MF.MemberID={1}
                                    Order BY M.Name", (int)Helper.Enums.RowStatus.Enabled, mid);
        }

        public bool GetHelpMembers()
        {
            return LoadFromRawSql(@"select d.MemberTypeSpecID,M.* 
                                    from Member M
                                        INNER JOIN aspnet_Users u ON u.UserId=M.UserID
                                        INNER JOIN aspnet_UsersInRoles ur on ur.UserId=u.UserId
                                        INNER JOIN aspnet_Roles r on r.RoleId=ur.RoleId AND r.RoleName={1}
                                        LEFT JOIN MemberType MT ON MT.MemberID=M.MemberID
                                        LEFT JOIN MemberTypeSpecDuration d ON MT.MemberTypeSpecDurationID=d.ID  
                                    WHERE M.RowStatusID={0}
                                    Order BY M.Name", (int)Helper.Enums.RowStatus.Enabled, Helper.Enums.AdminRoles.Admin_SiteHelper.ToString());
        }

        /// <summary>
        /// return list of blocked members by the specified member
        /// </summary>
        /// <param name="mid"></param>
        /// <returns></returns>
        public bool GetBlocked(int mid)
        {
            return LoadFromRawSql(@"select [MemberTypeSpecID]=ISNULL(d.MemberTypeSpecID,1),M.* 
                                    from BlockedMembers MB INNER JOIN Member M ON MB.BlockID=M.MemberID
                                        INNER JOIN aspnet_Users ON aspnet_Users.UserId=M.UserID
                                        LEFT JOIN MemberType MT ON MT.MemberID=M.MemberID
                                        LEFT JOIN MemberTypeSpecDuration d ON MT.MemberTypeSpecDurationID=d.ID 
                                    WHERE M.RowStatusID={0} AND MB.MemberID={1}
                                    Order BY M.Name", (int)Helper.Enums.RowStatus.Enabled, mid);
        }

        /// <summary>
        /// return list of members whom block the specified member id
        /// </summary>
        /// <param name="mid"></param>
        /// <returns></returns>
        public bool GetMembersBlockingMember(int mid)
        {
            return LoadFromRawSql(@"select [MemberTypeSpecID]=ISNULL(d.MemberTypeSpecID,1),M.* 
                                    from BlockedMembers MB INNER JOIN Member M ON MB.MemberID=M.MemberID
                                        INNER JOIN aspnet_Users ON aspnet_Users.UserId=M.UserID
                                        LEFT JOIN MemberType MT ON MT.MemberID=M.MemberID
                                        LEFT JOIN MemberTypeSpecDuration d ON MT.MemberTypeSpecDurationID=d.ID 
                                    WHERE M.RowStatusID={0} AND MB.BlockID={1}
                                    Order BY M.Name", (int)Helper.Enums.RowStatus.Enabled, mid);
        }

        public bool LoadByPrimaryKeyWithTypeSpec(int mid)
        {
            return LoadFromRawSql(@"select [MemberTypeSpecID]=ISNULL(d.MemberTypeSpecID,{2}),M.* 
                                    from Member M
                                        LEFT JOIN MemberType MT ON MT.MemberID=M.MemberID
                                        LEFT JOIN MemberTypeSpecDuration d ON MT.MemberTypeSpecDurationID=d.ID  
                                    WHERE M.RowStatusID={0} AND M.MemberID={1}
                                    Order BY M.Name", (int)Helper.Enums.RowStatus.Enabled, mid,(int)Helper.Enums.TypeSpec.Free);
        }
    }
}
