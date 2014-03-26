using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;
using System.Net.Mail;

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
                msg.To.Add("jobs@altaqwaschools.com");
                msg.From = new MailAddress("jobs@altaqwaschools.com");
                msg.Subject = " Email from jobs page";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.Unicode;

                msg.Body = "Name : " + uiTextBoxName.Text;
                msg.Body += "<br/> Email : " + uiTextBoxEmail.Text;
                if (uiFileUpload.HasFile)
                {
                    msg.Attachments.Add(new Attachment(uiFileUpload.FileContent, uiFileUpload.FileName));
                }

                SmtpClient client = new SmtpClient("mail.altaqwaschools.com", 25);
                //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential("jobs@altaqwaschools.com", "password");
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