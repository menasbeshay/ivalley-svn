using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            MailMessage msg = new MailMessage();
            string mail = uiRadEditorContnet.Text;
            string mailto = AllToNotify.GetColumn("Email").ToString();
            msg.To.Add(mailto);
            msg.From = new MailAddress(mail);
            msg.Subject = GetLocalResourceObject("subject").ToString();
            msg.IsBodyHtml = true;
            msg.BodyEncoding = System.Text.Encoding.UTF8;

            msg.Body = string.Format(GetLocalResourceObject("MailBody").ToString(), AllToNotify.GetColumn("DisplayName").ToString());

        }

        protected void LinkButtonSendNotifications_Click(object sender, EventArgs e)
        {
            List<string> MailToList = new List<string>();

            foreach (CheckBox chk in CheckBoxListGroups.Items)
            {

            }
        }
    }
}