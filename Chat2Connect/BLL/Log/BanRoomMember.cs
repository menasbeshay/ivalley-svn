using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class BanRoomMember : Log
    {
        public BanRoomMember()
        {
            Type = Helper.Enums.LogType.BanRoomMember;
        }
        public int MemberID { get; set; }
        [Helper.BoundProperty(HeaderText = "النيكنيم", DisplayOrder = 1)]
        public string MemberName { get; set; }

        [Helper.BoundProperty(HeaderText = "عدد أيام الحظر", DisplayOrder = 2)]
        public int? BanningDays { get; set; }

        [Helper.BoundProperty(HeaderText = "إنتهاء الحظر", DisplayOrder = 3, DataFormat = Helper.Date.DateStringFormat)]
        public DateTime? EndDate { get; set; }

    }
}
