using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin.Controls
{
    public partial class ucMonthlyReport : System.Web.UI.UserControl
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
            if (!IsPostBack) {
                uiDropDownListYear.SelectedValue = DateTime.Now.Year.ToString();
                uiDropDownListMonth.SelectedValue = DateTime.Now.Month.ToString();
            }
        }


        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentReport != 0)
            {
                db.UpdateMonthlyReport(CurrentReport, CurrentCheckedStudent, uiTextBoxDetails.Text,"", new DateTime(Convert.ToInt32(uiDropDownListYear.SelectedValue), Convert.ToInt32(uiDropDownListMonth.SelectedValue), 1));
            }
            else
            {
                db.AddMonthlyReport(CurrentCheckedStudent, uiTextBoxDetails.Text, "", new DateTime(Convert.ToInt32(uiDropDownListYear.SelectedValue), Convert.ToInt32(uiDropDownListMonth.SelectedValue), 1));
            }            
            CurrentReport = 0;
            ClearFields();
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();            
            BindData();
            uiDropDownListYear.SelectedValue = DateTime.Now.Year.ToString();
            uiDropDownListMonth.SelectedValue = DateTime.Now.Month.ToString();
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
                    uiTextBoxDetails.Text = ds.Tables[0].Rows[0]["ArDetails"].ToString();
                    
                }
               
            }
            else if (e.CommandName == "DeleteReports")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentReport = id;
                DBLayer db = new DBLayer();
                db.DeleteMonthlyReport(id);               
                BindData();
            }
        }



        public void BindData()
        {

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

        }
        private void ClearFields()
        {
            uiDropDownListYear.SelectedIndex = 0;
            uiDropDownListMonth.SelectedIndex = 0;
            uiTextBoxDetails.Text = "";
            
        }



    }
}