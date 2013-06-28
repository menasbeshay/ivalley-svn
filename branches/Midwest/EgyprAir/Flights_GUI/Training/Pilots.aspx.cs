using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Data;

namespace Flights_GUI.Training
{
    public partial class Pilots : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = "Pilots";
                LoadPilots();
            }
        }

        private void LoadPilots()
        {
            Pilot p = new Pilot();
            p.LoadAll();
            uiRepeaterPilots.DataSource = p.DefaultView;
            uiRepeaterPilots.DataBind();
        }

        protected void uiRepeaterPilots_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Label airportclass = (Label)e.Item.FindControl("uiLabelClass");
                Literal status = (Literal)e.Item.FindControl("uiLiteralStatus");

                DataRowView row = (DataRowView)e.Item.DataItem;

                airportclass.Text = (row["AirportClass"].ToString() == "1") ? "A" : (row["AirportClass"].ToString() == "2") ? "B" :"C";

                status.Text = "<span class='label ";
                status.Text += (row["LicenseStatus"].ToString() == "Approved") ? "label-success" : (row["LicenseStatus"].ToString() == "Suspended") ? "label-warning" : "label-inverse";
                status.Text += "'>" + row["LicenseStatus"].ToString() + "</span>";
            }
        }
    }
}