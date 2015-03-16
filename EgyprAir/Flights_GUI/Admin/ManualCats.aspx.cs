using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Admin
{
    public partial class ManualCats : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadCats();
            }
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

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {

        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {

        }

        protected void uiRadGridSubCats_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }

        protected void uiRadGridSubCats_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {

        }

        protected void uiRadTreeViewCats_NodeClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
        {
            ManualCategory cat = new ManualCategory ();
            cat.LoadByPrimaryKey(Convert.ToInt32(e.Node.Value));
        }
    }
}