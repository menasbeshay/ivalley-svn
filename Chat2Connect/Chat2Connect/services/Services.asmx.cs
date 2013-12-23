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
        public bool changePass(string question, string answer, string pass)
        {
            bool update = false;
            MembershipUser user = Membership.GetUser();
            Member member = new Member();

            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
            if (user.PasswordQuestion == question && member.Answer == answer)
            {
                string Oldpass = user.GetPassword(answer);
                update = user.ChangePassword(Oldpass, pass);
                Membership.UpdateUser(user);                
            }
            else
            {
                return update;
            }
            return update;
        }
    }
}
