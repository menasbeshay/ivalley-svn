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

        public ManualCategory CurrentCat
        {
            get
            {
                if (Session["CurrentCat"] != null)
                    return (ManualCategory)Session["CurrentCat"];
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
            if(!IsPostBack)
            {
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
            ManualCategory cat = new ManualCategory ();
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
                ManualCategory objData = new ManualCategory();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxTitle.Text = objData.Title;                
                CurrentCat = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteCat")
            {
                ManualCategory objData = new ManualCategory();
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
            ManualCategory cats = new ManualCategory();
            cats.LoadAll();

            uiRadTreeViewCats.DataSource = cats.DefaultView;
            uiRadTreeViewCats.DataFieldID = ManualCategory.ColumnNames.ManualCategoryID;
            uiRadTreeViewCats.DataFieldParentID = ManualCategory.ColumnNames.ParentCategoryID;
            uiRadTreeViewCats.DataTextField = ManualCategory.ColumnNames.Title;
            uiRadTreeViewCats.DataValueField = ManualCategory.ColumnNames.ManualCategoryID;
            uiRadTreeViewCats.DataBind();
        }

        private void LoadSubCats()
        {
            ManualCategory cats = new ManualCategory();
            cats.GetSubCatByCatID(currentParentCat);
            uiRadGridSubCats.DataSource = cats.DefaultView;
            uiRadGridSubCats.DataBind();
        }
        #endregion

       
    }
}