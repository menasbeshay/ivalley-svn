using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Helper
{
    public class TypeConverter
    {
        public static bool ToBoolean(object val)
        {
            if (val == DBNull.Value)
                return false;
            return Convert.ToBoolean(val);
        }

        public static int ToInt32(object val)
        {
            if (val == DBNull.Value)
                return 0;
            return Convert.ToInt32(val);
        }

        public static string ToString(object val)
        {
            if (val == DBNull.Value)
                return String.Empty;
            return Convert.ToString(val);
        }
    }
}
