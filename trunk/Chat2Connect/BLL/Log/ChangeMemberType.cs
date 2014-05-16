using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class ChangeMemberType : Log
    {
        public ChangeMemberType()
        {
            Type = Helper.Enums.LogType.ChangeMemberType;
        }

        public static ChangeMemberType FromString(string stringValue)
        {
            return Helper.JsonConverter.Deserialize<ChangeMemberType>(stringValue);
        }

        public int OldTypeID { get; set; }

        public int NewTypeID { get; set; }

        public DateTime OldTypeExpiryDate { get; set; }

        public DateTime NewTypeExpiryDate { get; set; }


    }
}
