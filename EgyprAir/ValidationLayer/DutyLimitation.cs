using Flight_BLL;
using Helper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace ValidationLayer
{
    public class DutyLimitation : ValidationBase
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
        public DutyLimitation(DataTable dt)
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
            int weekhours = 0;
            int weekmins = 0;
            int monthhours = 0;
            int monthmins = 0;
            int yearhours = 0;
            int yearmins = 0;
            int PilotID = Convert.ToInt32(LocalData.Rows[0]["PilotID"]);
            DateTime DutyDate = Convert.ToDateTime(LocalData.Rows[0]["DutyDate"]);

            Pilot currentPilot = new Pilot();
            currentPilot.GetPilotHoursWithinRangeAsTable_Validation(PilotID, DutyDate.AddDays(-7), DutyDate);
            int.TryParse(currentPilot.GetColumn("GrandTotalHours").ToString(), out weekhours);
            int.TryParse(currentPilot.GetColumn("GrandTotalMins").ToString(), out weekmins);

            currentPilot.GetPilotHoursWithinRangeAsTable_Validation(PilotID, DutyDate.AddDays(-30), DutyDate);
            int.TryParse(currentPilot.GetColumn("GrandTotalHours").ToString(), out monthhours);
            int.TryParse(currentPilot.GetColumn("GrandTotalMins").ToString(), out monthmins);

            currentPilot.GetPilotHoursWithinRangeAsTable_Validation(PilotID, DutyDate.AddDays(-365), DutyDate);
            int.TryParse(currentPilot.GetColumn("GrandTotalHours").ToString(), out yearhours);
            int.TryParse(currentPilot.GetColumn("GrandTotalMins").ToString(), out yearmins);

            if (weekhours > 50)
            {
                ValidationMsg.Add(Helper.EnumUtils.ToDescriptionString(ValidationMessages.WEEK_HOURS_EXCCEDED));
                ValidationResult = false;
                
            }
            if (monthhours > 100)
            {
                ValidationMsg.Add(Helper.EnumUtils.ToDescriptionString(ValidationMessages.MONTH_HOURS_EXCCEDED));
                ValidationResult = false;
            }
            if (yearhours > 900)
            {
                ValidationMsg.Add(Helper.EnumUtils.ToDescriptionString(ValidationMessages.YEAR_HOURS_EXCCEDED));
                ValidationResult = false;
            }
        }

        #endregion
    }
}
