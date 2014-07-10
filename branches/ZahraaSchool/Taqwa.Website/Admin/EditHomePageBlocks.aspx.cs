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
    public partial class EditHomePageBlocks : System.Web.UI.Page
    {
        public int CurrentBlock
        {
            get
            {
                if (Session["CurrentBlock"] != null && !string.IsNullOrEmpty(Session["CurrentBlock"].ToString()) && Session["CurrentBlock"].ToString() != "0")
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
                Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
                
              /*  if (CurrentBlock != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetHomePageBlock(CurrentBlock);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnBlockTitle.Text = ds.Tables[0].Rows[0]["ENBlockTitle"].ToString();
                        uiTextBoxArBlockTitle.Text = ds.Tables[0].Rows[0]["ArBlockTitle"].ToString();
                        uiFCKeditorEnContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ENBlockContent"].ToString());
                        uiFCKeditorArContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ARBlockContent"].ToString());
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
            ds = db.GetAllHomePageBlocks();
            uiGridViewHomePageBlocks.DataSource = ds;
            uiGridViewHomePageBlocks.DataBind();
        }

        protected void uiGridViewHomePageBlocks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditHomePageBlock")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentBlock = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetHomePageBlock(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnBlockTitle.Text = ds.Tables[0].Rows[0]["ENBlockTitle"].ToString();
                    uiTextBoxArBlockTitle.Text = ds.Tables[0].Rows[0]["ArBlockTitle"].ToString();
                    uiFCKeditorEnContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ENBlockContent"].ToString());
                    uiFCKeditorArContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ARBlockContent"].ToString());
                }
                uiPanelCurrentPages.Visible = false;
                uiPanelCurrent.Visible = true;
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            db.UpdateHomePageBlock(CurrentBlock, uiTextBoxEnBlockTitle.Text, uiTextBoxArBlockTitle.Text, Server.HtmlEncode(uiFCKeditorEnContent.Value), Server.HtmlEncode(uiFCKeditorArContent.Value));
            CurrentBlock = 0;
            uiPanelCurrentPages.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentBlock = 0;
            uiPanelCurrentPages.Visible = true;
            uiPanelCurrent.Visible = false;
        }
    }
}