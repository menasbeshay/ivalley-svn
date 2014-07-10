using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditMonthlyReport : System.Web.UI.Page
    {
        public int CurrentCheckedStudent
        {
            get
            {
                if (Session["CurrentCheckedStudent"] != null && !string.IsNullOrEmpty(Session["CurrentCheckedStudent"].ToString()) && Session["CurrentCheckedStudent"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentCheckedStudent"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentCheckedStudent"] = value;
            }
        }

        public int CurrentReport
        {
            get
            {
                if (Session["CurrentReport"] != null && !string.IsNullOrEmpty(Session["CurrentReport"].ToString()) && Session["CurrentReport"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentReport"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentReport"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
               /* if (CurrentCheckedStudent != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetStudent(CurrentCheckedStudent);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiGridViewStudentsReports.DataSource = db.GetMonthlyReportByStudentID(CurrentCheckedStudent);
                        uiGridViewStudentsReports.DataBind();
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
                {*/
                    uiPanelCurrentStudents.Visible = true;
                    uiPanelCurrent.Visible = false;
                    BindStudentData();
               // }
            }
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
        }

        private void BindStudentData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.SearchStudents(Convert.ToInt32(uiDropDownListClasses.SelectedValue), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), uiTextBoxSearchText.Text);
            uiGridViewStudents.DataSource = ds;
            uiGridViewStudents.DataBind();      
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
            BindStudentData();
        }

        protected void uiGridViewStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewStudents.PageIndex = e.NewPageIndex;
            BindStudentData();
        }

        protected void uiGridViewStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditReports")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentCheckedStudent = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetStudent(CurrentCheckedStudent);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiGridViewStudentsReports.DataSource = db.GetMonthlyReportByStudentID(CurrentCheckedStudent);
                    uiGridViewStudentsReports.DataBind();
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
            if (CurrentReport != 0)
            {
                db.UpdateMonthlyReport(CurrentReport, CurrentCheckedStudent, uiTextBoxArDetails.Text, uiTextBoxEnDetails.Text, new DateTime(Convert.ToInt32(uiDropDownListYear.SelectedValue), Convert.ToInt32(uiDropDownListMonth.SelectedValue), 1));
            }
            else
            {
                db.AddMonthlyReport(CurrentCheckedStudent, uiTextBoxArDetails.Text, uiTextBoxEnDetails.Text, new DateTime(Convert.ToInt32(uiDropDownListYear.SelectedValue), Convert.ToInt32(uiDropDownListMonth.SelectedValue), 1)); 
            }
            uiPanelCurrentStudents.Visible = false;
            uiPanelCurrent.Visible = true;
            CurrentReport = 0;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentStudents.Visible = false;
            uiPanelCurrent.Visible = true;
            BindData();
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetStudent(CurrentCheckedStudent);
            if (ds.Tables[0].Rows.Count > 0)
            {
                uiGridViewStudentsReports.DataSource = db.GetMonthlyReportByStudentID(CurrentCheckedStudent);
                uiGridViewStudentsReports.DataBind();
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

        protected void uiButtonNewStudent_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentStudents.Visible = true;
            uiPanelCurrent.Visible = false;
            BindStudentData();   
        }

        private void ClearFields()
        {                     
            uiDropDownListYear.SelectedIndex = 0;
            uiDropDownListMonth.SelectedIndex = 0;                      
            uiTextBoxArDetails.Text = "";
            uiTextBoxEnDetails.Text = "";            
        }

        protected void uiGridViewStudentsReports_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewStudentsReports.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewStudentsReports_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditReports")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentReport = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetMonthlyReport(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiDropDownListYear.SelectedValue = DateTime.Parse(ds.Tables[0].Rows[0]["Date"].ToString()).Year.ToString();
                    uiDropDownListMonth.SelectedValue = DateTime.Parse(ds.Tables[0].Rows[0]["Date"].ToString()).Month.ToString();
                    uiTextBoxArDetails.Text = ds.Tables[0].Rows[0]["ArDetails"].ToString();
                    uiTextBoxEnDetails.Text = ds.Tables[0].Rows[0]["EnDetails"].ToString();
                }
                uiPanelCurrentStudents.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteReports")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentReport = id;
                DBLayer db = new DBLayer();
                db.DeleteMonthlyReport(id);
                uiPanelCurrentStudents.Visible = false;
                uiPanelCurrent.Visible = true;
                BindData();
            }
        }
    }
}