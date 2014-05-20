using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Helper
{
    public class Date
    {
        public static const string DateStringFormat = "yyyy/MM/dd";
        public static DateTime ToDate(string dateString)
        {
            return DateTime.ParseExact(dateString, DateStringFormat, null);
        }
        public static string ToString(DateTime date)
        {
            return date.ToString(DateStringFormat);
        }
    }
}
