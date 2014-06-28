using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI.Admin
{
    public partial class EditDimension : System.Web.UI.Page
    {
        #region properties
        public Dimension CurrentDim
        {
            get
            {
                if (Session["CurrentDim"] != null)
                    return (Dimension)Session["CurrentDim"];
                else
                    return null;
            }
            set
            {
                Session["CurrentDim"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDims();
                uipanelError.Visible = false;
                uiPanelEditCat.Visible = false;
                uiPanelAllCats.Visible = true;
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentDim = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
            BindDims();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            Dimension dim = new Dimension();
            if (CurrentDim == null)
                dim.AddNew();
            else
                dim = CurrentDim;

            try
            {
                dim.Width = Convert.ToDecimal(uiTextBoxWidth.Text);
                dim.Height = Convert.ToDecimal(uiTextBoxHeight.Text);

            }
            catch (Exception ex)
            {
                return;
            }
            dim.Save();
            ClearFields();
            CurrentDim = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
            BindDims();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentDim = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentDim = null;
            uiPanelEditCat.Visible = true;
            uiPanelAllCats.Visible = false;
        }

        protected void uiGridViewDims_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewDims.PageIndex = e.NewPageIndex;
            BindDims();
        }

        protected void uiGridViewDims_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditDim")
            {
                Dimension objData = new Dimension();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxWidth.Text = objData.Width.ToString();
                uiTextBoxHeight.Text = objData.Height.ToString();

                uiPanelAllCats.Visible = false;
                uiPanelEditCat.Visible = true;
                CurrentDim = objData;

                BindDims();
            }
            else if (e.CommandName == "DeleteDim")
            {
                try
                {
                    Dimension objData = new Dimension();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentDim = null;
                    BindDims();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }
        #endregion

        #region methods

        private void BindDims()
        {
            Dimension cats = new Dimension();
            cats.LoadAll();            
            uiGridViewDims.DataSource = cats.DefaultView;
            uiGridViewDims.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxWidth.Text = "";
            uiTextBoxHeight.Text = "";
        }


        #endregion
    }
}