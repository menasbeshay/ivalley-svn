using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Intranet
{
    public partial class Bulletins : System.Web.UI.Page
    {
        public int CurrentAnnouncement
        {
            get
            {
                if (Request.QueryString["cid"] != null)
                {
                    try
                    {
                        return Convert.ToInt32(Request.QueryString["cid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        return 0;
                    }
                }
                return 0;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Bulletins";
                if (CurrentAnnouncement == 0)
                {
                    LoadCircularsPublic();
                    LoadCircularsGroup();
                    uiPanelViewAll.Visible = true;
                    uiPanelCurrent.Visible = false;
                }
                else
                {
                    LoadCurrent();
                    uiPanelViewAll.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                MarkNotificationsAsRead();

                UsersProfiles userProf = new UsersProfiles();
                userProf.getUserByGUID(new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()));

                Groups grps = new Groups();
                grps.LoadByPrimaryKey(userProf.GroupID);
                lblTabGroup.Text = grps.GroupName + " Bulletins";
            }
        }

        private void LoadCurrent()
        {
            Announcement current = new Announcement();

            if (current.LoadByPrimaryKey(CurrentAnnouncement))
            {
                uiLabelTitle.Text = current.Title;
                uiLabelDate.Text = current.CreatedDate.ToString("dd MMM yyyy");
                if (!current.IsColumnNull(Announcement.ColumnNames.CreatedBy))
                    uiLabelCreator.Text = Membership.GetUser(new Guid(current.CreatedBy.ToString())).UserName;
                uiLiteralContent.Text = Server.HtmlDecode(current.Content);
                uiImageMain.ImageUrl = string.IsNullOrEmpty(current.MainPic) ? "../img/announcement-icon.png" : current.MainPic;
                if (string.IsNullOrWhiteSpace(current.UploadedFile))
                {
                    btnDownloadAttachment.Visible = false;
                }
                else
                {
                    btnDownloadAttachment.HRef = current.UploadedFile;
                    btnDownloadAttachment.Attributes.Add("download", current.UploadedFile.Substring(current.UploadedFile.LastIndexOf('/') + 1));
                }
            }
        }

        private void LoadCircularsPublic()
        {
            Announcement all = new Announcement();
            all.GetAllBulletinsPublic();
            uiRadListViewCircularsPublic.DataSource = all.DefaultView;
            uiRadListViewCircularsPublic.DataBind();
        }
        private void LoadCircularsGroup()
        {
            UsersProfiles userProf = new UsersProfiles();
            userProf.getUserByGUID(new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()));

            Announcement all = new Announcement();
            all.GetAllBulletinsGroups(userProf.GroupID);
            uiRadListViewCircularsGroup.DataSource = all.DefaultView;
            uiRadListViewCircularsGroup.DataBind();
        }

        protected void uiRadListViewCircularsPublic_PageIndexChanged(object sender, Telerik.Web.UI.RadListViewPageChangedEventArgs e)
        {
            uiRadListViewCircularsPublic.CurrentPageIndex = e.NewPageIndex;
            LoadCircularsPublic();
        }
        protected void uiRadListViewCircularsGroup_PageIndexChanged(object sender, Telerik.Web.UI.RadListViewPageChangedEventArgs e)
        {
            uiRadListViewCircularsGroup.CurrentPageIndex = e.NewPageIndex;
            LoadCircularsGroup();
        }

        protected void MarkNotificationsAsRead()
        {
            UsersNofications userNotif = new UsersNofications();
            userNotif.MarkNotificationsReadByNotificationType((new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString())), 2);
        }

    }
}