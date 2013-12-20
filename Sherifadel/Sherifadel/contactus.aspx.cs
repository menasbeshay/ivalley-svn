using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Configuration;

namespace Sherifadel
{
    public partial class contactus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                int id = 7;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetPageContent(id);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    Master.PageTitle = ds.Tables[0].Rows[0]["Title"].ToString();
                    uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
                }
               
        }

        protected void uiButtonSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                MailMessage msg = new MailMessage();
                string mail = ConfigurationManager.AppSettings["mail"];
                string mailto = ConfigurationManager.AppSettings["mailTo"];
                msg.To.Add(mailto);
                msg.From = new MailAddress(mail);                
                msg.Subject = " Email from Contact us page";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.Unicode;

                msg.Body = "<br/> Name : " + uiTextBoxName.Text;
                msg.Body += "<br/> Email : " + uiTextBoxMail.Text;
                msg.Body += "<br/> Message : " + uiTextBoxSubject.Text;
                
                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 587);
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                client.Send(msg);
                uiLabelMessage.Visible = true;
            }
            catch (Exception ex)
            {
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = ex.Message;
            }
        }
    }
}