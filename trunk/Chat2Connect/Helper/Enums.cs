using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Helper
{
    public class Enums
    {
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
    }
}
