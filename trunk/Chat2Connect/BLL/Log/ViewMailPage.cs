using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class ViewMailPage : Log
    {
        public ViewMailPage()
        {
            Type = Helper.Enums.LogType.ViewMailPage;
        }
       
    }
}
