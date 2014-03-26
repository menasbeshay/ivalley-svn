using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditResults : System.Web.UI.Page
    {
        public int CurrentActiveStudent
        {
            get
            {
                if (Session["CurrentActiveStudent"] != null && !string.IsNullOrEmpty(Session["CurrentActiveStudent"].ToString()) && Session["CurrentActiveStudent"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentActiveStudent"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentActiveStudent"] = value;
            }
        }

        public int CurrentResult
        {
            get
            {
                if (Session["CurrentResult"] != null && !string.IsNullOrEmpty(Session["CurrentResult"].ToString()) && Session["CurrentResult"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentResult"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentResult"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                if (CurrentActiveStudent != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetStudent(CurrentActiveStudent);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiGridViewStudentResults.DataSource = db.GetResultByStudentIDAndSchoolYearForAdmin(CurrentActiveStudent, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                        uiGridViewStudentResults.DataBind();
                        uiLabelStudentName.Text = ds.Tables[0].Rows[0]["ArStudentName"].ToString() + ds.Tables[0].Rows[0]["ArFatherName"].ToString();
                        DataSet StudentClassRoom = new DataSet();
                        StudentClassRoom = db.GetClassRoom(Convert.ToInt32(ds.Tables[0].Rows[0]["ClassRoomID"].ToString()));
                        DataSet StudentClass = new DataSet();
                        StudentClass = db.GetClass(Convert.ToInt32(StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString()));
                        uiLabelClass.Text = StudentClass.Tables[0].Rows[0]["ArName"].ToString();
                    }
                    uiPanelCurrentStudents.Visible = false;
                    uiPanelCurrent.Visible = true;                    
                }
                else
                {
                    uiPanelCurrentStudents.Visible = true;
                    uiPanelCurrent.Visible = false;                                        
                    BindStudentData();
                }
            }

        }

        private void BindStudentData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            if (!string.IsNullOrEmpty(uiDropDownListClasses.SelectedValue) && !string.IsNullOrEmpty(uiDropDownListClassRooms.SelectedValue))
            {
                ds = db.SearchStudents(Convert.ToInt32(uiDropDownListClasses.SelectedValue), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), uiTextBoxSearchText.Text);
            }
            if (ds.Tables.Count > 0)
            {
                uiGridViewStudents.DataSource = ds;
            }
            else
            {
                uiGridViewStudents.DataSource = null;
            }
            uiGridViewStudents.DataBind();      
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
            uiDropDownListClassRooms.SelectedIndex = 0;

            uiDropDownListCourses.DataSource = db.GetAllCoursesByClass(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListCourses.DataTextField = "ArName";
            uiDropDownListCourses.DataValueField = "CourseID";
            uiDropDownListCourses.DataBind();

            uiDropDownListSchoolYear.DataSource = db.GetAllSchoolYear();
            uiDropDownListSchoolYear.DataTextField = "ArName";
            uiDropDownListSchoolYear.DataValueField = "SchoolYearID";
            uiDropDownListSchoolYear.DataBind();
            uiDropDownListSchoolYear.SelectedIndex = 0;
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetStudent(CurrentActiveStudent);
            if (ds.Tables[0].Rows.Count > 0)
            {
                uiGridViewStudentResults.DataSource = db.GetResultByStudentIDAndSchoolYearForAdmin(CurrentActiveStudent, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                uiGridViewStudentResults.DataBind();
                uiLabelStudentName.Text = ds.Tables[0].Rows[0]["ArStudentName"].ToString() + ds.Tables[0].Rows[0]["ArFatherName"].ToString();
                DataSet StudentClassRoom = new DataSet();
                StudentClassRoom = db.GetClassRoom(Convert.ToInt32(ds.Tables[0].Rows[0]["ClassRoomID"].ToString()));
                DataSet StudentClass = new DataSet();
                StudentClass = db.GetClass(Convert.ToInt32(StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString()));
                uiLabelClass.Text = StudentClass.Tables[0].Rows[0]["ArName"].ToString();
            }
            uiPanelCurrentStudents.Visible = false;
            uiPanelCurrent.Visible = true;      
        }

        protected void uiDropDownListClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            uiDropDownListClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListClassRooms.DataTextField = "ArName";
            uiDropDownListClassRooms.DataValueField = "ClassRoomID";
            uiDropDownListClassRooms.DataBind();

            uiDropDownListCourses.DataSource = db.GetAllCoursesByClass(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListCourses.DataTextField = "ArName";
            uiDropDownListCourses.DataValueField = "CourseID";
            uiDropDownListCourses.DataBind();
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            BindStudentData();
        }

        protected void uiGridViewStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewStudents.PageIndex = e.NewPageIndex;
            BindStudentData();
        }

        protected void uiGridViewStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditResults")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentActiveStudent = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetStudent(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiGridViewStudentResults.DataSource = db.GetResultByStudentIDAndSchoolYearForAdmin(CurrentActiveStudent, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                    uiGridViewStudentResults.DataBind();
                    uiLabelStudentName.Text = ds.Tables[0].Rows[0]["ARStudentName"].ToString() + " " + ds.Tables[0].Rows[0]["ArFatherName"].ToString();
                    DataSet StudentClassRoom = new DataSet();
                    StudentClassRoom = db.GetClassRoom(Convert.ToInt32(ds.Tables[0].Rows[0]["ClassRoomID"].ToString()));
                    DataSet StudentClass = new DataSet();
                    StudentClass = db.GetClass(Convert.ToInt32(StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString()));
                    uiLabelClass.Text = StudentClass.Tables[0].Rows[0]["ArName"].ToString();
                }
                uiPanelCurrentStudents.Visible = false;
                uiPanelCurrent.Visible = true;   
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();            
            if (CurrentResult != 0)
            {
                db.UpdateResult(CurrentResult, CurrentActiveStudent, Convert.ToInt32(uiDropDownListCourses.SelectedValue), float.Parse(uiTextBoxGrade.Text), uiTextBoxEvaluation.Text, uiRadioButtonListResult.Items[0].Selected, uiRadioButtonListResult.Items[1].Selected, uiRadioButtonListResult.Items[2].Selected, uiRadioButtonListResult.Items[3].Selected, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));                
            }
            else
            {
                db.AddResult(CurrentActiveStudent, Convert.ToInt32(uiDropDownListCourses.SelectedValue), float.Parse(uiTextBoxGrade.Text), uiTextBoxEvaluation.Text, uiRadioButtonListResult.Items[0].Selected, uiRadioButtonListResult.Items[1].Selected, uiRadioButtonListResult.Items[2].Selected, uiRadioButtonListResult.Items[3].Selected, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));                
            }            
            uiPanelCurrentStudents.Visible = false;
            uiPanelCurrent.Visible = true;
            CurrentResult = 0;
            uiDropDownListCourses.SelectedIndex = 0;
            uiTextBoxGrade.Text = "";
            uiTextBoxEvaluation.Text = "";
            uiRadioButtonListResult.SelectedIndex = -1; 
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentStudents.Visible = false;
            uiPanelCurrent.Visible = true;
            BindData();
        }

        private void ClearFields()
        {
            uiPanelCurrent.Visible = false;
            uiPanelCurrentStudents.Visible = true;
            CurrentActiveStudent = 0;
            CurrentResult = 0;
            uiDropDownListCourses.SelectedIndex = 0;
            uiTextBoxGrade.Text = "";
            uiTextBoxEvaluation.Text = "";
            uiDropDownListSchoolYear.SelectedIndex = 0;
            uiRadioButtonListResult.SelectedIndex = -1;            
            uiPanelCurrentStudents.Visible = true;
            uiPanelCurrent.Visible = false;
            
        }

        protected void uiGridViewStudentResults_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewStudentResults.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewStudentResults_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditResults")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentResult = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetResult(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiDropDownListCourses.SelectedValue = ds.Tables[0].Rows[0]["CourseID"].ToString();
                    uiTextBoxGrade.Text = ds.Tables[0].Rows[0]["Grade"].ToString();
                    uiTextBoxEvaluation.Text = ds.Tables[0].Rows[0]["Evaluation"].ToString();
                    uiRadioButtonListResult.Items[0].Selected = (bool)ds.Tables[0].Rows[0]["FirstHalfMidTerm"];
                    uiRadioButtonListResult.Items[1].Selected = (bool)ds.Tables[0].Rows[0]["FirstHalfFinal"];
                    uiRadioButtonListResult.Items[2].Selected = (bool)ds.Tables[0].Rows[0]["SecondHalfMidTerm"];
                    uiRadioButtonListResult.Items[3].Selected = (bool)ds.Tables[0].Rows[0]["SecondHalfFinal"];                    
                }
                uiPanelCurrentStudents.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteResults")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentResult = id;
                DBLayer db = new DBLayer();
                db.DeleteResult(id);
                uiPanelCurrentStudents.Visible = false;
                uiPanelCurrent.Visible = true;               
                BindData();
            }
        }

        protected void uiButtonSelectNew_Click(object sender, EventArgs e)
        {
            ClearFields();
            BindStudentData();
        }
    }
}