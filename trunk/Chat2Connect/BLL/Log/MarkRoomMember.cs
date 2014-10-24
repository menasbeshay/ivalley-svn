using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class MarkRoomMember : Log
    {
        public MarkRoomMember()
        {
            Type = Helper.Enums.LogType.MarkRoomMember;
        }
        public int MemberID { get; set; }
        [Helper.BoundProperty(HeaderText = "النيكنيم", DisplayOrder = 1)]
        public string MemberName { get; set; }

    }
}
