using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace ITravel
{
    /// <summary>
    /// Summary description for LoginHandler
    /// </summary>
    public class LoginHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Form["Username"] != null && context.Request.Form["Password"] != null)
            {
                if (Membership.ValidateUser(context.Request.Form["Username"].ToString(), context.Request.Form["Password"].ToString()))
                {
                    FormsAuthentication.SetAuthCookie(context.Request.Form["Username"].ToString(), true);                    
                    context.Server.TransferRequest("home.aspx");
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}