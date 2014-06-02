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
            if (!Member.CurrentMember.IsColumnNull("Credit_Money"))
                uiLabelBalance.Text = Member.CurrentMember.Credit_Money.ToString("0.0#") + " ريال";
            else
                uiLabelBalance.Text = "لا يوجد رصيد";
        }

        protected void uiLinkButtonConfirm_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser();

            if (user.PasswordQuestion == uiDropDownListQuestion.SelectedValue && Member.CurrentMember.Answer == uiTextBoxAnswer.Text)
            {
                if (!string.IsNullOrEmpty(uiHiddenFieldFriendID.Value))
                {

                    if (Member.CurrentMember.IsColumnNull("Credit_Money"))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Error1", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام الشحن.'); });", true);
                        return;
                    }                    
                    else
                    {
                        try
                        {
                            if (Member.CurrentMember.Credit_Money < Convert.ToDecimal(uiHiddenFieldPrice.Value))
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "Error3", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام الشحن.'); });", true);
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
                        ToMember.LoadByPrimaryKey(Convert.ToInt32(uiHiddenFieldFriendID.Value));

                        if (!ToMember.IsColumnNull("Credit_Point"))
                            ToMember.Credit_Point += Convert.ToInt32(uiHiddenFieldPoints.Value);
                        else
                            ToMember.Credit_Point = Convert.ToInt32(uiHiddenFieldPoints.Value);

                        Member currentmember = new Member();
                        currentmember.LoadByPrimaryKey(Member.CurrentMemberID);
                        currentmember.Credit_Money = Member.CurrentMember.Credit_Money - Convert.ToDecimal(uiHiddenFieldPrice.Value); ;
                        ToMember.Save();
                        currentmember.Save();

                        ClientScript.RegisterStartupScript(this.GetType(), "Success1", @"$(document).ready(function () { notify('success', 'تم تحويل النقاط بنجاح.'); });", true);

                        // logging
                        //BLL.MemberLog log = new BLL.MemberLog();
                        //log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.TransferBalance() { FriendID = ToMember.MemberID, FriendName = ToMember.Name, TranseferAmount = Convert.ToDecimal(uiTextBoxAmount.Text) }, ToMember.MemberID, null);

                        
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