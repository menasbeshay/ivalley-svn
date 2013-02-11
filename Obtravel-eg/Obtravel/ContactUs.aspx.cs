using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Obtravel
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetPageContent(2);
                uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());

            }
            RegisterStartupScript("menu", "<script type='text/javascript'>$(\"#m5\").addClass(\"selected\");</script>");
        }

        protected void uiLinkButtonSubmit_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (db.AddContactForm(uiTextBoxTelephone.Text, uiTextBoxMobile.Text, uiTextBoxEmail.Text, uiTextBoxSubject.Text,uiTextBoxName.Text,uiTextBoxStreet.Text,uiTextBoxCity.Text,uiTextBoxPostalCode.Text,uiTextBoxCountry.Text,uiDropDownListTitle.Text,Convert.ToInt32(uiDropDownListSection.SelectedValue)))
            {
                uiLabelSuccess.Visible = true;
                uiLabelFail.Visible = false;
            }
            else
            {
                uiLabelFail.Visible = true;
                uiLabelSuccess.Visible = false;
            }
        }
    }
}