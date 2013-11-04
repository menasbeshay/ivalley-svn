using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;
using System.Configuration;

namespace Taqwa.Website.Admin
{
    public partial class EditHonorPanal : System.Web.UI.Page
    {
        public int CurrentHonorPanel
        {
            get
            {
                if (Session["CurrentHonorPanel"] != null && !string.IsNullOrEmpty(Session["CurrentHonorPanel"].ToString()) && Session["CurrentHonorPanel"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentHonorPanel"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentHonorPanel"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["HonorPanelFilePath"];
               
                if (CurrentHonorPanel != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetHonorPanel(CurrentHonorPanel);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["ENName"].ToString();
                        uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                        uiImagePic.ImageUrl = ds.Tables[0].Rows[0]["PicturePath"].ToString();
                        uiFCKeditorEnComment.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ENComments"].ToString());
                        uiFCKeditorArComment.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ARComments"].ToString());
                    }
                    uiPanelCurrentHonorPanel.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {
                    uiPanelCurrentHonorPanel.Visible = true;
                    uiPanelCurrent.Visible = false;
                    BindData();
                }
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllHonorPanel();
            uiGridViewHonorPanel.DataSource = ds;
            uiGridViewHonorPanel.DataBind();
        }

        protected void uiGridViewHonorPanel_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditHonorPanel")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentHonorPanel = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetHonorPanel(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["ENName"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                    uiImagePic.ImageUrl = ds.Tables[0].Rows[0]["PicturePath"].ToString();
                    uiFCKeditorEnComment.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ENComments"].ToString());
                    uiFCKeditorArComment.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ARComments"].ToString());
                }
                uiPanelCurrentHonorPanel.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteNews")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentHonorPanel = id;
                DBLayer db = new DBLayer();
                db.DeleteHonorPanel(id);
                uiPanelCurrentHonorPanel.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            string temp = "";
            string filepath = "";
            DataSet ds = new DataSet(); 
            if (uiFileUploadPicture.HasFile)
            {                               
                uiFileUploadPicture.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["HonorPanelFilePath"] + uiFileUploadPicture.FileName));
                filepath = ConfigurationManager.AppSettings["HonorPanelFilePath"] + uiFileUploadPicture.FileName;                
            }
            ds = db.GetHonorPanel(CurrentHonorPanel);
            if (ds.Tables[0].Rows.Count > 0)
            {
                temp = ds.Tables[0].Rows[0]["PicturePath"].ToString();
            }
            if (CurrentHonorPanel != 0)
            {
                if (temp != filepath && string.IsNullOrEmpty(filepath))
                    db.UpdateHonorPanel(CurrentHonorPanel, uiTextBoxEnName.Text, uiTextBoxArName.Text, temp, Server.HtmlEncode(uiFCKeditorEnComment.Value), Server.HtmlEncode(uiFCKeditorArComment.Value));
                else
                    db.UpdateHonorPanel(CurrentHonorPanel, uiTextBoxEnName.Text, uiTextBoxArName.Text, filepath, Server.HtmlEncode(uiFCKeditorEnComment.Value), Server.HtmlEncode(uiFCKeditorArComment.Value));
            }
            else
            {
                db.AddHonorPanel(uiTextBoxEnName.Text, uiTextBoxArName.Text, filepath, Server.HtmlEncode(uiFCKeditorEnComment.Value), Server.HtmlEncode(uiFCKeditorArComment.Value));
            }
            CurrentHonorPanel = 0;
            uiPanelCurrentHonorPanel.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentHonorPanel.Visible = false;
            uiPanelCurrent.Visible = true;
        }

        private void ClearFields()
        {
            CurrentHonorPanel = 0;
            uiTextBoxArName.Text = "";
            uiTextBoxEnName.Text = "";
            uiImagePic.ImageUrl = "";
            uiFCKeditorEnComment.Value = "";
            uiFCKeditorArComment.Value = "";
            
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentHonorPanel.Visible = true;
            uiPanelCurrent.Visible = false;
        }
    }
}