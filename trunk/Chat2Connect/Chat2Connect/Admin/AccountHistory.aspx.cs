using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin
{
    public partial class AccountHistory : System.Web.UI.Page
    {
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_AccountHistory.ToString());
                return lstRoles;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtStartDate.Text = Helper.Date.ToString(DateTime.Now.AddDays(-30));
                txtEndDate.Text = Helper.Date.ToString(DateTime.Now);
            }
        }

        protected void grdLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdLog.PageIndex = e.NewPageIndex;
            BindReport();
        }

        protected void lnkBtnLoadReport_Click(object sender, EventArgs e)
        {
            BindReport();
        }

        private void BindReport()
        {
            BLL.MemberLog log = new BLL.MemberLog();
            if (!string.IsNullOrEmpty(txtMemberName.Text))
            {
                BLL.Member member = new BLL.Member();
                if(member.GetByName(txtMemberName.Text))
                {
                    log.Where.MemberID.Value = member.MemberID;
                    log.Where.CreateDate.Operator=MyGeneration.dOOdads.WhereParameter.Operand.Between;
                    log.Where.CreateDate.BetweenBeginValue=Helper.Date.ToDate(txtStartDate.Text);
                    log.Where.CreateDate.BetweenEndValue=Helper.Date.ToDate(txtEndDate.Text).AddDays(1);
                    log.Query.AddOrderBy("CreateDate", MyGeneration.dOOdads.WhereParameter.Dir.DESC);
                    log.Query.Load();
                }
            }

            grdLog.DataSource = log.DefaultView;
            grdLog.DataBind();
        }
    }
}