using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Flight_BLL;


namespace ValidationLayer
{
    public class MaxDaily_FDB : ValidationBase
    {
        #region Fields
        DataTable _LocalData;
        #endregion 
        #region Properties
        public DataTable LocalData { get { return _LocalData; } set { _LocalData = value; } }
        #endregion

        #region Events

        /// <summary>
        /// Class Constructor
        /// </summary>
        public MaxDaily_FDB(DataTable dt)
        {
            LocalData = dt.Clone();
            foreach (DataRow item in dt.Rows)
	        {
                LocalData.ImportRow(item);    
	        }
            
        }

        #endregion

        #region Methods

        public void GetAllDataForRule()
        {            
            // fill any extra data to local datatable 
        }

        public void ValidationMain()
        {
            /// 1- load prepared data from DB ( Validation Tables )
            /// 2- Loop on LocalDataTable we have ( sent from GUI ) - ( Get day by Day )
            /// 3- Loop inside each day ( sector count - First Takeoff time - Last landing time  )
            /// inside ( loop 3 ) -> Get Number value from DB table (TABLE A)  ACCLIMATIZED LOCAL TIME (*)
            /// inside ( loop 3) -> Based on Previous .. do calculation using the Equation 
            /// 
            
            // select all days 
            List<DateTime> Dates = LocalData.AsEnumerable().Select(r => r.Field<DateTime>("SectorDate")).Distinct().ToList();

            bool IsHeavy = Convert.ToBoolean(LocalData.Rows[0]["IsHeavyCrew"]);
            int pilotID = Convert.ToInt32(LocalData.Rows[0]["pilotID"]);

            foreach (DateTime day in Dates)
            {

                DataTable DaySectors = new DataTable();
                DaySectors = LocalData.Clone();
                // select all sectors in this day  
                DataRow[] rows = LocalData.Select(string.Format("SectorDate = '{0}'", day.ToString("MM/dd/yyyy")));
                foreach (DataRow item in rows)
                {
                    DaySectors.ImportRow(item);
                }

                // min(std) / max(sta) (our interval to validate)
                var minSTD_maxSTA = from row in DaySectors.AsEnumerable()                                            
                                    group row by new { SectorDate = row.Field<DateTime>("SectorDate") } into groupRow
                                    let f = groupRow.FirstOrDefault() 
                                    select new
                                    {
                                        MinSTD = groupRow.Min(r => r.Field<DateTime>("STD").TimeOfDay),
                                        MaxSTA = groupRow.Max(r => r.Field<DateTime>("STA").TimeOfDay),
                                        AirportID = Convert.ToInt32(f["From_AirportID"])
                                    };


                // calc and add all split duty rest to FDP 
                List<TimeSpan> extendingBySplitDuty = new List<TimeSpan>();
                for (int i = 0; i < DaySectors.Rows.Count-1 ; i++)
                {                        
                    DateTime currentSTA = Convert.ToDateTime(DaySectors.Rows[i]["STA"]);
                    DateTime NextSTD = Convert.ToDateTime(DaySectors.Rows[i+1]["STD"]);
                    if ((NextSTD - currentSTA).Hours >= 3)
                    {
                        TimeSpan t = new TimeSpan(0, 0, 0);
                        t.Add(new TimeSpan((NextSTD - currentSTA).Hours/2,(NextSTD - currentSTA).Minutes / 2,0)); 
                        extendingBySplitDuty.Add(t);
                    }
                }

                TimeSpan totalSplitDutyRest = new TimeSpan(extendingBySplitDuty.Sum<TimeSpan>(r => r.Ticks));
                    

                // add 1/3 of block time (rest) to FDP
                TimeSpan totalExtentionByInFlightRelief = new TimeSpan(0, 0, 0);
                if (IsHeavy)
                {
                    Pilot p = new Pilot();
                    p.GetPilotHoursWithinRangeAsTable_Validation(pilotID, day, day);
                    totalExtentionByInFlightRelief.Add(new TimeSpan(Convert.ToInt32(p.GetColumn("GrandTotalHours")), Convert.ToInt32(p.GetColumn("GrandTotalMins")), 0));
                }

                DataTable queryResults = new DataTable();
                queryResults.Columns.Add("MinSTD", typeof(TimeSpan));
                queryResults.Columns.Add("MaxSTA", typeof(TimeSpan));
                queryResults.Columns.Add("AirportID", typeof(int));
                foreach (var result in minSTD_maxSTA)
                    queryResults.Rows.Add(new object[] { result.MinSTD, result.MaxSTA, result.AirportID });

                // get time zone of airport
                Flight_BLL.TimeZone zone = new Flight_BLL.TimeZone();
                AirPort airport = new AirPort();
                airport.LoadByPrimaryKey(Convert.ToInt32(queryResults.Rows[0]["AirportID"]));
                if (!airport.IsColumnNull(AirPort.ColumnNames.TimeZoneID))
                    zone.LoadByPrimaryKey(airport.TimeZoneID);

                TimeSpan DutyStart = TimeSpan.Parse(queryResults.Rows[0]["MinSTD"].ToString()).Add(new TimeSpan(-1, -30, 0));
                if (zone.RowCount > 0)
                    DutyStart = DutyStart.Add(new TimeSpan(zone.Hours, zone.Mins, 0));

                if (DutyStart.Hours < 0)
                    DutyStart = DutyStart.Add(new TimeSpan(24, 0, 0));

                TimeLimitationTable limitationTable = new TimeLimitationTable();
                limitationTable.GetTimeLimitationPeriod(DutyStart, DaySectors.Rows.Count);

                // max sta <= min std + time validation period - 2 hours + total extension by split duty + total hours by in flight relief
                if (TimeSpan.Parse(queryResults.Rows[0]["MaxSTA"].ToString()) <= TimeSpan.Parse(queryResults.Rows[0]["MinSTD"].ToString()).Add(limitationTable.NoOfHours.TimeOfDay).Add(new TimeSpan(-2, 0, 0)).Add(totalSplitDutyRest).Add(totalExtentionByInFlightRelief))
                {
                    ValidationResult = true;
                }
                else
                {
                    ValidationResult = false;
                    ValidationMsg.Add(string.Format("Day {0} has some invalid sectors that may exceed Time limitation", day.ToString("dd/MM/yyyy")));
                }
            }

               
        }

        #endregion


    }
}
