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
            if (!String.IsNullOrEmpty(txtStartDate.Text) && !String.IsNullOrEmpty(txtEndDate.Text))
            {
                log.Where.CreateDate.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Between;
                log.Where.CreateDate.BetweenBeginValue = Helper.Date.ToDate(txtStartDate.Text);
                log.Where.CreateDate.BetweenEndValue = Helper.Date.ToDate(txtEndDate.Text).AddHours(DateTime.Now.Hour);
            }
            else if (!String.IsNullOrEmpty(txtStartDate.Text))
            {
                log.Where.CreateDate.Value = Helper.Date.ToDate(txtStartDate.Text);
                log.Where.CreateDate.Operator = MyGeneration.dOOdads.WhereParameter.Operand.GreaterThanOrEqual;
            }
            else if (!String.IsNullOrEmpty(txtEndDate.Text))
            {
                log.Where.CreateDate.Value = Helper.Date.ToDate(txtStartDate.Text);
                log.Where.CreateDate.Operator=MyGeneration.dOOdads.WhereParameter.Operand.LessThanOrEqual;
            }
            log.Where.MemberID.Value = BLL.Member.CurrentMemberID;
            log.Where.LogTypeID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.In;
            log.Where.LogTypeID.Value = String.Join(",", Helper.Enums.GetAccountingLogTypes().Select(r => (int)r));
            log.Query.Load();

            grdLog.DataSource = log.DefaultView;
            grdLog.DataBind();
        }
    }
}