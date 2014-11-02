using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Chat2Connect.SRCustomHubs;
using Helper;

namespace Chat2Connect
{
    public partial class MyBalance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBalance();
                //LoadFriends();

                // logging
                BLL.MemberLog log = new BLL.MemberLog();
                log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.Log() {Type=Helper.Enums.LogType.ViewBalancePage }, null, null);
            }
        }

        private void LoadBalance()
        {
            if (BLL.Member.CurrentMember.Credit_Point > 0)
                uiLabelBalance.Text = BLL.Member.CurrentMember.Credit_Point.ToString() + " نقطة";
            else
                uiLabelBalance.Text = "لا يوجد رصيد";
        }

        private void LoadFriends()
        {
            MemberFriend friends = new MemberFriend();
            friends.GetAllMemberFriends(BLL.Member.CurrentMember.MemberID);

            //uiRadioButtonListFriends.DataSource = friends.DefaultView;
            //uiRadioButtonListFriends.DataTextField = "MemberName";
            //uiRadioButtonListFriends.DataValueField = "FriendID";
            //uiRadioButtonListFriends.DataBind();
        }

        protected void uiLinkButtonConfirm_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser();

            if (user.PasswordQuestion == uiDropDownListQuestion.SelectedValue && BLL.Member.CurrentMember.Answer == uiTextBoxAnswer.Text.Trim())
            {
                if (uiHiddenFieldFriendID.Value != "")
                {

                    if (string.IsNullOrEmpty(uiTextBoxAmount.Text))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Error2", @"$(document).ready(function () { notify('error', 'حدث خطأ . من فضلك أدخل قيمة التحويل.'); });", true);
                        return;
                    }
                    try
                    {
                        int points = Convert.ToInt32(uiTextBoxAmount.Text);
                        if (BLL.Member.CurrentMember.Credit_Point < points)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Error3", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام التحويل.'); });", true);
                            return;
                        }

                        Member ToMember = new Member();
                        if (uiHiddenFieldFriendID.Value != "0" && uiHiddenFieldFriendID.Value != "")
                        {
                            ToMember.LoadByPrimaryKey(Convert.ToInt32(uiHiddenFieldFriendID.Value));
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Error7", @"$(document).ready(function () { notify('error', 'حدث خطأ . من فضلك أختر صديق للتحويل.'); });", true);
                            return;
                        }
                        
                        

                        ToMember.Credit_Point += points;
                        BLL.Member.CurrentMember.Credit_Point -= points;
                        ToMember.Save();
                        BLL.Member.CurrentMember.Save();

                        BLL.Message msg = new BLL.Message();
                        msg.AddNew();
                        msg.Body = string.Format(GetLocalResourceObject("ConfirmMsgBody").ToString(),BLL.Member.CurrentMember.UserName, points.ToString());
                        msg.SenderID = BLL.Member.CurrentMemberID;
                        msg.Subject = GetLocalResourceObject("ConfirmMsgSubject").ToString();
                        msg.ToMembers = ToMember.UserName;
                        msg.Save();

                        MemberMessage memberMsg = new MemberMessage();                        
                        memberMsg.AddNew();
                        memberMsg.MemberID = ToMember.MemberID;
                        memberMsg.MessageID = msg.ID;
                        memberMsg.Save();

                        NotificationHub notifications = new NotificationHub();
                        notifications.SendMailNotifications(ToMember.MemberID);

                        ClientScript.RegisterStartupScript(this.GetType(), "Success1", @"$(document).ready(function () { notify('success', 'تم تحويل النقاط بنجاح.'); });", true);

                        // logging
                        BLL.MemberLog log = new BLL.MemberLog();
                        log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.TransferPoints() { FromMemberName=BLL.Member.CurrentMember.Name, ToMemberName = ToMember.Name, Points = points }, ToMember.MemberID, null);

                        LoadBalance();
                        uiTextBoxAmount.Text = "";
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Error11", @"$(document).ready(function () { notify('error', 'حدث خطأ . من فضلك أعد المحاولة.'); });", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Error7", @"$(document).ready(function () { notify('error', 'حدث خطأ . من فضلك أختر صديق للتحويل.'); });", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error5", @"$(document).ready(function () { notify('error', 'حدث خطأ . من فضلك تأكد من السؤال والإجابة السرى.'); });", true);
                return;
            }

        }
    }
}