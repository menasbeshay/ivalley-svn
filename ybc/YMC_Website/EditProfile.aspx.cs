using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;

namespace YMC_Website
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    LoadUserProfile();
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
        }

        private void LoadUserProfile()
        {
            SiteUsers objData = new SiteUsers();
            objData = (SiteUsers)Session["CurrentUser"];            
            uiTextBoxFullName.Text = objData.UserFullName;
            uiTextBoxUserName.Text = objData.UserName;
            uiTextBoxTele.Text = objData.Telephone;            
            uiTextBoxMail.Text = objData.Email;
            uiTextBoxJob.Text = objData.Job;
            uiTextBoxInfo.Text = objData.OtherInfo;
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            SiteUsers objData = new SiteUsers();
            objData = (SiteUsers)Session["CurrentUser"];
            objData.UserFullName = uiTextBoxFullName.Text;
            objData.UserName = uiTextBoxUserName.Text;
            objData.Telephone = uiTextBoxTele.Text;            
            objData.Email = uiTextBoxMail.Text;
            objData.Job = uiTextBoxJob.Text;
            objData.OtherInfo = uiTextBoxInfo.Text;            
            if (!string.IsNullOrEmpty(uiTextBoxPassword.Text))
                objData.UserPassword = uiTextBoxPassword.Text;
            objData.Save();
            uiLabelSucc.Visible = true;
            LoadUserProfile();
        }        
    }
}