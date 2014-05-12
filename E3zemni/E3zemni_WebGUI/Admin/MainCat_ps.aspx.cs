using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI.Admin
{
    public partial class MainCat_ps : System.Web.UI.Page
    {
        #region properties
        public MainCat CurrentMainCat
        {
            get
            {
                if (Session["CurrentMainCatPS"] != null)
                    return (MainCat)Session["CurrentMainCatPs"];
                else
                    return null;
            }
            set
            {
                Session["CurrentMainCatPS"] = value;
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
                uipanelError.Visible = false;
                uiPanelEditCat.Visible = false;
                uiPanelAllCats.Visible = true;
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentMainCat = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
            BindCats();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            MainCat cat = new MainCat();
            if (CurrentMainCat == null)
            {
                cat.AddNew();
                cat.IsPartySupplier = true;
            }
            else
                cat = CurrentMainCat;

            cat.NameEng = uiTextBoxEnName.Text;
            cat.NameAr = uiTextBoxArName.Text;

            if (uiFileUploadImage.HasFile)
            {
                string filepath = "/images/Category/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + uiFileUploadImage.FileName;
                uiFileUploadImage.SaveAs(Server.MapPath("~" + filepath));
                cat.ImagePath = filepath;
            }
            if (uiFileUploadHover.HasFile)
            {
                string filepath = "/images/Category/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + uiFileUploadHover.FileName;
                uiFileUploadHover.SaveAs(Server.MapPath("~" + filepath));
                cat.HoverImage = filepath;
            }
            cat.TopLevelCatID = Convert.ToInt32(uiDropDownListTLCats.SelectedValue);
            cat.Save();
            ClearFields();
            CurrentMainCat = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
            BindCats();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentMainCat = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentMainCat = null;
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
                MainCat objData = new MainCat();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxEnName.Text = objData.NameEng;
                uiTextBoxArName.Text = objData.NameAr;

                uiPanelAllCats.Visible = false;
                uiPanelEditCat.Visible = true;
                CurrentMainCat = objData;

                BindCats();
            }
            else if (e.CommandName == "DeleteCat")
            {
                try
                {
                    MainCat objData = new MainCat();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentMainCat = null;
                    BindCats();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }


        protected void uiDropDownListTLCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCats();
        }
        #endregion

        #region methods

        private void LoadDDLs()
        {
            TopLevelCat cats = new TopLevelCat();
            cats.Where.IsPartySupplier.Value = true;
            cats.Where.IsPartySupplier.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            cats.Sort = "NameEng";
            cats.Query.Load();
            uiDropDownListTLCats.DataSource = cats.DefaultView;
            uiDropDownListTLCats.DataTextField = "NameEng";
            uiDropDownListTLCats.DataValueField = "TopLevelcatID";
            uiDropDownListTLCats.DataBind();
        }


        private void BindCats()
        {
            MainCat cats = new MainCat();
            if (uiDropDownListTLCats.SelectedIndex != -1)
                cats.GetMaincatByTopLevelCatId(Convert.ToInt32(uiDropDownListTLCats.SelectedValue));
            cats.Sort = "NameEng";
            uiGridViewCats.DataSource = cats.DefaultView;
            uiGridViewCats.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
        }


        #endregion

    }
}