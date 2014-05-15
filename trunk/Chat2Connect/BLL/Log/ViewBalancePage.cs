using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class ViewBalancePage : Log
    {
        public ViewBalancePage()
        {
            Type = Helper.Enums.LogType.ViewBalancePage;
        }
       
    }
}
