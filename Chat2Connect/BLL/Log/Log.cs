using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class Log
    {
        public Helper.Enums.LogType Type
        {
            get;
            set;
        }

        public string ToString()
        {
            return Helper.JsonConverter.Serialize(this);
        }
        public static Log FromString(string stringValue)
        {
            return Helper.JsonConverter.Deserialize<Log>(stringValue);
        }
    }
}
