using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class TransferPoints : Log
    {
        public TransferPoints()
        {
            Type = Helper.Enums.LogType.TransferPoints;
        }

        public static TransferPoints FromString(string stringValue)
        {
            return Helper.JsonConverter.Deserialize<TransferPoints>(stringValue);
        }

        [Helper.BoundProperty(HeaderText = "إسم العضو", DisplayOrder = 1)]
        public string MemberName { get; set; }

        [Helper.BoundProperty(HeaderText = "النقاط", DisplayOrder = 2)]
        public int Points { get; set; }
    }
}
