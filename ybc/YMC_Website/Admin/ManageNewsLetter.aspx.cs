using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.Text;

namespace YMC_Website.Admin
{
    public partial class ManageNewsLetter : System.Web.UI.Page
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void uiLinkButtonSend_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewAllPages.Visible = false;
        }

        protected void uiGridViewUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewUsers.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteUser")
            {
                YMC.BLL.NewsLetter objData = new YMC.BLL.NewsLetter();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiLinkButtonSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage msg = new MailMessage();
                string mail = ConfigurationManager.AppSettings["mail"];
                string mailto = "";
                YMC.BLL.NewsLetter objData = new YMC.BLL.NewsLetter();
                objData.LoadAll();
                for (int i = 0; i < objData.RowCount - 1; i++)
                {
                    mailto += objData.Email + ";";
                    objData.MoveNext();
                }

                msg.To.Add(mailto);
                msg.From = new MailAddress(mail);
                msg.Subject = uiTextBoxTitle.Text;
                msg.IsBodyHtml = true;
                msg.BodyEncoding = Encoding.UTF8;

                msg.Body = uiFCKeditorPage.Value;
                
                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                //client.EnableSsl = true;
                client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                //client.Credentials = new System.Net.NetworkCredential("mena.samy@gmail.com", "0103566600");
                client.Send(msg);
                uiLabelSuccess.Visible = true;
            }
            catch (Exception ex)
            {
                uiLabelError.Visible = true;
            }
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = false;
            uiPanelViewAllPages.Visible = true;
        }
        #endregion
        #region Methods
        private void BindData()
        {
            YMC.BLL.NewsLetter objData = new YMC.BLL.NewsLetter();
            objData.LoadAll();            
            uiGridViewUsers.DataSource = objData.DefaultView;
            uiGridViewUsers.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxTitle.Text = "";
            uiFCKeditorPage.Value = "";
            uiLabelError.Visible = false;
        }
        #endregion
    }
}