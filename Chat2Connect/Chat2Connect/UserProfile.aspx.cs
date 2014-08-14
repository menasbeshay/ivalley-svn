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
    public partial class UserProfile : System.Web.UI.Page
    {
        public int userId
        {
            get
            {
                if (Request.QueryString["uid"] != null)
                    try
                    {
                        return Convert.ToInt32(Request.QueryString["uid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        return 0;
                    }
                else
                    return 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadProfile();
        }

        private void LoadProfile()
        {
            if (userId != 0)
            {
                Member member = new Member();
                member.LoadByPrimaryKey(userId);

                // load settings 
                MemberSetting setting = new MemberSetting();
                setting.GetMemberSettingsByMemberID(member.MemberID);
                if ((setting.RowCount > 0))
                {
                    if (!setting.IsColumnNull("HideProfile"))
                    {
                        if (setting.HideProfile)
                            Response.Redirect("home.aspx");
                    }
                    if (!setting.IsColumnNull("HidePics"))
                        uiPanelPics.Visible = setting.HidePics;
                }

                uiLabelName.Text = member.Name;

                if (!member.IsColumnNull("ReligionID"))
                {
                    Religion religion = new Religion();
                    religion.LoadByPrimaryKey(member.ReligionID);
                    uiLabelReligion.Text = religion.Name;
                }
                uiLabelJob.Text = member.JobTitle;
                if (!member.IsColumnNull("BirthDate"))
                {
                    uiLabelDOP.Text = member.BirthDate.ToString("yyyy/MM/dd");
                }
                if (!member.IsColumnNull("CountryID"))
                {
                    Country country = new Country();
                    if (member.CountryID != 0)
                    {
                        country.LoadByPrimaryKey(member.CountryID);
                        uiLabelCountry.Text = country.Name;
                    }
                }
                uiLabelBestFood.Text = member.BestFood;
                uiLabelBestCar.Text = member.BestCar;
                uiLabelBestTeam.Text = member.BestTeam;
                uiLabelBestCountry.Text = member.BestCounrty;                
                uiHyperLinkFb.NavigateUrl = member.FbURL;
                uiHyperLinktwitter.NavigateUrl = member.TURL;
                uiHyperLinkyt.NavigateUrl = member.YtURL;

                if (member.MemberType.MemberTypeSpecDurationID != Helper.Defaults.MemberTypeSpecDurationID)
                {
                    uiLabelAccountType.Text = member.MemberType.MemberTypeSpecDuration.MemberTypeSpec.Name;

                }
                if (!member.IsColumnNull("ProfilePic"))
                {
                    uiImageMain.ImageUrl = member.ProfilePic;
                }
                ///////////////////////////////
                uiLabelInterests.Text = member.Interests;

            }
            else
            {
                Response.Redirect("home.aspx");
            }
        }
    }
}