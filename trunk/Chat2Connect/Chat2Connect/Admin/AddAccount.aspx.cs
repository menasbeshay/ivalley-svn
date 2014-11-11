using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect.Admin
{
    public partial class AddAccount : Page
    {
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_AddVIPAccount.ToString());
                return lstRoles;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Helper.Admin.HasAnyOfRoles(PageRoles))
                    Response.Redirect("~/default.aspx");

                ClearFields();
                uiPanelDone.Visible = false;
                uiPanelRegister.Visible = true;

                clearUpgradeFields();
                uiPanelUpgradeSuccess.Visible = false;
                uiPanelUpgrade.Visible = true;


                for (int i = 1; i <= 12; i++)
                {
                    lstTypeDuration.Items.Add(new ListItem(i.ToString(), i.ToString()));
                    uiDropDownListTypeDuration.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }

                var lstMemberTypes = Helper.EnumUtil.GetValues<Helper.Enums.TypeSpec>().Where(r=> (int)r>1).Select(r => new
                {
                    ID = (int)r,
                    Name = Helper.StringEnum.GetStringValue(r)
                }).ToList();
                lstTypes.DataValueField = "ID";
                lstTypes.DataTextField = "Name";
                lstTypes.DataSource = lstMemberTypes;
                lstTypes.DataBind();

                uiRadioButtonListTypes.DataValueField = "ID";
                uiRadioButtonListTypes.DataTextField = "Name";
                uiRadioButtonListTypes.DataSource = lstMemberTypes;
                uiRadioButtonListTypes.DataBind();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int type = Convert.ToInt32(lstTypes.SelectedValue);
            BLL.MemberTypeSpecDuration bllSpec = new MemberTypeSpecDuration();
            if (!bllSpec.LoadByMemberTypeSpecID(type))
                return;
            int val = 0;//Convert.ToInt32(bllSpec.Points);
            if (BLL.Member.CurrentMember.Credit_Point < val)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Error3", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام العملية.'); });", true);
                return;
            }
            MembershipCreateStatus objstatus;
            MembershipUser objUser = Membership.CreateUser(UserName.Text, Password.Text, Email.Text, Question.Text, Answer.Text.Trim(), true, out objstatus);
            bool success = true;
            switch (objstatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    ErrorMessage.Text = GetLocalResourceObject("duplicateUsername").ToString();
                    ErrorMessage.Visible = true;
                    success = false;
                    break;
                case MembershipCreateStatus.InvalidPassword:
                    ErrorMessage.Text = GetLocalResourceObject("invalidPass").ToString();
                    ErrorMessage.Visible = true;
                    success = false;
                    break;
                case MembershipCreateStatus.ProviderError:
                case MembershipCreateStatus.UserRejected:
                    ErrorMessage.Text = GetLocalResourceObject("generalError").ToString();
                    ErrorMessage.Visible = true;
                    success = false;
                    break;
                default:
                    break;
            }
            if (success)
            {
                Member member = new Member();
                member.AddNew();
                member.Answer = Answer.Text.Trim();
                member.UserID = new Guid(objUser.ProviderUserKey.ToString());
                member.Name = objUser.UserName;
                member.IsOnLine = false;
                member.Status = 1;
                member.Save();
                try
                {
                    MailMessage msg = new MailMessage();
                    string body = GetLocalResourceObject("body").ToString();
                    string mail = GetLocalResourceObject("mail").ToString();

                    member.ActivationCode = Guid.NewGuid();
                    member.Save();
                    string mailto = objUser.Email;
                    msg.To.Add(mailto);
                    msg.From = new MailAddress(mail);
                    msg.Subject = GetLocalResourceObject("subject").ToString();
                    msg.IsBodyHtml = true;
                    msg.BodyEncoding = System.Text.Encoding.Unicode;

                    msg.Body = string.Format(body, objUser.UserName, member.ActivationCode.ToString());

                    SmtpClient client = new SmtpClient(GetLocalResourceObject("mailserver").ToString(), 25);

                    client.UseDefaultCredentials = false;

                    client.Credentials = new System.Net.NetworkCredential(mail, GetLocalResourceObject("mailpass").ToString());
                    client.Send(msg);


                    member.MemberType.MemberTypeSpecDurationID = bllSpec.ID;
                    member.MemberType.CreateBy = BLL.Member.CurrentMember.MemberID;
                    member.MemberType.StartDate = DateTime.Now;
                    member.MemberType.EndDate = DateTime.Now.AddMonths(Convert.ToInt32(lstTypeDuration.SelectedValue));
                    member.MemberType.Save();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Success1", @"$(document).ready(function () { notify('success', 'تم ترقية الإسم بنجاح.'); });", true);

                    BLL.MemberLog log = new BLL.MemberLog();
                    log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.ChangeMemberType() { MemberName = member.Name, NewTypeName = member.MemberType.MemberTypeSpecDuration.MemberTypeSpec.Name, NewTypeExpiryDate = member.MemberType.EndDate, Points = val }, member.MemberID, null);
                }
                catch (Exception)
                {

                }

                uiPanelDone.Visible = true;
                uiPanelRegister.Visible = false;
                ClearFields();
            }
            
        }


        protected void uiLinkButtonSaveMember_Click(object sender, EventArgs e)
        {
            int type = Convert.ToInt32(uiDropDownListTypeDuration.SelectedValue);
            BLL.MemberTypeSpecDuration bllSpec = new MemberTypeSpecDuration();
            if (!bllSpec.LoadByMemberTypeSpecID(type))
                return;
            int val = 0;//Convert.ToInt32(bllSpec.Points);
            if (BLL.Member.CurrentMember.Credit_Point < val)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "balanceError", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام العملية.'); });", true);
                return;
            }

            Member member = new Member();
            if (!member.LoadByPrimaryKey(Convert.ToInt32(hdnMember.Value)))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "NoacountError", @"$(document).ready(function () { notify('error', 'حدث خطأ . لا يوجد حساب بهذا الإسم.'); });", true);
                return;
            }

            BLL.MembershipBLL membership = new BLL.MembershipBLL();
            string msg;
            string oldname = member.Name;
            if (membership.ChangeUsername(oldname, uiTextBoxNewName.Text, Membership.ApplicationName, out msg))
            {
                member.Name = uiTextBoxNewName.Text;
                member.Save();
            }
            else
            {
                uiTextBoxNewName.Text = oldname;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "changeName", @"$(document).ready(function () { notify('error', 'حدث خطأ ." + msg + ".'); });", true);
                return;
            }

            member.MemberType.MemberTypeSpecDurationID = bllSpec.ID;
            member.MemberType.CreateBy = BLL.Member.CurrentMember.MemberID;
            member.MemberType.StartDate = DateTime.Now;
            member.MemberType.EndDate = DateTime.Now.AddMonths(Convert.ToInt32(lstTypeDuration.SelectedValue));
            member.MemberType.OldName = oldname;
            member.MemberType.Save();

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Success1", @"$(document).ready(function () { notify('success', 'تم ترقية الإسم بنجاح.'); });", true);

            uiPanelUpgradeSuccess.Visible = true;
            uiPanelUpgrade.Visible = false;
            clearUpgradeFields();

            BLL.MemberLog log = new BLL.MemberLog();
            log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.ChangeMemberType() { MemberName = member.Name,OldName=oldname, NewTypeName = member.MemberType.MemberTypeSpecDuration.MemberTypeSpec.Name, NewTypeExpiryDate = member.MemberType.EndDate, Points = val }, member.MemberID, null);

        }

        protected void uiLinkButtonCreateNew_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelDone.Visible = false;
            uiPanelRegister.Visible = true;
            
        }

        protected void uiLinkButtonUpgradeNew_Click(object sender, EventArgs e)
        {
            clearUpgradeFields();
            uiPanelUpgradeSuccess.Visible = false;
            uiPanelUpgrade.Visible = true;

        }

        private void ClearFields()
        {
            UserName.Text = "";
            Password.Text = "";
            ConfirmPassword.Text = "";
            Email.Text = "";
            Question.SelectedIndex = 0;
            Answer.Text = "";
            ErrorMessage.Visible = false;
        }
        
        private void clearUpgradeFields()
        {
            uiLabelError.Visible = false;
            uiTextBoxNewName.Text = "";
            uiTextBoxUsername.Text = "";
        }

    }
}