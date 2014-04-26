using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;
using System.Configuration;
namespace E3zemni_WebGUI.Admin
{
    public partial class EditPages : System.Web.UI.Page
    {
        #region properties
        public SitePages CurrentPage
        {
            get
            {
                if (Session["CurrentPage"] != null)
                    return (SitePages)Session["CurrentPage"];
                else
                    return null;
            }
            set
            {
                Session["CurrentPage"] = value;
            }
        }
        #endregion
        #region Events


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                uiPanelAllCats.Visible = true;
                uiPanelEditCat.Visible = false;
                Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
            }
        }

        protected void uiGridViewPages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPage")
            {
                SitePages objData = new SitePages();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentPage = objData;
                uiTextBoxArName.Text = objData.PageTitleAr;
                uiTextBoxEnName.Text = objData.PageTitleEng;
                uiFCKeditorArContent.Value = Server.HtmlDecode(objData.PageTextAr);
                uiFCKeditorEnContent.Value = Server.HtmlDecode(objData.PageTextEng);
                uiPanelAllCats.Visible = false;
                uiPanelEditCat.Visible = true;
            }
        }

        protected void uiGridViewPages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewPages.PageIndex = e.NewPageIndex;
            BindData();
        }
        
        #endregion
        #region methods
        private void BindData()
        {
            SitePages objData = new SitePages();
            objData.LoadAll();
            uiGridViewPages.DataSource = objData.DefaultView;
            uiGridViewPages.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxArName.Text = "";
            uiTextBoxEnName.Text = "";
            uiFCKeditorEnContent.Value = "";
            uiFCKeditorArContent.Value = "";            
        }
        #endregion

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            SitePages objData = new SitePages();
            objData = CurrentPage;
            objData.PageTitleEng = uiTextBoxEnName.Text;
            objData.PageTitleAr = uiTextBoxArName.Text;
            objData.PageTextEng = Server.HtmlEncode(uiFCKeditorEnContent.Value);
            objData.PageTextAr = Server.HtmlEncode(uiFCKeditorArContent.Value);
            objData.Save();
            CurrentPage = null;
            uiPanelAllCats.Visible = true;
            uiPanelEditCat.Visible = false;
            BindData();
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            CurrentPage = null;
            uiPanelAllCats.Visible = true;
            uiPanelEditCat.Visible = false;
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentPage = null;
            uiPanelAllCats.Visible = true;
            uiPanelEditCat.Visible = false;
        }
    }
}