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

        [Helper.BoundProperty(HeaderText = "إسم العضو", DisplayOrder = 1)]
        public string MemberName
        {
            get;
            set;
        }
        [Helper.BoundProperty(HeaderText="كلمة السر القديمة",DisplayOrder=2)]
        public string OldPassword
        {
            get;
            set;
        }
        [Helper.BoundProperty(HeaderText = "كلمة السر الجديدة", DisplayOrder = 3)]
        public string NewPassword
        {
            get;
            set;
        }

    }
}
