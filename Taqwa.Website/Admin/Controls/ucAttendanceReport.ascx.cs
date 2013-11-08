using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin.Controls
{
    public partial class ucAttendanceReport : System.Web.UI.UserControl
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

        }

        public void BindData()
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
                
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteReports")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentAttendanceReport = id;
                DBLayer db = new DBLayer();
                db.DeleteMonthlyAttendanceReport(id);                
                uiPanelCurrent.Visible = true;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentAttendanceReport != 0)
            {
                db.UpdateMonthlyAttendanceReport(CurrentAttendanceReport, CurrentCheckedStudent, true, DateTime.ParseExact(uiTextBoxDay.Text, "dd/MM/yyyy", null));
            }
            else
            {
                db.AddMonthlyAttendanceReport(CurrentCheckedStudent, true, DateTime.ParseExact(uiTextBoxDay.Text, "dd/MM/yyyy", null));
            }            
            uiPanelCurrent.Visible = true;
            CurrentAttendanceReport = 0;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();            
            uiPanelCurrent.Visible = true;
            CurrentAttendanceReport = 0;
            BindData();
        }

        private void ClearFields()
        {
            uiTextBoxDay.Text = "";

        }


    }
}