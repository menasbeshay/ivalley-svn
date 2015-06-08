using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;

namespace Flights_GUI.Admin
{
    public partial class AircraftManualCats : System.Web.UI.Page
    {
        #region Properties
        public int currentParentCat
        {
            get
            {
                object o = this.ViewState["_currentParentCat"];
                if (o == null)
                    return 0;
                else
                    return (int)o;
            }
            set
            {
                this.ViewState["_currentParentCat"] = value;
            }
        }

        public AircraftManualCategory CurrentCat
        {
            get
            {
                if (Session["CurrentCat"] != null)
                    return (AircraftManualCategory)Session["CurrentCat"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCat"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Aircraft Manual categories";
                LoadCats();
                LoadSubCats();
                uiPanelEdit.Visible = false;
                uiPanelViewAll.Visible = true;
            }
        }



        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiTextBoxTitle.Text = "";
            uiPanelEdit.Visible = true;
            uiPanelViewAll.Visible = false;
            CurrentCat = null;
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            AircraftManualCategory cat = new AircraftManualCategory();
            if (CurrentCat != null)
                cat = CurrentCat;
            else
                cat.AddNew();

            cat.Title = uiTextBoxTitle.Text;
            if (currentParentCat != 0)
                cat.ParentCategoryID = currentParentCat;

            cat.Save();
            LoadCats();
            LoadSubCats();

            uiTextBoxTitle.Text = "";
            uiPanelEdit.Visible = false;
            uiPanelViewAll.Visible = true;
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiTextBoxTitle.Text = "";
            uiPanelEdit.Visible = false;
            uiPanelViewAll.Visible = true;
        }

        protected void uiRadGridSubCats_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditCat")
            {
                AircraftManualCategory objData = new AircraftManualCategory();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxTitle.Text = objData.Title;
                CurrentCat = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteCat")
            {
                AircraftManualCategory objData = new AircraftManualCategory();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                LoadSubCats();
            }
        }

        protected void uiRadGridSubCats_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            uiRadGridSubCats.CurrentPageIndex = e.NewPageIndex;
            LoadSubCats();
        }

        protected void uiRadTreeViewCats_NodeClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
        {
            currentParentCat = Convert.ToInt32(e.Node.Value);
            LoadSubCats();

        }

        protected void uiLinkButtonGetRootCats_Click(object sender, EventArgs e)
        {
            currentParentCat = 0;
            uiRadTreeViewCats.UnselectAllNodes();
            LoadSubCats();
        }
        #endregion

        #region Methods
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

        private void LoadSubCats()
        {
            AircraftManualCategory cats = new AircraftManualCategory();
            cats.GetSubCatByCatID(currentParentCat);
            uiRadGridSubCats.DataSource = cats.DefaultView;
            uiRadGridSubCats.DataBind();
        }
        #endregion
    }
}