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
        public static RechargeBalance FromString(string stringValue)
        {
            return Helper.JsonConverter.Deserialize<RechargeBalance>(stringValue);
        }

        [Helper.BoundProperty(HeaderText = "قيمة الشحن", DisplayOrder = 1, DataFormat="{0:0.0#}&nbsp;ريال")]
        public decimal RechargeAmount { get; set; }
    }
}
