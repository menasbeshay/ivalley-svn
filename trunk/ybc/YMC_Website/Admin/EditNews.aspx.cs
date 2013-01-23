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
    public partial class EditNews : System.Web.UI.Page
    {
        #region properties
        public News CurrentNews
        {
            get
            {
                if (Session["CurrentNews"] != null)
                    return (News)Session["CurrentNews"];
                else
                    return null;
            }
            set
            {
                Session["CurrentNews"] = value;
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
                News objData = new News();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentNews = objData;
                uiTextBoxArTitle.Text = objData.Title;
                uiTextBoxCommitee.Text = objData.CommiteeName;
                uiFCKeditorContent.Value = Server.HtmlDecode(objData.Details);
                uiTextBoxBrief.Text = objData.Brief;
                uiPanelViewAllPages.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteNews")
            {
                News objData = new News();
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
            CurrentNews = null;
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            News objData = new News();
            if (CurrentNews != null)
                objData = CurrentNews;
            else
            {
                objData.AddNew();
            }
            objData.Title = uiTextBoxArTitle.Text;
            objData.CommiteeName = uiTextBoxCommitee.Text;
            objData.Details = Server.HtmlEncode(uiFCKeditorContent.Value);
            objData.Brief = uiTextBoxBrief.Text;
            objData.NewsDate = DateTime.Now;
            objData.Save();
            CurrentNews = null;
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            BindData();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            Clearfields();
            CurrentNews = null;
        }

        #endregion

        #region Methods
        private void BindData()
        {
            News objData = new News();
            objData.LoadAll();
            uiGridViewNews.DataSource = objData.DefaultView;
            uiGridViewNews.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxArTitle.Text = "";
            uiTextBoxCommitee.Text = "";
            uiFCKeditorContent.Value = "";
            uiTextBoxBrief.Text = "";
            uiLabelError.Visible = false;
        }
        #endregion
    }
}