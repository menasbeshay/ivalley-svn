using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditFees : System.Web.UI.Page
    {
        public int CurrentFees
        {
            get
            {
                if (Session["CurrentFees"] != null && !string.IsNullOrEmpty(Session["CurrentFees"].ToString()) && Session["CurrentFees"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentFees"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentFees"] = value;
            }
        }
        public int CurrentStudentActive
        {
            get
            {
                if (Session["CurrentStudentActive"] != null && !string.IsNullOrEmpty(Session["CurrentStudentActive"].ToString()) && Session["CurrentStudentActive"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentStudentActive"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentStudentActive"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                if (CurrentStudentActive != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetFeesByStudentIDAndSchoolYear(CurrentStudentActive,Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxRemainingFees.Text = ds.Tables[0].Rows[0]["RemainingFeesLastYear"].ToString();
                        uiTextBoxBooksFees.Text = ds.Tables[0].Rows[0]["BooksFees"].ToString();
                        uiTextBoxBusFees.Text = ds.Tables[0].Rows[0]["BusFees"].ToString();
                        uiTextBoxUniformFees.Text = ds.Tables[0].Rows[0]["UniformFees"].ToString();
                        uiTextBoxActFees.Text = ds.Tables[0].Rows[0]["ActivitiesFees"].ToString();
                        uiTextBoxOtherFees.Text = ds.Tables[0].Rows[0]["OtherFees"].ToString();
                    }
                    uiPanelCurrentFees.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {
                    uiPanelCurrentFees.Visible = true;
                    uiPanelCurrent.Visible = false;
                    BindStudentsData();
                }
            }
        }

        private void BindStudentsData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.SearchStudents(Convert.ToInt32(uiDropDownListClasses.SelectedValue), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), uiTextBoxSearchText.Text);
            uiGridViewStudents.DataSource = ds;
            uiGridViewStudents.DataBind();      
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetFeesByClassAndClassRoomAndSchoolYear(Convert.ToInt32(uiDropDownListClasses.SelectedValue),
                                                            Convert.ToInt32(uiDropDownListClassRooms.SelectedValue),
                                                            Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            uiGridViewStudentsFees.DataSource = ds;
            uiGridViewStudentsFees.DataBind();     
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            uiDropDownListClasses.DataSource = db.GetAllClass();
            uiDropDownListClasses.DataTextField = "ArName";
            uiDropDownListClasses.DataValueField = "ClassID";
            uiDropDownListClasses.DataBind();
            uiDropDownListClasses.SelectedIndex = 0;

            uiDropDownListClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListClassRooms.DataTextField = "ArName";
            uiDropDownListClassRooms.DataValueField = "ClassRoomID";
            uiDropDownListClassRooms.DataBind();

            uiDropDownListSchoolYear.DataSource = db.GetAllSchoolYear();
            uiDropDownListSchoolYear.DataTextField = "ArName";
            uiDropDownListSchoolYear.DataValueField = "SchoolYearID";
            uiDropDownListSchoolYear.DataBind();
            uiDropDownListSchoolYear.SelectedIndex = 0;
        }

        protected void uiDropDownListClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            uiDropDownListClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListClassRooms.DataTextField = "ArName";
            uiDropDownListClassRooms.DataValueField = "ClassRoomID";
            uiDropDownListClassRooms.DataBind();
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            BindStudentsData();
        }        

        private void ClearFields()
        {
            uiTextBoxRemainingFees.Text = "0";
            uiTextBoxBooksFees.Text = "0";
            uiTextBoxBusFees.Text = "0";
            uiTextBoxUniformFees.Text = "0";
            uiTextBoxActFees.Text = "0";
            uiTextBoxOtherFees.Text = "0";
            
        }

        protected void uiGridViewStudentsFees_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewStudentsFees.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewStudentsFees_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditFees")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());                
                CurrentFees = id;                
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetFees(CurrentFees);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxRemainingFees.Text = ds.Tables[0].Rows[0]["RemainingFeesLastYear"].ToString();
                    uiTextBoxBooksFees.Text = ds.Tables[0].Rows[0]["BooksFees"].ToString();
                    uiTextBoxBusFees.Text = ds.Tables[0].Rows[0]["BusFees"].ToString();
                    uiTextBoxUniformFees.Text = ds.Tables[0].Rows[0]["UniformFees"].ToString();
                    uiTextBoxActFees.Text = ds.Tables[0].Rows[0]["ActivitiesFees"].ToString();
                    uiTextBoxOtherFees.Text = ds.Tables[0].Rows[0]["OtherFees"].ToString();              
                }
                uiPanelCurrentFees.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteFees")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentFees = id;
                DBLayer db = new DBLayer();
                db.DeleteFees(id);
                uiPanelCurrentFees.Visible = false;
                uiPanelCurrent.Visible = true;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentFees != 0)
            {
                db.UpdateFees(CurrentFees, float.Parse(uiTextBoxRemainingFees.Text), float.Parse(uiTextBoxBooksFees.Text),float.Parse(uiTextBoxBusFees.Text),float.Parse(uiTextBoxUniformFees.Text),float.Parse(uiTextBoxOtherFees.Text),float.Parse(uiTextBoxActFees.Text),CurrentStudentActive, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            }
            else
            {
                db.AddFees(float.Parse(uiTextBoxRemainingFees.Text), float.Parse(uiTextBoxBooksFees.Text), float.Parse(uiTextBoxBusFees.Text), float.Parse(uiTextBoxUniformFees.Text), float.Parse(uiTextBoxOtherFees.Text), float.Parse(uiTextBoxActFees.Text), CurrentStudentActive, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            }
            uiPanelCurrentFees.Visible = false;
            uiPanelCurrent.Visible = true;
            ClearFields();
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentStudentActive = 0;
            CurrentFees = 0;
            uiPanelCurrentFees.Visible = false;
            uiPanelCurrent.Visible = true;
            BindData();
        }

        protected void uiGridViewStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewStudents.PageIndex = e.NewPageIndex;
            BindStudentsData();
        }

        protected void uiGridViewStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditFees")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentStudentActive = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetStudent(CurrentStudentActive);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiGridViewStudentsFees.DataSource = db.GetFeesByClassAndClassRoomAndSchoolYear(Convert.ToInt32(uiDropDownListClasses.SelectedValue),
                                                            Convert.ToInt32(uiDropDownListClassRooms.SelectedValue),
                                                            Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                    uiGridViewStudentsFees.DataBind();
                    uiLabelStudentName.Text = ds.Tables[0].Rows[0]["ARStudentName"].ToString() + " " + ds.Tables[0].Rows[0]["ArFatherName"].ToString();
                    DataSet StudentClassRoom = new DataSet();
                    StudentClassRoom = db.GetClassRoom(Convert.ToInt32(ds.Tables[0].Rows[0]["ClassRoomID"].ToString()));
                    DataSet StudentClass = new DataSet();
                    StudentClass = db.GetClass(Convert.ToInt32(StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString()));
                    uiLabelClass.Text = StudentClass.Tables[0].Rows[0]["ArName"].ToString();
                }
                uiPanelCurrentFees.Visible = false;
                uiPanelCurrent.Visible = true;
            }
        }

        protected void uiButtonNewStudent_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentStudentActive = 0;
            CurrentFees = 0;
            uiPanelCurrentFees.Visible = true;
            uiPanelCurrent.Visible = false;
            BindStudentsData();
        }
    }
}