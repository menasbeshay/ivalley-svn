using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Chat2Connect.Logic;

namespace Chat2Connect
{
    public partial class AccTypes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFriends();
            }
        }

        private void LoadFriends()
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            MemberFriend friends = new MemberFriend();
            friends.GetAllMemberFriendsAndMember(member.MemberID);

            uiDropDownListFriends.DataSource = friends.DefaultView;
            uiDropDownListFriends.DataTextField = "MemberName";
            uiDropDownListFriends.DataValueField = "FriendID";
            uiDropDownListFriends.DataBind();
        }

        protected void uiLinkButtonConfirm_Click(object sender, EventArgs e)
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));

            Member upgrademember = new Member();
            upgrademember.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListFriends.SelectedValue));

            MembershipUser user = Membership.GetUser();

            if (user.PasswordQuestion == uiDropDownListQuestion.SelectedValue && member.Answer == uiTextBoxAnswer.Text)
            {
                if (uiDropDownListFriends.SelectedIndex != -1)
                {

                    if (member.IsColumnNull("Credit_Money"))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Error1", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام العملية.'); });", true);
                        return;
                    }
                   
                    try
                    {
                        int type = 0;
                        decimal val = 0;
                        if (uiRadioButtonListType1.SelectedIndex != -1)
                        {
                            val = Convert.ToDecimal(uiRadioButtonListType1.SelectedValue);
                            type = 2;
                        }
                        else if (uiRadioButtonListType2.SelectedIndex != -1)
                        {
                            val = Convert.ToDecimal(uiRadioButtonListType2.SelectedValue);
                            type = 3;
                        }

                        if (member.Credit_Money < val)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Error3", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام العملية.'); });", true);
                            return;
                        }

                        member.Credit_Money -= val;
                        member.Save();

                        upgrademember.MemberTypeID = type;
                        upgrademember.Save();

                        ClientScript.RegisterStartupScript(this.GetType(), "Success1", @"$(document).ready(function () { notify('success', 'تم صبغة الإسم بنجاح.'); });", true);
                        
                        UserTransLog log2 = new UserTransLog();
                        log2.AddNew();
                        log2.MemberID = member.MemberID;                        
                        //log2.Value = Convert.ToDecimal(uiTextBoxAmount.Text);
                        log2.TransType = 2;
                        log2.TransDate = DateTime.Now;
                        log2.PaymentMethod = StringEnum.GetStringValue(PaymentMethod.UpgradeAccount);
                        log2.Save();
                        
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