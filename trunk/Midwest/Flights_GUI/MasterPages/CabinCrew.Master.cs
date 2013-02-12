using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Flights_GUI.MasterPages
{
    public partial class CabinCrew : System.Web.UI.MasterPage
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
                else if (Roles.IsUserInRole("CabinCrew Admin") || Roles.IsUserInRole("SuperAdmin"))
                {
                    if (Roles.IsUserInRole("SuperAdmin"))
                    {
                        uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi1' class='hide' href='../Default.aspx'>Back to All Modules</a></li>";
                    }
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../Operation/SectorsList.aspx'>Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi1' class='hide' href='../CabinCrew/CrewSchedule.aspx'>Schedule</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi2' class='hide' href='../CabinCrew/Profile.aspx'>Profile</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi3' class='hide' href='../CabinCrew/Reports.aspx'>Reports</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='Cmi1' class='hide' href='../Common/Tickets.aspx?ref=c'>PAX Tickets</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi6' class='hide' href='../CabinCrew/Activities.aspx'>Activities</a></li>";
                    uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi4' class='hide' href='../ChangePassword.aspx'>Change Password</a></li>";
                }
            }
            else
            {

            }
        }
    }
}