using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect
{
    public partial class LoadMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.Form["message"]))
                {
                    int msgID = 0;
                    int.TryParse(Request.Form["message"], out msgID);

                    BLL.MemberMessage msg = new BLL.MemberMessage();
                    if (msg.LoadFullInfoByID(msgID))
                    {
                        if (!msg.IsRead && !msg.IsColumnNull(BLL.MemberMessage.ColumnNames.MemberID))
                        {
                            msg.IsRead = true;
                            msg.Save();
                            Chat2Connect.SRCustomHubs.NotificationHub notification = new SRCustomHubs.NotificationHub();
                            notification.SendMailNotifications(msg.MemberID);
                        }
                    }

                    dtlMessage.DataSource = msg.DefaultView;
                    dtlMessage.DataBind();
                }
            }
        }
    }
}