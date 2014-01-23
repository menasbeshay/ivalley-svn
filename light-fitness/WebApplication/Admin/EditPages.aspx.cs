using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace WebApplication.Admin
{
    public partial class EditPages : System.Web.UI.Page
    {
        public int CurrentPage
        {
            get
            {
                if (Session["CurrentPage"] != null)
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
                    Response.Redirect("login.aspx");
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
                    BindData();
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

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            db.SetPageContent(CurrentPage, Server.HtmlEncode(uiFCKeditorContent.Value), uiTextBoxTitle.Text);
            uiTextBoxTitle.Text = "";
            uiFCKeditorContent.Value = "";
            CurrentPage = 0;
            uiPanelCurrentPages.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelCurrentPages.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
            ClearFields();
        }

        private void ClearFields()
        {
            uiTextBoxTitle.Text = "";
            uiFCKeditorContent.Value = "";
            CurrentPage = 0;
        }
    }
}