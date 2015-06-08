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
                Master.PageTitle = "Aircraft Manuals";
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
            }
        }
       
        protected void uiRadTreeViewCats_NodeClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
        {
            currentManualCat = Convert.ToInt32(e.Node.Value);
            uiLabelCat.Text = e.Node.Text;
            BindData();
        }

        protected void uiRadGridmanuals_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            uiRadGridmanuals.CurrentPageIndex = e.NewPageIndex;
            BindData();
        }

        private void LoadCats()
        {
            AircraftManualCategory cats = new AircraftManualCategory();
            cats.LoadAll();

            uiRadTreeViewCats.DataSource = cats.DefaultView;
            uiRadTreeViewCats.DataFieldID = AircraftManualCategory.ColumnNames.ManualCategoryID;
            uiRadTreeViewCats.DataFieldParentID = AircraftManualCategory.ColumnNames.ParentCategoryID;
            uiRadTreeViewCats.DataTextField = AircraftManualCategory.ColumnNames.Title;
            uiRadTreeViewCats.DataValueField = AircraftManualCategory.ColumnNames.ManualCategoryID;
            uiRadTreeViewCats.DataBind();
        }
        private void BindData()
        {
            AirCraftManual objdata = new AirCraftManual();
            objdata.GetManualsByCatID(currentManualCat);
            uiRadGridmanuals.DataSource = objdata.DefaultView;
            uiRadGridmanuals.DataBind();

        }
    }
}