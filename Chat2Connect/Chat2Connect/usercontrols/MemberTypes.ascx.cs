using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Helper;
using System.Data;

namespace Chat2Connect.usercontrols
{
    public partial class MemberTypes : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblPoints.Text = BLL.Member.CurrentMember.s_Credit_Point;
            }
        }

        protected void uiLinkButtonConfirm_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser();
            if (user.PasswordQuestion == uiDropDownListQuestion.SelectedValue && BLL.Member.CurrentMember.Answer == uiTextBoxAnswer.Text.Trim())
            {
                if (!String.IsNullOrEmpty(hdnMember.Value))
                {
                    Member upgrademember = new Member();
                    upgrademember.LoadByPrimaryKey(Convert.ToInt32(hdnMember.Value));

                    try
                    {
                        int durationID = Convert.ToInt32(hdnDuration.Value);
                        int specID = Convert.ToInt32(hdnSpec.Value);
                        BLL.MemberTypeSpecDuration bllMemberTypeSpecDuration = new MemberTypeSpecDuration();
                        bllMemberTypeSpecDuration.Where.TypeDurationID.Value = durationID;
                        bllMemberTypeSpecDuration.Where.MemberTypeSpecID.Value = specID;
                        bllMemberTypeSpecDuration.Query.Load();
                        int points = bllMemberTypeSpecDuration.Points;

                        if (BLL.Member.CurrentMember.Credit_Point < points)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Error3", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام العملية.'); });", true);
                            return;
                        }

                        BLL.Member.CurrentMember.Credit_Point -= points;
                        BLL.Member.CurrentMember.Save();

                        upgrademember.MemberType.MemberTypeSpecDurationID = bllMemberTypeSpecDuration.ID;
                        upgrademember.MemberType.CreateBy = BLL.Member.CurrentMember.MemberID;
                        upgrademember.MemberType.StartDate = DateTime.Now;
                        upgrademember.MemberType.EndDate = DateTime.Now.AddMonths(bllMemberTypeSpecDuration.TypeDuration.MonthesNumber);
                        upgrademember.MemberType.Save();

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Success1", @"$(document).ready(function () { notify('success', 'تم صبغة الإسم بنجاح.'); });", true);

                        BLL.MemberLog log = new BLL.MemberLog();
                        log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.ChangeMemberType() { MemberName = upgrademember.Name, NewTypeName = upgrademember.MemberType.MemberTypeSpecDuration.MemberTypeSpec.Name, NewTypeExpiryDate = upgrademember.MemberType.EndDate, Points = points }, upgrademember.MemberID, null);

                        lblPoints.Text = BLL.Member.CurrentMember.Credit_Point.ToString();

                        NotifyMember(upgrademember.MemberID, bllMemberTypeSpecDuration.MemberTypeSpecID);
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

        private static void NotifyMember(int mid,int typeSpecID)
        {
            List<Helper.SignalRUser> users = Chat2Connect.SRCustomHubs.ChatRoomHub.ConnectedUsers.Where(u => u.MemberID == mid).ToList();
            Microsoft.AspNet.SignalR.IHubContext _Rcontext = Microsoft.AspNet.SignalR.GlobalHost.ConnectionManager.GetHubContext<Chat2Connect.SRCustomHubs.ChatRoomHub>();
            foreach (var user in users)
            {
                foreach (var room in user.Rooms)
                {
                    _Rcontext.Clients.Group(room.ToString()).updateRoomMemberType(user.MemberID, typeSpecID, room);
                }
            }
        }

    }
}