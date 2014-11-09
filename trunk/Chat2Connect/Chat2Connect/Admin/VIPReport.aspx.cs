using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin
{
    public partial class VIPReport : System.Web.UI.Page
    {
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_VIPReport.ToString());
                return lstRoles;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                uiTextBoxAccCreatedFrom.Text = Helper.Date.ToString(DateTime.Now.AddDays(-30));
                uiTextBoxAccCreatedTo.Text = Helper.Date.ToString(DateTime.Now);

                uiTextBoxRoomCreatedFrom.Text = Helper.Date.ToString(DateTime.Now.AddDays(-30));
                uiTextBoxRoomCreatedTo.Text = Helper.Date.ToString(DateTime.Now);

                BindAcc();

                BindRooms();
            }
        }

        private void BindRooms()
        {
            DAL.StatsReport st = new DAL.StatsReport();
            DataTable dt = new DataTable();
            dt.Load(st.GetVIPRoomsReport(Helper.Date.ToDate(uiTextBoxRoomCreatedFrom.Text), Helper.Date.ToDate(uiTextBoxRoomCreatedTo.Text)));
            uiGridViewRoom.DataSource = dt.DefaultView;
            uiGridViewRoom.DataBind();
        }

        private void BindAcc()
        {
            DAL.StatsReport st = new DAL.StatsReport();
            DataTable dt = new DataTable();
            dt.Load(st.GetVIPMembersReport(Helper.Date.ToDate(uiTextBoxAccCreatedFrom.Text), Helper.Date.ToDate(uiTextBoxAccCreatedTo.Text)));
            uiGridViewAcc.DataSource = dt.DefaultView;
            uiGridViewAcc.DataBind();
        }

        protected void uiGridViewAcc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewAcc.PageIndex = e.NewPageIndex;
            BindAcc();
        }

        protected void uiGridViewRoom_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewRoom.PageIndex = e.NewPageIndex;
            BindRooms();
        }

        protected void uiLinkButtonRunRoom_Click(object sender, EventArgs e)
        {
            BindRooms();
        }

        protected void uiLinkButtonRunAcc_Click(object sender, EventArgs e)
        {
            BindAcc();
        }
    }
}