using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin
{
    public partial class StatsReport : System.Web.UI.Page
    {
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_StatsReport.ToString());
                return lstRoles;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtStartDate.Text = Helper.Date.ToString(DateTime.Now.AddDays(-30));
                txtEndDate.Text = Helper.Date.ToString(DateTime.Now);

                BindStats();
            }
        }

        protected void lnkBtnLoadReport_Click(object sender, EventArgs e)
        {
            BindStats();
        }

        private void BindStats()
        {
            DAL.StatsReport st = new DAL.StatsReport();
            grdResult.DataSource = st.Load(Helper.Date.ToDate(txtStartDate.Text), Helper.Date.ToDate(txtEndDate.Text));
            grdResult.DataBind();
        }
    }
}