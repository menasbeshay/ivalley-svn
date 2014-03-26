using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website
{
    public partial class MonthlyAttendanceReport : System.Web.UI.Page
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

        protected void uiButtonViewReport_Click(object sender, EventArgs e)
        {
            BindData();

        }

        private void BindData()
        {
            DBLayer db = new DBLayer();

            DataSet attendance = new DataSet();

            attendance = db.GetMonthlyAttendanceReportByStudentIDAndDate(Convert.ToInt32(Session["CurrentLoggedInStudent"].ToString()), DateTime.ParseExact("01/" + (uiDropDownListMonth.SelectedValue.Length == 1 ? "0" + uiDropDownListMonth.SelectedValue : uiDropDownListMonth.SelectedValue) + "/" + uiDropDownListYear.SelectedValue, "dd/MM/yyyy", null));

            uiRepeaterAttendance.DataSource = attendance;
            uiRepeaterAttendance.DataBind();

            uiPanelAttendance.Visible = true;
        }
    }
}