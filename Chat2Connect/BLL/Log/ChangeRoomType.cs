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
        [Helper.BoundProperty(HeaderText = "إنتهاء الترقية", DisplayOrder = 3,DataFormat=Helper.Date.DateStringFormat)]
        public DateTime NewTypeExpiryDate { get; set; }

        [Helper.BoundProperty(HeaderText = "إسم الغرفة", DisplayOrder = 1)]
        public string RoomName { get; set; }

        [Helper.BoundProperty(HeaderText = "نوع الترقية", DisplayOrder = 2)]
        public string NewTypeName { get; set; }

        [Helper.BoundProperty(HeaderText = "النقاط", DisplayOrder = 4)]
        public int Points { get; set; }

        [Helper.BoundProperty(HeaderText = "الإسم القديم", DisplayOrder = 5)]
        public string OldName { get; set; }
    }
}
