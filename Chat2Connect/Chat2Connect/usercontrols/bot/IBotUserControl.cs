using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chat2Connect.usercontrols.bot
{
    public interface IBotUserControl
    {
        /// <summary>
        /// Bot type id
        /// </summary>
        int BotID
        {
            get;
        }

        string ValidationGroup
        {
            get;
            set;
        }
        void DataBind(Info.RoomBot infoSource);

        Info.RoomBot GetDataObject();
        
    }
}
