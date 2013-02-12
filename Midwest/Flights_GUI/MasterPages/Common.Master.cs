using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Flights_GUI.MasterPages
{
    public partial class Common : System.Web.UI.MasterPage
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
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi1' class='hide' href='../CabinCrew/CrewSchedule.aspx'>Schedule</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../CabinCrew/Profile.aspx'>Profile</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi3' class='hide' href='../CabinCrew/Reports.aspx'>Reports</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi4' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("CabinCrew Admin"))
                {
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi1' class='hide' href='../CabinCrew/CrewSchedule.aspx'>Schedule</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../CabinCrew/Profile.aspx'>Profile</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi3' class='hide' href='../CabinCrew/Reports.aspx'>Reports</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='Cmi1' class='hide' href='../Common/Tickets.aspx'>PAX Tickets</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi4' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Pilot"))
                {
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi31' class='hide' href='../Operation/ViewSchedule.aspx'>Schedule</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi32' class='hide' href='../Profile.aspx'>Profile</a></li>";
                    //uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi33' class='hide' href='../PilotFlights.aspx'>My Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi3' class='hide' href='../Operation/Reports.aspx'>Reports</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi34' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Operation"))
                {
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../Operation/FlightDetails.aspx'>Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi3' class='hide' href='../Operation/Reports.aspx'>Flight Reports</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi31' class='hide' href='../Operation/ViewSchedule.aspx'>Schedule</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi35' class='hide' href='../Operation/PilotSchedule.aspx'>Pilot status</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='Cmi1' class='hide' href='../Common/Tickets.aspx'>PAX Tickets</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi34' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Hosting"))
                {
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../Operation/SectorsList.aspx'>Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi34' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Dispatcher"))
                {
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../Operation/SectorsList.aspx'>Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi34' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Flight Data Entry"))
                {
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../Operation/SectorsList.aspx'>Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi3' class='hide' href='../Operation/Reports.aspx'>Flight Reports</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi34' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("SuperAdmin"))
                {
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi1' class='hide' href='../Default.aspx'>Back to All Modules</a></li>";
                    if (Request.QueryString["ref"] != null)
                    {
                        if (Request.QueryString["ref"].ToString() == "o")
                        {
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../Operation/SectorsList.aspx'>Flights' List</a></li>";
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi3' class='hide' href='../Operation/Reports.aspx'>Flight Reports</a></li>";
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi31' class='hide' href='../Operation/ViewSchedule.aspx'>Schedule</a></li>";
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi35' class='hide' href='../Operation/PilotSchedule.aspx'>Pilot status</a></li>";
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='Cmi1' class='hide' href='../Common/Tickets.aspx'>PAX Tickets</a></li>";
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi34' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                        }
                        else if (Request.QueryString["ref"].ToString() == "c")
                        {
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi1' class='hide' href='../CabinCrew/CrewSchedule.aspx'>Schedule</a></li>";
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../CabinCrew/Profile.aspx'>Profile</a></li>";
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi3' class='hide' href='../CabinCrew/Reports.aspx'>Reports</a></li>";
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='Cmi1' class='hide' href='../Common/Tickets.aspx'>PAX Tickets</a></li>";
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi6' class='hide' href='../CabinCrew/Activities.aspx'>Activities</a></li>";
                            uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi4' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                        }

                    }
                }
            }
            else
            {

            }
        }
    }
}