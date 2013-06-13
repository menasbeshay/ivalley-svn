using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;

namespace Website.Admin
{
    public partial class EditQuotes : System.Web.UI.Page
    {
        #region Properties
        public Quotes CurrentQuote
        {
            get
            {   
                if (Session["CurrentQuote"] != null)
                    return (Quotes)Session["CurrentQuote"];
                else
                    return null;
            }
            set
            {
                Session["CurrentQuote"] = value;
            }
        }

        #endregion


        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                uiPanelEdit.Visible = false;
                uiPanelViewQuotes.Visible = true;
                LoadQuotes();
            }
        }

        protected void uiGridViewQuotes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewQuotes.PageIndex = e.NewPageIndex;
            LoadQuotes();
        }

        protected void uiGridViewQuotes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditQuotes")
            {
                Quotes objData = new Quotes();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiRadEditorPageContent.Content = Server.HtmlDecode(objData.ArContent);
                uiTextBoxDate.Text = objData.PostedDate.ToString("dd/MM/yyyy");
                uiPanelViewQuotes.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentQuote = objData;
            }
            else if (e.CommandName == "DeleteQuotes")
            {
                Quotes objData = new Quotes();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                LoadQuotes();
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = true;
            uiPanelViewQuotes.Visible = false;
            uiRadEditorPageContent.Content = "";
            uiTextBoxDate.Text = "";
        }

        protected void uiLinkButtonUpdateReadings_Click(object sender, EventArgs e)
        {
            if (CurrentQuote != null)
            {
                CurrentQuote.ArContent = Server.HtmlEncode(uiRadEditorPageContent.Content);
                CurrentQuote.PostedDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
                if (uiFileUploadMainPicturePath.HasFile)
                {
                    uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/Images/" + uiFileUploadMainPicturePath.FileName));
                    CurrentQuote.ImageURL = "/UploadedFiles/Images/" + uiFileUploadMainPicturePath.FileName;
                }
                CurrentQuote.Save();
            }
            else
            {
                Quotes objData = new Quotes();
                objData.AddNew();
                objData.ArContent = Server.HtmlEncode(uiRadEditorPageContent.Content);
                objData.PostedDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
                if (uiFileUploadMainPicturePath.HasFile)
                {
                    uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/Images/" + uiFileUploadMainPicturePath.FileName));
                    objData.ImageURL = "/UploadedFiles/Images/" + uiFileUploadMainPicturePath.FileName;
                }
                objData.Save();
            }
            uiPanelEdit.Visible = false;
            uiPanelViewQuotes.Visible = true;
            uiRadEditorPageContent.Content = "";
            uiTextBoxDate.Text = "";
            LoadQuotes();
        }

        protected void uiLinkButtonCancelReadings_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewQuotes.Visible = true;
            uiRadEditorPageContent.Content = "";
            uiTextBoxDate.Text = "";
            CurrentQuote = null;
        }

        #endregion


        #region Methods

        private void LoadQuotes()
        {
            Quotes read = new Quotes();
            read.Query.AddOrderBy(Ermia_BLL.Quotes.ColumnNames.PostedDate, MyGeneration.dOOdads.WhereParameter.Dir.DESC);
            read.Query.Load();
            uiGridViewQuotes.DataSource = read.DefaultView;
            uiGridViewQuotes.DataBind();
        }
        #endregion
    }
}