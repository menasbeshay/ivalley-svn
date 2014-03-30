using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin.Controls
{
    public partial class UpdateFees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
            }
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            uiDropDownListClass.DataSource = db.GetAllClass();
            uiDropDownListClass.DataTextField = "ArName";
            uiDropDownListClass.DataValueField = "ClassID";
            uiDropDownListClass.DataBind();
            uiDropDownListClass.SelectedIndex = 0;

            uiDropDownListSchoolYear.DataSource = db.GetAllSchoolYear();
            uiDropDownListSchoolYear.DataTextField = "ArName";
            uiDropDownListSchoolYear.DataValueField = "SchoolYearID";
            uiDropDownListSchoolYear.DataBind();
            uiDropDownListSchoolYear.SelectedIndex = 0;
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            DataSet students = new DataSet();

            students = db.GetAllStudentsByClass(Convert.ToInt32(uiDropDownListClass.SelectedValue));

            for (int i = 0; i < students.Tables[0].Rows.Count; i++)
            {
                try
                {
                    DataSet fees = new DataSet();
                    fees = db.GetFeesByStudentIDAndSchoolYear(Convert.ToInt32(students.Tables[0].Rows[i]["StudentID"].ToString()), Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                    if (fees.Tables[0].Rows.Count > 0)
                    {
                        db.UpdateFees(Convert.ToInt32(fees.Tables[0].Rows[0]["FeesID"].ToString()), float.Parse(fees.Tables[0].Rows[0]["RemainingFeesLastYear"].ToString()), float.Parse(uiTextBoxBooksFees.Text), float.Parse(uiTextBoxBusFees.Text), float.Parse(uiTextBoxUniformFees.Text), float.Parse(uiTextBoxExtFees.Text), float.Parse(uiTextBoxActFees.Text), Convert.ToInt32(students.Tables[0].Rows[i]["StudentID"].ToString()), Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                    }
                    else
                    {
                        db.AddFees(0, float.Parse(uiTextBoxBooksFees.Text), float.Parse(uiTextBoxBusFees.Text), float.Parse(uiTextBoxUniformFees.Text), float.Parse(uiTextBoxExtFees.Text), float.Parse(uiTextBoxActFees.Text), Convert.ToInt32(students.Tables[0].Rows[i]["StudentID"].ToString()), Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                    }
                    fees.Clear();
                    fees.Tables.Clear();
                }
                catch (Exception ex)
                {
                    continue;
                }
            }
        }
    }
}