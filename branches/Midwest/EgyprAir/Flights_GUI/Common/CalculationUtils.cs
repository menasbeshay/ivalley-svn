using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Flight_BLL;
using System.Data;
using System.Globalization;

namespace Flights_GUI.Common
{
    public class CalculationUtils
    {
        public CalculationUtils()
        {

        }
        
        public static TimeSpan[] CalculatePilotStatus(int pilotID, string fromdate, string todate)
        {
            TimeSpan []result;
            Pilot current = new Pilot();
            current.LoadByPrimaryKey(pilotID);
            Pilot p = new Pilot();
            DateTime? From = null;
            DateTime? To = null;
            CultureInfo provider = CultureInfo.InvariantCulture;
            provider = new CultureInfo("fr-FR");
            if (!string.IsNullOrEmpty(fromdate))
            {
                From = DateTime.ParseExact(fromdate, "dd/MM/yyyy", provider);
            }
            if (!string.IsNullOrEmpty(todate))
            {
                To = DateTime.ParseExact(todate, "dd/MM/yyyy", provider);
            }
            if (current.RowCount > 0)
                p.GetPilotSchedule(current.PilotID, From, To);
            else
                return null;
            
            /************************************************************************************************/
        
            DateTime FromAverage, ToAverage = new DateTime();
            FromAverage = To.Value.AddDays(-28);
            ToAverage = To.Value;

            TimeSpan AverageTotal = new TimeSpan();
            //TimeSpan DutyAverageTotal = new TimeSpan();
        
            /***********current month Grand Total *************/
        
            Pilot pTotal = new Pilot();
            DateTime FromTotal = new DateTime(To.Value.Year, To.Value.Month, 1);
            DateTime ToTotal = new DateTime(To.Value.Year, To.Value.Month, getLastDay(To.Value.Month));

            pTotal.GetPilotSchedule(current.PilotID, FromTotal, ToTotal);
            TimeSpan TotalTime = new TimeSpan();
            TimeSpan TotalTimeUpToDate = new TimeSpan();
            //TimeSpan DutyTotalUpToDate = new TimeSpan();

            foreach (DataRow row in pTotal.DefaultView.Table.Rows)
            {
                TimeSpan currentTime = new TimeSpan();
                if (row["ChoxOff"] != null && row["ChoxOn"] != null && string.IsNullOrEmpty(row["ChoxOff"].ToString()) && string.IsNullOrEmpty(row["ChoxOn"].ToString()) && (DateTime.Parse(row["ChoxOn"].ToString()).Subtract(DateTime.Parse(row["ChoxOff"].ToString())) != TimeSpan.Zero))
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
                    /*
                    if (DutyTotalUpToDate == TimeSpan.Zero)
                    {
                        DutyTotalUpToDate = currentTime.Add(new TimeSpan(1, 30, 0));
                    }
                    else
                    {
                        DutyTotalUpToDate = DutyTotalUpToDate.Add(currentTime.Add(new TimeSpan(1, 30, 0)));
                    }*/
                }

                /* calculate the average total for the last 4 weeks  */
                /* add times related to average of last 4 weeks period from current month  */
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
                    /*
                    if (DutyAverageTotal == TimeSpan.Zero)
                    {
                        DutyAverageTotal = currentTime.Add(new TimeSpan(1, 30, 0));
                    }
                    else
                    {
                        DutyAverageTotal = DutyAverageTotal.Add(currentTime.Add(new TimeSpan(1, 30, 0)));
                    }
                    */

                }
            }            

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
                if (row["ChoxOff"] != null && row["ChoxOn"] != null && string.IsNullOrEmpty(row["ChoxOff"].ToString()) && string.IsNullOrEmpty(row["ChoxOn"].ToString()) && (DateTime.Parse(row["ChoxOn"].ToString()).Subtract(DateTime.Parse(row["ChoxOff"].ToString())) != TimeSpan.Zero))
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

                /* add times related to average of last 4 weeks period from last month  */
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
                    /*
                    if (DutyAverageTotal == TimeSpan.Zero)
                    {
                        DutyAverageTotal = currentTime.Add(new TimeSpan(1, 30, 0));
                    }
                    else
                    {
                        DutyAverageTotal = DutyAverageTotal.Add(currentTime.Add(new TimeSpan(1, 30, 0)));
                    }
                    */
                }
            }

            result = new TimeSpan[4];
            result[0] = TotalTime; // current month total
            result[1] = LastTotalTime; // last month total
            result[2] = AverageTotal; // last 4 weeks average
            result[3] = TotalTimeUpToDate; // total for selected period 

            return result;

        }

        private static int getLastDay(int p)
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
                case 2:
                    return 28;
                default:
                    return 30;
            }
        }
        
    }
}