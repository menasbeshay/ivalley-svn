using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class ChangePassword:Log
    {
        public ChangePassword()
        {
            Type = Helper.Enums.LogType.ChangePassword;
        }

        public string OldPassword
        {
            get;
            set;
        }
        public string NewPassword
        {
            get;
            set;
        }
    }
}
