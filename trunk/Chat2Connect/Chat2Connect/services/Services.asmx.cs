using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using BLL;

namespace Chat2Connect.services
{
    /// <summary>
    /// Summary description for Services
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Services : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool changeMail(string question,string answer, string mail)
        {            
            MembershipUser user = Membership.GetUser();
            Member member = new Member();
            
            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
            if (user.PasswordQuestion == question && member.Answer == answer)
            {
                MembershipUser[] users = Membership.GetAllUsers().Cast<MembershipUser>().Where(m => m.Email == mail).ToArray();
                if (users.Length < 15)
                {
                    user.Email = mail;
                    Membership.UpdateUser(user);
                }

                else
                    return false;
            }
            else
            {
                return false;
            }
            return true;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool changePass(string oldpass ,string question, string answer, string pass)
        {
            bool update = false;
            MembershipUser user = Membership.GetUser();
            Member member = new Member();

            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
            if (user.PasswordQuestion == question && member.Answer == answer)
            {
                string Oldpass = oldpass;
                update = user.ChangePassword(Oldpass, pass);
                if(update)
                    Membership.UpdateUser(user);                
            }
            else
            {
                return update;
            }
            return update;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool changeStatusMsg(string status)
        {
            MembershipUser user = Membership.GetUser();
            Member member = new Member();

            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
            member.StatusMsg = status;
            member.Save();
            return true;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool changeStatus(int status)
        {
            MembershipUser user = Membership.GetUser();
            Member member = new Member();

            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
            member.Status = status;            
            member.Save();
            return true;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string[] SearchMembers(string query)
        {
            List<string> listString = new List<string>();
            Member member = new Member();
            member.SearchMembers(query);


            if (member.RowCount > 0)
            {
                for (int i = 0; i < member.RowCount; i++)
                {
                    listString.Add(member.MemberID + "##" + member.Name);
                    //ItemsJSON += "{'Name': '" + items.ItemCode + " - " + items.Name + "' , 'ItemID': '" + items.ItemID + "'}";
                    member.MoveNext();
                }
            }

            string[] str = listString.ToArray();
            return str;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string[] SearchMembersExceptFriends(string query, string MemberID)
        {
            List<string> listString = new List<string>();
            Member member = new Member();
            member.SearchMembersExceptFriends(query, Convert.ToInt32(MemberID));


            if (member.RowCount > 0)
            {
                for (int i = 0; i < member.RowCount; i++)
                {
                    listString.Add(member.MemberID + "##" + member.Name);
                    //ItemsJSON += "{'Name': '" + items.ItemCode + " - " + items.Name + "' , 'ItemID': '" + items.ItemID + "'}";
                    member.MoveNext();
                }
            }

            string[] str = listString.ToArray();
            return str;
        }
    }
}
