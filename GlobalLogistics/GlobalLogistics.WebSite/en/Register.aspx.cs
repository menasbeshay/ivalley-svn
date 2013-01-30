using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Configuration;
using System.Net.Mail;

namespace GlobalLogistics.WebSite
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                LoadTerms();
            }
        }

        private void LoadDDLs()
        {
            Cities objCities = new Cities();
            objCities.LoadAll();
            uiDropDownListCity.DataSource = objCities.DefaultView;
            uiDropDownListCity.DataTextField = "EnName";
            uiDropDownListCity.DataValueField = "CityID";
            uiDropDownListCity.DataBind();
            uiDropDownListCity.Items.Insert(0, new ListItem("Select City", "0"));

            Categories objCategories = new Categories();
            objCategories.LoadAll();
            uiDropDownListCategory.DataSource = objCategories.DefaultView;
            uiDropDownListCategory.DataTextField = "EnName";
            uiDropDownListCategory.DataValueField = "CategoryID";
            uiDropDownListCategory.DataBind();
            uiDropDownListCategory.Items.Insert(0, new ListItem("Select Category", "0"));

            Packages objpack = new Packages();
            objpack.LoadAll();
            uiDropDownListPackage.DataSource = objpack.DefaultView;
            uiDropDownListPackage.DataTextField = "EnName";
            uiDropDownListPackage.DataValueField = "PackageID";
            uiDropDownListPackage.DataBind();
        }

        private void LoadTerms()
        {
            BLL.Pages objTerms = new BLL.Pages();
            objTerms.LoadByPrimaryKey(12);
            uiLiteralTerms.Text = Server.HtmlDecode(objTerms.EnContent);
        }

        protected void uiDropDownListCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategories objSubCategories = new SubCategories();
            objSubCategories.GetAllSubCategoriesByCategory(Convert.ToInt32(uiDropDownListCategory.SelectedValue));
            uiDropDownListSubCategory.DataSource = objSubCategories.DefaultView;
            uiDropDownListSubCategory.DataTextField = "EnName";
            uiDropDownListSubCategory.DataValueField = "SubCategoryID";
            uiDropDownListSubCategory.DataBind();
            uiDropDownListSubCategory.Items.Insert(0, new ListItem("Select Sub-Category", "0"));
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage msg = new MailMessage();
                string mail = ConfigurationManager.AppSettings["mail"];
                string mailto = ConfigurationManager.AppSettings["mailTo"];
                msg.To.Add(mailto);        
                msg.From = new MailAddress(mail);                
                msg.Subject = " New company request for register";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.UTF8;

                msg.Body = " Name : " + uiTextBoxName.Text;
                msg.Body += "<br/> Address : " + uiTextBoxAddress.Text;
                msg.Body += "<br/> City : " + uiDropDownListCity.SelectedItem.Text;
                msg.Body += "<br/> Category : " + uiDropDownListCategory.SelectedItem.Text;
                msg.Body += "<br/> Sub-Category : " + uiDropDownListSubCategory.SelectedItem.Text;
                msg.Body += "<br/> Package : " + uiDropDownListPackage.SelectedItem.Text;
                msg.Body += "<br/> Tele : " + uiTextBoxtele.Text;
                msg.Body += "<br/> Fax : " + uiTextBoxFax.Text;
                msg.BodyEncoding = System.Text.Encoding.UTF8;

                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                client.Send(msg);
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = "Mail Sent successfully";
            }
            catch (Exception ex)
            {
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = ex.Message;
            }
        }
    }
}