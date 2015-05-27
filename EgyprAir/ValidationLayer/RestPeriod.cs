using Flight_BLL;
using Helper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace ValidationLayer
{
    public class RestPeriod : ValidationBase
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
        public RestPeriod(DataTable dt)
        {
            GetAllDataForRule(dt);
        }

        #endregion

        #region Methods
        public void GetAllDataForRule(DataTable dt)
        {
            // fill any extra data to local datatable 
            // get last 28 days for such a pilot
            int PilotID = Convert.ToInt32(dt.Rows[0]["PilotID"]);
            DateTime DutyDate = Convert.ToDateTime(dt.Rows[0]["DutyDate"]);

            Pilot trxs = new Pilot();
            trxs.GetPilotTransactions(PilotID,DutyDate.AddDays(-28), DutyDate);
            LocalData = trxs.DefaultView.Table;

        }
        public void ValidationMain()
        {
            // Egyption rules are :
            // 1 day off each 7 consecutive days 
            // 2 consecutive days off every any consecutive 14 days
            // minimum 6 days off in any consecutive 4 weeks (28 days)
            // get last 28 days then check rules as following:
            // 4 weeks - 14 days - 7 days 
            int Last7Days = 0, Last14Days = 0, Last4Weeks = 0;
            DateTime currentdate = new DateTime();
            LocalData.DefaultView.Sort = "day desc";
            for (int i = 0; i < LocalData.Rows.Count; i++)
            {
                //count day only one time as data set can get more that 1 flight / transaction in the same day 
                if (currentdate != Convert.ToDateTime(LocalData.Rows[i]["day"].ToString()))
                {
                    currentdate = Convert.ToDateTime(LocalData.Rows[i]["day"].ToString());
                    if (LocalData.Rows[i]["StatusType"].ToString() != "WORK")
                    {
                        // count rest days in last 7 days
                        if (i < 7)
                            Last7Days++;

                        //count rest days in last 14 days
                        if (i < 14)
                            Last14Days++;

                        // count rest days in last 4 weeks
                        Last4Weeks++;

                    }
                }
            }

            if (Last7Days < 1)
            {
                ValidationMsg.Add(Helper.EnumUtils.ToDescriptionString(ValidationMessages.LAST_7_DAYS_REST));
                ValidationResult = false;                
            }

            if (Last14Days < 3)
            {
                ValidationMsg.Add(Helper.EnumUtils.ToDescriptionString(ValidationMessages.LAST_14_DAYS_REST));
                ValidationResult = false;
            }

            if (Last4Weeks < 6)
            {
                ValidationMsg.Add(Helper.EnumUtils.ToDescriptionString(ValidationMessages.LAST_4_WEEK_REST));
                ValidationResult = false;
            }


        }
        #endregion
    }
}
