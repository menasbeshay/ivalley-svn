using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Obtravel.Admin
{
    public partial class ContactForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                BindData();
                uiPanelContactForms.Visible = true;
                uiPanelViewForm.Visible = false;
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiGridViewContactForm.DataSource = db.GetAllContactForm();
            uiGridViewContactForm.DataBind();
        }

        protected void uiGridViewContactForm_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewContactForm.PageIndex = e.NewPageIndex;
        }

        protected void uiGridViewContactForms_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewContact")
            {
                DBLayer db = new DBLayer();
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                DataSet ds = new DataSet();
                ds = db.GetContactForm(id);
                uiLabelSection.Text = ds.Tables[0].Rows[0]["Section"].ToString();
                uiLabelTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                uiLabelName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                uiLabelEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                uiLabelStreet.Text = ds.Tables[0].Rows[0]["Street"].ToString();
                uiLabelCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
                uiLabelPostalCode.Text = ds.Tables[0].Rows[0]["PostalCode"].ToString();
                uiLabelCountry.Text = ds.Tables[0].Rows[0]["Country"].ToString();
                uiLabelTelephone.Text = ds.Tables[0].Rows[0]["Telephone"].ToString();
                uiLabelMobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                uiTextBoxSubject.Text = ds.Tables[0].Rows[0]["Subject"].ToString();
                uiPanelContactForms.Visible = false;
                uiPanelViewForm.Visible = true;
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            uiPanelContactForms.Visible = true;
            uiPanelViewForm.Visible = false;
        }
    }
}