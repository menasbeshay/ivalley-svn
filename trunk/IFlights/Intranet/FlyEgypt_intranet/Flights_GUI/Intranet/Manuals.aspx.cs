using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Web.Security;

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
                        uiRadTreeViewCats.Nodes.FindNodeByValue(d.ToString()).Selected = true;
                }
                else
                    uiRadTreeViewCats.Nodes[0].Selected = true;
                currentManualCat = Convert.ToInt32(uiRadTreeViewCats.SelectedNode.Value);
                uiLabelCat.Text = uiRadTreeViewCats.SelectedNode.Text;
                BindData();

                MarkNotificationsAsRead();
            }
        }
       
        protected void uiRadTreeViewCats_NodeClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
        {
            currentManualCat = Convert.ToInt32(e.Node.Value);
            uiLabelCat.Text = e.Node.Text;
            BindData();
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
            cats.LoadAll();

            uiRadTreeViewCats.DataSource = cats.DefaultView;
            uiRadTreeViewCats.DataFieldID = ManualCategory.ColumnNames.ManualCategoryID;
            uiRadTreeViewCats.DataFieldParentID = ManualCategory.ColumnNames.ParentCategoryID;
            uiRadTreeViewCats.DataTextField = ManualCategory.ColumnNames.Title;
            uiRadTreeViewCats.DataValueField = ManualCategory.ColumnNames.ManualCategoryID;
            uiRadTreeViewCats.DataBind();
        }
        private void BindData()
        {
            Manual objdata = new Manual();
            objdata.GetManualsByCatID(currentManualCat);
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
                userNotif.MarkNotificationsReadByCategoryID((new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString())), 3,currentManualCat);
            else
                userNotif.MarkNotificationsReadByCategoryID((new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString())), 5, currentManualCat);
        }

    }
}