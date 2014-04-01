using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI.Admin
{
    public partial class EditEnvelops : System.Web.UI.Page
    {
        #region properties
        public Envelops CurrentEnvelop
        {
            get
            {
                if (Session["CurrentEnvelop"] != null)
                    return (Envelops)Session["CurrentEnvelop"];
                else
                    return null;
            }
            set
            {
                Session["CurrentEnvelop"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                BindCats();                
                uiPanelEditCat.Visible = false;
                uiPanelAllCats.Visible = true;
            }
        }

        private void LoadDDLs()
        {
            Color colors = new Color();
            colors.LoadAll();
            uiDropDownListColor.DataSource = colors.DefaultView;
            uiDropDownListColor.DataTextField = "ColorNameEng";
            uiDropDownListColor.DataValueField = "ColorID";
            uiDropDownListColor.DataBind();

            Dimension dims = new Dimension();
            dims.GetAllDims();
            uiDropDownListDim.DataSource = dims.DefaultView;
            uiDropDownListDim.DataTextField = "DisplayName";
            uiDropDownListDim.DataValueField = "DimensionID";
            uiDropDownListDim.DataBind();
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentEnvelop = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
            BindCats();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            Envelops envelop = new Envelops();
            if (CurrentEnvelop == null)
            {
                envelop.AddNew();
                envelop.UploadDate = DateTime.Now;
            }
            else
                envelop = CurrentEnvelop;

            envelop.ColorID = Convert.ToInt32(uiDropDownListColor.SelectedValue);
            envelop.DimensionID = Convert.ToInt32(uiDropDownListDim.SelectedValue);
            double price = 0;
            double.TryParse(uiTextBoxPrice.Text, out price);
            envelop.Price = price;

            if (uiFileUploadImage.HasFile)
            {
                string filepath = "/images/Envelop/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + uiFileUploadImage.FileName;
                uiFileUploadImage.SaveAs(Server.MapPath("~" + filepath));
                envelop.ImagePath = filepath;
            }
            envelop.Save();
            ClearFields();
            CurrentEnvelop = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
            BindCats();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentEnvelop = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentEnvelop = null;
            uiPanelEditCat.Visible = true;
            uiPanelAllCats.Visible = false;
        }

        protected void uiGridViewEnvelops_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewEnvelops.PageIndex = e.NewPageIndex;
            BindCats();
        }

        protected void uiGridViewEnvelops_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditEnvelop")
            {
                Envelops objData = new Envelops();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                if(!objData.IsColumnNull("ColorID"))
                    uiDropDownListColor.SelectedValue = objData.ColorID.ToString();
                if (!objData.IsColumnNull("DimensionID"))
                    uiDropDownListDim.SelectedValue = objData.DimensionID.ToString();

                uiTextBoxPrice.Text = objData.Price.ToString();

                uiPanelAllCats.Visible = false;
                uiPanelEditCat.Visible = true;
                CurrentEnvelop = objData;

                BindCats();
            }
            else if (e.CommandName == "DeleteEnvelop")
            {
                try
                {
                    Envelops objData = new Envelops();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentEnvelop = null;
                    BindCats();
                }
                catch (Exception ex)
                {
                    return;
                }
            }
        }
        #endregion

        #region methods

        private void BindCats()
        {
            Envelops env = new Envelops();
            env.LoadAll();            
            uiGridViewEnvelops.DataSource = env.DefaultView;
            uiGridViewEnvelops.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxPrice.Text = "";
            uiDropDownListColor.SelectedIndex = 0;
            uiDropDownListDim.SelectedIndex = 0;

        }


        #endregion

        protected void uiGridViewEnvelops_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = e.Row.FindControl("ColorDiv") as System.Web.UI.HtmlControls.HtmlGenericControl;

                int Colid = (int)DataBinder.Eval(e.Row.DataItem, "ColorID");
                Color col = new Color();
                col.LoadByPrimaryKey(Colid);

                string color = "#" + col.ColorCode;
                div.Attributes.CssStyle.Add("background-color", color);

                Label dim = (Label)e.Row.FindControl("uiLabelDim");
                int dimid = (int)DataBinder.Eval(e.Row.DataItem, "DimensionID");
                Dimension obj = new Dimension();
                obj.LoadByPrimaryKey(dimid);
                dim.Text = obj.Width.ToString() + " × " + obj.Height.ToString(); ;
            }
        }
    }
}