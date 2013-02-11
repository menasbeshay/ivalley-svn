using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace Obtravel.Admin
{
    public partial class EditPageContent : System.Web.UI.Page
    {
        public int CurrentPage
        {
            get
            {
                if (!string.IsNullOrEmpty(Session["CurrentPage"].ToString()) && Session["CurrentPage"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentPage"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentPage"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                if (CurrentPage != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetPageContent(CurrentPage);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                        uiFCKeditorContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
                    }
                    uiPanelCurrentPages.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {
                    Response.Redirect("AdminCP.aspx");
                }
                
                
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetPages();
            uiGridViewPages.DataSource = ds;
            uiGridViewPages.DataBind();
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            db.SetEnglishPageContent(CurrentPage, Server.HtmlEncode(uiFCKeditorContent.Value), "");
            db.SetEnglishPageTitle(CurrentPage, uiTextBoxTitle.Text);
            uiTextBoxTitle.Text = "";
            uiFCKeditorContent.Value = "";
            CurrentPage = 0;
           // uiPanelCurrentPages.Visible = true;
           // uiPanelCurrent.Visible = false;
           // BindData();
            Response.Redirect("AdminCP.aspx");
            
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            //uiPanelCurrentPages.Visible = true;
            //uiPanelCurrent.Visible = false;
            Response.Redirect("AdminCP.aspx");
        }

        protected void uiGridViewPages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPage")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentPage = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetPageContent(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                    uiFCKeditorContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
                }
                uiPanelCurrentPages.Visible = false;
                uiPanelCurrent.Visible = true;
            }
        }
    }
}