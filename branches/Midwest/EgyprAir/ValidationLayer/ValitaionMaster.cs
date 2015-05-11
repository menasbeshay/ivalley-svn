using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Flight_BLL;
namespace ValidationLayer
{
    public class ValidationMaster : ValidationBase
    {
        public ValidationMaster()
        {

        }

        /// <summary>
        /// Validate data against rules 
        /// set validationResult with validation process result
        /// </summary>
        public void Validate(DataTable dt, ValidationRuleToApply rule)
        {
            switch (rule)
            {
                case ValidationRuleToApply.WORKING_HOURS:
                    break;
                case ValidationRuleToApply.FLIGHT_DUTY_PERIOD:
                    // select all days 
                    List<DateTime> Dates = dt.AsEnumerable().Select(r => r.Field<DateTime>("SectorDate")).Distinct().ToList();
                    while (true)
                    {
                        foreach (DateTime day in Dates)
                        {
                            DataTable DaySectors = new DataTable();
                            DaySectors = dt.Clone();
                            // select all sectors in this day  
                            DataRow[] rows = dt.Select(string.Format("SectorDate = '{0}'", day.ToString("MM/dd/yyyy")));
                            foreach (DataRow item in rows)
                            {
                                DaySectors.ImportRow(item);
                            }

                            // min(std) / max(sta) (our interval to validate)
                            var minSTD_maxSTA = from row in DaySectors.AsEnumerable()
                                                group row by new { SectorID = row.Field<DateTime>("SectorDate") } into groupRow
                                                select new 
                                                {                                                    
                                                    MinSTD = groupRow.Min(r => r.Field<DateTime>("STD").TimeOfDay),
                                                    MaxSTA = groupRow.Max(r => r.Field<DateTime>("STA").TimeOfDay)
                                                };

                            DataTable queryResults = new DataTable();
                            queryResults.Columns.Add("MinSTD", typeof(TimeSpan));
                            queryResults.Columns.Add("MaxSTA", typeof(TimeSpan));
                            foreach (var result in minSTD_maxSTA)
                                queryResults.Rows.Add(new object[] { result.MinSTD, result.MaxSTA });



                            TimeSpan DutyStart = TimeSpan.Parse(queryResults.Rows[0]["MinSTD"].ToString()).Add(new TimeSpan(-1,-30,0));
                            if (DutyStart.Hours < 0)
                                DutyStart = DutyStart.Add(new TimeSpan(24, 0, 0));

                            TimeLimitationTable limitationTable = new TimeLimitationTable();
                            limitationTable.GetTimeLimitationPeriod(DutyStart, DaySectors.Rows.Count);

                            // max sta <= std + time validation period - 2 hours 
                            if (TimeSpan.Parse(queryResults.Rows[0]["MaxSTA"].ToString()) <= TimeSpan.Parse(queryResults.Rows[0]["MinSTD"].ToString()).Add(limitationTable.NoOfHours.TimeOfDay).Add(new TimeSpan(-2, 0, 0)))
                            {
                                ValidationResult = true;
                            }
                            else
                            {
                                ValidationResult = false;
                                ValidationMsg.Add(string.Format( "Day {0} has some invalid sectors that may exceed Time limitation", day.ToString("dd/MM/yyyy")));
                            }
                        }
                        
                        break;
                    }
                    break;
                default:
                    break;
            }

            
        }
    }
}
