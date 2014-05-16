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

        public static TransferBalance FromString(string stringValue)
        {
            return Helper.JsonConverter.Deserialize<TransferBalance>(stringValue);
        }

        public int FriendID { get; set; }
        [Helper.BoundProperty(HeaderText = "تحويل إلى", DisplayOrder = 1)]
        public string FriendName { get; set; }

        [Helper.BoundProperty(HeaderText = "قيمة التحويل", DisplayOrder = 2, DataFormat = "{0:0.0#}&nbsp;ريال")]
        public decimal TranseferAmount { get; set; }
    }
}
