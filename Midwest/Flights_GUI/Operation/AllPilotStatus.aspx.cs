using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using Flights_GUI.Common;
using System.Data;

namespace Flights_GUI.Operation
{
    public partial class AllPilotStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
 
            }

        }

        protected void uiLinkButtonView_Click(object sender, EventArgs e)
        {
            BindData();
        }

        private void BindData()
        {
            Pilot allpilots = new Pilot();
            allpilots.LoadAll();
            uiRadGridAllPilots.DataSource = allpilots.DefaultView;
            uiRadGridAllPilots.DataBind();
        }

        protected void uiRadGridAllPilots_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item.ItemType == Telerik.Web.UI.GridItemType.Item || e.Item.ItemType == Telerik.Web.UI.GridItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                TimeSpan[] totals = CalculationUtils.CalculatePilotStatus(Convert.ToInt32(row["PilotID"].ToString()), uiTextBoxFrom.Text, uiTextBoxTo.Text);
                Label uiLabelCurrentMonthTotal = (Label)e.Item.FindControl("uiLabelCurrentMonthTotal");
                uiLabelCurrentMonthTotal.Text = Math.Floor(totals[0].TotalHours).ToString() + ":" + totals[0].Minutes.ToString("00");
                Label uiLabelLastMonthTotal = (Label)e.Item.FindControl("uiLabelLastMonthTotal");
                uiLabelLastMonthTotal.Text = Math.Floor(totals[1].TotalHours).ToString() + ":" + totals[1].Minutes.ToString("00");
                Label uiLabelSelectedPeriodTotal = (Label)e.Item.FindControl("uiLabelSelectedPeriodTotal");
                uiLabelSelectedPeriodTotal.Text = Math.Floor(totals[3].TotalHours).ToString() + ":" + totals[3].Minutes.ToString("00");
                Label uiLabelAverageTotal = (Label)e.Item.FindControl("uiLabelAverageTotal");
                uiLabelAverageTotal.Text = Math.Floor(totals[2].TotalHours / 4.0).ToString() + ":" + Math.Floor(totals[2].Minutes / 4.0).ToString("00");
            }
        }

        protected void uiRadGridAllPilots_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindData();
        }

        protected void uiRadGridAllPilots_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            BindData();
        }
    }
}