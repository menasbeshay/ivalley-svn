using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.Data;

namespace Sherifadel
{
    public partial class careers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetPageContent(9);
            if (ds.Tables[0].Rows.Count != 0)
            {
                Master.PageTitle = ds.Tables[0].Rows[0]["Title"].ToString();
                uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
            }
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
                msg.Subject = " Career request";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.UTF8;

                msg.Body = "Name : " + uiTextBoxName.Text;
                msg.Body += "<br/> Surname : " + uiTextBoxSurname.Text;                
                msg.Body += "<br/> Email : " + uiTextBoxEmail.Text;
                msg.Body += "<br/> city : " + uiTextBoxCity.Text;
                msg.Body += "<br/> Tele : " + uiTextBoxTele.Text;
                msg.Body += "<br/> Qualifications : " + uiTextBoxQual.Text;
                msg.Body += "<br/> Languages : " + uiTextBoxLang.Text;                
                if (uiFileUploadCV.HasFile)
                    msg.Attachments.Add(new Attachment(uiFileUploadCV.FileContent, uiFileUploadCV.FileName));

                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                client.Send(msg);
                uiLabelMessage.Visible = true;
                uiLabelError.Visible = false;
            }
            catch (Exception ex)
            {
                uiLabelError.Visible = true;                

            }
        }
    }
}