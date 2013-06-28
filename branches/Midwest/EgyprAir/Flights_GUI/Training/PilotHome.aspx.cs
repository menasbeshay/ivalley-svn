using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Data;
using System.Web.Security;

namespace Flights_GUI.Training
{
    public partial class PilotHome : System.Web.UI.Page
    {

        #region properties
        public Pilot CurrentPilot
        {
            get
            {
                if (Session["CurrentPilot"] != null)
                    return (Pilot)Session["CurrentPilot"];
                else
                    return null;
            }
            set
            {
                Session["CurrentPilot"] = value;
            }
        }

        public int CurrentPilotID
        {
            get
            {
                if (Request.QueryString["pid"] != null && !string.IsNullOrEmpty(Request.QueryString["pid"]))
                    return Convert.ToInt32(Request.QueryString["pid"].ToString());
                else
                    return 0;
            }
            
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = "Pilot Profile";
                LoadPilotData();
                LoadTitles();
                if (Roles.IsUserInRole("SuperAdmin") || Roles.IsUserInRole("Training Admin"))
                {
                    uiLinkButtonAddTitle.Visible = true;
                }
                else
                {
                    uiLinkButtonAddTitle.Visible = false;
                }
            }
        }

        #endregion

        #region Methods

        private void LoadPilotData()
        {
            if (CurrentPilotID == 0 && CurrentPilot == null)
            {

            }
            else 
            {
                Pilot p = new Pilot();
                if (CurrentPilot == null)
                {
                    p.LoadByPrimaryKey(CurrentPilotID);
                }
                else
                {
                    p = CurrentPilot;
                }

                uiLabelName.Text = p.FirstName + " " + p.SecondName + " " + p.SureName; 
                uiLabelFirstName.Text = p.FirstName;
                uiLabelLastName.Text = p.SecondName + " " + p.SureName;
                uiLabelLicenseNo.Text = p.LicenseNo;
                uiLabelClass.Text = (p.AirportClass.ToString() == "1") ? "A" : (p.AirportClass.ToString() == "2") ? "B" : "C";
                uiLiteralStatus.Text = "<div class='alert ";
                uiLiteralStatus.Text += (p.LicenseStatus == "Approved") ? "alert-success" : (p.LicenseStatus == "Suspended") ? "" : "alert-error";
                uiLiteralStatus.Text += "'>" + p.LicenseStatus + "</div>";
                
                BindTitles();

                PilotCourse pc = new PilotCourse();
                IDataReader reader = pc.GetPilotCoursesByPilotID(p.PilotID);
                DataTable dt = new DataTable();
                dt.Load(reader);

                uiRepeaterCourses.DataSource = dt;
                uiRepeaterCourses.DataBind();
            }
        }
        #endregion

        protected void uiRepeaterCourses_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Literal status = (Literal)e.Item.FindControl("uiLiteralStatus");
                Literal result = (Literal)e.Item.FindControl("uiLiteralResult");

                DataRowView row = (DataRowView)e.Item.DataItem;

                status.Text = "<span class='label ";
                //if (DateTime.Parse(row["ExpiryDate"].ToString()) > DateTime.Now)
                //{
                status.Text += (row["Approved"].ToString() == "1") ? "label-warning'> Not Started" : (row["Approved"].ToString() == "2") ? "label-danger'> Not Assigned" : "label-danger'> Not assigned";
                    status.Text += "</span>";
                //}
                //else
                //{
                //    status.Text += "label-important";
                //    status.Text += "'> Expired </span>";
                //}
                if(row["Result"] == null || string.IsNullOrEmpty(row["Result"].ToString()))
                {
                    result.Text = "";
                }
                else
                {
                    if (row["TrainingID"].ToString() == "0")
                    {
                        result.Text = "";
                    }
                    else if (row["Result"] != null && !string.IsNullOrEmpty(row["Result"].ToString()))
                    {
                        result.Text = (row["Result"].ToString() == "1") ? "Satisfactory" : "Un-Satisfactory";
                    }
                }
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            PilotTitle pt = new PilotTitle();
            pt.AddNew();

            Pilot p = new Pilot();
            if (CurrentPilot == null)
            {
                p.LoadByPrimaryKey(CurrentPilotID);
            }
            else
            {
                p = CurrentPilot;
            }

            pt.TitleID = Convert.ToInt32(uiDropDownListTitle.SelectedValue);
            pt.PilotID = p.PilotID;
            pt.Save();
            BindTitles();
        }

        protected void uiGridViewTitles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteTitle")
            {
                Pilot p = new Pilot();
                if (CurrentPilot == null)
                {
                    p.LoadByPrimaryKey(CurrentPilotID);
                }
                else
                {
                    p = CurrentPilot;
                }

                Flight_BLL.PilotTitle objData = new Flight_BLL.PilotTitle();
                objData.LoadByPrimaryKey(p.PilotID, Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindTitles();
            }
        }



        private void LoadTitles()
        {
            Flight_BLL.Title titles = new Title();
            titles.LoadAll();
            uiDropDownListTitle.DataSource = titles.DefaultView;
            uiDropDownListTitle.DataTextField = "Name";
            uiDropDownListTitle.DataValueField = "TitleID";
            uiDropDownListTitle.DataBind();
        }

        private void BindTitles()
        {
            Pilot p = new Pilot();
            if (CurrentPilot == null)
            {
                p.LoadByPrimaryKey(CurrentPilotID);
            }
            else
            {
                p = CurrentPilot;
            }

            Title pt = new Title();
            pt.GetPilotTitlesByPilotID(p.PilotID);

            uiGridViewTitles.DataSource = pt.DefaultView;
            uiGridViewTitles.DataBind();

            uiRepeaterTitles.DataSource = pt.DefaultView;
            uiRepeaterTitles.DataBind();
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            BindTitles();
        }
    }
}