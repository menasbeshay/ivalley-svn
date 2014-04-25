using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

namespace Chat2Connect.Admin.UserControls
{
    public partial class AccountInfo : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_AccountInfo.ToString()))
                {
                    for (int i = 1; i < dtlAccountInfo.Fields.Count; i++)
                    {
                        dtlAccountInfo.Fields[i].Visible = true;
                    }
                }
            }
        }
        public string MemberUserName
        {
            get
            {
                return Convert.ToString(ViewState["userName"]);
            }
            set
            {
                ViewState["userName"] = value;
                BindAccountInfo();
            }
        }
        private void BindAccountInfo()
        {
            dtlAccountInfo.DataSource = null;
            dtlAccountInfo.DataBind();
            try
            {
                BLL.Member member = new BLL.Member();
                if (member.GetMemberByUserName(MemberUserName))
                {

                    List<dynamic> dataSource = new List<dynamic>()
                        {
                            new {
                                UserName=member.UserName,
                                Email=member.Email,
                                Password=member.Password,
                                PasswordQuestion=member.PasswordQuestion,
                                QuestionAnswer=member.Answer,
                                CreationDate=member.CreationDate,
                                IP=member.s_IP,
                                MemberTypeExpiryDate=member.s_MemberTypeExpiryDate,
                                Credit_Money=member.s_Credit_Money,
                                MemberTypeColor=member.MemberTypeColor,
                                StatusName=member.StatusName,
                                IsOnline=(member.IsOnLine?"نعم":"لا"),
                                FriendsCount=member.FriendsCount()
                            }
                        };
                    dtlAccountInfo.DataSource = dataSource;
                    dtlAccountInfo.DataBind();
                    if (Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_AccountInfo.ToString()))
                    {
                        Repeater repOwnerRooms = (Repeater)dtlAccountInfo.FindControl("repOwnerRooms");
                        Repeater repAdminRooms = (Repeater)dtlAccountInfo.FindControl("repAdminRooms");

                        BLL.RoomMember roomMember = new BLL.RoomMember();
                        roomMember.GetAllRoomsByAdminMemberID(member.MemberID);
                        repAdminRooms.DataSource = roomMember.DefaultView; 
                        repAdminRooms.DataBind();
                        //string adminRoom = string.Join(",", roomMember.DefaultView.Table.AsEnumerable().Select(x => x["RoomName"].ToString()).ToArray());
                        BLL.Room room = new BLL.Room();
                        room.GetRoomsByCreatorID(member.MemberID);
                        repOwnerRooms.DataSource = room.DefaultView;
                        repOwnerRooms.DataBind();
                    }
                }
            }
            catch
            {
            }

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(MemberUserName);
            if (user != null)
            {
                BLL.Member member = new BLL.Member();
                member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
                user.ChangePassword(user.GetPassword(member.Answer), txtPassword.Text);

                BindAccountInfo();
            }
        }

        protected void btnChangeQuestion_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(MemberUserName);
            if (user != null)
            {
                BLL.Member member = new BLL.Member();
                member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
                if (user.ChangePasswordQuestionAndAnswer(user.GetPassword(member.Answer), drpQuestions.SelectedValue, txtQuestionAnswer.Text))
                {
                    member.Answer = txtQuestionAnswer.Text;
                    member.Save();

                    BindAccountInfo();
                }
            }
        }

        protected void btnUpdateUserName_Click(object sender, EventArgs e)
        {
            TextBox txtNewUserName = (TextBox)dtlAccountInfo.FindControl("txtUsername");
            BLL.MembershipBLL membership = new BLL.MembershipBLL();
            string msg;
            if (membership.ChangeUsername(MemberUserName, txtNewUserName.Text, Membership.ApplicationName, out msg))
            {
                Response.Redirect(Request.Url.AbsolutePath + "?search=" + txtNewUserName.Text);
            }
            else
            {
                txtNewUserName.Text = MemberUserName;
                lblErrorMessage.Text = msg;
            }
        }
    }
}