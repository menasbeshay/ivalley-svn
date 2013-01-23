using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;
using System.Configuration;

namespace YMC_Website.Admin
{
    public partial class MaangeRequests : System.Web.UI.Page
    {
        #region properties
        public UserRequests CurrentRequest
        {
            get
            {
                if (Session["CurrentRequest_Admin"] != null)
                    return (UserRequests)Session["CurrentRequest_Admin"];
                else
                    return null;
            }
            set
            {
                Session["CurrentRequest_Admin"] = value;
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

        protected void uiGridViewNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewNews.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewNews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditNews")
            {
                UserRequests objData = new UserRequests();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentRequest = objData;
                uiTextBoxArTitle.Text = objData.RequestTitle;
                uiHyperLinkFile.Visible = true;
                if (!string.IsNullOrEmpty(objData.RequestFile))
                    uiHyperLinkFile.NavigateUrl = objData.RequestFile;
                else
                    uiHyperLinkFile.Visible = false;
                uiFCKeditorContent.Value = Server.HtmlDecode(objData.RequestDetails);
                uiFckeditorReply.Value = Server.HtmlDecode(objData.AdminResponse);                
                uiPanelViewAllPages.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteNews")
            {
                UserRequests objData = new UserRequests();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelViewAllPages.Visible = false;
            uiPanelEdit.Visible = true;
            Clearfields();
            CurrentRequest = null;
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            UserRequests objData = new UserRequests();
            if (CurrentRequest != null)
                objData = CurrentRequest;
            if (!string.IsNullOrEmpty(uiFckeditorReply.Value))
            {
                objData.AdminResponse = Server.HtmlEncode(uiFckeditorReply.Value);
                objData.IsAnswered = true;
            }
            objData.Save();
            CurrentRequest = null;
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            BindData();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            Clearfields();
            CurrentRequest = null;
        }
        #endregion
        #region methods
        private void BindData()
        {
            UserRequests objData = new UserRequests();            
            objData.LoadAll();
            uiGridViewNews.DataSource = objData.DefaultView;
            uiGridViewNews.DataBind();
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