using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class UnBanRoomMember : Log
    {
        public UnBanRoomMember()
        {
            Type = Helper.Enums.LogType.UnBanRoomMember;
        }
        public int MemberID { get; set; }
        [Helper.BoundProperty(HeaderText = "النيكنيم", DisplayOrder = 1)]
        public string MemberName { get; set; }
    }
}
