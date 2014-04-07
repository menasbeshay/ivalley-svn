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

    public enum MemberRoles
    {
        [StringValue("المحادثة الخاصة")]
        SpecialChat,
        [StringValue("غرفة مؤقتة")]
        TempRoom,
        [StringValue("صندوق البريد")]
        Mailinbox,
        [StringValue("البريد الصوتى")]
        VoiceMail,
        [StringValue("إرسال رسالة بريد")]
        SendEmail,
        [StringValue("إرسال SMS")]
        SendSMS

    }

    public enum AdminRoles
    {
        [StringValue("معلومات الحساب")]
        Admin_AccountInfo,
        [StringValue("تعديل حساب من/إلى")]
        Admin_ChangeUsername,
        [StringValue("ترقية حساب")]
        Admin_UpdateAccountType,
        [StringValue("حسابات البريد الإلكترونى")]
        Admin_MailsAccounts,
        [StringValue("حسابات ال IP")]
        Admin_IPAccounts,
        [StringValue("التحكم فى الحسابات")]
        Admin_MemberRole,
        [StringValue("التحكم فى خصائص الحسابات")]
        Admin_AdminRoles,
        [StringValue("تعطيل غرفة")]
        Admin_RoomStatus,
        [StringValue("تعطيل/تشغيل حساب")]
        Admin_UpdateAccountStatus

    }

    public enum RowStatus
    {
        [StringValue("فعال")]
        Enabled = 1,
        [StringValue("معطل مؤقتا")]
        TemporaryDisabled = 2,
        [StringValue("معطل نهائيا")]
        PermanentlyDisabled = 3,
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

    public static class EnumUtil
    {
        public static IEnumerable<T> GetValues<T>()
        {
            return Enum.GetValues(typeof(T)).Cast<T>();
        }
    }
}