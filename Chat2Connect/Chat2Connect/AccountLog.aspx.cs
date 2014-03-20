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
            if (!IsPostBack)
            {
                LoadLog();
            }
        }

        private void LoadLog()
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));

            UserTransLog log = new UserTransLog();
            log.GetLogByMemberID(member.MemberID);

            uiGridViewLog.DataSource = log.DefaultView;
            uiGridViewLog.DataBind();
        }

        protected void uiGridViewLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewLog.PageIndex = e.NewPageIndex;
            LoadLog();
        }

        protected void uiGridViewLog_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label label = (Label)e.Row.FindControl("uiLabelSenderName"); 
                Label labelto = (Label)e.Row.FindControl("uiLabelToName");
                DataRowView row = (DataRowView)e.Row.DataItem;
                
                if (!string.IsNullOrEmpty(row["AddedFrom"].ToString()))
                {
                    Member member = new Member();
                    member.LoadByPrimaryKey(Convert.ToInt32(row["AddedFrom"].ToString()));
                    label.Text = member.Name;
                }

                if (!string.IsNullOrEmpty(row["AddedTo"].ToString()))
                {
                    Member member = new Member();
                    member.LoadByPrimaryKey(Convert.ToInt32(row["AddedTo"].ToString()));
                    labelto.Text = member.Name;
                }

            }
        }
    }
}