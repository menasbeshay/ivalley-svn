using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI.Admin
{
    public partial class EditCategories : System.Web.UI.Page
    {
        #region properties
        public Categories CurrentCat
        {
            get
            {
                if (Session["CurrentCat"] != null)
                    return (Categories)Session["CurrentCat"];
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
            if (!IsPostBack)
            {                
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
            Categories cat = new Categories();
            if (CurrentCat == null)
                cat.AddNew();
            else
                cat = CurrentCat;

            cat.CatNameEng = uiTextBoxEnName.Text;
            cat.CatNameAr = uiTextBoxArName.Text;

            if (uiFileUploadImage.HasFile)
            {
                string filepath = "/images/Category/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + uiFileUploadImage.FileName;
                uiFileUploadImage.SaveAs(Server.MapPath("~" + filepath));
                cat.CatImage = filepath;
            }            
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
                Categories objData = new Categories();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxEnName.Text = objData.CatNameEng;
                uiTextBoxArName.Text = objData.CatNameAr;

                uiPanelAllCats.Visible = false;
                uiPanelEditCat.Visible = true;
                CurrentCat = objData;

                BindCats();
            }
            else if (e.CommandName == "DeleteCat")
            {
                try
                {
                    Categories objData = new Categories();
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
            Categories cats = new Categories();
            cats.LoadAll();
            cats.Sort = "CatNameEng";
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