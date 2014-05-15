using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class TransferBalance : Log
    {
        public TransferBalance()
        {
            Type = Helper.Enums.LogType.TransferBalance;
        }

        public int FriendID { get; set; }
        public string FriendName { get; set; }
        public decimal TranseferAmount { get; set; }
    }
}
