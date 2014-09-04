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
            Admin_StatsReport,
            [StringValue("المساعدة")]
            Admin_SiteHelper,
            [StringValue("إعدادات عامة")]
            Admin_GeneralSettings,

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

        public enum LogType
        {
            [StringValue("إنشاء غرفة")]
            CreateRoom = 1,
            [StringValue("إنشاء غرفة مؤقتة")]
            CreateTempRoom = 2,
            [StringValue("دخول غرفة")]
            EnterRoom = 3,
            [StringValue("إضافة صديق")]
            AddFriend = 4,
            [StringValue("عرض  صفحةالبريد")]
            ViewMailPage = 5,
            [StringValue("عرض  الرصيد")]
            ViewBalancePage = 6,
            [StringValue("صبغ غرفة")]
            ChangeRoomType = 7,
            [StringValue("صبغ حساب")]
            ChangeMemberType = 8,
            [StringValue("شحن رصيد")]
            RechargeBalance = 9,
            [StringValue("تحويل رصيد")]
            TransferBalance = 10,
            [StringValue("دخول محادثة خاصة")]
            EnterPrivateChate = 11,
            [StringValue("تغيير كلمة السر")]
            ChangePassword = 12,
            [StringValue("دخول غرفة مخفى")]
            EnterRoomHidden = 13,
            [StringValue("حذف صديق")]
            DeleteFriend = 14
        }

        public enum BanningType
        {
            [StringValue("نهائى")]
            Permanent = 1,
            [StringValue("شهر")]
            Month = 2,
            [StringValue("أسبوع")]
            Week = 3,
            [StringValue("24 ساعة")]
            Day = 4,
        }

        public enum RoomMemberLevel
        {
            [StringValue("زائر")]
            Visitor = 1,
            [StringValue("مراقب")]
            Admin = 2,
            [StringValue("مدير")]
            SuperAdmin = 3,
            [StringValue("مالك")]
            Owner = 4
        }

        public enum Bot
        {
            Welcome=1,
            InviteFriendsBan=2,
            FollowAdmin=3,
            MembersLogin=4
        }
    }
}
