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
            Sector AllToNotify = new Sector();

            Sector FlightsWithinRange = new Sector();

            // build namse guide
            Pilot pilots = new Pilot();
            pilots.LoadAll();

            Crew crew = new Crew();
            crew.LoadAll();

            string ALLPilotsCrewNames = "";

            ALLPilotsCrewNames = "<table cellpadding='0' cellspacing='0' width='100%' border='0'><tr><td> <h5>Pilots</h5><ul>";
            for (int i = 0; i < pilots.RowCount; i++)
            {
                ALLPilotsCrewNames += "<li>" + pilots.ShortName + " - " + pilots.FirstName + " " + pilots.SecondName + " " + pilots.SureName + "</li>";
                pilots.MoveNext();
            }
            ALLPilotsCrewNames += "</ul></td>";

            ALLPilotsCrewNames += "<td><h5>Crew</h5><ul>";
            for (int i = 0; i < crew.RowCount; i++)
            {
                ALLPilotsCrewNames += "<li>" + crew.ShortName + " - " + crew.Name + "</li>";
                crew.MoveNext();
            }
            ALLPilotsCrewNames += "</ul></td></tr></table>";

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


            AllToNotify.GetPilotsAndCrewInfoToNotify( (uiRadDatePickerFrom.SelectedDate != null) ? uiRadDatePickerFrom.SelectedDate.Value : DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null)
                , (uiRadDatePickerTo.SelectedDate != null) ? uiRadDatePickerTo.SelectedDate.Value : DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null));


            FlightsWithinRange.SearchBatchSectors("", (uiRadDatePickerFrom.SelectedDate != null) ? uiRadDatePickerFrom.SelectedDate.Value : DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null)
                , (uiRadDatePickerTo.SelectedDate != null) ? uiRadDatePickerTo.SelectedDate.Value : DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null));

            if (uiRadDatePickerFrom.SelectedDate == null)
            {
                uiRadDatePickerFrom.SelectedDate = DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null);
            }
            if (uiRadDatePickerTo.SelectedDate == null)
            {
                uiRadDatePickerTo.SelectedDate = DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null);
            }

            // build html table for flights within range
            string AllFlightsWithinRangeHTML = "";
            AllFlightsWithinRangeHTML += GetLocalResourceObject("HeaderFlights").ToString();
            for (int i = 0; i < FlightsWithinRange.RowCount; i++)
            {
                AllFlightsWithinRangeHTML += string.Format(GetLocalResourceObject("FlightTemplate").ToString(), FlightsWithinRange.SectorDate.ToString("dd/MM/yyyy"), FlightsWithinRange.FlightNo, FlightsWithinRange.STD.ToString("HH:mm"), FlightsWithinRange.STA.ToString("HH:mm"), FlightsWithinRange.GetColumn("FromA").ToString(), FlightsWithinRange.GetColumn("TOA"), Server.HtmlDecode(FlightsWithinRange.GetColumn("Pilots").ToString()), Server.HtmlDecode(FlightsWithinRange.GetColumn("Crew").ToString()));
                FlightsWithinRange.MoveNext();
            }
            AllFlightsWithinRangeHTML += GetLocalResourceObject("FooterFlights").ToString();

            for (int i = 0; i < AllToNotify.RowCount; i++)
            {
                try
                {
                    MailMessage msg = new MailMessage();
                    string mail = GetLocalResourceObject("mail").ToString();
                    string mailto = AllToNotify.GetColumn("Email").ToString();
                    msg.To.Add(mailto);
                    msg.From = new MailAddress(mail);
                    msg.Subject = GetLocalResourceObject("subject").ToString();
                    msg.IsBodyHtml = true;
                    msg.BodyEncoding = System.Text.Encoding.UTF8;

                    msg.Body = string.Format(GetLocalResourceObject("MailBody").ToString(), AllToNotify.GetColumn("DisplayName").ToString());


                    if (AllToNotify.GetColumn("Pilot").ToString() == "1") // pilot
                    {                        
                        Pilot pt = new Pilot();
                        pt.GetPilotTransactions( Convert.ToInt32(AllToNotify.GetColumn("PilotID").ToString()),
                                                (uiRadDatePickerFrom.SelectedDate != null) ? uiRadDatePickerFrom.SelectedDate.Value : DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null)
                                              , (uiRadDatePickerTo.SelectedDate != null) ? uiRadDatePickerTo.SelectedDate.Value : DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null));

                        // fix night city preview
                        for (int j = 0; j < pt.RowCount; j++)
                        {
                            // has night city 
                            if (!pt.IsColumnNull("City"))
                            {
                                Sector nextsector = new Sector();
                                // get next sector in same flight
                                if (!pt.IsColumnNull("SectorID"))
                                {
                                    nextsector.GetNextSector(Convert.ToInt32(pt.GetColumn("SectorID")));
                                    DateTime CurrentDate = Convert.ToDateTime(pt.GetColumn("day"));
                                    string currentCity = pt.GetColumn("city").ToString();
                                    if (nextsector.RowCount > 0)
                                    {
                                        for (int k = 0; k < nextsector.SectorDate.Subtract(CurrentDate).Days; k++)
                                        {

                                            try
                                            {
                                                pt.SetColumn("city", currentCity);
                                                pt.SetColumn("StatusType", "WORK");
                                                pt.MoveNext();
                                                j++;
                                            }
                                            catch (Exception ex)
                                            {
                                                // CurrentDate = CurrentDate.AddDays(1);
                                                pt.MoveNext();
                                                j++;

                                            }
                                            //CurrentDate = CurrentDate.AddDays(1);

                                        }
                                    }
                                }

                            }
                            pt.MoveNext();
                        }

                        // back to 1st row
                        pt.Rewind();

                        msg.Body += GetLocalResourceObject("HeaderStatus").ToString();
                        for (int j = 0; j < pt.RowCount; j++)
                        {
                            msg.Body += string.Format(GetLocalResourceObject("StatusTemplate").ToString(), Convert.ToDateTime(pt.GetColumn("day").ToString()).ToString("dd/MM/yyyy"), 
                                                                                                            pt.GetColumn("StatusDay").ToString(),
                                                                                                            pt.IsColumnNull("StatusType") ? "Day off" : pt.GetColumn("StatusType").ToString(),
                                                                                                            pt.GetColumn("FlightNo").ToString(),
                                                                                                            pt.GetColumn("Route").ToString(), 
                                                                                                            pt.IsColumnNull("STD") ? "" : Convert.ToDateTime(pt.GetColumn("STD").ToString()).ToString("HH:mm"),
                                                                                                            pt.IsColumnNull("STA") ? "" : Convert.ToDateTime(pt.GetColumn("STA").ToString()).ToString("HH:mm"), 
                                                                                                            pt.GetColumn("City").ToString());
                            pt.MoveNext();
                        }
                        msg.Body += GetLocalResourceObject("FooterStatus").ToString();
                    }
                    else if (AllToNotify.GetColumn("Pilot").ToString() == "0") // crew
                    {
                        Crew pt = new Crew();
                        pt.GetCrewTransactions(Convert.ToInt32(AllToNotify.GetColumn("PilotID").ToString()),
                                                (uiRadDatePickerFrom.SelectedDate != null) ? uiRadDatePickerFrom.SelectedDate.Value : DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null)
                                              , (uiRadDatePickerTo.SelectedDate != null) ? uiRadDatePickerTo.SelectedDate.Value : DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null));


                        // fix night city preview
                        for (int j = 0; j < pt.RowCount; j++)
                        {
                            // has night city 
                            if (!pt.IsColumnNull("City"))
                            {
                                Sector nextsector = new Sector();
                                // get next sector in same flight
                                if (!pt.IsColumnNull("SectorID"))
                                {
                                    nextsector.GetNextSector(Convert.ToInt32(pt.GetColumn("SectorID")));
                                    DateTime CurrentDate = Convert.ToDateTime(pt.GetColumn("day"));
                                    string currentCity = pt.GetColumn("city").ToString();
                                    if (nextsector.RowCount > 0)
                                    {
                                        for (int k = 0; k < nextsector.SectorDate.Subtract(CurrentDate).Days; k++)
                                        {

                                            try
                                            {
                                                pt.SetColumn("city", currentCity);
                                                pt.SetColumn("StatusType", "WORK");
                                                pt.MoveNext();
                                                j++;
                                            }
                                            catch (Exception ex)
                                            {
                                                // CurrentDate = CurrentDate.AddDays(1);
                                                pt.MoveNext();
                                                j++;

                                            }
                                            //CurrentDate = CurrentDate.AddDays(1);

                                        }
                                    }
                                }

                            }
                            pt.MoveNext();
                        }

                        // back to 1st row
                        pt.Rewind();

                        msg.Body += GetLocalResourceObject("HeaderStatus").ToString();
                        for (int j = 0; j < pt.RowCount; j++)
                        {
                            msg.Body += string.Format(GetLocalResourceObject("StatusTemplate").ToString(), Convert.ToDateTime(pt.GetColumn("day").ToString()).ToString("dd/MM/yyyy"),
                                                                                                            pt.GetColumn("StatusDay").ToString(),
                                                                                                            pt.IsColumnNull("StatusType") ? "Day off" : pt.GetColumn("StatusType").ToString(),
                                                                                                            pt.GetColumn("FlightNo").ToString(),
                                                                                                            pt.GetColumn("Route").ToString(),
                                                                                                            pt.IsColumnNull("STD") ? "" : Convert.ToDateTime(pt.GetColumn("STD").ToString()).ToString("HH:mm"),
                                                                                                            pt.IsColumnNull("STA") ? "" : Convert.ToDateTime(pt.GetColumn("STA").ToString()).ToString("HH:mm"), 
                                                                                                            pt.GetColumn("City").ToString());
                            pt.MoveNext();
                        }
                        msg.Body += GetLocalResourceObject("FooterStatus").ToString();
                    }


                    msg.Body += "<p>&nbsp;</p>" + AllFlightsWithinRangeHTML;

                    msg.Body += "<p>&nbsp;</p>" + ALLPilotsCrewNames;

                    SmtpClient client = new SmtpClient(GetLocalResourceObject("server").ToString(), 587);
                    //SmtpClient client = new SmtpClient(GetLocalResourceObject("server").ToString(), 25);
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;

                    client.Credentials = new System.Net.NetworkCredential(mail, GetLocalResourceObject("pass").ToString());
                    client.Send(msg);

                }
                catch (Exception ex)
                {
                    throw;
                }
                AllToNotify.MoveNext();
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