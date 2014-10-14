using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin
{
    public partial class MailAds : System.Web.UI.Page
    {
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_MailAds.ToString());
                return lstRoles;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtStartDate.Text = Helper.Date.ToString(DateTime.Now);

                BLL.MailAds ads = new BLL.MailAds();
                ads.LoadAll();

                repAds.DataSource = ads.DefaultView;
                repAds.DataBind();

                for (int i = 1; i <= 30;i++ )
                {
                    lstDays.Items.Add(new ListItem(i.ToString()));
                }
                for (int i = 1; i <= 24; i++)
                {
                    lstHours.Items.Add(new ListItem(i.ToString()));
                }
                var lstStatus = Helper.EnumUtil.GetValues<Helper.Enums.RowStatus>().Select(r => new
                {
                    ID = (int)r,
                    Name = Helper.StringEnum.GetStringValue(r)
                }).ToList();
                rdStatus.DataValueField = "ID";
                rdStatus.DataTextField = "Name";
                rdStatus.DataSource = lstStatus;
                rdStatus.DataBind();

                var lstMemberTypes = Helper.EnumUtil.GetValues<Helper.Enums.MemberType>().Select(r => new
                {
                    ID = (int)r,
                    Name = Helper.StringEnum.GetStringValue(r)
                }).ToList();
                chkMemberTypes.DataValueField = "ID";
                chkMemberTypes.DataTextField = "Name";
                chkMemberTypes.DataSource = lstMemberTypes;
                chkMemberTypes.DataBind();
            }

        }

        protected void btnSaveAd_Click(object sender, EventArgs e)
        {
            try
            {
                int adId = Helper.TypeConverter.ToInt32(hdnAdID.Value);
                BLL.MailAds bllMailAd = new BLL.MailAds();
                if (adId > 0)
                {
                    bllMailAd.LoadByPrimaryKey(adId);
                }
                else
                {
                    bllMailAd.AddNew();
                    bllMailAd.Timestamp = DateTime.Now;
                }

                string path = "~/" + Helper.Defaults.AdsPicFolder;
                if (uiFileUploadAddImage.HasFile)
                {
                    path = path + "/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_") + uiFileUploadAddImage.FileName;
                    uiFileUploadAddImage.SaveAs(Server.MapPath(path));
                    bllMailAd.AdImage = path.Substring(1);
                }
                
                bllMailAd.AdText = txtAdText.Text;
                bllMailAd.RowStatusID = Convert.ToInt32(rdStatus.SelectedValue);
                bllMailAd.NumOfDays = Convert.ToInt32(lstDays.SelectedValue);
                bllMailAd.NuOfHours = Convert.ToInt32(lstHours.SelectedValue);
                bllMailAd.StartDate = Helper.Date.ToDate(txtStartDate.Text);
                string strMembers = "";
                for (int i = 0; i < chkMemberTypes.Items.Count;i++ )
                {
                    if (chkMemberTypes.Items[i].Selected)
                    {
                        strMembers += "," + chkMemberTypes.Items[i].Value;
                    }
                }
                bllMailAd.MemberTypes = strMembers;
                bllMailAd.Save();

                Response.Redirect("MailAds.aspx");
            }
            catch (Exception ex)
            {
            }
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            LinkButton lnkBtn = (LinkButton)sender;
                
            int adId=Helper.TypeConverter.ToInt32(lnkBtn.CommandArgument);
            BLL.MailAds bllMailAds = new BLL.MailAds();
            if (bllMailAds.LoadByPrimaryKey(adId))
            {
                hdnAdID.Value = adId.ToString();
                txtAdText.Text = bllMailAds.AdText;
                lstDays.SelectedValue=bllMailAds.s_NumOfDays;
                lstHours.SelectedValue = bllMailAds.s_NuOfHours;
                txtStartDate.Text = Helper.Date.ToString(bllMailAds.StartDate);
                string[] memberTypes = bllMailAds.MemberTypes.Split(new string[] { "," },StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i < chkMemberTypes.Items.Count; i++)
                {
                    chkMemberTypes.Items[i].Selected = memberTypes.Contains(chkMemberTypes.Items[i].Value);
                }

                rdStatus.SelectedValue = bllMailAds.s_RowStatusID;

                lblTitle.Text = "تعديل الإعلان";
            }
        }


        public string GetStatusName(object statusID)
        {
            return Helper.StringEnum.GetStringValue(Helper.EnumUtil.ParseEnum<Helper.Enums.RowStatus>(Helper.TypeConverter.ToInt32(statusID)));
        }

        public static string GetAdContent(object adText,object adImage)
        {
            string result = "";
            if (adText != DBNull.Value)
            {
                result = adText.ToString().Replace("\r\n", "</br>");
                if (adImage != DBNull.Value)
                {
                    result += "</br><img src='" + adImage.ToString() + "'/>";
                }
            }
            return result;
        }
        
    }
}