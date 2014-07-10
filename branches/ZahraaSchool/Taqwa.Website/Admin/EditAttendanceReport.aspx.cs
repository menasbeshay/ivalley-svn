using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditAttendanceReport : System.Web.UI.Page
    {
        public int CurrentCheckedStudent
        {
            get
            {
                if (Session["CurrentCheckedStudentForAtt"] != null && !string.IsNullOrEmpty(Session["CurrentCheckedStudentForAtt"].ToString()) && Session["CurrentCheckedStudentForAtt"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentCheckedStudentForAtt"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentCheckedStudentForAtt"] = value;
            }
        }

        public int CurrentAttendanceReport
        {
            get
            {
                if (Session["CurrentAttendanceReport"] != null && !string.IsNullOrEmpty(Session["CurrentAttendanceReport"].ToString()) && Session["CurrentAttendanceReport"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentAttendanceReport"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentAttendanceReport"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                /*if (CurrentCheckedStudent != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetStudent(CurrentCheckedStudent);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiGridViewStudentsAbsence.DataSource = db.GetMonthlyAttendanceReportByStudentID(CurrentCheckedStudent);
                        uiGridViewStudentsAbsence.DataBind();
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
                //}
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
                    uiGridViewStudentsAbsence.DataSource = db.GetMonthlyAttendanceReportByStudentID(CurrentCheckedStudent);
                    uiGridViewStudentsAbsence.DataBind();
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
            if (CurrentAttendanceReport != 0)
            {
                db.UpdateMonthlyAttendanceReport(CurrentAttendanceReport, CurrentCheckedStudent, true, DateTime.ParseExact(uiTextBoxDay.Text,"dd/MM/yyyy",null));
            }
            else
            {
                db.AddMonthlyAttendanceReport(CurrentCheckedStudent, true, DateTime.ParseExact(uiTextBoxDay.Text, "dd/MM/yyyy", null));
            }
            uiPanelCurrentStudents.Visible = false;
            uiPanelCurrent.Visible = true;
            CurrentAttendanceReport = 0;
            BindData();
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetStudent(CurrentCheckedStudent);
            if (ds.Tables[0].Rows.Count > 0)
            {
                uiGridViewStudentsAbsence.DataSource = db.GetMonthlyAttendanceReportByStudentID(CurrentCheckedStudent);
                uiGridViewStudentsAbsence.DataBind();
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

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentStudents.Visible = false;
            uiPanelCurrent.Visible = true;
            CurrentAttendanceReport = 0;
            BindData();
        }

        private void ClearFields()
        {
            uiTextBoxDay.Text = "";

        }

        protected void uiButtonNewStudent_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentStudents.Visible = true;
            uiPanelCurrent.Visible = false;
            BindStudentData();   
        }

        protected void uiGridViewStudentsAbsence_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewStudentsAbsence.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewStudentsAbsence_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditReports")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentAttendanceReport = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetMonthlyAttendanceReport(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxDay.Text = string.Format("{0:dd/MM/yyyy}", DateTime.Parse(ds.Tables[0].Rows[0]["Date"].ToString()));
                }
                uiPanelCurrentStudents.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteReports")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentAttendanceReport = id;
                DBLayer db = new DBLayer();
                db.DeleteMonthlyAttendanceReport(id);
                uiPanelCurrentStudents.Visible = false;
                uiPanelCurrent.Visible = true;
                BindData();
            }
        }
    }
}