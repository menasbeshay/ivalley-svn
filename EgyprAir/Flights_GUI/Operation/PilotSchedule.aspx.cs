using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Globalization;
using System.Data;
using System.Web.UI.HtmlControls;

namespace Flights_GUI.Operation
{
    public partial class PilotSchedule : System.Web.UI.Page
    {
        public string currentday = "";
        TimeSpan Companytotal = new TimeSpan();
        TimeSpan DutyHoursTotal = new TimeSpan();        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Pilot status";
                Header.Visible = false;
                totals.Visible = false;
                grandTotal.Visible = false;
                guide.Visible = false;
                CurrentMonthTotal.Visible = false;
                AverageTotals.Visible = false;
 
                LoadDDLs();
            }
        }

        private void LoadDDLs()
        {
            Pilot Allpilots = new Pilot();
            Allpilots.LoadAll();
            uiDropDownListPilots.DataSource = Allpilots.DefaultView;
            uiDropDownListPilots.DataTextField = "ShortName";
            uiDropDownListPilots.DataValueField = "PilotID";
            uiDropDownListPilots.DataBind();
            uiDropDownListPilots.Items.Insert(0, new ListItem("Select Pilot", "0"));
        }
        protected void uiRadGridTrx_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindData();
        }       

        private void BindData()
        {
            Pilot current = new Pilot();
            current.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListPilots.SelectedValue));
            Pilot p = new Pilot();
            DateTime? From = null;
            DateTime? To = null;
            CultureInfo provider = CultureInfo.InvariantCulture;
            provider = new CultureInfo("fr-FR");
            if (!string.IsNullOrEmpty(uiTextBoxFrom.Text))
            {
                From = DateTime.ParseExact(uiTextBoxFrom.Text, "dd/MM/yyyy", provider);
            }
            if (!string.IsNullOrEmpty(uiTextBoxTo.Text))
            {
                To = DateTime.ParseExact(uiTextBoxTo.Text, "dd/MM/yyyy", provider);
            }
            if (current.RowCount > 0)
                p.GetPilotTransactions(current.PilotID, From, To);
            else
                p.GetPilotTransactions(3, From, To);

            for (int i = 0; i < p.RowCount; i++)
            {
                // has night city 
                if (!p.IsColumnNull("City"))
                {
                    Sector nextsector = new Sector();
                    // get next sector in same flight
                    if (!p.IsColumnNull("SectorID"))
                    {
                        nextsector.GetNextSector(Convert.ToInt32(p.GetColumn("SectorID")));
                        DateTime CurrentDate = Convert.ToDateTime(p.GetColumn("day"));
                        string currentCity = p.GetColumn("city").ToString();
                        if (nextsector.RowCount > 0)
                        {
                            for (int j = 0; j < nextsector.SectorDate.Subtract(CurrentDate).Days; j++)
                            {

                                try
                                {
                                    p.SetColumn("city", currentCity);                                    
                                    p.SetColumn("StatusType", "WORK");
                                    p.MoveNext();
                                    i++;
                                }
                                catch (Exception ex)
                                {
                                   // CurrentDate = CurrentDate.AddDays(1);
                                    p.MoveNext();
                                    i++;

                                }
                                //CurrentDate = CurrentDate.AddDays(1);

                            }
                        }
                    }
                    
                }
                p.MoveNext();
            }


            uiRadGridTrx.DataSource = p.DefaultView;
            uiRadGridTrx.DataBind();

            /*
            if (current.RowCount > 0)
                p.GetPilotSchedule(current.PilotID, From, To);
            else
                p.GetPilotSchedule(3, From, To);
             * */
            uiLabelFullName.Text = current.FirstName + " " + current.SecondName;
            uiLabelShortName.Text = current.ShortName;
            //uiDataListSchedule.DataSource = p.DefaultView;
            //uiDataListSchedule.DataBind();
            Header.Visible = true;
            totals.Visible = true;
            grandTotal.Visible = true;
            guide.Visible = true;
            CurrentMonthTotal.Visible = true;
            AverageTotals.Visible = true;
 
            uiLabelCompanyTotal.Text = Math.Floor(Companytotal.TotalHours).ToString() + ":" + Companytotal.Minutes.ToString("00");
            
            if (Companytotal.TotalHours < 50)
            {
                DIVcompanyTotal.Attributes.Add("class", "greenI");
            }
            else if (Companytotal.TotalHours >= 50 && Companytotal.TotalHours < 70)
            {
                DIVcompanyTotal.Attributes.Add("class", "yellowI");
            }
            else if (Companytotal.TotalHours >= 70 && Companytotal.TotalHours < 80)
            {
                DIVcompanyTotal.Attributes.Add("class", "blueI");
            }
            else if (Companytotal.TotalHours >= 80)
            {
                DIVcompanyTotal.Attributes.Add("class", "redI");
            }


            uiLabelCAATotal.Text = Math.Floor(Companytotal.TotalHours).ToString() + ":" + Companytotal.Minutes.ToString("00");

            if (Companytotal.TotalHours < 50)
            {
                DIVCAATotal.Attributes.Add("class", "greenI");
            }
            else if (Companytotal.TotalHours >= 50 && Companytotal.TotalHours < 70)
            {
                DIVCAATotal.Attributes.Add("class", "yellowI");
            }
            else if (Companytotal.TotalHours >= 70 && Companytotal.TotalHours < 80)
            {
                DIVCAATotal.Attributes.Add("class", "blueI");
            }
            else if (Companytotal.TotalHours >= 80)
            {
                DIVCAATotal.Attributes.Add("class", "redI");
            }


            uiLabelDutyTotal.Text = Math.Floor(DutyHoursTotal.TotalHours).ToString() + ":" + DutyHoursTotal.Minutes.ToString("00");

            if (DutyHoursTotal.TotalHours < 50)
            {
                DIVDutyTotal.Attributes.Add("class", "greenI");
            }
            else if (DutyHoursTotal.TotalHours >= 50 && DutyHoursTotal.TotalHours < 70)
            {
                DIVDutyTotal.Attributes.Add("class", "yellowI");
            }
            else if (DutyHoursTotal.TotalHours >= 70 && DutyHoursTotal.TotalHours < 80)
            {
                DIVDutyTotal.Attributes.Add("class", "blueI");
            }
            else if (DutyHoursTotal.TotalHours >= 80)
            {
                DIVDutyTotal.Attributes.Add("class", "redI");
            }
            /************************************************************************************************/
            
            DateTime FromAverage, ToAverage = new DateTime();
            FromAverage = To.Value.AddDays(-28);
            ToAverage = To.Value;

            TimeSpan AverageTotal = new TimeSpan();
            TimeSpan DutyAverageTotal = new TimeSpan();

            /***********current month Grand Total *************/
            Pilot pTotal = new Pilot();
            DateTime FromTotal = new DateTime(To.Value.Year, To.Value.Month, 1);
            DateTime ToTotal = new DateTime(To.Value.Year, To.Value.Month, getLastDay(To.Value.Month));

            pTotal.GetPilotSchedule(current.PilotID, FromTotal, ToTotal);
            TimeSpan TotalTime = new TimeSpan();
            TimeSpan TotalTimeUpToDate = new TimeSpan();
            TimeSpan DutyTotalUpToDate = new TimeSpan();

            foreach (DataRow row in pTotal.DefaultView.Table.Rows)
            {
                TimeSpan currentTime = new TimeSpan();
                if (row["ChoxOff"] != null && row["ChoxOn"] != null && (DateTime.Parse(row["ChoxOn"].ToString()).Subtract(DateTime.Parse(row["ChoxOff"].ToString())) != TimeSpan.Zero))
                {
                    DateTime choxon = DateTime.Parse(row["ChoxOn"].ToString());
                    DateTime choxoff = DateTime.Parse(row["ChoxOff"].ToString());
                    currentTime = choxon.Subtract(choxoff);
                }
                else
                {
                    DateTime STD = DateTime.Parse(row["STD"].ToString());
                    DateTime STA = DateTime.Parse(row["STA"].ToString());
                    currentTime = STA.Subtract(STD);
                }


                if (TotalTime == TimeSpan.Zero)
                {
                    TotalTime = currentTime;
                }
                else
                {
                    TotalTime = TotalTime.Add(currentTime);
                }


                /* calculate total for currrent month from 1 to the ToDate */
                if (Convert.ToDateTime(row["SectorDate"].ToString()) <= To.Value)
                {
                    if (TotalTimeUpToDate == TimeSpan.Zero)
                    {
                        TotalTimeUpToDate = currentTime;
                    }
                    else
                    {
                        TotalTimeUpToDate = TotalTimeUpToDate.Add(currentTime);
                    }

                    if (DutyTotalUpToDate == TimeSpan.Zero)
                    {
                        DutyTotalUpToDate = currentTime.Add(new TimeSpan (1, 30, 0));
                    }
                    else
                    {
                        DutyTotalUpToDate = DutyTotalUpToDate.Add(currentTime.Add(new TimeSpan (1, 30, 0)));
                    }                    
                }

                /* calculate the average total for the last 4 weeks  */
                if (Convert.ToDateTime(row["SectorDate"].ToString()) <= ToAverage && Convert.ToDateTime(row["SectorDate"].ToString()) >= FromAverage)
                {
                    if (AverageTotal == TimeSpan.Zero)
                    {
                        AverageTotal = currentTime;
                    }
                    else
                    {
                        AverageTotal = AverageTotal.Add(currentTime);
                    }

                    if (DutyAverageTotal == TimeSpan.Zero)
                    {
                        DutyAverageTotal = currentTime.Add(new TimeSpan (1, 30, 0));
                    }
                    else
                    {
                        DutyAverageTotal = DutyAverageTotal.Add(currentTime.Add(new TimeSpan (1, 30, 0)));
                    }

                    
                }
            }


            uiLabelGrandTotal.Text = "<div style='float:left;width:230px'>" + From.Value.ToString("MMMM") + " Total Hours : </div><div style='float:right;width:50px'>" + Math.Floor(TotalTime.TotalHours).ToString("00") + ":" + TotalTime.Minutes.ToString("00") + "</div>";
           
            /************************/

            /***********last month Grand Total *************/
            Pilot pLastTotal = new Pilot();
            DateTime FromLastTotal = new DateTime((From.Value.Month != 1) ? From.Value.Year : From.Value.Year - 1, (From.Value.Month != 1) ? From.Value.Month - 1 : 12, 1);
            DateTime ToLastTotal = new DateTime((From.Value.Month != 1) ? From.Value.Year : From.Value.Year - 1, (From.Value.Month != 1) ? From.Value.Month - 1 : 12, getLastDay((From.Value.Month != 1) ? From.Value.Month - 1 : 12));

            pLastTotal.GetPilotSchedule(current.PilotID, FromLastTotal, ToLastTotal);
            TimeSpan LastTotalTime = new TimeSpan();

            foreach (DataRow row in pLastTotal.DefaultView.Table.Rows)
            {
                TimeSpan currentTime = new TimeSpan();
                if (row["ChoxOff"] != null && row["ChoxOn"] != null && (DateTime.Parse(row["ChoxOn"].ToString()).Subtract(DateTime.Parse(row["ChoxOff"].ToString())) != TimeSpan.Zero))
                {
                    DateTime choxon = DateTime.Parse(row["ChoxOn"].ToString());
                    DateTime choxoff = DateTime.Parse(row["ChoxOff"].ToString());
                    currentTime = choxon.Subtract(choxoff);
                }
                else
                {
                    DateTime STD = DateTime.Parse(row["STD"].ToString());
                    DateTime STA = DateTime.Parse(row["STA"].ToString());
                    currentTime = STA.Subtract(STD);
                }


                if (LastTotalTime == TimeSpan.Zero)
                {
                    LastTotalTime = currentTime;
                }
                else
                {
                    LastTotalTime = LastTotalTime.Add(currentTime);
                }


                if (Convert.ToDateTime(row["SectorDate"].ToString()) <= ToAverage && Convert.ToDateTime(row["SectorDate"].ToString()) >= FromAverage)
                {
                    if (AverageTotal == TimeSpan.Zero)
                    {
                        AverageTotal = currentTime;
                    }
                    else
                    {
                        AverageTotal = AverageTotal.Add(currentTime);
                    }

                    if (DutyAverageTotal == TimeSpan.Zero)
                    {
                        DutyAverageTotal = currentTime.Add(new TimeSpan (1, 30, 0));
                    }
                    else
                    {
                        DutyAverageTotal = DutyAverageTotal.Add(currentTime.Add(new TimeSpan (1, 30, 0)));
                    }
                    
                }
            }

            

            uiLabelLastTotal.Text = "<div style='float:left;width:230px'>" + FromLastTotal.ToString("MMMM") + " Total Hours : </div><div style='float:right;width:50px'>" + Math.Floor(LastTotalTime.TotalHours).ToString("00") + ":" + LastTotalTime.Minutes.ToString("00") + "</div>";
           
            /************************/
            //uiLabelCurrentMonth.Text = "<div style='float:left;width:230px'>" + "Current Month Total Hours : </div><div style='float:right;width:50px'>" + Math.Floor(TotalTimeUpToDate.TotalHours).ToString("00") + ":" + TotalTimeUpToDate.Minutes.ToString("00") + "</div>";
            //uiLabelAverageTotal.Text = "<div style='float:left;width:230px'>" + "Last four weeks Avergae Total Hours : </div><div style='float:right;width:50px'>" + Math.Floor(AverageTotal.TotalHours / 4.0).ToString("00") + ":" + Math.Floor(AverageTotal.Minutes / 4.0).ToString("00") +"</div>";

            uiLabelCurrentMCompantTotal.Text = Math.Floor(TotalTimeUpToDate.TotalHours).ToString() + ":" + TotalTimeUpToDate.Minutes.ToString("00");
            uiLabelCurrentMCAATotal.Text = Math.Floor(TotalTimeUpToDate.TotalHours).ToString() + ":" + TotalTimeUpToDate.Minutes.ToString("00");
            uiLabelCurrentMDutyTotal.Text = Math.Floor(DutyTotalUpToDate.TotalHours).ToString() + ":" + DutyTotalUpToDate.Minutes.ToString("00");


            uiLabelAverageCompany.Text = Math.Floor(AverageTotal.TotalHours / 4.0).ToString() + ":" + Math.Floor(AverageTotal.Minutes  / 4.0 ).ToString("00");
            uiLabelAverageCAA.Text = Math.Floor(AverageTotal.TotalHours / 4.0).ToString() + ":" + Math.Floor(AverageTotal.Minutes / 4.0).ToString("00");
            uiLabelAverageDuty.Text = Math.Floor(DutyAverageTotal.TotalHours / 4.0).ToString() + ":" + Math.Floor(DutyAverageTotal.Minutes / 4.0).ToString("00");
        }

        private int getLastDay(int p)
        {
            switch (p)
            {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    return 31;
                case 4:
                case 6:
                case 9:
                case 11:
                    return 30;
                case 2 : 
                    return 28;
                default:
                    return 30;
            }
        }

        protected void uiLinkButtonView_Click(object sender, EventArgs e)
        {
            BindData();
        }

        public string displayday(string day)
        {
            if (currentday == day)
                return "";
            else
            {
                currentday = day;
                uiDataListSchedule.RepeatColumns += 1;
                return Eval("Day") + "<div style='clear:both;'></div>" + String.Format("{0:dd/MM/yyyy}", Eval("SectorDate"));
            }
        }

        protected void uiDataListSchedule_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                if (Convert.ToInt32(row["AirPlane"].ToString()) == 1)
                {

                    HtmlGenericControl DivDetail = (HtmlGenericControl)e.Item.FindControl("Detail");
                    DivDetail.Attributes.CssStyle.Add("background-color","yellow");
                    DivDetail.Attributes.CssStyle.Add("color", "black");
                }
                else
                {
                    HtmlGenericControl DivDetail = (HtmlGenericControl)e.Item.FindControl("Detail");
                    DivDetail.Attributes.CssStyle.Add("background-color","green");
                    DivDetail.Attributes.CssStyle.Add("color", "white");
                }


                CultureInfo ci = CultureInfo.InvariantCulture;
                Label company = (Label)e.Item.FindControl("uiLabelCompany");
                Label CAA = (Label)e.Item.FindControl("uiLabelCAA");
                Label DutyHours = (Label)e.Item.FindControl("uiLabelDutyHours");
                TimeSpan Duty = new TimeSpan();
                if (row["ChoxOff"] != null && row["ChoxOn"] != null && (DateTime.Parse(row["ChoxOn"].ToString()).Subtract(DateTime.Parse(row["ChoxOff"].ToString())) != TimeSpan.Zero))
                {
                    DateTime choxon = DateTime.Parse(row["ChoxOn"].ToString());
                    DateTime choxoff = DateTime.Parse(row["ChoxOff"].ToString());
                    Duty = choxon.Subtract(choxoff);
                }
                else
                {
                    DateTime STD = DateTime.Parse(row["STD"].ToString());
                    DateTime STA = DateTime.Parse(row["STA"].ToString());
                    Duty = STA.Subtract(STD);
                }

                if (Companytotal == TimeSpan.Zero)
                {
                    Companytotal = Duty;
                }
                else
                {
                    Companytotal = Companytotal.Add(Duty);
                }

                if (DutyHoursTotal == TimeSpan.Zero)
                {
                    DutyHoursTotal = Duty.Add(new TimeSpan(1, 30, 0));
                }
                else
                {
                   DutyHoursTotal = DutyHoursTotal.Add(Duty.Add(new TimeSpan(1, 30, 0)));
                }
                company.Text = Duty.ToString("hh\\:mm");
                CAA.Text = company.Text;
                DutyHours.Text = Duty.Add(new TimeSpan(1,30,0)).ToString("hh\\:mm");

            }
        }     




    }
}

