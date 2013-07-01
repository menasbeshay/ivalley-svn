using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IStock.BLL;
namespace I_Stock.Admin
{
    public partial class ItemCats : System.Web.UI.Page
    {
        #region properties
        public ItemCategories CurrentCat
        {
            get
            {
                if (Session["CurrentCat"] != null)
                    return (ItemCategories)Session["CurrentCat"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCat"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                BindCats();
                uipanelError.Visible = false;
                uiPanelEditCat.Visible = false;
                uiPanelAllCats.Visible = true;
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentCat = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
            BindCats();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            ItemCategories cat = new ItemCategories ();
            if (CurrentCat == null)
                cat.AddNew();
            else
                cat = CurrentCat;

            cat.Name = uiTextBoxName.Text;
            cat.Description = uiTextBoxDesc.Text;
            cat.Save();
            ClearFields();
            CurrentCat = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
            BindCats();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentCat = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;            
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentCat = null;
            uiPanelEditCat.Visible = true;
            uiPanelAllCats.Visible = false;           
        }

        protected void uiGridViewCats_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCats.PageIndex = e.NewPageIndex;
            BindCats();
        }

        protected void uiGridViewCats_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCat")
            {
                ItemCategories objData = new ItemCategories();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxName.Text = objData.Name;
                uiTextBoxDesc.Text = objData.Description;
                
                uiPanelAllCats.Visible = false;
                uiPanelEditCat.Visible = true;
                CurrentCat = objData;
                
                BindCats();
            }
            else if (e.CommandName == "DeleteCat")
            {
                try
                {
                    ItemCategories objData = new ItemCategories();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentCat = null;
                    BindCats();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }
        #endregion

        #region methods

        private void BindCats()
        {
            ItemCategories cats = new ItemCategories();
            cats.LoadAll();
            cats.Sort = "Name";
            uiGridViewCats.DataSource = cats.DefaultView;
            uiGridViewCats.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxDesc.Text = "";
        }


        #endregion
    }
}