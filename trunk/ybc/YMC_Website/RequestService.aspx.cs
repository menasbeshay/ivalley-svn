using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;
using System.Configuration;

namespace YMC_Website
{
    public partial class RequestService1 : System.Web.UI.Page
    {
        #region properties
        public UserRequests CurrentRequest
        {
            get
            {
                if (Session["CurrentRequest"] != null)
                    return (UserRequests)Session["CurrentRequest"];
                else
                    return null;
            }
            set
            {
                Session["CurrentRequest"] = value;
            }
        }


        public SiteUsers CurrentUser
        {
            get
            {
                if (Session["CurrentUser"] != null)
                    return (SiteUsers)Session["CurrentUser"];
                else
                    return null;
            }
            set
            {
                Session["CurrentUser"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    BindData();
                    uiPanelViewAllPages.Visible = true;
                    uiPanelEdit.Visible = false;
                    Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
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
                uiFCKeditorContent.Value = Server.HtmlDecode(objData.RequestDetails);
                uiLiteralReply.Text = Server.HtmlDecode(objData.AdminResponse);
                if (string.IsNullOrEmpty(objData.AdminResponse))
                    uiLiteralReply.Text = "لم يتم الرد. برجاء التحقق بعد فترة";
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
            else
            {
                objData.AddNew();
            }
            objData.RequestTitle = uiTextBoxArTitle.Text;
            objData.RequestDetails = Server.HtmlEncode(uiFCKeditorContent.Value);
            if (uiFileUploadRequest.HasFile)
            {
                uiFileUploadRequest.SaveAs(Server.MapPath("~/Userfiles/UserRequests/") + uiFileUploadRequest.FileName);
                objData.RequestFile = "/Userfiles/UserRequests/" + uiFileUploadRequest.FileName;
            }
            objData.SiteUserID = CurrentUser.ID;
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

        #region Methods
        private void BindData()
        {
            UserRequests objData = new UserRequests();
            SiteUsers user = new SiteUsers();
            user = (SiteUsers)Session["CurrentUser"];
            objData.GetRequesetsByUserID(user.ID);
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