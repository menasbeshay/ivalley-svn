using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chat2Connect.usercontrols.bot
{
    public interface IBotUserControl
    {
        void DataBind(Info.RoomBot infoSource);

        Info.RoomBot GetDataObject();
        
    }
}
