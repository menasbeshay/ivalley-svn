using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Helper
{
    public class Admin
    {
        public class Defaults
        {
            public static string UserName
            {
                get
                {
                    if (System.Web.Configuration.WebConfigurationManager.AppSettings["AdminUser"] != null)
                    {
                        return System.Web.Configuration.WebConfigurationManager.AppSettings["AdminUser"];
                    }
                    else
                        return "Admin";
                }
            }

            public static string Password
            {
                get
                {
                    if (System.Web.Configuration.WebConfigurationManager.AppSettings["AdminPassword"] != null)
                    {
                        return System.Web.Configuration.WebConfigurationManager.AppSettings["AdminPassword"];
                    }
                    else
                        return "Admin123";
                }
            }

            public static string Email
            {
                get { return "admin@chat2connect.com"; }
            }

            public static string Question
            {
                get
                {
                    return "Question";
                }
            }

            public static string Answer
            {
                get
                {
                    return "Answer";
                }
            }
        }
        
        public static bool IsAdmin()
        {
            MembershipUser user = Membership.GetUser();
            if (user != null)
                return IsAdmin(user.UserName);

            return false;
        }

        public static bool IsAdmin(string userName)
        {
            bool isAdmin = String.Equals(userName, Defaults.UserName); //default admin user is super admin assumed to be has all roles
            if (!isAdmin)
            {
                foreach (var adminRole in EnumUtil.GetValues<Enums.AdminRoles>())
                {
                    if (Roles.IsUserInRole(userName, adminRole.ToString()))
                    {
                        return true;
                    }
                }
            }

            return isAdmin;
        }

        public static bool HasRole(string roleName)
        {
            MembershipUser user = Membership.GetUser();
            if (user != null)
                return HasRole(roleName, user.UserName);

            return false;
        }

        public static bool HasRole(string roleName, string userName)
        {
            if (String.Equals(userName, Defaults.UserName))
                return true;

            return Roles.IsUserInRole(userName, roleName);
        }

        public static bool HasAnyOfRoles(List<string> roles,string userName)
        {
            for(int i=0;i<roles.Count;i++)
            {
                if (HasRole(roles[i], userName))
                    return true;
            }
            return false;
        }

        public static bool HasAnyOfRoles(List<string> roles)
        {
            MembershipUser user = Membership.GetUser();
            if (user != null)
                return HasAnyOfRoles(roles,user.UserName);

            return false;
        }
    }
}
