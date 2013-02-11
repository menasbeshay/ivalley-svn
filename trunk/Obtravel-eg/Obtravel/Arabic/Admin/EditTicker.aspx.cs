using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Obtravel.Arabic.Admin
{
    public partial class EditTicker : System.Web.UI.Page
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
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                BindData();
                uiPanelCurrentNews.Visible = true;
                uiPanelCurrent.Visible = false;
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
                ds = db.GetNewsContent(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["arContent"].ToString();
                    uiTextBoxOrder.Text = ds.Tables[0].Rows[0]["arOrder"].ToString();
                }
                uiPanelCurrentNews.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteNews")
            {
                DBLayer db = new DBLayer();
                db.DeleteNews(Convert.ToInt32(e.CommandArgument.ToString()));
                BindData();
                uiPanelCurrentNews.Visible = true;
                uiPanelCurrent.Visible = false;
            }
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            int order = 0;
            if (!string.IsNullOrEmpty(uiTextBoxOrder.Text))
            {
                int.TryParse(uiTextBoxOrder.Text, out order);
            }
            if (CurrentNews != 0)
            {
                db.SetArabicNewsContent(CurrentNews, uiTextBoxTitle.Text, order);
            }
            else
            {
                db.AddArabicNewsContent(uiTextBoxTitle.Text, order);
            }

            uiTextBoxTitle.Text = "";
            uiTextBoxOrder.Text = "";
            CurrentNews = 0;
            uiPanelCurrentNews.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelCurrentNews.Visible = true;
            uiPanelCurrent.Visible = false;
            CurrentNews = 0;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiTextBoxTitle.Text = "";
            uiTextBoxOrder.Text = "";
            uiPanelCurrentNews.Visible = false;
            uiPanelCurrent.Visible = true;
        }
    }
}