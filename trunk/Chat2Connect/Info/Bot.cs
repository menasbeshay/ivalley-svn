using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Info
{
    public class Bot
    {
        public int ID
        {
            get;
            set;
        }
        public string Title
        {
            get;
            set;
        }

        public string IconPath { get; set; }

        [JsonProperty(TypeNameHandling = TypeNameHandling.Objects)]
        public BotSettings SettingObject { get; set; }

        public int Points { get; set; }
    }
}
