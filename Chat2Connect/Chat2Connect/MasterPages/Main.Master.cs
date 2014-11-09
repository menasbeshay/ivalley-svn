using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Chat2Connect.SRCustomHubs;
using Microsoft.AspNet.SignalR;

namespace Chat2Connect.MasterPages
{
    public partial class Main : System.Web.UI.MasterPage
    {
        public int MemberID
        {
            get
            {
                if (ViewState["ID"] == null)
                    ViewState["ID"] = 0;
                return Convert.ToInt32(ViewState["ID"]);
            }
            set
            {
                ViewState["ID"] = value;
            }
        }
        public string ProfilePic
        {
            get
            {
                return Convert.ToString(ViewState["ProfilePic"]);
            }
            set
            {
                ViewState["ProfilePic"] = value;
            }
        }
        protected override void OnInit(EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    loadUserInfo();

                    var mails = Helper.EnumUtil.GetValues<Helper.Enums.SiteMembers>().Select(m => new
                    {
                        ID = (int)m,
                        Name = Helper.StringEnum.GetStringValue(m),
                    }).ToList();
                    lstHelpRequests.DataTextField = "Name";
                    lstHelpRequests.DataValueField = "ID";
                    lstHelpRequests.DataSource = mails;
                    lstHelpRequests.DataBind();

                    SiteSettings settings = new SiteSettings();
                    settings.LoadByPrimaryKey(1); //fb
                    uiHyperLinkFB.NavigateUrl = settings.URL;

                    settings.LoadByPrimaryKey(2); //twitter
                    uiHyperLinkTwitter.NavigateUrl = settings.URL;

                    settings.LoadByPrimaryKey(3); //youtube
                    uiHyperLinkYoutube.NavigateUrl = settings.URL;

                    settings.LoadByPrimaryKey(4); //google
                    uiHyperLinkGp.NavigateUrl = settings.URL;
                }
            }
            else
            {
                Response.Redirect("~/default.aspx");
            }
            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        private void loadUserInfo()
        {
            Member user = BLL.Member.CurrentMember;
            MemberID = user.MemberID;
            string img = "/images/defaultavatar.png";
            if (!user.IsColumnNull("ProfilePic"))
                img = user.ProfilePic;
            ProfilePic = img;

            var lstStatus = Helper.EnumUtil.GetValues<Helper.Enums.MemberStatus>().Select(l => new
            {
                ID = (int)l,
                Title = Helper.StringEnum.GetStringValue(l),
                Name = l.ToString().ToLower()
            }).ToList();
            repStatus.DataSource = lstStatus;
            repStatus.DataBind();

            uiLabelName.Text = user.Name;
            uiLinkButtonLock.PostBackUrl = "../lock.aspx?u=" + user.Name;
            uiTextBoxStatus.Text = user.StatusMsg;
            uiHiddenFieldClientID.Value = user.MemberID.ToString();
            Session["Activate_session"] = 1;
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Member member = BLL.Member.CurrentMember;
            member.IsOnLine = false;
            member.Save();

            IHubContext _Rcontext = GlobalHost.ConnectionManager.GetHubContext<ChatRoomHub>();
            _Rcontext.Clients.All.updateMember(member.MemberID, "IsOnline", false);

            // clear all session vars
            Session.Abandon();
        }

        protected void btnSaveHelpRequest_Click(object sender, EventArgs e)
        {
            BLL.Message msg = new BLL.Message();
            msg.AddNew();
            msg.Body = txtBody.Text;
            msg.SenderID = BLL.Member.CurrentMemberID;
            msg.Subject = txtSubject.Text;
            msg.ToMembers = lstHelpRequests.SelectedItem.Text;
            msg.Save();
            MemberMessage memberMsg = new MemberMessage();
            //add to member sent items
            memberMsg.AddNew();
            memberMsg.MessageID = msg.ID;
            memberMsg.IsRead = true;
            //add to receipent folder
            Helper.Enums.SiteMembers siteMember = Helper.EnumUtil.ParseEnum<Helper.Enums.SiteMembers>(Convert.ToInt32(lstHelpRequests.SelectedValue));
            int recipientID = BLL.Member.SiteMembers.Where(s => String.Equals(s.Name, Helper.StringEnum.GetStringValue(siteMember))).FirstOrDefault().MemberID;
            memberMsg.AddNew();
            memberMsg.MemberID = recipientID;
            memberMsg.MessageID = msg.ID;
            memberMsg.Save();
        }
    }
}