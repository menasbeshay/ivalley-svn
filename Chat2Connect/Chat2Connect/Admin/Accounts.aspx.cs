using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin
{
    public partial class Accounts : System.Web.UI.Page
    {
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_MailsAccounts.ToString());
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_IPAccounts.ToString());
                return lstRoles;
            }
        }
        #region Properties
        protected enum SearchType
        {
            Mail,
            IP
        }
        protected SearchType SearchMethod
        {
            get
            {
                SearchType result = SearchType.Mail;
                if (ViewState["SearchMethod"] == null)
                {
                    ViewState["SearchMethod"] = SearchType.Mail.ToString();
                }
                Enum.TryParse<SearchType>(Convert.ToString(ViewState["SearchMethod"]), out result);
                return result;
            }
            set
            {
                ViewState["SearchMethod"] = value.ToString();
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkMemberMailSearch_Click(object sender, EventArgs e)
        {

            BindResult();
        }

        private void BindResult()
        {
            if (SearchMethod == SearchType.Mail)
            {
                MembershipUserCollection users = Membership.FindUsersByEmail(txtMemberMailSearch.Text);
                grdMemberResult.DataSource = users;
                grdMemberResult.DataBind();
            }
            else
            {
                grdMemberResult.DataSource = null;
                grdMemberResult.DataBind();
            }
        }

        protected void lnkmemberIPSearch_Click(object sender, EventArgs e)
        {

        }

        protected void grdMemberResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdMemberResult.PageIndex = e.NewPageIndex;
            BindResult();
        }
    }
}