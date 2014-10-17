using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect
{
    public partial class AccountLog : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            CultureInfo ci = new CultureInfo("ar-EG");
            ci.DateTimeFormat = ci.DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = ci;

            base.InitializeCulture();

        }

        protected void Page_Load(object sender, EventArgs e)
        {
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
            log.GetPointsReport(BLL.Member.CurrentMemberID, txtStartDate.Text, txtEndDate.Text);

            grdLog.DataSource = log.DefaultView;
            grdLog.DataBind();
        }
    }
}