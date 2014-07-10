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
    public partial class EditNews : System.Web.UI.Page
    {
        public int CurrentNews
        {
            get
            {
                if (Session["CurrentNews"] != null && !string.IsNullOrEmpty(Session["CurrentNews"].ToString()) && Session["CurrentNews"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentNews"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentNews"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
                
               /* if (CurrentNews != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetNews(CurrentNews);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnNewsTitle.Text = ds.Tables[0].Rows[0]["EnTitle"].ToString();
                        uiTextBoxArNewsTitle.Text = ds.Tables[0].Rows[0]["ArTitle"].ToString();
                        uiFCKeditorEnContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["EnBody"].ToString());
                        uiFCKeditorArContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ArBody"].ToString());
                    }
                    uiPanelCurrentNews.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {*/
                    uiPanelCurrentNews.Visible = true;
                    uiPanelCurrent.Visible = false;
                    BindData();
               // }
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllNews();
            uiGridViewNews.DataSource = ds;
            uiGridViewNews.DataBind();
        }

        protected void uiGridViewNews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditNews")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentNews = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetNews(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnNewsTitle.Text = ds.Tables[0].Rows[0]["EnTitle"].ToString();
                    uiTextBoxArNewsTitle.Text = ds.Tables[0].Rows[0]["ArTitle"].ToString();
                    uiFCKeditorEnContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["EnBody"].ToString());
                    uiFCKeditorArContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ArBody"].ToString());
                }
                uiPanelCurrentNews.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteNews")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentNews = id;
                DBLayer db = new DBLayer();
                db.DeleteNews(id);
                uiPanelCurrentNews.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            string filepath = "";
            if (uiFileUploadImage.HasFile)
            {
                filepath = "/images/news/" + DateTime.Now.ToString("ddMMyyyyhhss_") + uiFileUploadImage.FileName;
                uiFileUploadImage.SaveAs(Server.MapPath("~" + filepath));
            }
            if (CurrentNews != 0)
            {
                db.UpdateNews(CurrentNews, uiTextBoxEnNewsTitle.Text, uiTextBoxArNewsTitle.Text, Server.HtmlEncode(uiFCKeditorEnContent.Value), Server.HtmlEncode(uiFCKeditorArContent.Value),DateTime.ParseExact(uiTextBoxDate.Text,"dd/MM/yyyy", null), filepath);
            }
            else
            {
                db.AddNews(uiTextBoxEnNewsTitle.Text, uiTextBoxArNewsTitle.Text, Server.HtmlEncode(uiFCKeditorEnContent.Value), Server.HtmlEncode(uiFCKeditorArContent.Value), DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null), filepath);
            }
            uiPanelCurrentNews.Visible = true;
            uiPanelCurrent.Visible = false;
            ClearFields();
            BindData();
        }

        protected void uiGridViewNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewNews.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentNews.Visible = false;
            uiPanelCurrent.Visible = true;
        }

        private void ClearFields()
        {
            CurrentNews = 0;
            uiTextBoxArNewsTitle.Text = "";
            uiTextBoxEnNewsTitle.Text = "";
            uiFCKeditorEnContent.Value = "";
            uiFCKeditorArContent.Value = "";
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentNews.Visible = true;
            uiPanelCurrent.Visible = false;
        }


    }
}