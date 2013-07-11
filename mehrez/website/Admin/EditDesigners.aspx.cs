using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace website.Admin
{
    public partial class EditDesigners : System.Web.UI.Page
    {
        #region properties
        public int CurrentDesigner
        {
            get
            {
                if (Session["CurrentDesigner"] != null)
                    return (int)Session["CurrentDesigner"];
                else
                    return 0;
            }
            set
            {
                Session["CurrentDesigner"] = value;
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
                uiPanelViewDesigners.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiGridViewDesigners_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewDesigners.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewDesigners_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditDesigner")
            {
                DBLayer db = new DBLayer();
                CurrentDesigner = Convert.ToInt32(e.CommandArgument);
                DataSet ds = db.GetDesignerContent(CurrentDesigner);
                uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                uiTextBoxBrief.Text = ds.Tables[0].Rows[0]["Brief"].ToString();
                uiTextBoxName.Text = ds.Tables[0].Rows[0]["DesignerName"].ToString();
                uiTextBoxContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
                uiPanelViewDesigners.Visible = false;
                uiPanelEdit.Visible = true;

            }
            else if (e.CommandName == "DeleteDesigner")
            {
                DBLayer db = new DBLayer();
                db.DeleteDesigner(Convert.ToInt32(e.CommandArgument));
                CurrentDesigner = 0;
                BindData();

            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = true;
            uiPanelViewDesigners.Visible = false;
            Clearfields();
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentDesigner != 0)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewDesigners.Visible = true;
            Clearfields();
            BindData();
            CurrentDesigner = 0;

        }



        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewDesigners.Visible = true;
            Clearfields();
            CurrentDesigner = 0;
        }



        #endregion
        #region Methods
        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiGridViewDesigners.DataSource = db.GetAllDesigners();
            uiGridViewDesigners.DataBind();
        }

        private void AddNewRecord()
        {
            DBLayer db = new DBLayer();

            string filepath = "";
            if (uiFileUploadMainPicturePath.HasFile)
            {
                uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/Designers/" + uiFileUploadMainPicturePath.FileName));
                filepath = "/UploadedFiles/Designers/" + uiFileUploadMainPicturePath.FileName;
            }
            db.AddDesignerContent(uiTextBoxContent.Text, uiTextBoxTitle.Text, uiTextBoxBrief.Text, uiTextBoxName.Text, filepath);

        }

        private void UpdateRecord()
        {
            DBLayer db = new DBLayer();

            string filepath = "";
            if (uiFileUploadMainPicturePath.HasFile)
            {
                uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/Designers/" + uiFileUploadMainPicturePath.FileName));
                filepath = "/UploadedFiles/Designers/" + uiFileUploadMainPicturePath.FileName;
            }

            db.SetDesignerContent(CurrentDesigner, uiTextBoxContent.Text, uiTextBoxTitle.Text, uiTextBoxBrief.Text, uiTextBoxName.Text, filepath);

        }



        private void Clearfields()
        {
            uiTextBoxTitle.Text = "";
            uiTextBoxContent.Text = "";
            uiTextBoxBrief.Text = "";
            uiTextBoxName.Text = "";
        }

        #endregion
    }
}