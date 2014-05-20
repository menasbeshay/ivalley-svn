using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

namespace Chat2Connect.usercontrols
{
    public partial class RoomTypes : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPage();
            }
        }

        private void BindPage()
        {
            Room rooms = new Room();
            if (Helper.Admin.IsAdmin() && Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_RoomType.ToString()))
            {
                rooms.LoadAll();
            }
            else
            {
                rooms.GetRoomsByCreatorID(BLL.Member.CurrentMemberID);
            }

            uiDropDownListMyRooms.DataSource = rooms.DefaultView;
            uiDropDownListMyRooms.DataValueField = "RoomID";
            uiDropDownListMyRooms.DataTextField = "Name";
            uiDropDownListMyRooms.DataBind();

            RoomTypeSpec roomTypeSpec = new RoomTypeSpec();
            roomTypeSpec.LoadAll();
            repRoomTypeSpecs.DataSource = roomTypeSpec.DefaultView;
            repRoomTypeSpecs.DataBind();

        }

        protected void uiLinkButtonConfirm_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser();
            if (user.PasswordQuestion == uiDropDownListQuestion.SelectedValue && BLL.Member.CurrentMember.Answer == uiTextBoxAnswer.Text)
            {
                if (!String.IsNullOrEmpty(uiDropDownListMyRooms.SelectedValue))
                {
                    Room room = new Room();
                    room.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListMyRooms.SelectedValue));

                    try
                    {
                        int type = Convert.ToInt32(selectedTypeSpecDurationID.Value);
                        decimal val = Convert.ToDecimal(selectedTypeSpecDurationPrice.Value);

                        if (BLL.Member.CurrentMember.Credit_Money < val)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Error3", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام العملية.'); });", true);
                            return;
                        }

                        BLL.Member.CurrentMember.Credit_Money -= val;
                        BLL.Member.CurrentMember.Save();

                        room.RoomType.RoomTypeSpecDurationID = type;
                        room.RoomType.CreateBy = BLL.Member.CurrentMember.MemberID;
                        room.RoomType.StartDate = DateTime.Now;
                        room.RoomType.EndDate = DateTime.Now.AddMonths(room.RoomType.RoomTypeSpecDuration.TypeDuration.MonthesNumber);
                        room.RoomType.Save();

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Success1", @"$(document).ready(function () { notify('success', 'تم صبغة الغرفة بنجاح.'); });", true);

                        UserTransLog log2 = new UserTransLog();
                        log2.AddNew();
                        log2.MemberID = BLL.Member.CurrentMember.MemberID;
                        log2.Value = val;
                        log2.TransType = 2;
                        log2.TransDate = DateTime.Now;
                        log2.PaymentMethod = Helper.StringEnum.GetStringValue(Helper.Enums.PaymentMethod.UpgradeRoom);
                        log2.Save();

                        BLL.MemberLog log = new BLL.MemberLog();
                        log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.ChangeRoomType() { RoomName=room.Name, NewTypeName=room.RoomType.RoomTypeSpecDuration.RoomTypeSpec.Name,NewTypeExpiryDate=room.RoomType.EndDate}, null, room.RoomID);

                    }
                    catch (Exception ex)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Error11", @"$(document).ready(function () { notify('error', 'حدث خطأ . من فضلك أعد المحاولة.'); });", true);
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Error4", @"$(document).ready(function () { notify('error', 'حدث خطأ . من فضلك أعد المحاولة.'); });", true);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Error5", @"$(document).ready(function () { notify('error', 'حدث خطأ . من فضلك تأكد من السؤال والإجابة السرى.'); });", true);
                return;
            }
        }

        private int roomTypespecID;
        protected void repRoomTypeSpecs_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                Repeater repDurations = (Repeater)e.Item.FindControl("repDurations");
                roomTypespecID = Convert.ToInt32(row["ID"]);

                TypeDuration duration = new TypeDuration();
                duration.LoadOfRoomTypeSpecID(roomTypespecID);
                repDurations.DataSource = duration.DefaultView;
                repDurations.DataBind();

            }
        }

        public string GetRoomOrder(int order)
        {
            string orderString = "";
            switch (order)
            {
                case 1:
                    orderString = "تظهر فى الغرف VIP &nbsp;&nbsp;&nbsp;&nbsp;<br />وتظهر فى أعلى القائمة";
                    break;
                case 2:
                    orderString = "فى أعلى القائمة";
                    break;
                case 3:
                    orderString = "قبل الغرف الغير ملونة";
                    break;
                case 4:
                    orderString = "بعد الغرف الملونة";
                    break;
            }

            return orderString;
        }

        protected void repDurations_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                GridView grdDurationTypespec = (GridView)e.Item.FindControl("grdDurationTypespec");
                int durationID = 0;
                if (row["ID"]!=DBNull.Value) 
                    durationID=Convert.ToInt32(row["ID"]);

                RoomTypeSpecDuration specDurations = new RoomTypeSpecDuration();
                specDurations.LoadByRoomTypeSpecIDAndDurationID(roomTypespecID, durationID);
                grdDurationTypespec.DataSource = specDurations.DefaultView;
                grdDurationTypespec.DataBind();

            }
        }
    }
}