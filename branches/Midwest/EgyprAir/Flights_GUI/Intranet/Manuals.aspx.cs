using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;

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
                uiRadTreeViewCats.Nodes[0].Selected = true;
                currentManualCat = Convert.ToInt32(uiRadTreeViewCats.Nodes[0].Value);
                BindData();
            }
        }
       
        protected void uiRadTreeViewCats_NodeClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
        {
            currentManualCat = Convert.ToInt32(e.Node.Value);
            BindData();
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
    }
}