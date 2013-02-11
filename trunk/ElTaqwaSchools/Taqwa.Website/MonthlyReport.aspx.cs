using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website
{
    public partial class MonthlyReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentLoggedInStudent"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                uiDropDownListYear.SelectedValue = DateTime.Now.Year.ToString();
                uiDropDownListMonth.SelectedValue = DateTime.Now.Month.ToString();
                BindData();        
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet report = new DataSet();
            // DataSet attendance = new DataSet();

            //report = db.GetMonthlyReportByStudentIDAndDate(Convert.ToInt32(Session["CurrentLoggedInStudent"].ToString()), DateTime.ParseExact("01/" + (uiDropDownListMonth.SelectedValue.Length == 1 ? "0" + uiDropDownListMonth.SelectedValue : uiDropDownListMonth.SelectedValue) + "/" + uiDropDownListYear.SelectedValue, "dd/MM/yyyy", null));
            report = db.GetMonthlyReportByStudentIDAndDate(Convert.ToInt32(Session["CurrentLoggedInStudent"].ToString()), DateTime.ParseExact("01/" + (uiDropDownListMonth.SelectedValue.Length == 1 ? "0" + uiDropDownListMonth.SelectedValue : uiDropDownListMonth.SelectedValue) + "/" + uiDropDownListYear.SelectedValue, "dd/MM/yyyy", null));
            //attendance = db.GetMonthlyAttendanceReportByStudentIDAndDate(Convert.ToInt32(Session["CurrentLoggedInStudent"].ToString()), DateTime.ParseExact("01/" + (uiDropDownListMonth.SelectedValue.Length == 1 ? "0" + uiDropDownListMonth.SelectedValue : uiDropDownListMonth.SelectedValue) + "/" + uiDropDownListYear.SelectedValue, "dd/MM/yyyy", null));

            uiRepeaterMonthlyReport.DataSource = report;
            uiRepeaterMonthlyReport.DataBind();

            //uiRepeaterAttendance.DataSource = attendance;
            //uiRepeaterAttendance.DataBind();

            //uiPanelAttendance.Visible = true;
            uiPanelReport.Visible = true;
        }

        protected void uiButtonViewReport_Click(object sender, EventArgs e)
        {
            BindData();
        }
    }
}