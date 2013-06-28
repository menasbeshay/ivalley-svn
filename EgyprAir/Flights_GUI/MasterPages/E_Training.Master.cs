using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Flights_GUI.MasterPages
{
    public partial class E_Training : System.Web.UI.MasterPage
    {

        public string CustomPageTitle 
        {
            get { return uiLabelTitle.Text; }
            set { uiLabelTitle.Text = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMenu();
            }

            if (Roles.IsUserInRole("Pilot"))
            {
                string s1 = @"<li class='dropdown' id='header_notification_bar'><a href='#' class='dropdown-toggle'
                            data-toggle='dropdown'><i class='icon-bell-alt'></i>
                            
                                <span class='badge badge-warning'>3</span>
                        </a>
                            <ul class='dropdown-menu extended notification'>
                                <li>
                                    <p>
                                        You have 3 new notifications</p>
                                </li>
                                <li><a href='#'><span class='label label-important'><i class='icon-bolt'></i></span>
                                    English Level 3 wil be expired within <span class='small italic'>34 days</span>
                                </a></li>
                                <li><a href='#'><span class='label label-warning'><i class='icon-bolt'></i></span>Security
                                    will be expired within <span class='small italic'>15 days</span> </a></li>
                                <li><a href='#'><span class='label label-important'><i class='icon-bolt'></i></span>
                                    SMS will be expired within <span class='small italic'>3 days</span> </a></li>
                                <li><a href='#'>See all notifications</a> </li>
                            </ul>
                             </li>";
                Literal1.Text = s1;

            }
            else
            {
                string s1 = @"<li class='dropdown' id='header_notification_bar'><a href='#' class='dropdown-toggle'
                            data-toggle='dropdown'><i class='icon-bell-alt'></i>   
                                 <span class='badge badge-warning'>3</span>                         
                        </a>          
                <ul class='dropdown-menu extended notification'>
                                <li>
                                    <p>
                                        You have 3 new notifications</p>
                                </li>
                                <li><a href='#'><span class='label label-important'><i class='icon-bolt'></i></span>
                                     3 pilots' licenses wil be expired within <span class='small italic'>34 days</span>
                                </a></li>
                                <li><a href='#'><span class='label label-warning'><i class='icon-bolt'></i></span>2 pilots has been blocked <span class='small italic'>1 days</span> </a></li>
                                <li><a href='#'><span class='label label-important'><i class='icon-bolt'></i></span>
                                    10 courses has been started today <span class='small italic'>1 days</span> </a></li>
                                <li><a href='#'>See all notifications</a> </li>
                            </ul>                  
                             </li>";
                Literal1.Text = s1;
                
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
                else if (Roles.IsUserInRole("CabinCrew Admin"))
                {
                    uiLiteralMenu.Text += "<li><a href='../CabinCrew/CrewSchedule.aspx'><span class='icon-box'><i class='icon-calendar'></i></span> Schedule</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../CabinCrew/Profile.aspx'><span class='icon-box'><i class='icon-user'></i></span> Profile</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../CabinCrew/Reports.aspx'><span class='icon-box'><i class='icon-bar-chart'></i></span> Reports</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Common/Tickets.aspx?ref=o'><span class='icon-box'><i class='icon-group'></i></span> PAX Tickets</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Pilot"))
                {
                    uiLiteralMenu.Text += "<li><a href='../Operation/ViewSchedule.aspx'><span class='icon-box'><i class='icon-calendar'></i></span> Schedule</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Profile.aspx'><span class='icon-box'><i class='icon-user'></i></span> Profile</a></li>";
                    //uiLiteralMenu.Text += "<li class='VMenuBorder'></li><li><a id='mi33' class='hide' href='../PilotFlights.aspx'>My Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/Reports.aspx'><span class='icon-box'><i class='icon-bar-chart'></i></span> Reports</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Operation"))
                {
                    uiLiteralMenu.Text += "<li><a href='../Operation/SectorsList.aspx'><span class='icon-box'><i class='icon-list-alt'></i></span> Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/Reports.aspx'><span class='icon-box'><i class='icon-bar-chart'></i></span> Flight Reports</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/ViewSchedule.aspx'><span class='icon-box'><i class='icon-calendar'></i></span> Schedule</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/Pilotschedule.aspx'><span class='icon-box'><i class='icon-plane'></i></span> Pilot status</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Common/Tickets.aspx?ref=o'><span class='icon-box'><i class='icon-group'></i></span> PAX Tickets</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Hosting"))
                {
                    uiLiteralMenu.Text += "<li><a href='../Operation/SectorsList.aspx'><span class='icon-box'><i class='icon-list-alt'></i></span> Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Dispatcher"))
                {
                    uiLiteralMenu.Text += "<li><a href='../Operation/SectorsList.aspx'><span class='icon-box'><i class='icon-list-alt'></i></span> Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("Flight Data Entry"))
                {
                    uiLiteralMenu.Text += "<li><a href='../Operation/SectorsList.aspx'><span class='icon-box'><i class='icon-list-alt'></i></span> Flights' List</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Operation/Reports.aspx'><span class='icon-box'><i class='icon-bar-chart'></i></span> Flight Reports</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                }
                else if (Roles.IsUserInRole("SuperAdmin") || Roles.IsUserInRole("Training Admin"))
                {
                    uiLiteralMenu.Text += "<li><a href='../Default.aspx'><span class='icon-box'><i class='icon-dashboard'></i></span> Back to All Modules</a></li>";
                    uiLiteralMenu.Text += @"<li class='has-sub'><a href='#'><span class='icon-box'><i class='icon-bar-chart'></i></span> Reports <span class='arrow'></span></a>
                                            <ul class='sub'>
                                                <li><a class='' href='#'>Pilots' Status</a></li>
                                                <li><a class='' href='#'>Pilots' Log</a></li>
                                                <li><a class='' href='#'>Trainers' Log</a></li>                                                
                                            </ul>
                                            </li>";
                    if (Request.QueryString["ref"] != null)
                    {
                        if (Request.QueryString["ref"].ToString() == "o")
                        {
                            uiLiteralMenu.Text += "<li><a href='../Operation/SectorsList.aspx'><span class='icon-box'><i class='icon-list-alt'></i></span> Flights' List</a></li>";
                            uiLiteralMenu.Text += "<li><a href='../Operation/Reports.aspx'><span class='icon-box'><i class='icon-bar-chart'></i></span> Flight Reports</a></li>";
                            uiLiteralMenu.Text += "<li><a href='../Operation/ViewSchedule.aspx'><span class='icon-box'><i class='icon-calendar'></i></span> Schedule</a></li>";
                            uiLiteralMenu.Text += "<li><a href='../Operation/Pilotschedule.aspx'><span class='icon-box'><i class='icon-plane'></i></span> Pilot status</a></li>";
                            uiLiteralMenu.Text += "<li><a href='../Common/Tickets.aspx?ref=o'><span class='icon-box'><i class='icon-group'></i></span> PAX Tickets</a></li>";
                            uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                        }
                        else if (Request.QueryString["ref"].ToString() == "c")
                        {
                            uiLiteralMenu.Text += "<li><a href='../CabinCrew/CrewSchedule.aspx'><span class='icon-box'><i class='icon-calendar'></i></span> Schedule</a></li>";
                            uiLiteralMenu.Text += "<li><a href='../CabinCrew/Profile.aspx'><span class='icon-box'><i class='icon-user'></i></span> Profile</a></li>";
                            uiLiteralMenu.Text += "<li><a href='../CabinCrew/Reports.aspx'><span class='icon-box'><i class='icon-bar-chart'></i></span> Reports</a></li>";
                            uiLiteralMenu.Text += "<li><a href='../Common/Tickets.aspx?ref=o'><span class='icon-box'><i class='icon-group'></i></span> PAX Tickets</a></li>";
                            uiLiteralMenu.Text += "<li><a href='../CabinCrew/Activities.aspx?ref=o'><span class='icon-edit'><i class='icon-group'></i></span> Activities</a></li>";
                            uiLiteralMenu.Text += "<li><a href='../Changepassword.aspx'><span class='icon-box'><i class='icon-user-md'></i></span> Change Password</a></li>";
                        }

                    }

                    uiLiteralMenu.Text += "<li><a href='../Training/courses.aspx'><span class='icon-box'><i class='icon-briefcase'></i></span> Courses</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Training/titlecourses.aspx'><span class='icon-box'><i class='icon-check'></i></span> Title Courses</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Training/pilots.aspx'><span class='icon-box'><i class='icon-plane'></i></span> Pilots</a></li>";
                    uiLiteralMenu.Text += "<li><a href='../Training/TrainingOrders.aspx'><span class='icon-box'><i class='icon-certificate'></i></span> Training Orders</a></li>";
                }
            }
            else
            {

            }
        }
    }
}