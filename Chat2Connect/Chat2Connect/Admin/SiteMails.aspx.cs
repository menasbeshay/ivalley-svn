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
                drpSiteMembers.DataValueField = BLL.Member.ColumnNames.MemberID;
                drpSiteMembers.DataTextField = BLL.Member.ColumnNames.Name;
                drpSiteMembers.DataSource = BLL.Member.SiteMembers;
                drpSiteMembers.DataBind();

                if (!String.IsNullOrEmpty(drpSiteMembers.SelectedValue))
                {
                    ctrlMail.MemberID = Convert.ToInt32(drpSiteMembers.SelectedValue);
                }
            }
        }

        protected void lnkLoadMail_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(drpSiteMembers.SelectedValue))
            {
                ctrlMail.MemberID = Convert.ToInt32(drpSiteMembers.SelectedValue);
            }
        }

    }
}