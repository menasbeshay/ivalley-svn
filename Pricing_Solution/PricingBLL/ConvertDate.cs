using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class ConvertDate
    {
        public ConvertDate()
        {

        }

        public static DateTime ConvertStringToDateCulture(string inputDate)
        {
            System.Globalization.CultureInfo cultureinfo = new System.Globalization.CultureInfo("en-US");
            return DateTime.Parse(inputDate, cultureinfo);
        }
    }
}
