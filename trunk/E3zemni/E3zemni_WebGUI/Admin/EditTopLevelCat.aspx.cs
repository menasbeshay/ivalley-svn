using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI.Admin
{
    public partial class EditTopLevelCat : System.Web.UI.Page
    {
        #region properties
        public TopLevelCat CurrentTopCat
        {
            get
            {
                if (Session["CurrentTopCat"] != null)
                    return (TopLevelCat)Session["CurrentTopCat"];
                else
                    return null;
            }
            set
            {
                Session["CurrentTopCat"] = value;
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
            CurrentTopCat = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
            BindCats();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            TopLevelCat cat = new TopLevelCat();
            if (CurrentTopCat == null)
            {
                cat.AddNew();
                cat.IsPartySupplier = false;
            }
            else
                cat = CurrentTopCat;

            cat.NameEng = uiTextBoxEnName.Text;
            cat.NameAr = uiTextBoxArName.Text;
            cat.IsPartySupplier = false;

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

            cat.Save();
            ClearFields();
            CurrentTopCat = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
            BindCats();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentTopCat = null;
            uiPanelEditCat.Visible = false;
            uiPanelAllCats.Visible = true;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentTopCat = null;
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
                TopLevelCat objData = new TopLevelCat();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxEnName.Text = objData.NameEng;
                uiTextBoxArName.Text = objData.NameAr;

                uiPanelAllCats.Visible = false;
                uiPanelEditCat.Visible = true;
                CurrentTopCat = objData;

                BindCats();
            }
            else if (e.CommandName == "DeleteCat")
            {
                try
                {
                    TopLevelCat objData = new TopLevelCat();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentTopCat = null;
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
            TopLevelCat cats = new TopLevelCat();
            cats.Where.IsPartySupplier.Value = true;
            cats.Where.IsPartySupplier.Operator = MyGeneration.dOOdads.WhereParameter.Operand.NotEqual;
            cats.Sort = "NameEng";
            cats.Query.Load();
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