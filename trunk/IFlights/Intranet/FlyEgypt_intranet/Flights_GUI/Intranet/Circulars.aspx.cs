﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Web.Security;

namespace Flights_GUI.Intranet
{
    public partial class Circulars : System.Web.UI.Page
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
                Master.PageTitle = "Circulars";
                if (CurrentAnnouncement == 0)
                {
                    LoadCirculars();
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
            }
        }

        private void LoadCurrent()
        {
            Announcement current = new Announcement();

            if (current.LoadByPrimaryKey(CurrentAnnouncement))
            {
                uiLabelTitle.Text = current.Title;
                uiLabelDate.Text = current.CreatedDate.ToString("dd MMM yyyy");
                if(!current.IsColumnNull(Announcement.ColumnNames.CreatedBy))
                    uiLabelCreator.Text = Membership.GetUser(new Guid(current.CreatedBy.ToString())).UserName;
                uiLiteralContent.Text = Server.HtmlDecode(current.Content);
                uiImageMain.ImageUrl = string.IsNullOrEmpty(current.MainPic) ? "../img/announcement-icon.png" : current.MainPic;
            }
        }

        private void LoadCirculars()
        {
            Announcement all = new Announcement();
            all.GetAllCirculars();

            uiRadListViewCirculars.DataSource = all.DefaultView;
            uiRadListViewCirculars.DataBind();
        }

        protected void uiRadListViewCirculars_PageIndexChanged(object sender, Telerik.Web.UI.RadListViewPageChangedEventArgs e)
        {
            uiRadListViewCirculars.CurrentPageIndex = e.NewPageIndex;
            LoadCirculars();
        }

        protected void MarkNotificationsAsRead()
        {
            UsersNofications userNotif = new UsersNofications();
            userNotif.MarkNotificationsReadByNotificationType((new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString())),1);
        }
    }
}