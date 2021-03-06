﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Web.Security;
using Telerik.Web.UI;

namespace Flights_GUI.Intranet
{
    public partial class Manuals : System.Web.UI.Page
    {
        public int currentManualCat
        {
            get
            {
                object o = this.ViewState["_currentManualCat"];
                if (o == null)
                    return 0;
                else
                    return (int)o;
            }
            set
            {
                this.ViewState["_currentManualCat"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.ModuleTitle = "";
                Master.PageTitle = "Manuals";
                LoadCats();
                if (Request.QueryString["cid"] != null)
                {
                    int d = 0;
                    int.TryParse(Request.QueryString["cid"].ToString(), out d);
                    if (d != 0)
                    {
                        RadTreeNode node = uiRadTreeViewCats.FindNodeByValue(d.ToString());
                        node.Selected = true;
                        node.ExpandParentNodes();
                    }
                        //uiRadTreeViewCats.Nodes.FindNodeByValue(d.ToString()).Selected = true;
                }
                else
                    uiRadTreeViewCats.Nodes[0].Selected = true;
                currentManualCat = Convert.ToInt32(uiRadTreeViewCats.SelectedNode.Value);
                ManualCategory cat = new ManualCategory();
                cat.LoadByPrimaryKey(currentManualCat);
                uiLabelCat.Text = cat.Title;
                BindData();

                MarkNotificationsAsRead();
            }
        }
       
        protected void uiRadTreeViewCats_NodeClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
        {
            currentManualCat = Convert.ToInt32(e.Node.Value);
            ManualCategory cat = new ManualCategory();
            cat.LoadByPrimaryKey(currentManualCat);
            uiLabelCat.Text = cat.Title;
            BindData();
            LoadCats();
            MarkNotificationsAsRead();
        }

        protected void uiRadGridmanuals_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            uiRadGridmanuals.CurrentPageIndex = e.NewPageIndex;
            BindData();
        }

        private void LoadCats()
        {
            ManualCategory cats = new ManualCategory();
            cats.GetAllCatsWithNotifications(new Guid(Membership.GetUser().ProviderUserKey.ToString()));

            uiRadTreeViewCats.DataSource = cats.DefaultView;
            uiRadTreeViewCats.DataFieldID = ManualCategory.ColumnNames.ManualCategoryID;
            uiRadTreeViewCats.DataFieldParentID = ManualCategory.ColumnNames.ParentCategoryID;
            uiRadTreeViewCats.DataTextField = "DisplayName";
            uiRadTreeViewCats.DataValueField = ManualCategory.ColumnNames.ManualCategoryID;
            uiRadTreeViewCats.DataBind();
        }
        private void BindData()
        {
            Manual objdata = new Manual();
            objdata.GetManualsByCatID(currentManualCat, new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            uiRadGridmanuals.DataSource = objdata.DefaultView;
            uiRadGridmanuals.DataBind();

        }

        //protected void MarkNotificationsAsRead()
        //{
        //    UsersNofications userNotif = new UsersNofications();
        //    userNotif.MarkNotificationsRead((new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString())), 3);
        //}

        protected void MarkNotificationsAsRead()
        {
            UsersNofications userNotif = new UsersNofications();
            if(currentManualCat != 12)
                userNotif.MarkNotificationsReadByManualCategoryID((new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString())), 3,currentManualCat);
            else
                userNotif.MarkNotificationsReadByManualCategoryID((new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString())), 5, currentManualCat);
        }

    }
}