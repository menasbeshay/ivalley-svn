using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web.Security;

namespace BLL
{
    public class MembershipBLL : _Membership
    {
        public bool RegisterMember(string userName, string password, string email, string question, string questionAnswer, out MembershipCreateStatus createStatus)
        {
            MembershipUser objUser = Membership.CreateUser(userName, password, email, question, questionAnswer, true, out createStatus);
            if (createStatus == MembershipCreateStatus.Success)
            {
                BLL.Member member = new BLL.Member();
                member.AddNew();
                member.Answer = questionAnswer;
                member.UserID = new Guid(objUser.ProviderUserKey.ToString());
                member.Name = objUser.UserName;
                member.IsOnLine = true;
                member.Status = 1;
                member.Save();

                return true;
            }
            return false;
        }
    }
}
