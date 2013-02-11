using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditOutStanding : System.Web.UI.Page
    {
        public int CurrentOutStanding
        {
            get
            {
                if (Session["CurrentOutStanding"] != null && !string.IsNullOrEmpty(Session["CurrentOutStanding"].ToString()) && Session["CurrentOutStanding"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentOutStanding"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentOutStanding"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["OutstandingFilePath"];
                
                if (CurrentOutStanding != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetOutstanding(CurrentOutStanding);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["ENName"].ToString();
                        uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                        uiImagePic.ImageUrl = ds.Tables[0].Rows[0]["PicturePath"].ToString();
                        uiTextBoxYear.Text = ds.Tables[0].Rows[0]["Date"].ToString();
                        uiDropDownListClass.SelectedValue = ds.Tables[0].Rows[0]["ClassID"].ToString();
                    }
                    uiPanelCurrentOutStanding.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {
                    uiPanelCurrentOutStanding.Visible = true;
                    uiPanelCurrent.Visible = false;
                    BindData();
                    LoadDDLs();
                }
            }
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer ();
            uiDropDownListClass.DataSource = db.GetAllClass();
            uiDropDownListClass.DataTextField = "ArName";
            uiDropDownListClass.DataValueField = "ClassID";
            uiDropDownListClass.DataBind();
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllOutstanding();
            uiGridViewOutstanding.DataSource = ds;
            uiGridViewOutstanding.DataBind();
        }

        protected void uiGridViewOutstanding_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditOutStanding")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentOutStanding = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetOutstanding(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["ENName"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                    uiImagePic.ImageUrl = ds.Tables[0].Rows[0]["PicturePath"].ToString();
                    uiTextBoxYear.Text = ds.Tables[0].Rows[0]["Date"].ToString();
                    uiDropDownListClass.SelectedValue = ds.Tables[0].Rows[0]["ClassID"].ToString();
                }
                uiPanelCurrentOutStanding.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteOutStanding")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentOutStanding = id;
                DBLayer db = new DBLayer();
                db.DeleteOutstanding(id);
                uiPanelCurrentOutStanding.Visible = true;
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
                uiFileUploadPicture.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["OutstandingFilePath"] + uiFileUploadPicture.FileName));
                filepath = ConfigurationManager.AppSettings["OutstandingFilePath"] + uiFileUploadPicture.FileName;
            }
            ds = db.GetOutstanding(CurrentOutStanding);
            if (ds.Tables[0].Rows.Count > 0)
            {
                temp = ds.Tables[0].Rows[0]["PicturePath"].ToString();
            }
            if (CurrentOutStanding != 0)
            {
                if (temp != filepath && string.IsNullOrEmpty(filepath))
                    db.UpdateOutstanding(CurrentOutStanding, uiTextBoxEnName.Text, uiTextBoxArName.Text, temp, DateTime.Parse(uiTextBoxYear.Text),Convert.ToInt32(uiDropDownListClass.SelectedValue));
                else
                    db.UpdateOutstanding(CurrentOutStanding, uiTextBoxEnName.Text, uiTextBoxArName.Text, filepath, DateTime.Parse(uiTextBoxYear.Text), Convert.ToInt32(uiDropDownListClass.SelectedValue));
            }
            else
            {
                db.AddOutStanding(uiTextBoxEnName.Text, uiTextBoxArName.Text, filepath, DateTime.Parse(uiTextBoxYear.Text), Convert.ToInt32(uiDropDownListClass.SelectedValue));
            }
            CurrentOutStanding = 0;
            uiPanelCurrentOutStanding.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentOutStanding.Visible = false;
            uiPanelCurrent.Visible = true;
        }

        private void ClearFields()
        {
            CurrentOutStanding = 0;
            uiTextBoxArName.Text = "";
            uiTextBoxEnName.Text = "";
            uiImagePic.ImageUrl = "";
            uiTextBoxYear.Text = "";
            uiDropDownListClass.SelectedIndex = -1;

        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentOutStanding.Visible = false;
            uiPanelCurrent.Visible = true;
        }
    }
}