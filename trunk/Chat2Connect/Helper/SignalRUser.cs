using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Helper
{
    public class SignalRUser
    {

        public string ConnectionId { get; set; }

        public string MemberName { get; set; }

        public int MemberID { get; set; }

        public List<int> Rooms { get; set; }
    }
}
