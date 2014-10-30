using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect
{
    public partial class GiftPoints : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    LoadBalance();
                }
            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }

        private void LoadBalance()
        {
            if (!Member.CurrentMember.IsColumnNull("Credit_Point"))
                uiLabelBalance.Text = Member.CurrentMember.Credit_Point.ToString() + " نقطة";
            else
                uiLabelBalance.Text = "لا يوجد رصيد";
        }

        protected void uiLinkButtonConfirm_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser();

            if (user.PasswordQuestion == uiDropDownListQuestion.SelectedValue && Member.CurrentMember.Answer == uiTextBoxAnswer.Text.Trim())
            {
                if (!string.IsNullOrEmpty(uiHiddenFieldFriendID.Value))
                {
                    try
                    {
                        int points = Convert.ToInt32(uiHiddenFieldPoints.Value);
                        if (Member.CurrentMember.Credit_Point < points)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Error3", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام الشحن.'); });", true);
                            return;
                        }

                        Member ToMember = new Member();
                        ToMember.LoadByPrimaryKey(Convert.ToInt32(uiHiddenFieldFriendID.Value));

                        ToMember.Credit_Point = ToMember.Credit_Point + points;
                        Member.CurrentMember.Credit_Point -= points;
                        ToMember.Save();
                        Member.CurrentMember.Save();

                        ClientScript.RegisterStartupScript(this.GetType(), "Success1", @"$(document).ready(function () { notify('success', 'تم تحويل النقاط بنجاح.'); });", true);

                        // logging
                        BLL.MemberLog log = new BLL.MemberLog();
                        log.AddNew(Member.CurrentMemberID, new BLL.Log.RechargePoints() { FromMemberName=BLL.Member.CurrentMember.Name,ToMemberName = ToMember.Name, Points = points }, ToMember.MemberID, null);

                        LoadBalance();
                        uiHiddenFieldPrice.Value = "";
                        uiHiddenFieldPoints.Value = "";
                        uiHiddenFieldFriendID.Value = "";
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