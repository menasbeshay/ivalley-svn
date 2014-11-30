
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;

namespace Helper
{
    public class JsonConverter
    {
        public static T Deserialize<T>(string stringValue)
        {
            return Newtonsoft.Json.JsonConvert.DeserializeObject<T>(stringValue);
        }

        public static T Deserialize<T>(string stringValue,bool withType)
        {
            Newtonsoft.Json.JsonSerializerSettings settings = new Newtonsoft.Json.JsonSerializerSettings { TypeNameHandling = Newtonsoft.Json.TypeNameHandling.All };
            return Newtonsoft.Json.JsonConvert.DeserializeObject<T>(stringValue,settings);
        }

        public static T Deserialize<T>(string stringValue, Newtonsoft.Json.JsonSerializerSettings settings)
        {
            return Newtonsoft.Json.JsonConvert.DeserializeObject<T>(stringValue,settings);
        }

        public static string Serialize(object instance)
        {
            return Newtonsoft.Json.JsonConvert.SerializeObject(instance);
        }

        public static string Serialize(object instance,bool withType)
        {
            Newtonsoft.Json.JsonSerializerSettings settings = new Newtonsoft.Json.JsonSerializerSettings { TypeNameHandling = Newtonsoft.Json.TypeNameHandling.All };
            return Newtonsoft.Json.JsonConvert.SerializeObject(instance,settings);
        }
    }
}
