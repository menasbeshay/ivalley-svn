using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin
{
    public partial class SiteMails : System.Web.UI.Page
    {
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_SiteMails.ToString());
                return lstRoles;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["m"] != null && !String.IsNullOrEmpty(Request.QueryString["m"]))
                {
                    Helper.Enums.SiteMembers mailMember;
                    Enum.TryParse<Helper.Enums.SiteMembers>(Request.QueryString["m"],out mailMember);
                    Member member = Member.SiteMembers.Where(m => String.Equals(m.Name,Helper.StringEnum.GetStringValue(mailMember),StringComparison.CurrentCultureIgnoreCase)).FirstOrDefault();
                    if (member != null)
                    {
                        ctrlMail.MemberID = member.MemberID;
                        ctrlMail.MemberName = member.Name;
                    }
                }
                else
                {
                    ctrlMail.Visible = false;
                }
            }
        }

    }
}