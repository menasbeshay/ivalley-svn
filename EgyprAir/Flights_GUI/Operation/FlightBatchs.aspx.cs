using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Operation
{
    public partial class FlightBatchs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                uiPanelSuccess.Visible = false;
                Master.PageTitle = "Flights batch";
            }
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            uiPanelSuccess.Visible = false;
            SearchFlights();
        }

        protected void uiButtonSend_Click(object sender, EventArgs e)
        {
            uiPanelSuccess.Visible = false;
            SendMail();
        }

        private void SendMail()
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


            SectorsObj.SearchBatchSectors("",(uiRadDatePickerFrom.SelectedDate != null) ? uiRadDatePickerFrom.SelectedDate.Value : DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null)
                , (uiRadDatePickerTo.SelectedDate != null) ? uiRadDatePickerTo.SelectedDate.Value : DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null));

            try
            {

                MailMessage msg = new MailMessage();
                string mail = GetLocalResourceObject("mail").ToString();
                string [] mailto  = uiTextBoxMailto.Text.Split(';');
                foreach (string item in mailto)
                {
                    if(!string.IsNullOrEmpty(item))
                        msg.To.Add(item);    
                }
                
                msg.From = new MailAddress(mail);
                msg.Subject = GetLocalResourceObject("subject").ToString();
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.UTF8;

                for (int i = 0; i < SectorsObj.RowCount; i++)
                {
                    msg.Body += string.Format(GetLocalResourceObject("FlightTemplate").ToString(), SectorsObj.SectorDate.ToString("dd/MM/yyyy"), SectorsObj.FlightNo, SectorsObj.STD.ToString("HH:mm"), SectorsObj.STA.ToString("HH:mm"), SectorsObj.GetColumn("FromA").ToString(), SectorsObj.GetColumn("TOA"), Server.HtmlDecode(SectorsObj.GetColumn("Pilots").ToString()), Server.HtmlDecode(SectorsObj.GetColumn("Crew").ToString()));
                    SectorsObj.MoveNext();
                }

                msg.Body += uiTextBoxBody.Text;
                SmtpClient client = new SmtpClient(GetLocalResourceObject("server").ToString(), 587);
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(mail, GetLocalResourceObject("pass").ToString());
                client.Send(msg);

            }
            catch (Exception)
            {
                throw;
            }

            uiPanelSuccess.Visible = true;
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


            SectorsObj.SearchBatchSectors("",(uiRadDatePickerFrom.SelectedDate != null) ? uiRadDatePickerFrom.SelectedDate.Value : DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null)
                , (uiRadDatePickerTo.SelectedDate != null) ? uiRadDatePickerTo.SelectedDate.Value : DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null));


            if (uiRadDatePickerFrom.SelectedDate == null)
            {
                uiRadDatePickerFrom.SelectedDate = DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null);
            }
            if (uiRadDatePickerTo.SelectedDate == null)
            {
                uiRadDatePickerTo.SelectedDate = DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null);
            }

            uiRadGridFlights.DataSource = SectorsObj.DefaultView;
            uiRadGridFlights.DataBind();
            
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

        protected void uiRadGridFlights_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            uiRadGridFlights.CurrentPageIndex = e.NewPageIndex;
            SearchFlights();
        }

        protected void uiRadGridFlights_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {            
            SearchFlights();
        }
    }
}