using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI
{
    public partial class sendNotifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                uiPanelSuccess.Visible = false;
                Master.PageTitle = "Send notifications";
            }
        }

        protected void uiButtonSend_Click(object sender, EventArgs e)
        {
            uiPanelSuccess.Visible = false;
            SearchFlights();
        }

        private void SearchFlights()
        {
            Sector SectorsObj = new Sector();

            if (Request.QueryString["F"] != null && uiRadDatePickerFrom.SelectedDate == null)
            {
                uiRadDatePickerFrom.SelectedDate = DateTime.ParseExact(Request.QueryString["F"].ToString(), "dd/MM/yyyy", null);
            }

            if (uiRadDatePickerFrom.SelectedDate == null)
            {
                uiRadDatePickerFrom.SelectedDate = GetWeekStartDaTe();
            }

            if (Request.QueryString["T"] != null && uiRadDatePickerTo.SelectedDate == null)
            {
                uiRadDatePickerTo.SelectedDate = DateTime.ParseExact(Request.QueryString["T"].ToString(), "dd/MM/yyyy", null);
            }

            if (uiRadDatePickerTo.SelectedDate == null)
            {
                uiRadDatePickerTo.SelectedDate = GetWeekStartDaTe().AddDays(7);
            }


            SectorsObj.GetPilotsAndCrewToNotify( (uiRadDatePickerFrom.SelectedDate != null) ? uiRadDatePickerFrom.SelectedDate.Value : DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null)
                , (uiRadDatePickerTo.SelectedDate != null) ? uiRadDatePickerTo.SelectedDate.Value : DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null));


            if (uiRadDatePickerFrom.SelectedDate == null)
            {
                uiRadDatePickerFrom.SelectedDate = DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null);
            }
            if (uiRadDatePickerTo.SelectedDate == null)
            {
                uiRadDatePickerTo.SelectedDate = DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null);
            }

            for (int i = 0; i < SectorsObj.RowCount; i++)
            {
                try
                {
                    
                    MailMessage msg = new MailMessage();
                    string mail = GetLocalResourceObject("mail").ToString();
                    string mailto = SectorsObj.GetColumn("Email").ToString();
                    msg.To.Add(mailto);
                    msg.From = new MailAddress(mail);
                    msg.Subject = GetLocalResourceObject("subject").ToString();
                    msg.IsBodyHtml = true;
                    msg.BodyEncoding = System.Text.Encoding.UTF8;

                    msg.Body = string.Format(GetLocalResourceObject("MailBody").ToString(), SectorsObj.GetColumn("DisplayName").ToString(), Server.HtmlDecode(SectorsObj.GetColumn("FlightInfo").ToString()));

                    SmtpClient client = new SmtpClient(GetLocalResourceObject("server").ToString(), 587);
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;

                    client.Credentials = new System.Net.NetworkCredential(mail, GetLocalResourceObject("pass").ToString());
                    client.Send(msg);

                }
                catch (Exception)
                {
                    continue;
                }
                SectorsObj.MoveNext();
            }

            uiPanelSuccess.Visible = true;

        }

        private DateTime GetWeekStartDaTe()
        {
            if (DateTime.Now.DayOfWeek == DayOfWeek.Monday)
            {
                return DateTime.Now;
            }
            else if (DateTime.Now.DayOfWeek == DayOfWeek.Sunday)
            {
                return DateTime.Now.AddDays(1);
            }
            else
            {
                return DateTime.Now.AddDays(-1 * (Convert.ToInt32(DateTime.Now.DayOfWeek) - 1));
            }
        }
    }
}