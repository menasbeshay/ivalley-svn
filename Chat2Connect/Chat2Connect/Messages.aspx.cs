using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect
{
    public partial class Messages : System.Web.UI.Page
    {
        #region Events

        protected override void InitializeCulture()
        {
            CultureInfo ci = new CultureInfo("ar-EG");
            ci.DateTimeFormat = ci.DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = ci;

            base.InitializeCulture();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Member member=new Member();
                member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
                ctrlMail.MemberName = Membership.GetUser().UserName;
                ctrlMail.MemberID = member.MemberID;


                // logging
                BLL.MemberLog log = new BLL.MemberLog();
                log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.Log() { Type = Helper.Enums.LogType.ViewMailPage }, null, null);
            }
        }

        #endregion

    }
}