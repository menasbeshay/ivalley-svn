using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace brotherssolidarity.Admin
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    ContactInfo ContInf = new ContactInfo();
                    ContInf.LoadByPrimaryKey(1);
                   // txtPageTitle.Text = ContInf.PageTitle;
                    //uiFCKeditorArContent.Value = Server.HtmlDecode(ContInf.PageContent);
                    txtAddress.Text = ContInf.ContactAddress;
                    txtTelephone.Text = ContInf.ContactTelephone;
                    txtEMail.Text = ContInf.ContactMail;
                    txtSkype.Text = ContInf.ContactSkype;
                    txtTwitter.Text = ContInf.ContactTwitter;
                    txtFacebook.Text = ContInf.ContactFacebook;
                    txtDurationTime.Text = ContInf.ContactDribble;
                    txtYoutube.Text = ContInf.ContactYoutube;
                    txtInestgram.Text = ContInf.ContactInstegram;
                    txtGoogleMap.Text = ContInf.GoogleMapURL;
                }
                catch (Exception)
                {
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            try
            {
                ContactInfo ContInf = new ContactInfo();
                ContInf.LoadByPrimaryKey(1);
                //ContInf.PageTitle = txtPageTitle.Text;
                //ContInf.PageContent = Server.HtmlEncode(uiFCKeditorArContent.Value);
                ContInf.ContactAddress = txtAddress.Text;
                ContInf.ContactTelephone = txtTelephone.Text;
                ContInf.ContactMail = txtEMail.Text;
                ContInf.ContactSkype = txtSkype.Text;
                ContInf.ContactTwitter = txtTwitter.Text;
                ContInf.ContactFacebook = txtFacebook.Text;
                ContInf.ContactDribble = txtDurationTime.Text;
                ContInf.ContactYoutube = txtYoutube.Text;
                ContInf.ContactInstegram = txtInestgram.Text;
                ContInf.GoogleMapURL = txtGoogleMap.Text;
                ContInf.Save();
            }
            catch (Exception)
            {
                /*ContactInformation ContInf = new ContactInformation();
                ContInf.AddNew();
                ContInf.PageTitle = txtPageTitle.Text;
                ContInf.PageContent = Server.HtmlEncode(uiFCKeditorArContent.Value);
                ContInf.ContactAddress = txtAddress.Text;
                ContInf.ContactTelephone = txtTelephone.Text;
                ContInf.ContactMail = txtEMail.Text;
                ContInf.ContactSkype = txtSkype.Text;
                ContInf.ContactTwitter = txtTwitter.Text;
                ContInf.ContactFacebook = txtFacebook.Text;
                ContInf.ContactDribble = txtDribble.Text;
                ContInf.ContactYoutube = txtYoutube.Text;
                ContInf.Save();*/
            }


            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Saved Successfully" + "');", true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adminhome.aspx");
        }
    }
}