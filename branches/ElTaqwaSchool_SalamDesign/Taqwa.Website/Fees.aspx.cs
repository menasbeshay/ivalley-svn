using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website
{
    public partial class Fees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentLoggedInStudent"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                LoadDDLs();
                BindData();

            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet Installments = new DataSet();
            DataSet Fees = new DataSet();
            Fees = db.GetFeesByStudentIDAndSchoolYear(Convert.ToInt32(Session["CurrentLoggedInStudent"].ToString()), Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            Installments = db.GetInstallmentsByStudentIDAndSchoolYearID(Convert.ToInt32(Session["CurrentLoggedInStudent"].ToString()), Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));

            uiGridViewInstallments.DataSource = Installments;
            uiGridViewInstallments.DataBind();
            float totalpaied = 0;
            float TotalFees = 0;

            float RemainingYearLastYear = 0;
            float BooksFees = 0;
            float BusFees = 0;
            float UniformFees = 0;
            float OtherFees = 0;
            float ActivitiesFees = 0;

            for (int i = 0; i < Installments.Tables[0].Rows.Count; i++)
            {
                totalpaied += float.Parse(Installments.Tables[0].Rows[i]["Quantity"].ToString());
            }

            for (int i = 0; i < Fees.Tables[0].Rows.Count; i++)
            {
                RemainingYearLastYear += float.Parse(Fees.Tables[0].Rows[i]["RemainingFeesLastYear"].ToString());
                BooksFees += float.Parse(Fees.Tables[0].Rows[i]["BooksFees"].ToString());
                BusFees += float.Parse(Fees.Tables[0].Rows[i]["BusFees"].ToString());
                UniformFees += float.Parse(Fees.Tables[0].Rows[i]["UniformFees"].ToString());
                OtherFees += float.Parse(Fees.Tables[0].Rows[i]["OtherFees"].ToString());
                ActivitiesFees += float.Parse(Fees.Tables[0].Rows[i]["ActivitiesFees"].ToString());
            }

            TotalFees = RemainingYearLastYear + BooksFees + BusFees + UniformFees + OtherFees + ActivitiesFees;

            uiLabelRemaining.Text = RemainingYearLastYear.ToString();
            uiLabelBooks.Text = BooksFees.ToString();
            uiLabelBus.Text = BusFees.ToString();
            uiLabelUniform.Text = UniformFees.ToString();
            uiLabelOther.Text = OtherFees.ToString();
            uiLabelAct.Text = ActivitiesFees.ToString();

            uiLabelTotal.Text = TotalFees.ToString();
            uiLabelTotalPaid.Text = totalpaied.ToString();

            uiLabelInvoiceTotal.Text = (TotalFees - totalpaied).ToString();
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            uiDropDownListSchoolYear.DataSource = db.GetAllSchoolYear();
            uiDropDownListSchoolYear.DataTextField = "ArName";
            uiDropDownListSchoolYear.DataValueField = "SchoolYearID";
            uiDropDownListSchoolYear.DataBind();

            DataSet currentYear = new DataSet();
            currentYear = db.GetCurrentSchoolYear();

            if (currentYear.Tables[0].Rows.Count > 0)
            {
                uiDropDownListSchoolYear.SelectedValue = currentYear.Tables[0].Rows[0]["SchoolYearID"].ToString();
            }
            else
            {
                uiDropDownListSchoolYear.SelectedIndex = 0;
            }
        }       

        protected void uiButtonView_Click(object sender, EventArgs e)
        {
            BindData();
        }
    }
}