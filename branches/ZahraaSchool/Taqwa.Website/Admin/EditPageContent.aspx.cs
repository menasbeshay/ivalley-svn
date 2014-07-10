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
    public partial class EditPageContent : System.Web.UI.Page
    {
        public int CurrentPage
        {
            get
            {
                if ( Session["CurrentPage"]!= null && !string.IsNullOrEmpty(Session["CurrentPage"].ToString()) && Session["CurrentPage"].ToString() != "0")
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
                
              /*  if (CurrentPage != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetPage(CurrentPage);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnPageTitle.Text = ds.Tables[0].Rows[0]["EnPageTitle"].ToString();
                        uiTextBoxArPageTitle.Text = ds.Tables[0].Rows[0]["ArPageTitle"].ToString();
                        uiFCKeditorEnContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["EnPageContent"].ToString());
                        uiFCKeditorArContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ArPageContent"].ToString());
                    }
                    uiPanelCurrentPages.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {*/
                    uiPanelCurrentPages.Visible = true;
                    uiPanelCurrent.Visible = false;
                    BindData();
               // }
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
                ds = db.GetPage(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnPageTitle.Text = ds.Tables[0].Rows[0]["EnPageTitle"].ToString();
                    uiTextBoxArPageTitle.Text = ds.Tables[0].Rows[0]["ArPageTitle"].ToString();
                    uiFCKeditorEnContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["EnPageContent"].ToString());
                    uiFCKeditorArContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ArPageContent"].ToString());
                }
                uiPanelCurrentPages.Visible = false;
                uiPanelCurrent.Visible = true;
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            db.UpdatePage(CurrentPage, uiTextBoxEnPageTitle.Text, uiTextBoxArPageTitle.Text, Server.HtmlEncode(uiFCKeditorEnContent.Value), Server.HtmlEncode(uiFCKeditorArContent.Value));
            CurrentPage = 0;
            uiPanelCurrentPages.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            uiPanelCurrentPages.Visible = true;
            uiPanelCurrent.Visible = false;
        }
    }
}
