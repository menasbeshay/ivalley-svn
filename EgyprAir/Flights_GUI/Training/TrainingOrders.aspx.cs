using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Collections;
using System.Data;

namespace Flights_GUI.Training
{
    public partial class TrainingOrders : System.Web.UI.Page
    {
        #region properties
        public Flight_BLL.Training CurrentTraining
        {
            get
            {
                if (Session["CurrentTraining"] != null)
                    return (Flight_BLL.Training)Session["CurrentTraining"];
                else
                    return null;
            }
            set
            {
                Session["CurrentTraining"] = value;
            }
        }

        public ArrayList TrainingPilots
        {
            get
            {
                if (Session["TrainingPilots"] != null)
                    return (ArrayList)Session["TrainingPilots"];
                else
                    return null;
            }
            set
            {
                Session["TrainingPilots"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                LoadCourses();
                LoadPilots();
                LoadAircrafts();
                BindData();
                uiPanelAllTOs.Visible = true;
                uiPanelEditTO.Visible = false;
            }
        }

        protected void uiGridViewTO_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewTO.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewTO_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditTraining")
            {
                Flight_BLL.Training objData = new Flight_BLL.Training();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                
                uiTextBoxCode.Text = objData.TrainingCode;
                uiDropDownListAircraft.SelectedValue = objData.AirPlaneModel.ToString();
                uiTextBoxTrainingPlace.Text = objData.TrainingPlace;
                uiDropDownListCourses.SelectedValue= objData.CourseID.ToString();
                uiDropDownListTrainer.SelectedValue = objData.TrainerID.ToString();

                if(!objData.IsColumnNull("StartDate") &&!objData.IsColumnNull("EndDate"))
                    uiTextBoxSEDate.Text = objData.StartDate.ToString("dd/MM/yyyy") + " - " + objData.EndDate.ToString("dd/MM/yyyy");

                uiPanelAllTOs.Visible = false;
                uiPanelEditTO.Visible = true;
                CurrentTraining = objData;
                EnableDisablePilotPanel();
                BindPilots();
            }
            else if (e.CommandName == "DeleteTraining")
            {
                Flight_BLL.Training objData = new Flight_BLL.Training();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                PilotCourse pc = new PilotCourse();
                pc.Where.TrainingID.Value = objData.TrainingID;
                pc.Query.Load();
                pc.MarkAsDeleted();
                pc.Save();

                objData.MarkAsDeleted();
                objData.Save();
                CurrentTraining = null;
                BindData();
            }
        }



        protected void uiGridViewTO_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label courseName = (Label)e.Row.FindControl("uiLabelCourse");                
                
                Flight_BLL.Course course = new Flight_BLL.Course();
                DataRowView row = (DataRowView)e.Row.DataItem;
                course.LoadByPrimaryKey(Convert.ToInt32(row["CourseID"].ToString()));
                courseName.Text = course.Name;

                Label AirplaneName = (Label)e.Row.FindControl("uiLabelAircraft");

