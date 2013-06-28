using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Flights_GUI.MasterPages
{
    public partial class E_CabinCrew : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMenu();
            }
        }

        private void LoadMenu()
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                if (Roles.IsUserInRole("CabinCrew"))
                {
                    uiLiteralMenu.Text += "<li><a href='../CabinCrew/CrewSchedule.aspx'><span class='icon-box'><i class='icon-calendar'></i></span> Schedule</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../CabinCrew/Profile.aspx'><span class='icon-box'><i class='icon-user'></i></span> Profile</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../CabinCrew/Reports.aspx'><span class='icon-box'><i class='icon-bar-chart'></i></span> Reports</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("CabinCrew Admin") || Roles.IsUserInRole("SuperAdmin"))
                {
                    if (Roles.IsUserInRole("SuperAdmin"))
                    {
                        uiLiteralMenu.Text += "<li><a href='../Default.aspx'><span class='icon-box'><i class='icon-dashboard'></i></span> Back to All Modules</a></li>";
                    }

                    uiLiteralMenu.Text += "<li><a href='../Operation/SectorsList.aspx'><span class='icon-box'><i class='icon-list-alt'></i></span> Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../CabinCrew/CrewSchedule.aspx'><span class='icon-box'><i class='icon-calendar'></i></span> Schedule</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../CabinCrew/Profile.aspx'><span class='icon-box'><i class='icon-user'></i></span> Profile</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../CabinCrew/Reports.aspx'><span class='icon-box'><i class='icon-bar-chart'></i></span> Reports</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Common/Tickets.aspx?ref=o'><span class='icon-box'><i class='icon-group'></i></span> PAX Tickets</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../CabinCrew/Activities.aspx?ref=o'><span class='icon-edit'><i class='icon-group'></i></span> Activities</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                
                }
            }
        }
    }
}