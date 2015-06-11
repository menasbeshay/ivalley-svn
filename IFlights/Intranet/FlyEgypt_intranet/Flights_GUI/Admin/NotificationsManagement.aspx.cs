using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Web.Services;
using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Web.Script.Services;

namespace Flights_GUI.Admin
{
    public partial class NotificationsManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Groups grps = new Groups();
                grps.LoadAll();
                CheckBoxListGroups.DataSource = grps.DefaultView;
                CheckBoxListGroups.DataTextField = Groups.ColumnNames.GroupName;
                CheckBoxListGroups.DataValueField = Groups.ColumnNames.GroupID;
                CheckBoxListGroups.DataBind();

               
            }
        }

        private void sendNotificationEmails(List<string> MailToList)
        {
            /*MailMessage msg = new MailMessage();
            string mail = uiRadEditorContnet.Text;
            string mailto = AllToNotify.GetColumn("Email").ToString();
            msg.To.Add(mailto);
            msg.From = new MailAddress(mail);
            msg.Subject = GetLocalResourceObject("subject").ToString();
            msg.IsBodyHtml = true;
            msg.BodyEncoding = System.Text.Encoding.UTF8;

            msg.Body = string.Format(GetLocalResourceObject("MailBody").ToString(), AllToNotify.GetColumn("DisplayName").ToString());
            */
        }

        protected void LinkButtonSendNotifications_Click(object sender, EventArgs e)
        {
            UsersProfiles up = new UsersProfiles();
            Groups gr = new Groups();


            List<string> GroupIDs = CheckBoxListGroups.Items.Cast<ListItem>()
                .Where(li => li.Selected)
                .Select(li => li.Value)
                .ToList();


            up.getuserEmails(GroupIDs);



             try
                {
                    MailMessage msg = new MailMessage();
                    string mail = GetLocalResourceObject("FromMail").ToString();  
                    for (int i = 0; i < up.RowCount; i++)
			{
			 
                        msg.To.Add(up.Email);
                        up.MoveNext();
			}
                    
                    msg.From = new MailAddress(mail);
                    msg.Subject = GetLocalResourceObject("subject").ToString();
                    msg.IsBodyHtml = true;
                    msg.BodyEncoding = System.Text.Encoding.UTF8;

                    msg.Body = uiRadEditorContnet.GetHtml(Telerik.Web.UI.EditorStripHtmlOptions.None);

                  SmtpClient client = new SmtpClient(GetLocalResourceObject("Server").ToString(), 25);
                    //SmtpClient client = new SmtpClient(GetLocalResourceObject("server").ToString(), 25);
                    client.EnableSsl = false;
                    client.UseDefaultCredentials = false;

                    client.Credentials = new System.Net.NetworkCredential(mail, GetLocalResourceObject("Password").ToString());

                    client.Send(msg);
                }
             catch (Exception ex)
             {
                 throw;
             }
        }
        
        
        
    }

   
}