                Flight_BLL.AirPlane Aircraft = new Flight_BLL.AirPlane();
                DataRowView rowa = (DataRowView)e.Row.DataItem;
                Aircraft.LoadByPrimaryKey(Convert.ToInt32(rowa["AirPlaneModel"].ToString()));
                AirplaneName.Text = Aircraft.Name;

            }
        }

        protected void uiGridViewPilots_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewPilots.PageIndex = e.NewPageIndex;
            BindPilots();
        }

        protected void uiGridViewPilots_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeletePilot")
            {
                Pilot objData = new Pilot();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                PilotCourse pc = new PilotCourse();
                pc.Where.TrainingID.Value = Convert.ToInt32(CurrentTraining.TrainingID);
                pc.Where.PilotID.Value = Convert.ToInt32(objData.PilotID);
                pc.Query.Load();
                if (pc.RowCount == 1)
                {
                    pc.MarkAsDeleted();
                    pc.Save();
                }
                
                BindPilots();
            }
        }



        protected void uiLinkButtonAddPilot_Click(object sender, EventArgs e)
        {
            PilotCourse Member = new PilotCourse();
            if (!PilotExists(Convert.ToInt32(uiDropDownListTrainingPilots.SelectedValue)))
            {
                Pilot p = new Pilot();
                p.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListTrainingPilots.SelectedValue));
                Member.AddNew();
                Member.TrainingID = CurrentTraining.TrainingID;
                Member.PilotID = p.PilotID;
                Member.CourseID = Convert.ToInt32(uiDropDownListCourses.SelectedValue);
                Member.TrainerID= Convert.ToInt32(uiDropDownListTrainer.SelectedValue);
                if(!CurrentTraining.IsColumnNull("StartDate"))
                    Member.StartDate = CurrentTraining.StartDate;
                if (!CurrentTraining.IsColumnNull("EndDate"))
                    Member.EndDate = CurrentTraining.EndDate;
                Member.Save();
            }
            BindPilots();
        }



        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            Flight_BLL.Training objData = new Flight_BLL.Training();
            if (CurrentTraining == null)
                objData.AddNew();
            else
                objData = CurrentTraining;

            objData.TrainingCode = uiTextBoxCode.Text;
            objData.AirPlaneModel = Convert.ToInt32(uiDropDownListAircraft.SelectedValue);
            objData.TrainingPlace = uiTextBoxTrainingPlace.Text;
            objData.CourseID = Convert.ToInt32(uiDropDownListCourses.SelectedValue);
            objData.TrainerID = Convert.ToInt32(uiDropDownListTrainer.SelectedValue);


            try
            {
                if (!string.IsNullOrEmpty(uiTextBoxSEDate.Text))
                {
                    string[] dates = new string[2];
                    dates = uiTextBoxSEDate.Text.Split('-');
                    objData.StartDate = DateTime.ParseExact(dates[0].Trim(), "dd/MM/yyyy", null);
                    objData.EndDate = DateTime.ParseExact(dates[1].Trim(), "dd/MM/yyyy", null);
                    

                }
            }
            catch (Exception ex)
            {
                
            }

            objData.Save();
            CurrentTraining = objData;
            UpdatePilotsData();
            uiPanelAllTOs.Visible = false;
            uiPanelEditTO.Visible = true;
            BindPilots();
            EnableDisablePilotPanel();
        }


        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentTraining = null;
            uiPanelEditTO.Visible = false;
            uiPanelAllTOs.Visible = true;
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentTraining = null;
            uiPanelEditTO.Visible = false;
            uiPanelAllTOs.Visible = true;
            BindData();
        }


        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentTraining = null;
            uiPanelEditTO.Visible = true;
            uiPanelAllTOs.Visible = false;
            EnableDisablePilotPanel();
        }

        protected void uiLinkButtonApprove_Click(object sender, EventArgs e)
        {
            CurrentTraining.IsApproved = true;
            CurrentTraining.Save();
        }

        #endregion


        #region Methods

        private void BindData()
        {
            Flight_BLL.Training objData = new Flight_BLL.Training();
            objData.LoadAll();
            uiGridViewTO.DataSource = objData.DefaultView;
            uiGridViewTO.DataBind();
        }


        private void BindPilots()
        {
            Pilot TrainingPilots = new Pilot();
            TrainingPilots.GetPilotsByTrainingID(CurrentTraining.TrainingID);
            uiGridViewPilots.DataSource = TrainingPilots.DefaultView;
            uiGridViewPilots.DataBind();
        }


        private void LoadAircrafts()
        {
            AirPlane objdata = new AirPlane();
            objdata.LoadAll();
            objdata.Sort = "Name ASC";
            uiDropDownListAircraft.DataSource = objdata.DefaultView;
            uiDropDownListAircraft.DataTextField = "Name";
            uiDropDownListAircraft.DataValueField = "AirplaneID";
            uiDropDownListAircraft.DataBind();
        }


        private void LoadPilots()
        {
            Pilot objdata = new Pilot();
            objdata.GetAllPilots();
            objdata.Sort = "DisplayName ASC";
            uiDropDownListTrainer.DataSource = objdata.DefaultView;
            uiDropDownListTrainer.DataTextField = "DisplayName";
            uiDropDownListTrainer.DataValueField = "PilotID";
            uiDropDownListTrainer.DataBind();

            uiDropDownListTrainingPilots.DataSource = objdata.DefaultView;
            uiDropDownListTrainingPilots.DataTextField = "DisplayName";
            uiDropDownListTrainingPilots.DataValueField = "PilotID";
            uiDropDownListTrainingPilots.DataBind();
        }

        private void LoadCourses()
        {
            Course objdata = new Course();
            objdata.LoadAll();
            objdata.Sort = "Name ASC";
            uiDropDownListCourses.DataSource = objdata.DefaultView;
            uiDropDownListCourses.DataTextField = "Name";
            uiDropDownListCourses.DataValueField = "CourseID";
            uiDropDownListCourses.DataBind();
        }



        private bool PilotExists(int pilotID)
        {
            bool exist = false;
            Pilot Member = new Pilot();
            Member.GetPilotsByTrainingID(CurrentTraining.TrainingID);
            foreach (DataRowView item in Member.DefaultView)
            {
                if (pilotID.ToString() == item["PilotID"].ToString())
                {
                    exist = true;
                    break;
                }
            }
            return exist;
        }


        private void UpdatePilotsData()
        {
            if (CurrentTraining != null)
            {
                PilotCourse pc = new PilotCourse();
                pc.Where.TrainingID.Value = Convert.ToInt32(CurrentTraining.TrainingID);
                pc.Query.Load();
                for (int i = 0; i < pc.RowCount; i++)
                {
                    pc.CourseID = CurrentTraining.CourseID;
                    pc.TrainerID = CurrentTraining.TrainerID;
                    pc.StartDate = CurrentTraining.StartDate;
                    pc.EndDate = CurrentTraining.EndDate;
                    pc.MoveNext();
                }

                pc.Save();
            }
        }

        private void EnableDisablePilotPanel()
        {
            uiPanelPilots.Visible = (CurrentTraining != null);
            uiLinkButtonApprove.Enabled = (CurrentTraining != null);
        }

        private void ClearFields()
        {
            uiTextBoxCode.Text = "";
            uiDropDownListAircraft.SelectedIndex = 0;
            uiTextBoxSEDate.Text = "";
            uiTextBoxTrainingPlace.Text = "";
            uiDropDownListCourses.SelectedIndex = 0;
            uiDropDownListTrainer.SelectedIndex = 0;
            uiDropDownListTrainingPilots.SelectedIndex = 0;
        }
        #endregion

        





    }
}