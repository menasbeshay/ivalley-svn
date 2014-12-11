using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDls();
                LoadProfile();
                LoadRooms();
                LoadPics();
            }
        }

        private void LoadDDls()
        {
            Religion religion = new Religion();
            religion.LoadAll();
            uiDropDownListReligion.DataSource = religion.DefaultView;
            uiDropDownListReligion.DataTextField = "Name";
            uiDropDownListReligion.DataValueField = "ReligionID";
            uiDropDownListReligion.DataBind();

            Country country = new Country();
            country.LoadAll();
            uiDropDownListCountry.DataSource = country.DefaultView;
            uiDropDownListCountry.DataTextField = "Name";
            uiDropDownListCountry.DataValueField = "CountryID";
            uiDropDownListCountry.DataBind();
            uiDropDownListCountry.Items.Insert(0, new ListItem("إختر البلد", "0"));
        }

        private void LoadProfile()
        {
            if (Request.IsAuthenticated)
            {
                Member member = new Member();
                member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
                uiLabelName.Text = uiTextBoxName.Text = member.Name;
                uiHiddenFieldCID_profile.Value = member.MemberID.ToString();
                if (!member.IsColumnNull("ReligionID"))
                {
                    Religion religion = new Religion();
                    uiDropDownListReligion.SelectedValue = member.ReligionID.ToString();
                    religion.LoadByPrimaryKey(member.ReligionID);
                    uiLabelReligion.Text = religion.Name;
                }
                uiLabelJob.Text = uiTextBoxJob.Text = member.JobTitle;
                if (!member.IsColumnNull("BirthDate"))
                {
                    uiLabelDOP.Text = uiTextBoxDOP.Text = member.BirthDate.ToString("yyyy/MM/dd");
                }
                if (!member.IsColumnNull("CountryID"))
                {
                    Country country = new Country();
                    if (member.CountryID != 0)
                        uiDropDownListCountry.SelectedValue = member.CountryID.ToString();
                    country.LoadByPrimaryKey(member.CountryID);
                    uiLabelCountry.Text = country.Name;
                }
                uiLabelBestFood.Text = uiTextBoxBestFood.Text = member.BestFood;
                uiLabelBestCar.Text = uiTextBoxBestCar.Text = member.BestCar;
                uiLabelBestTeam.Text = uiTextBoxBestTeam.Text = member.BestTeam;
                uiLabelBestCountry.Text = uiTextBoxBestCountry.Text = member.BestCounrty;
                uiLabelMail.Text = Membership.GetUser().Email;
                uiHyperLinkFb.NavigateUrl = uiTextBoxfb.Text = member.FbURL;
                uiHyperLinktwitter.NavigateUrl = uiTextBoxTwitter.Text = member.TURL;
                uiHyperLinkyt.NavigateUrl = uiTextBoxyt.Text = member.YtURL;

                uiLabelCreatedDate.Text = Membership.GetUser().CreationDate.ToString("yyyy/MM/dd");
                if (member.MemberType.MemberTypeSpecDurationID != Helper.Defaults.MemberTypeSpecDurationID)
                {
                    uiLabelAccountType.Text = member.MemberType.MemberTypeSpecDuration.MemberTypeSpec.Name;
                    if (!member.MemberType.IsColumnNull("EndDate"))
                        uiLabelTypeExpiry.Text = member.MemberType.EndDate.ToString("yyyy/MM/dd");
                }
                if (!member.IsColumnNull("ProfilePic"))
                {
                    uiImageMain.ImageUrl = member.ProfilePic;
                }
                ///////////////////////////////
                uiLabelInterests.Text = uiTextBoxInterests.Text = member.Interests;

                ProfileLike likes = new ProfileLike();
                likes.GetLikeCount(member.MemberID);
                uiLabelLikeCount.Text = likes.RowCount.ToString();


                // load settings 
                MemberSetting setting = new MemberSetting();
                setting.GetMemberSettingsByMemberID(member.MemberID);
                if (!(setting.RowCount > 0))
                {
                    return;
                }
                uiCheckBoxHidePics.Checked = setting.HidePics;
                uiCheckBoxHideRoomPics.Checked = setting.HideRoomPics;
                uiCheckBoxHideProfile.Checked = setting.HideProfile;
                uiCheckBoxNotifyOnPrivateChat.Checked = setting.NotifyOnPrivateChat;
                uiCheckBoxNotifyOnFriendsOnOff.Checked = setting.NotifyOnFriendsOnOff;
                uiCheckBoxNotifyOnFriendChangeStatus.Checked = setting.NotifyOnFriendChangeStatus;
                uiCheckBoxNotifyOnGetMsg.Checked = setting.NotifyOnGetMsg;
                uiCheckBoxNotifyOnVoiceMail.Checked = setting.NotifyOnVoiceMail;
                uiCheckBoxSearchMeByMail.Checked = setting.SearchMeByMail;
                uiCheckBoxVoiceNotfication.Checked = setting.VoiceNotfication;
                uiCheckBoxChangeMyStatus.Checked = setting.ChangeMyStatus;

                if (!setting.IsColumnNull("ChangeMyStatusMin"))
                    uiTextBoxChangeMyStatusMin.Text = setting.ChangeMyStatusMin.ToString();

                if (!setting.IsColumnNull("AcceptPM"))
                    uiRadioButtonListAcceptPM.SelectedValue = setting.AcceptPM ? "0" : "1";
                if (!setting.IsColumnNull("AcceptSMS"))
                    uiRadioButtonListAcceptSMS.SelectedValue = setting.AcceptSMS ? "0" : "1";
                if (!setting.IsColumnNull("AcceptMSG"))
                    uiRadioButtonListAcceptMsg.SelectedValue = setting.AcceptMSG ? "0" : "1";
                if (!setting.IsColumnNull("AcceptVoiceMail"))
                    uiRadioButtonListAcceptVoiceMail.SelectedValue = setting.AcceptVoiceMail ? "0" : "1";
                if (!setting.IsColumnNull("AcceptFiles"))
                    uiRadioButtonListAcceptFiles.SelectedValue = setting.AcceptFiles ? "0" : "1";
                if (!setting.IsColumnNull("AcceptInvitations"))
                    uiRadioButtonListAcceptInvitations.SelectedValue = setting.AcceptInvitations ? "0" : "1";

            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }

        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));

            member.Name = uiTextBoxName.Text;
            try
            {
                if (!string.IsNullOrEmpty(uiTextBoxDOP.Text))
                    member.BirthDate = DateTime.ParseExact(uiTextBoxDOP.Text, "yyyy/MM/dd", null);
            }
            catch (Exception ex)
            {

            }
            if(!string.IsNullOrEmpty( uiDropDownListReligion.SelectedValue))
                member.ReligionID = Convert.ToInt32(uiDropDownListReligion.SelectedValue);
            if (!string.IsNullOrEmpty(uiTextBoxReligion.Text))
                member.Religion = uiTextBoxReligion.Text;
            if (!string.IsNullOrEmpty(uiDropDownListCountry.SelectedValue) && uiDropDownListCountry.SelectedValue != "0")
                member.CountryID = Convert.ToInt32(uiDropDownListCountry.SelectedValue);
            member.JobTitle = uiTextBoxJob.Text;
            member.BestTeam = uiTextBoxBestTeam.Text;
            member.BestFood = uiTextBoxBestFood.Text;
            member.BestCar = uiTextBoxBestCar.Text;
            member.BestCounrty = uiTextBoxBestCountry.Text;

            member.FbURL = uiTextBoxfb.Text;
            member.TURL = uiTextBoxTwitter.Text;
            member.YtURL = uiTextBoxyt.Text;

            string path = "~/" + ConfigurationManager.AppSettings["accountpics"].ToString();
            DirectoryInfo dir = new DirectoryInfo(Server.MapPath(path + "/" + Membership.GetUser().ProviderUserKey.ToString()));
            if (!dir.Exists)
                dir.Create();
            path += "/" + Membership.GetUser().ProviderUserKey.ToString();

            member.Save();
            LoadProfile();
            ClientScript.RegisterStartupScript(this.GetType(), "doneSave", "$(document).ready(function (){ notify('success','تم التحديث بنجاح.');}); ", true);
        }

        protected void uiLinkButtonSaveInterests_Click(object sender, EventArgs e)
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));

            member.Interests = uiTextBoxInterests.Text;
            member.Save();
            LoadProfile();
            ClientScript.RegisterStartupScript(this.GetType(), "doneSaveInter", "$(document).ready(function (){ notify('success','تم التحديث بنجاح.');}); ", true);
        }

        protected void uiLinkButtonSaveMemberSettings_Click(object sender, EventArgs e)
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));

            MemberSetting setting = new MemberSetting();
            setting.GetMemberSettingsByMemberID(member.MemberID);
            if (!(setting.RowCount > 0))
            {
                setting.AddNew();
                setting.MemberID = member.MemberID;
            }
            setting.HidePics = uiCheckBoxHidePics.Checked;
            setting.HideRoomPics = uiCheckBoxHideRoomPics.Checked;
            setting.HideProfile = uiCheckBoxHideProfile.Checked;
            setting.NotifyOnPrivateChat = uiCheckBoxNotifyOnPrivateChat.Checked;
            setting.NotifyOnFriendsOnOff = uiCheckBoxNotifyOnFriendsOnOff.Checked;
            setting.NotifyOnFriendChangeStatus = uiCheckBoxNotifyOnFriendChangeStatus.Checked;
            setting.NotifyOnGetMsg = uiCheckBoxNotifyOnGetMsg.Checked;
            setting.NotifyOnVoiceMail = uiCheckBoxNotifyOnVoiceMail.Checked;
            setting.SearchMeByMail = uiCheckBoxSearchMeByMail.Checked;
            setting.VoiceNotfication = uiCheckBoxVoiceNotfication.Checked;
            setting.ChangeMyStatus = uiCheckBoxChangeMyStatus.Checked;
            if (!string.IsNullOrEmpty(uiTextBoxChangeMyStatusMin.Text))
                setting.ChangeMyStatusMin = Convert.ToInt32(uiTextBoxChangeMyStatusMin.Text);
            if (uiRadioButtonListAcceptPM.SelectedIndex != -1)
                setting.AcceptPM = uiRadioButtonListAcceptPM.SelectedValue == "0" ? false : true;
            else
                setting.AcceptPM = false;

            if (uiRadioButtonListAcceptSMS.SelectedIndex != -1)
                setting.AcceptSMS = uiRadioButtonListAcceptSMS.SelectedValue == "0" ? false : true;
            else
                setting.AcceptSMS = false;

            if (uiRadioButtonListAcceptMsg.SelectedIndex != -1)
                setting.AcceptMSG = uiRadioButtonListAcceptMsg.SelectedValue == "0" ? false : true;
            else
                setting.AcceptMSG = false;
            if (uiRadioButtonListAcceptVoiceMail.SelectedIndex != -1)
                setting.AcceptVoiceMail = uiRadioButtonListAcceptVoiceMail.SelectedValue == "0" ? false : true;
            else
                setting.AcceptVoiceMail = false;
            if (uiRadioButtonListAcceptFiles.SelectedIndex != -1)
                setting.AcceptFiles = uiRadioButtonListAcceptFiles.SelectedValue == "0" ? false : true;
            else
                setting.AcceptFiles = false;
            if (uiRadioButtonListAcceptInvitations.SelectedIndex != -1)
                setting.AcceptInvitations = uiRadioButtonListAcceptInvitations.SelectedValue == "0" ? false : true;
            else
                setting.AcceptInvitations = false;

            setting.Save();
            LoadProfile();
            ClientScript.RegisterStartupScript(this.GetType(), "doneSavesett", "$(document).ready(function (){ notify('success','تم حقظ الإعدادات بنجاح.');}); ", true);
        }

        protected void uiLinkButtonAddPhoto_Click(object sender, EventArgs e)
        {
            string path = "~/" + ConfigurationManager.AppSettings["accountpics"].ToString();
            DirectoryInfo dir = new DirectoryInfo(Server.MapPath(path + "/" + Membership.GetUser().ProviderUserKey.ToString()));
            if (!dir.Exists)
                dir.Create();
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            path += "/" + Membership.GetUser().ProviderUserKey.ToString();
            if (uiFileUploadAddImage.HasFile)
            {
                path = path + "/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_") + uiFileUploadAddImage.FileName;
                uiFileUploadAddImage.SaveAs(Server.MapPath(path));
                MemberPic pic = new MemberPic();
                pic.AddNew();
                pic.Description = uiTextBoxPhotoDesc.Text;
                pic.PicPath = path.Substring(1);
                pic.MemberID = member.MemberID;
                pic.Save();
            }
            LoadPics();
            ClientScript.RegisterStartupScript(this.GetType(), "donePic", "$(document).ready(function (){ notify('success','تم إضافة الصورة بنجاح.');}); ", true);
        }

        protected void uiLinkButtonAddProfilePhoto_Click(object sender, EventArgs e)
        {            
            string path = "~/" + ConfigurationManager.AppSettings["accountpics"].ToString();
            DirectoryInfo dir = new DirectoryInfo(Server.MapPath(path + "/" + Membership.GetUser().ProviderUserKey.ToString()));
            if (!dir.Exists)
                dir.Create();
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            path += "/" + Membership.GetUser().ProviderUserKey.ToString();
            if (uiFileUploadAddProfileImage.HasFile)
            {
                path = path + "/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_") + uiFileUploadAddProfileImage.FileName;
                uiFileUploadAddProfileImage.SaveAs(Server.MapPath(path));
                MemberPic pic = new MemberPic();
                pic.AddNew();                
                pic.PicPath = path.Substring(1);
                pic.MemberID = member.MemberID;
                pic.Save();
                member.ProfilePic = path.Substring(1);
                member.Save();
            }
            LoadPics();
            LoadProfile();

            ClientScript.RegisterStartupScript(this.GetType(), "doneaccPic", "$(document).ready(function (){ notify('success','تم تعديل صورة الحساب بنجاح.');}); ", true);
        }

        private void LoadPics()
        {
            MemberPic pics = new MemberPic();
            pics.GetMemberPicsByMemberID(Member.CurrentMemberID);
            uiRepeaterPhotos.DataSource = pics.DefaultView;
            uiRepeaterPhotos.DataBind();

            uiRepeaterProfilePics.DataSource = pics.DefaultView;
            uiRepeaterProfilePics.DataBind();
        }

        private void LoadRooms()
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            Room myrooms = new Room();
            myrooms.GetRoomsByCreatorID(member.MemberID);

            uiRepeaterMyRooms.DataSource = myrooms.DefaultView;
            uiRepeaterMyRooms.DataBind();
        }

        protected void uiRepeaterPhotos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                MemberPic pic = new MemberPic();
                pic.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                pic.MarkAsDeleted();
                pic.Save();
                LoadPics();
            }
        }
    }
}