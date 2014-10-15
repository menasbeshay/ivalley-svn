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
            uiDropDownListFriends.Items.Insert(0, new ListItem(BLL.Member.CurrentMember.Name, BLL.Member.CurrentMemberID.ToString()));

            MemberTypeSpec memberTypeSpec = new MemberTypeSpec();
            memberTypeSpec.LoadAll();
            if (!Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_AddVIPAccount.ToString()))
            {
                memberTypeSpec.Filter = String.Format("{0}<>{1}", MemberTypeSpec.ColumnNames.ID, (int)Helper.Enums.MemberTypeSpec.VIP);
            }
            repMemberTypeSpecs.DataSource = memberTypeSpec.DefaultView;
            repMemberTypeSpecs.DataBind();

            lblPoints.Text = BLL.Member.CurrentMember.s_Credit_Point;
        }

        protected void uiLinkButtonConfirm_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(uiDropDownListFriends.SelectedValue))
                return;
            Member upgrademember = new Member();
            upgrademember.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListFriends.SelectedValue));

            MembershipUser user = Membership.GetUser();
            if (user.PasswordQuestion == uiDropDownListQuestion.SelectedValue && BLL.Member.CurrentMember.Answer == uiTextBoxAnswer.Text)
            {
                if (uiDropDownListFriends.SelectedIndex != -1)
                {

                    if (BLL.Member.CurrentMember.IsColumnNull(BLL.Member.ColumnNames.Credit_Point))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Error1", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام العملية.'); });", true);
                        return;
                    }

                    try
                    {
                        int type = Convert.ToInt32(selectedTypeSpecDurationID.Value);
                        int val = Convert.ToInt32(selectedTypeSpecDurationPoints.Value);

                        if (BLL.Member.CurrentMember.Credit_Point < val)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Error3", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام العملية.'); });", true);
                            return;
                        }

                        BLL.Member.CurrentMember.Credit_Point -= val;
                        BLL.Member.CurrentMember.Save();

                        //upgrademember.MemberTypeID = type;
                        upgrademember.MemberType.MemberTypeSpecDurationID = type;
                        upgrademember.MemberType.CreateBy = BLL.Member.CurrentMember.MemberID;
                        upgrademember.MemberType.StartDate = DateTime.Now;
                        upgrademember.MemberType.EndDate = DateTime.Now.AddMonths(upgrademember.MemberType.MemberTypeSpecDuration.TypeDuration.MonthesNumber);
                        upgrademember.MemberType.Save();

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Success1", @"$(document).ready(function () { notify('success', 'تم صبغة الإسم بنجاح.'); });", true);

                        BLL.MemberLog log = new BLL.MemberLog();
                        log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.ChangeMemberType() { MemberName = upgrademember.Name, NewTypeName = upgrademember.MemberType.MemberTypeSpecDuration.MemberTypeSpec.Name, NewTypeExpiryDate = upgrademember.MemberType.EndDate ,Points=val}, upgrademember.MemberID, null);
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

        public string GetMailSize(object size)
        {
            if (size == DBNull.Value)
                return "غير محدود";
            double val = Helper.TypeConverter.ToInt32(size);
            int unit = 0;
            while (val >= 1024)
            {
                val = val / 1024;
                unit++;
            }
            if (unit < 1)
                return String.Format("{0} كيلو بايت",val);
            if (unit < 2)
                return String.Format("{0} ميجا بايت", val);
            if (unit < 3)
                return String.Format("{0} جيجا بايت", val);
            
            return String.Format("{0} كيلو بايت", val);
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