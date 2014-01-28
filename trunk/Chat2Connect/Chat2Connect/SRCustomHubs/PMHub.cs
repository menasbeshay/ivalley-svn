using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace Chat2Connect.SRCustomHubs
{
    public class PMHub : Hub
    {
        public void Hello()
        {
            Clients.All.hello();
        }
    }
}