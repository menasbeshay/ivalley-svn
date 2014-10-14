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

        [Helper.BoundProperty(HeaderText = "إنتهاء الصبغة", DisplayOrder = 3,DataFormat="{0:"+Helper.Date.DateStringFormat+"}")]
        public DateTime NewTypeExpiryDate { get; set; }

        [Helper.BoundProperty(HeaderText = "إسم الغرفة", DisplayOrder = 1)]
        public string RoomName { get; set; }

        [Helper.BoundProperty(HeaderText = "نوع الصبغة", DisplayOrder = 2)]
        public string NewTypeName { get; set; }

        [Helper.BoundProperty(HeaderText = "النقاط", DisplayOrder = 4)]
        public int Points { get; set; }
    }
}
