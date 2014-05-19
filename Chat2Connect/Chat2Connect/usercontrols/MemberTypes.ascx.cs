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
        public int MemberID
        {
            get
            {
                if (ViewState["MemberID"] == null)
                {
                    ViewState["MemberID"] = BLL.Member.CurrentMemberID;
                }
                return Convert.ToInt32(ViewState["MemberID"]);
            }
            set
            {
                ViewState["MemberID"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPage();
            }
        }

        private void BindPage()
        {
            
            
            MemberFriend friends = new MemberFriend();
            friends.GetAllMemberFriendsAndMember(MemberID);

            uiDropDownListFriends.DataSource = friends.DefaultView;
            uiDropDownListFriends.DataTextField = "MemberName";
            uiDropDownListFriends.DataValueField = "FriendID";
            uiDropDownListFriends.DataBind();

            MemberTypeSpec memberTypeSpec = new MemberTypeSpec();
            memberTypeSpec.LoadAll();
            repMemberTypeSpecs.DataSource = memberTypeSpec.DefaultView;
            repMemberTypeSpecs.DataBind();
        }

        protected void uiLinkButtonConfirm_Click(object sender, EventArgs e)
        {
            Member upgrademember = new Member();
            upgrademember.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListFriends.SelectedValue));

            MembershipUser user = Membership.GetUser();

            if (user.PasswordQuestion == uiDropDownListQuestion.SelectedValue && BLL.Member.CurrentMember.Answer == uiTextBoxAnswer.Text)
            {
                if (uiDropDownListFriends.SelectedIndex != -1)
                {

                    if (BLL.Member.CurrentMember.IsColumnNull("Credit_Money"))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Error1", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام العملية.'); });", true);
                        return;
                    }

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

                        //upgrademember.MemberTypeID = type;
                        upgrademember.MemberType.MemberTypeSpecDurationID = type;
                        upgrademember.MemberType.CreateBy = BLL.Member.CurrentMember.MemberID;
                        upgrademember.MemberType.StartDate = DateTime.Now;
                        upgrademember.MemberType.EndDate = DateTime.Now.AddMonths(upgrademember.MemberType.MemberTypeSpecDuration.TypeDuration.MonthesNumber);
                        upgrademember.MemberType.Save();

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Success1", @"$(document).ready(function () { notify('success', 'تم صبغة الإسم بنجاح.'); });", true);

                        UserTransLog log2 = new UserTransLog();
                        log2.AddNew();
                        log2.MemberID = BLL.Member.CurrentMember.MemberID;
                        //log2.Value = Convert.ToDecimal(uiTextBoxAmount.Text);
                        log2.TransType = 2;
                        log2.TransDate = DateTime.Now;
                        log2.PaymentMethod = StringEnum.GetStringValue(Enums.PaymentMethod.UpgradeAccount);
                        log2.Save();

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

        protected void repMemberTypeSpecs_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                GridView grdDurations = (GridView)e.Item.FindControl("grdDurations");
                int memberTypespecID = Convert.ToInt32(row["ID"]);

                MemberTypeSpecDuration specDurations = new MemberTypeSpecDuration();
                specDurations.LoadByMemberTypeSpecID(memberTypespecID);
                grdDurations.DataSource = specDurations.DefaultView;
                grdDurations.DataBind();

            }
        }
    }
}