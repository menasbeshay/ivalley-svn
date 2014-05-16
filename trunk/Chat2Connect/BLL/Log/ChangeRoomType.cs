using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class ChangeRoomType: Log
    {
        public ChangeRoomType()
        {
            Type = Helper.Enums.LogType.ChangeRoomType;
        }

        public static ChangeRoomType FromString(string stringValue)
        {
            return Helper.JsonConverter.Deserialize<ChangeRoomType>(stringValue);
        }

        public int OldTypeID { get; set; }

        public int NewTypeID { get; set; }

        public DateTime OldTypeExpiryDate { get; set; }

        public DateTime NewTypeExpiryDate { get; set; }
    }
}
