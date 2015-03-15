using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Taqwa.Website
{
    public partial class ContactRespon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendMsg_Click(object sender, EventArgs e)
        {
            string msgTxt = txtMsg.Text;

            try
            {
                MailMessage msg = new MailMessage();

                switch (int.Parse(drpDwnReceiver.SelectedValue.ToString()))
                {
                    case 0: //مدير المدرسة
                        msg.To.Add(ConfigurationManager.AppSettings["ManagerMail"]);
                        break;

                    case 1: //الإخصائي النفسي
                        msg.To.Add(ConfigurationManager.AppSettings["PsychologistMail"]);
                        break;

                    case 2: //مسئول الموقع
                        msg.To.Add(ConfigurationManager.AppSettings["WebSiteAdminMail"]);
                        break;

                    default:
                        break;
                }


                msg.From = new MailAddress(ConfigurationManager.AppSettings["FromMail"]);
                msg.Subject = " Email From Contact Responsible";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.UTF8;

                msg.Body = msgTxt;

                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["Server"], 25);
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["FromMail"], ConfigurationManager.AppSettings["FromPass"]);
                client.Send(msg);
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "تم إرسال رسالتك بنجاح" + "');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "حدث خطأ غير متوقع ، من فضلك حاول مرة أخرى" + "');", true);
            }
        }
    }
}