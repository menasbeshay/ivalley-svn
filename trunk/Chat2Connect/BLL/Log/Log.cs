using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class Log
    {
        [JsonIgnore]
        public Helper.Enums.LogType Type
        {
            get;
            set;
        }

        public string ToString()
        {
            return JsonConvert.SerializeObject(this);

        }

        public T Deserialize<T>(string stringValue)
        {
            return Newtonsoft.Json.JsonConvert.DeserializeObject<T>(stringValue);
        }

    }
}
