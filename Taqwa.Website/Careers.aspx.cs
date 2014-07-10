using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;
using System.Net.Mail;
using System.Configuration;

namespace Taqwa.Website
{
    public partial class Careers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetPage(6);
                uiLiteralTitle.Text = ds.Tables[0].Rows[0]["ArPageTitle"].ToString();
                uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["ArPageContent"].ToString());
                
            }
        }

        protected void uiButtonUpload_Click(object sender, EventArgs e)
        {
            try
            {

                MailMessage msg = new MailMessage();
                msg.To.Add(ConfigurationManager.AppSettings["careerMail"]);
                msg.From = new MailAddress(ConfigurationManager.AppSettings["FromMail"]);
                msg.Subject = " Email from jobs page";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.Unicode;

                msg.Body = "Name : " + uiTextBoxName.Text;
                msg.Body += "<br/> Email : " + uiTextBoxEmail.Text;
                if (uiFileUpload.HasFile)
                {
                    msg.Attachments.Add(new Attachment(uiFileUpload.FileContent, uiFileUpload.FileName));
                }

                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["Server"], 25);
                //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["FromMail"], ConfigurationManager.AppSettings["FromPass"]);   
                client.Send(msg);
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = "تم إرسال سيرتك الذاتية بنجاح";
            }
            catch (Exception ex)
            {
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = "حدث خطأ غير متوقع ، من فضلك حاول مرة أخرى";
            }
        }
    }
}