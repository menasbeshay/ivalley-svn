using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace Chat2Connect.Logic
{
    public class Common
    {
    }

    public enum PaymentMethod
	{
        [StringValue("تحويل من صديق")]
	    FriendTransefer,
        [StringValue("تحويل ينكى")]
        BankTransefer,
        [StringValue("دفع أونلاين")]
        OnlinePayment,
        [StringValue("تحويل من الإدارة")]
        AgentTransefer,
        [StringValue("تحويل إلى صديق")]
        TranseferToFriend,
        [StringValue("صبغ إسم")]
        UpgradeAccount,
        [StringValue("صبغ غرفة")]
        UpgradeRoom
	}

    public class StringValue : System.Attribute
    {

        private string _value;

        public StringValue(string value)
        {
            _value = value;
        }

        public string Value
        {
            get { return _value; }
        }

    }

    public static class StringEnum
    {
        public static string GetStringValue(Enum value)
        {
            string output = null;
            Type type = value.GetType();

            //Check first in our cached results...

            //Look for our 'StringValueAttribute' 

            //in the field's custom attributes

            FieldInfo fi = type.GetField(value.ToString());
            StringValue[] attrs =
               fi.GetCustomAttributes(typeof(StringValue),
                                       false) as StringValue[];
            if (attrs.Length > 0)
            {
                output = attrs[0].Value;
            }

            return output;
        }
    }
}