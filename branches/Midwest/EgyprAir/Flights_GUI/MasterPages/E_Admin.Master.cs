using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Flights_GUI.MasterPages
{
    public partial class E_Admin : System.Web.UI.MasterPage
    {
        public string PageTitle { get { return uiLabelTitle.Text; } set { uiLabelTitle.Text = value;uiLabelContTitle.Text = value; } }
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
                if (Roles.IsUserInRole("Pilot"))
                {
                    //icon-plane
                    uiLiteralMenu.Text += "<li><a href='../Operation/ViewSchedule.aspx'><span class='icon-box'><i class='icon-calendar'></i></span> Schedule</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Profile.aspx'><span class='icon-box'><i class='icon-user'></i></span> Profile</a></li>";
                    //uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi33' class='hide' href='../PilotFlights.aspx'>My Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/Reports.aspx'><span class='icon-box'><i class='icon-bar-chart'></i></span> Reports</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Operation") || Roles.IsUserInRole("SuperAdmin") || Roles.IsUserInRole("Commercial"))
                {
                    if (Roles.IsUserInRole("SuperAdmin"))
                    {
                        uiLiteralMenu.Text += "<li><a href='../Default.aspx'><span class='icon-box'><i class='icon-dashboard'></i></span> Back to All Modules</a></li>";
                    }
                    uiLiteralMenu.Text += "<li><a href='../Operation/Airports.aspx'><span class='icon-box'><i class='icon-plane'></i></span> Airports' List</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../CabinCrew/ManageCrewProfile.aspx'><span class='icon-box'><i class='icon-user'></i></span> Crew Data</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/FlightList.aspx'><span class='icon-box'><i class='icon-list-alt'></i></span> Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/Reports.aspx'><span class='icon-box'><i class='icon-bar-chart'></i></span> Pilot Reports</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/ViewSchedule.aspx'><span class='icon-box'><i class='icon-calendar'></i></span> Schedule</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/Pilotschedule.aspx'><span class='icon-box'><i class='icon-plane'></i></span> Pilot status</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/SendNotifications.aspx'><span class='icon-box'><i class='icon-bell'></i></span> Send notifications</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/FlightBatchs.aspx'><span class='icon-box'><i class='icon-plane'></i></span> Flights Batchs</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/PilotTrx.aspx'><span class='icon-box'><i class='icon-plane'></i></span> Pilot Transactions</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Common/Tickets.aspx?ref=o'><span class='icon-box'><i class='icon-group'></i></span> PAX Tickets</a></li>";                    
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Hosting"))
                {
                    uiLiteralMenu.Text += "<li><a href='../Operation/FlightList.aspx'><span class='icon-box'><i class='icon-list-alt'></i></span> Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Dispatcher"))
                {
                    uiLiteralMenu.Text += "<li><a href='../Operation/FlightList.aspx'><span class='icon-box'><i class='icon-list-alt'></i></span> Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Flight Data Entry"))
                {
                    uiLiteralMenu.Text += "<li><a href='../Operation/FlightList.aspx'><span class='icon-box'><i class='icon-list-alt'></i></span> Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/Reports.aspx'><span class='icon-box'><i class='icon-bar-chart'></i></span> Pilot Reports</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                }

            }
            else
            {

            }
        }
    }
}