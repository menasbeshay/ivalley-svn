using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class RechargePoints:Log
    {
        public RechargePoints()
        {
            Type = Helper.Enums.LogType.RechargePoints;
        }
        public static RechargePoints FromString(string stringValue)
        {
            return Helper.JsonConverter.Deserialize<RechargePoints>(stringValue);
        }

        [Helper.BoundProperty(HeaderText = "إسم العضو", DisplayOrder = 1)]
        public string MemberName { get; set; }

        [Helper.BoundProperty(HeaderText = "عدد النقاط", DisplayOrder = 2)]
        public int Points { get; set; }


    }
}
