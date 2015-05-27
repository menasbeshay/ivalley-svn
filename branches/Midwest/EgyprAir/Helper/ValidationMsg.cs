using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace Helper
{
    public class ValidationMsg
    {
        public List<string> Messages = new List<string> ();
        public List<string> References = new List<string> ();
        private bool _IsValid;
        
        public bool IsValid { get { return _IsValid; } set { _IsValid = value; } }
    }

    public enum ValidationMessages
    {
        [Description("Week hours excceded, pilot/crew working more than 50 hours during last week (Crew Member : {0})")]
        WEEK_HOURS_EXCCEDED = 1,
        [Description("Month hours excceded, pilot/crew working more than 100 hours during last month (Crew Member : {0})")]
        MONTH_HOURS_EXCCEDED = 2,
        [Description("Year hours excceded, pilot/crew working more than 900 hours during last 12 months (Crew Member : {0})")]
        YEAR_HOURS_EXCCEDED = 3,
        [Description("Rest periods violation (Not work more than seven consecutive days between days off) (Crew Member : {0})")]
        LAST_7_DAYS_REST = 4,        
        [Description("Rest periods violation (must have 2 consecutive days off in any consecutive 14 days) (Crew Member : {0})")]
        LAST_14_DAYS_REST = 5,
        [Description("Rest periods violation (minimum of 6 days off in any consecutive 4 weeks) (Crew Member : {0})")]
        LAST_4_WEEK_REST = 6,
    }

    public enum ValidationMessagesReferences
    {
        [Description("Manual reference : 7.1.3.1")]
        WEEK_HOURS_EXCCEDED = 1,
        [Description("Manual reference : 7.1.3.2")]
        MONTH_HOURS_EXCCEDED = 2,
        [Description("Manual reference : 7.1.3.3")]
        YEAR_HOURS_EXCCEDED = 3,
        [Description("Manual reference : 7.1.4")]
        REST_PERIOD = 4,
    }


}
