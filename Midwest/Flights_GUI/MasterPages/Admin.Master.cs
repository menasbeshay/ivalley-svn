using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Flights_GUI.MasterPages
{
    public partial class Admin : System.Web.UI.MasterPage
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
                if(Roles.IsUserInRole("Pilot"))
                {
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi31' class='hide' href='../Operation/ViewSchedule.aspx'>Schedule</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi32' class='hide' href='../Profile.aspx'>Profile</a></li>";
                    //uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi33' class='hide' href='../PilotFlights.aspx'>My Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi3' class='hide' href='../Operation/Reports.aspx'>Reports</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi34' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Operation") || Roles.IsUserInRole("SuperAdmin"))
                {
                    if (Roles.IsUserInRole("SuperAdmin"))
                    {
                        uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi1' class='hide' href='../Default.aspx'>Back to All Modules</a></li>";
                    }
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../Operation/FlightDetails.aspx'>Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi3' class='hide' href='../Operation/Reports.aspx'>Flight Reports</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi31' class='hide' href='../Operation/ViewSchedule.aspx'>Schedule</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi35' class='hide' href='../Operation/PilotSchedule.aspx'>Pilot status</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='Cmi1' class='hide' href='../Common/Tickets.aspx?ref=o'>PAX Tickets</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi34' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
                else if(Roles.IsUserInRole("Hosting"))
                {
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../Operation/FlightDetails.aspx'>Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi34' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
                else if(Roles.IsUserInRole("Dispatch"))
                {
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../Operation/FlightDetails.aspx'>Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi34' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Flight Data Entry"))
                {
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../Operation/FlightDetails.aspx'>Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi3' class='hide' href='../Operation/Reports.aspx'>Flight Reports</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi34' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
                
            }
            else
            {
 
            }
        }
    }
}