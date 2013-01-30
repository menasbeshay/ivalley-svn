using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;
using System.Configuration;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditPages : System.Web.UI.Page
    {
        #region properties
        public BLL.Pages CurrentPage
        {
            get
            {
                if (Session["CurrentPage"] != null)
                    return (BLL.Pages)Session["CurrentPage"];
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
                uiPanelViewAllPages.Visible = true;
                uiPanelEdit.Visible = false;
                Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
            }
        }

        protected void uiGridViewPages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPage")
            {
                BLL.Pages objData = new BLL.Pages();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentPage = objData;
                uiTextBoxArTitle.Text = objData.ArTitle;
                uiTextBoxEnTitle.Text = objData.EnTitle;
                uiFCKeditorArContent.Value = Server.HtmlDecode(objData.ArContent);
                uiFCKeditorEnContent.Value = Server.HtmlDecode(objData.EnContent);
                uiPanelViewAllPages.Visible = false;
                uiPanelEdit.Visible = true;
            }
        }

        protected void uiGridViewPages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewPages.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            BLL.Pages objData = new BLL.Pages();
            objData = CurrentPage;
            objData.EnTitle = uiTextBoxEnTitle.Text;
            objData.ArTitle = uiTextBoxArTitle.Text;
            objData.EnContent = Server.HtmlEncode(uiFCKeditorEnContent.Value);
            objData.ArContent = Server.HtmlEncode(uiFCKeditorArContent.Value);            
            objData.Save();
            CurrentPage = null;
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
        }


        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            BLL.Pages objData = new BLL.Pages();
            objData.SearchPages(uiTextBoxSearch.Text);
            uiGridViewPages.DataSource = objData.DefaultView;
            uiGridViewPages.DataBind();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
             uiPanelViewAllPages.Visible = true;
             uiPanelEdit.Visible = false;
        }
        #endregion
        #region methods
        private void BindData()
        {
            BLL.Pages objData = new BLL.Pages();
            objData.LoadAll();
            uiGridViewPages.DataSource = objData.DefaultView;
            uiGridViewPages.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxArTitle.Text = "";
            uiTextBoxEnTitle.Text = "";
            uiFCKeditorEnContent.Value = "";
            uiFCKeditorArContent.Value = "";          
            uiLabelError.Visible = false;
        }
        #endregion

        
       

       

    }
}