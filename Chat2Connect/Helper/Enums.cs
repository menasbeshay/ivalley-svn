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

        public enum MemberStatus
        {
            [StringValue("متصل")]
            Online=1,
            [StringValue("مشغول")]
            Busy=2,
            [StringValue("بعيد")]
            Away=3,
            [StringValue("غير متصل")]
            Offline=4
        }
        public enum MemberRoles
        {
            [StringValue("المحادثة الخاصة")]
            SpecialChat,
            [StringValue("غرفة مؤقتة")]
            TempRoom,
            [StringValue("صندوق البريد")]
            Mailinbox,
            [StringValue("إرسال رسالة بريد")]
            SendEmail,
            [StringValue("دخول مخفى للغرف")]
            InvisibleInRoom
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
            [StringValue("تعطيل حساب")]
            Admin_UpdateAccountStatus,
            [StringValue("حركة حساب")]
            Admin_AccountHistory,
            [StringValue("إصدار حساب مميز")]
            Admin_AddVIPAccount,
            [StringValue("صبغ غرفة")]
            Admin_RoomType,
            [StringValue("بريد الموقع")]
            Admin_SiteMails,
            [StringValue("إرسال رسائل للحسابات")]
            Admin_SendMessgae,
            [StringValue("إحصائيات")]
            Admin_StatsReport

        }

        public enum SiteMembers
        {
            [StringValue("المساعدة")]
            Help,
            [StringValue("البرمجة")]
            Programming,
            [StringValue("الشكاوى")]
            Problems,
            [StringValue("الإقتراحات والإستفسارات")]
            Inquiries,
            [StringValue("الوظائف")]
            Jobs,
            [StringValue("الدعم الفنى")]
            Support,
            [StringValue("التسويق والإعلان")]
            Marketing,
            [StringValue("الإدارة")]
            Admin,
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

        public enum AdminMailAddressAlias
        {
            [StringValue("الجميع")]
            All,
            [StringValue("المتواجدين الأن")]
            Online,
            [StringValue("الغير متواجد")]
            Offline,
            [StringValue("الحساب المصبوغ")]
            TypedAccount,
        }
    }
}
