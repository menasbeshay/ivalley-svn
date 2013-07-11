using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace website.Admin
{
    public partial class EditPages : System.Web.UI.Page
    {
        #region properties
        public int CurrentPage
        {
            get
            {
                if (Session["CurrentPage"] != null)
                    return (int)Session["CurrentPage"];
                else
                    return 0;
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
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("Login.aspx");
                }    
                BindData();
                uiPanelViewPages.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }


        protected void uiGridViewPages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewPages.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewPages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPages")
            {
                DBLayer db = new DBLayer();
                CurrentPage = Convert.ToInt32(e.CommandArgument);
                DataSet ds = db.GetPageContent(CurrentPage);
                uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();                                
                uiTextBoxContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
                uiPanelViewPages.Visible = false;
                uiPanelEdit.Visible = true;

            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentPage != 0)
            {
                UpdateRecord();
            }
            

            uiPanelEdit.Visible = false;
            uiPanelViewPages.Visible = true;
            Clearfields();
            BindData();
            CurrentPage = 0;
        }


        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewPages.Visible = true;
            Clearfields();
            CurrentPage = 0;
        }

        #endregion

        #region Methods

        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiGridViewPages.DataSource = db.GetPages();
            uiGridViewPages.DataBind();
        }


        private void Clearfields()
        {
            uiTextBoxContent.Text = "";
            uiTextBoxTitle.Text = "";            
        }

        private void UpdateRecord()
        {
            DBLayer db = new DBLayer();

            string filepath = "";
            if (uiFileUploadMainPicturePath.HasFile)
            {
                uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/Pages/" + uiFileUploadMainPicturePath.FileName));
                filepath = "/UploadedFiles/Pages/" + uiFileUploadMainPicturePath.FileName;
            }
            string content = Server.HtmlEncode( uiTextBoxContent.Text);

            db.SetPageContent(CurrentPage, content, filepath);

        }
        #endregion

    }
}