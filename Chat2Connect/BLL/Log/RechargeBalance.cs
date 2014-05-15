using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class RechargeBalance:Log
    {
        public RechargeBalance()
        {
            Type = Helper.Enums.LogType.RechargeBalance;
        }

        public decimal RechargeAmount { get; set; }
    }
}
