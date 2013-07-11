using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using website;
using System.Data;
namespace website.Admin
{
    public partial class EditNews : System.Web.UI.Page
    {
        #region properties
        public int CurrentNews
        {
            get
            {
                if (Session["CurrentNews"] != null)
                    return (int)Session["CurrentNews"];
                else
                    return 0;
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
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("Login.aspx");
                }    
                BindData();                
                uiPanelViewNews.Visible = true;
                uiPanelEdit.Visible = false;
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
                DBLayer db = new DBLayer();
                CurrentNews = Convert.ToInt32(e.CommandArgument);
                DataSet ds = db.GetNewsContent(CurrentNews);
                uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                uiTextBoxBrief.Text = ds.Tables[0].Rows[0]["Brief"].ToString();
                uiTextBoxDate.Text = string.Format("{0:dd/MM/yyyy}",ds.Tables[0].Rows[0]["NewsDate"]);
                uiTextBoxContent.Text = ds.Tables[0].Rows[0]["Content"].ToString();
                uiPanelViewNews.Visible = false;
                uiPanelEdit.Visible = true;

            }
            else if (e.CommandName == "DeleteNews")
            {
                DBLayer db = new DBLayer();
                db.DeleteNews(Convert.ToInt32(e.CommandArgument));
                CurrentNews = 0;
                BindData();

            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = true;
            uiPanelViewNews.Visible = false;
            Clearfields();
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentNews != 0)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewNews.Visible = true;
            Clearfields();
            BindData();
            CurrentNews = 0;

        }



        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewNews.Visible = true;
            Clearfields();
            CurrentNews = 0;
        }



        #endregion
        #region Methods
        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiGridViewNews.DataSource = db.GetAllNews();
            uiGridViewNews.DataBind();
        }

        private void AddNewRecord()
        {
            DBLayer db = new DBLayer();
            
            string filepath = "";
            if (uiFileUploadMainPicturePath.HasFile)
            {
                uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/News/" + uiFileUploadMainPicturePath.FileName));
                filepath = "/UploadedFiles/News/" + uiFileUploadMainPicturePath.FileName;
            }
            db.AddNewsContent(uiTextBoxContent.Text, uiTextBoxTitle.Text, uiTextBoxBrief.Text, DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null), filepath);

        }

        private void UpdateRecord()
        {
            DBLayer db = new DBLayer();

            string filepath = "";
            if (uiFileUploadMainPicturePath.HasFile)
            {
                uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/News/" + uiFileUploadMainPicturePath.FileName));
                filepath = "/UploadedFiles/News/" + uiFileUploadMainPicturePath.FileName;
            }

            db.SetNewsContent(CurrentNews, uiTextBoxContent.Text, uiTextBoxTitle.Text, uiTextBoxBrief.Text, DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null), filepath);

        }



        private void Clearfields()
        {
            uiTextBoxTitle.Text = "";
            uiTextBoxContent.Text = "";
            uiTextBoxBrief.Text = "";
            uiTextBoxDate.Text = "";
        }

        #endregion
    }
}