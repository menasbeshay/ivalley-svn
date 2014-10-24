using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class EnterPrivateChate:Log
    {
        public EnterPrivateChate()
        {
            Type = Helper.Enums.LogType.EnterPrivateChate;
        }
        public int FriendID { get; set; }
        [Helper.BoundProperty(HeaderText = "إسم الصديق", DisplayOrder = 1)]
        public string FriendName { get; set; }

    }
}
