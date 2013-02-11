using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace Obtravel.Arabic.Admin
{
    public partial class EditHomeBlocks : System.Web.UI.Page
    {
        public int CurrentBlock
        {
            get
            {
                if (!string.IsNullOrEmpty(Session["CurrentBlock"].ToString()) && Session["CurrentBlock"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentBlock"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentBlock"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                BindData();
                Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
                uiPanelCurrentBlocks.Visible = true;
                uiPanelCurrent.Visible = false;
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetBlocks();
            uiGridViewBlocks.DataSource = ds;
            uiGridViewBlocks.DataBind();
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            string imagepath = "";
            if (uiFileUploadImage.HasFile)
            {
                uiFileUploadImage.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["UserFilePath"] + "UploadedImages/" + uiFileUploadImage.FileName));
                imagepath = ConfigurationManager.AppSettings["UserFilePath"] + "UploadedImages/" + uiFileUploadImage.FileName;
            }
            DataSet ds = new DataSet();
            ds = db.GetBlockContent(CurrentBlock);
            string temp = ds.Tables[0].Rows[0]["arImagepath"].ToString();
            if (temp != imagepath && string.IsNullOrEmpty(imagepath))
                db.SetArabicBlockContent(CurrentBlock, Server.HtmlEncode(uiFCKeditor.Value), uiTextBoxTitle.Text, temp);
            else
                db.SetArabicBlockContent(CurrentBlock, Server.HtmlEncode(uiFCKeditor.Value), uiTextBoxTitle.Text, imagepath);

            uiTextBoxTitle.Text = "";
            uiFCKeditor.Value = "";
            CurrentBlock = 0;
            uiPanelCurrentBlocks.Visible = true;
            uiPanelCurrent.Visible = false;


        }

        protected void uiGridViewBlocks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditBlock")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentBlock = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetBlockContent(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["arTitle"].ToString();
                    uiFCKeditor.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["arBrief"].ToString());
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["arImagepath"].ToString()))
                    {
                        uiImageCurrent.ImageUrl = ds.Tables[0].Rows[0]["arImagepath"].ToString();
                        uiImageCurrent.Visible = true;
                    }
                    else
                    {
                        uiImageCurrent.Visible = false;
                    }
                }
                uiPanelCurrentBlocks.Visible = false;
                uiPanelCurrent.Visible = true;
            }
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelCurrentBlocks.Visible = true;
            uiPanelCurrent.Visible = false;
        }
    }
}