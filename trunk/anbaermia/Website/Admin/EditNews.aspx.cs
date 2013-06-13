using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;
using System.Collections;
namespace Website.Admin
{
    public partial class EditNews : System.Web.UI.Page
    {
        #region properties
        public News CurrentArNews
        {
            get
            {
                if (Session["CurrentArNews"] != null)
                    return (News)Session["CurrentArNews"];
                else
                    return null;
            }
            set
            {
                Session["CurrentArNews"] = value;
            }
        }
        #endregion
        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                BindData();
                populateDDLs();
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
                News objData = new News();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentArNews = objData;
                uiTextBoxArTitle.Text = objData.ArTitle;
                uiTextBoxBrief.Text = objData.Description;
                uiTextBoxDate.Text = objData.PostedDate.ToString("dd/MM/yyyy");
                uiDropDownListHours.SelectedValue = objData.PostedDate.Hour.ToString("00");
                uiDropDownListMins.SelectedValue = objData.PostedDate.Minute.ToString("00");
                uiRadEditorPageContent.Content = Server.HtmlDecode(objData.ArContent);                
                uiPanelViewNews.Visible = false;
                uiPanelEdit.Visible = true;

            }
            else if (e.CommandName == "DeleteNews")
            {
                News objData = new News();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentArNews = null;
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
            if (CurrentArNews != null)
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
            CurrentArNews = null;

        }



        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewNews.Visible = true;            
            Clearfields();
            CurrentArNews = null;
        }


        
        #endregion
        #region Methods
        private void BindData()
        {
            News objData = new News();
            
            objData.LoadAll();
            objData.DefaultView.Sort = "PostedDate Desc";
            uiGridViewNews.DataSource = objData.DefaultView;
            uiGridViewNews.DataBind();
        }

        private void AddNewRecord()
        {
            News objData = new News();
            objData.AddNew();            
            objData.ArTitle = uiTextBoxArTitle.Text;            
            objData.ArContent = Server.HtmlEncode(uiRadEditorPageContent.Content);
            objData.Description = uiTextBoxBrief.Text;               
            if (uiFileUploadMainPicturePath.HasFile)
            {
                uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/News/" + uiFileUploadMainPicturePath.FileName));
                objData.MainImagePath = "/UploadedFiles/News/" + uiFileUploadMainPicturePath.FileName;
            }
            objData.PostedDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
            objData.PostedDate = objData.PostedDate.AddHours(double.Parse(uiDropDownListHours.SelectedValue));
            objData.PostedDate = objData.PostedDate.AddMinutes(double.Parse(uiDropDownListMins.SelectedValue));
            objData.Save();

        }

        private void UpdateRecord()
        {
            News objData = new News();
            objData = CurrentArNews;
            objData.ArTitle = uiTextBoxArTitle.Text;
            objData.ArContent = Server.HtmlEncode(uiRadEditorPageContent.Content);
            objData.Description = uiTextBoxBrief.Text;               
            if (uiFileUploadMainPicturePath.HasFile)
            {
                uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/News/" + uiFileUploadMainPicturePath.FileName));
                objData.MainImagePath = "/UploadedFiles/News/" + uiFileUploadMainPicturePath.FileName;
            }
            objData.PostedDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
            objData.PostedDate = objData.PostedDate.AddHours(double.Parse(uiDropDownListHours.SelectedValue));
            objData.PostedDate = objData.PostedDate.AddMinutes(double.Parse(uiDropDownListMins.SelectedValue));
            objData.Save();
        }

        

        private void Clearfields()
        {
            uiTextBoxArTitle.Text = "";
            uiRadEditorPageContent.Content = "";
            uiTextBoxBrief.Text = "";
            uiTextBoxDate.Text = ""; 
        }

        public void populateDDLs()
        {
            ArrayList Hours = new ArrayList();
            for (int i = 0; i < 24; i++)
            {
                Hours.Add(i.ToString("00"));
            }

            ArrayList Mins = new ArrayList();
            for (int i = 0; i < 60; i++)
            {
                Mins.Add(i.ToString("00"));
            }

            uiDropDownListHours.DataSource = Hours;
            uiDropDownListHours.DataBind();

            uiDropDownListMins.DataSource = Mins;
            uiDropDownListMins.DataBind();
        }
        #endregion
    }
}