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
        [Description("Week hours excceded, pilot/crew working more than 50 hours during last week")]
        WEEK_HOURS_EXCCEDED = 1,
        [Description("Month hours excceded, pilot/crew working more than 100 hours during last month")]
        MONTH_HOURS_EXCCEDED = 2,
        [Description("Year hours excceded, pilot/crew working more than 900 hours during last 12 months")]
        YEAR_HOURS_EXCCEDED = 3, 
    }

    public enum ValidationMessagesReferences
    {
        [Description("Manual reference : 7.1.3.1")]
        WEEK_HOURS_EXCCEDED = 1,
        [Description("Manual reference : 7.1.3.2")]
        MONTH_HOURS_EXCCEDED = 2,
        [Description("Manual reference : 7.1.3.3")]
        YEAR_HOURS_EXCCEDED = 3,
    }
}
