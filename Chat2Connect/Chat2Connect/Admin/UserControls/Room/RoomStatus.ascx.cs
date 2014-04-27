using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin.UserControls.Room
{
    public partial class RoomStatus : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var lstStatus = Helper.EnumUtil.GetValues<Helper.Enums.RowStatus>().Select(r => new
                {
                    ID = (int)r,
                    Name = Helper.StringEnum.GetStringValue(r)
                }).ToList();
                drpRoomStatus.DataValueField = "ID";
                drpRoomStatus.DataTextField = "Name";
                drpRoomStatus.DataSource = lstStatus;
                drpRoomStatus.DataBind();
            }
        }

        public int RoomID
        {
            get
            {
                return Convert.ToInt32(ViewState["SelectedRoomID"]);
            }
            set
            {
                ViewState["SelectedRoomID"] = value;
                BindRoomInfo();
            }
        }

        private void BindRoomInfo()
        {
            BLL.Room room = new BLL.Room();
            if (room.LoadByPrimaryKey(RoomID))
            {
                drpRoomStatus.SelectedValue = room.s_RowStatusID;
            }
        }

        protected void btnUpdateRoomStatus_Click(object sender, EventArgs e)
        {
            BLL.Room room = new BLL.Room();
            if (room.LoadByPrimaryKey(RoomID))
            {
                if (drpRoomStatus.SelectedValue != room.s_RowStatusID)
                {
                    room.RowStatusID = Convert.ToByte(drpRoomStatus.SelectedValue);
                    room.Save();

                    //SEND MAIL MESSAGE BY THE NEW STATUS TO ROOM OWNERS AND ADMINS
                    string msgTitle = "تغيير حالة غرفة";
                    string msgBody = String.Format("عزيزى العضو<br><br>تحية طيبة وبعد<br><br>نود إبلاغكم بأنه تم تغيير حالة الغرفة <b>{0}</b> إلى <b>{1}</b><br><br><br>شكرا<br>",room.Name,drpRoomStatus.SelectedItem.Text);
                    BLL.MemberMessage message = new BLL.MemberMessage();
                    message.AddNew();
                    message.MessageSubject = msgTitle;
                    message.MessageContent = msgBody;
                    message.MemberID = room.CreatedBy;
                    message.SenderID = BLL.Member.SiteMembers.Where(m => String.Equals(m.Name, Helper.StringEnum.GetStringValue(Helper.Enums.SiteMembers.Admin))).FirstOrDefault().MemberID;
                    message.SendDate = DateTime.Now;
                    message.Save();
                }
            }
        }
    }
}