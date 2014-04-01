using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI.Admin
{
    public partial class EditColors : System.Web.UI.Page
    {
        #region properties
        public Color CurrentColor
        {
            get
            {
                if (Session["CurrentColor"] != null)
                    return (Color)Session["CurrentColor"];
                else
                    return null;
            }
            set
            {
                Session["CurrentColor"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindColors();
                uipanelError.Visible = false;
                uiPanelEditCat.Visible = false;
                uiPanelAllCats.Visible = true;
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentColor = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
            BindColors();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            Color color = new Color();
            if (CurrentColor == null)
                color.AddNew();
            else
                color = CurrentColor;

            color.ColorNameEng = uiTextBoxEnName.Text;
            color.ColorNameAr = uiTextBoxArName.Text;
            color.ColorCode = uiTextBoxColorCode.Text;
            
            color.Save();
            ClearFields();
            CurrentColor = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
            BindColors();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentColor = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentColor = null;
            uiPanelEditCat.Visible = true;
            uiPanelAllCats.Visible = false;
        }

        protected void uiGridViewColors_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewColors.PageIndex = e.NewPageIndex;
            BindColors();
        }

        protected void uiGridViewColors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditColor")
            {
                Color objData = new Color();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxEnName.Text = objData.ColorNameEng;
                uiTextBoxArName.Text = objData.ColorNameAr;
                uiTextBoxColorCode.Text = objData.ColorCode;
                uiPanelAllCats.Visible = false;
                uiPanelEditCat.Visible = true;
                CurrentColor = objData;

                BindColors();
            }
            else if (e.CommandName == "DeleteColor")
            {
                try
                {
                    Color objData = new Color();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentColor = null;
                    BindColors();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }
        #endregion

        #region methods

        private void BindColors()
        {
            Color colors = new Color();
            colors.LoadAll();
            colors.Sort = "ColorNameEng";
            uiGridViewColors.DataSource = colors.DefaultView;
            uiGridViewColors.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxColorCode.Text = "";
        }


        #endregion

        protected void uiGridViewColors_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = e.Row.FindControl("colordiv") as System.Web.UI.HtmlControls.HtmlGenericControl;
                string color = "#" + (string)DataBinder.Eval(e.Row.DataItem, "ColorCode");
                div.Attributes.CssStyle.Add("background-color", color);
            }
        }
    }
}