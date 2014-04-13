using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Helper
{
    public class Date
    {
        public static DateTime ToDate(string dateString)
        {
            return DateTime.ParseExact(dateString, "yyyy/MM/dd", null);
        }
        public static string ToString(DateTime date)
        {
            return date.ToString("yyyy/MM/dd");
        }
    }
}
