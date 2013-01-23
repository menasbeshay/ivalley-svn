using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using YMC.BLL;
namespace YMC_Website.Admin
{
    public partial class EditPages : System.Web.UI.Page
    {
        #region properties
        public Pages CurrentPage
        {
            get
            {
                if (Session["CurrentPage"] != null)
                    return (Pages)Session["CurrentPage"];
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
            BindData();
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
        }

        protected void uiGridViewPages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewPages.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewPages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPage")
            {
                Pages objData = new Pages();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentPage = objData;
                uiTextBoxArTitle.Text = objData.TitleArabic;
                uiFCKeditorContent.Value = Server.HtmlDecode(objData.ContentArabic);
                uiPanelViewAllPages.Visible = false;
                uiPanelEdit.Visible = true;
            }
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            Pages objData = new Pages();
            objData = CurrentPage;
            objData.TitleArabic = uiTextBoxArTitle.Text;
            objData.ContentArabic = Server.HtmlEncode(uiFCKeditorContent.Value);
            objData.Save();
            CurrentPage = null;
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            BindData();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            Clearfields();
            CurrentPage = null;
        }

        #endregion

        #region Methods
        private void BindData()
        {
            Pages objData = new Pages();
            objData.LoadAll();
            uiGridViewPages.DataSource = objData.DefaultView;
            uiGridViewPages.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxArTitle.Text = "";
            uiFCKeditorContent.Value = "";
            uiLabelError.Visible = false;
        }
        #endregion

    }
}