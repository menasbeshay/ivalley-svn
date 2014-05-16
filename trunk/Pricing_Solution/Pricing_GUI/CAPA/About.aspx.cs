using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Net.Mail;
//using EASendMail;
//using System.Web.Mail;

namespace Pricing_GUI
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string MsgBody()
        {

            return " <br /> <img alt=\"\" src=\"Images/MailHeader.jpg\" /><br /><hr style=\"width:550px;text-align:left\"/><div style=\"padding-left:20px\"> " +
 " <b>Dear Chairman of (CompanyName)</b>  <br /> <br /> Kindly be informed that your Product <b></b><br /> <br /> Thanks and Best Regards, Pricing specialist, <br /> " +
 " </div> <br /> <hr style=\"width:550px;text-align:left\"/>  <br /> <img alt=\"\" src=\"Images/MailFooter.jpg\" />";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           //////////////// MailMessage msg = new MailMessage();
           //////////////// string mailfrom = "a.salah.mohamed@gmail.com";
           //////////////// string mailPass = "0128889603";
          
           ////////////////     msg.To.Add("michlosoft@hotmail.com");

           //////////////// msg.From = new MailAddress(mailfrom);
           //////////////// msg.Subject = "test embded Image";
           //////////////// msg.IsBodyHtml = true;
           //////////////// msg.BodyEncoding = System.Text.Encoding.Unicode;

           //////////////// msg.Body = MsgBody();

           ////////////////// msg.Attachments.Add(new Attachment("Images/MailHeader.jpg"));
           //////////////// System.Web.Mail.SmtpMail oMail = new System.Web.Mail.SmtpMail();
           //////////////// Attachment oAttachment = oMail.AddAttachment("d:\\test.gif"); //new Attachment("Images/MailHeader.jpg");

           //////////////// // Specifies the attachment as an embedded image
           //////////////// // contentid can be any string.
           //////////////// string contentID = "HeaderImage";
           //////////////// oAttachment.ContentID = contentID;
           //////////////// oMail.HtmlBody = "<html><body>this is a <img src=\"cid:"
           ////////////////      + contentID + "\"> embedded image.</body></html>"; 

           //////////////// //SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 110);
           //////////////// SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
           //////////////// client.EnableSsl = true;
           //////////////// client.UseDefaultCredentials = false;

           //////////////// client.Credentials = new System.Net.NetworkCredential("a.salah.mohamed@gmail.com", "0128889603");
           //////////////// client.Send(msg);
           //////////////// // Response.Redirect("services/success.aspx");
           //////////////// return true;


            ////SmtpMail oMail = new SmtpMail("TryIt");
            ////SmtpClient oSmtp = new SmtpClient();

            ////// Set sender email address, please change it to yours
            ////oMail.From = "michael@i-valley.com";

            ////// Set recipient email address, please change it to yours
            ////oMail.To = "michlosoft@hotmail.com";

            ////// Set email subject
            ////oMail.Subject = "test html email with attachment";

            ////// Your SMTP server address
            ////SmtpServer oServer = new SmtpServer("smtp.i-valley.com");

            ////// User and password for ESMTP authentication, if your server doesn't require
            ////// User authentication, please remove the following codes.
            ////oServer.User = "michael@i-valley.com";
            ////oServer.Password = "justme";

            ////// If your SMTP server requires SSL connection, please add this line
            ////// oServer.ConnectType = SmtpConnectType.ConnectSSLAuto;

            ////try
            ////{
            ////    // Add image attachment from local disk
            ////    Attachment oAttachment = oMail.AddAttachment(Server.MapPath("Images/MailHeader.jpg"));

            ////    // Specifies the attachment as an embedded image
            ////    // contentid can be any string.
            ////    string contentID = "test001@host";
            ////    oAttachment.ContentID = contentID;
            ////    oMail.HtmlBody = "<html><body>this is a <img src=\"cid:"
            ////         + contentID + "\"> embedded image.</body></html>";

            ////  //  Console.WriteLine("start to send email with embedded image...");
            ////    oSmtp.SendMail(oServer, oMail);
            ////    //Console.WriteLine("email was sent successfully!");
            ////}
            ////catch (Exception ep)
            ////{
            ////   // Console.WriteLine("failed to send email with the following error:");
            ////    //Console.WriteLine(ep.Message);
            ////} 
        }
    }
}
