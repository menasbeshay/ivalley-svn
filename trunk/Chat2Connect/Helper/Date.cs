using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Helper
{
    public class Date
    {
        public const string DateStringFormat = "yyyy/MM/dd";
        public const string DateTimeStringFormat = "tt:mm:hh yyyy/MM/dd";
        public static DateTime ToDate(string dateString)
        {
            return DateTime.ParseExact(dateString, DateStringFormat, null);
        }
        public static string ToString(DateTime date)
        {
            return date.ToString(DateStringFormat);
        }
        public static string ToDateTimeString(DateTime date)
        {
            return date.ToString(DateTimeStringFormat,new System.Globalization.CultureInfo("ar-EG"));
        }
    }
}
