using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
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
                LoadFriends();

                // logging
                BLL.MemberLog log = new BLL.MemberLog();
                log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.ViewBalancePage() { }, null, null);
            }
        }

        private void LoadBalance()
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            if (!member.IsColumnNull("Credit_Money"))
                uiLabelBalance.Text = member.Credit_Money.ToString("0.0#") + " ريال";
            else
                uiLabelBalance.Text = "لا يوجد رصيد";
        }

        private void LoadFriends()
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));

            MemberFriend friends = new MemberFriend();
            friends.GetAllMemberFriends(member.MemberID);

            uiDropDownListFriends.DataSource = friends.DefaultView;
            uiDropDownListFriends.DataTextField = "MemberName";
            uiDropDownListFriends.DataValueField = "FriendID";
            uiDropDownListFriends.DataBind();
        }

        protected void uiLinkButtonConfirm_Click(object sender, EventArgs e)
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            MembershipUser user = Membership.GetUser();

            if (user.PasswordQuestion == uiDropDownListQuestion.SelectedValue && member.Answer == uiTextBoxAnswer.Text)
            {
                if (uiDropDownListFriends.SelectedIndex != -1)
                {

                    if (member.IsColumnNull("Credit_Money"))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Error1", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام التحويل.'); });", true);
                        return;
                    }
                    else if (string.IsNullOrEmpty(uiTextBoxAmount.Text))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Error2", @"$(document).ready(function () { notify('error', 'حدث خطأ . من فضلك أدخل قيمة التحويل.'); });", true);
                        return;
                    }
                    else
                    {
                        try
                        {
                            if (member.Credit_Money < Convert.ToDecimal(uiTextBoxAmount.Text))
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "Error3", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام التحويل.'); });", true);
                                return;
                            }
                        }
                        catch (Exception ex)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Error10", @"$(document).ready(function () { notify('error', 'حدث خطأ . من فضلك أعد المحاولة.'); });", true);
                        }
                    }



                    try
                    {
                        Member ToMember = new Member();
                        ToMember.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListFriends.SelectedValue));

                        if (!ToMember.IsColumnNull("Credit_Money"))
                            ToMember.Credit_Money += Convert.ToDecimal(uiTextBoxAmount.Text);
                        else
                            ToMember.Credit_Money = Convert.ToDecimal(uiTextBoxAmount.Text);

                        member.Credit_Money -= Convert.ToDecimal(uiTextBoxAmount.Text);
                        ToMember.Save();
                        member.Save();

                        ClientScript.RegisterStartupScript(this.GetType(), "Success1", @"$(document).ready(function () { notify('success', 'تم تحويل الرصيد بنجاح.'); });", true);

                        // logging
                        BLL.MemberLog log = new BLL.MemberLog();
                        log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.TransferBalance() { FriendID = ToMember.MemberID, FriendName = ToMember.Name, TranseferAmount = Convert.ToDecimal(uiTextBoxAmount.Text) }, ToMember.MemberID, null);

                        /*
                        UserTransLog log = new UserTransLog();
                        log.AddNew();
                        log.MemberID = ToMember.MemberID;
                        log.AddedFrom = member.MemberID;
                        log.Value = Convert.ToDecimal(uiTextBoxAmount.Text);
                        log.TransType = 1;
                        log.TransDate = DateTime.Now;
                        log.PaymentMethod = StringEnum.GetStringValue(Enums.PaymentMethod.FriendTransefer);
                        log.Save();

                        UserTransLog log2 = new UserTransLog();
                        log2.AddNew();
                        log2.MemberID = member.MemberID;
                        log2.AddedTo = ToMember.MemberID;
                        log2.Value = Convert.ToDecimal(uiTextBoxAmount.Text);
                        log2.TransType = 2;
                        log2.TransDate = DateTime.Now;
                        log2.PaymentMethod = StringEnum.GetStringValue(Enums.PaymentMethod.TranseferToFriend);
                        log2.Save();*/
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
                    ClientScript.RegisterStartupScript(this.GetType(), "Error4", @"$(document).ready(function () { notify('error', 'حدث خطأ . من فضلك أعد المحاولة.'); });", true);
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