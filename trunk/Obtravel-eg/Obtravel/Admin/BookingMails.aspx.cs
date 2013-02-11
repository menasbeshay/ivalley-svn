using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Obtravel.Admin
{
    public partial class BookingMails : System.Web.UI.Page
    {
        public int CurrentMail
        {
            get
            {
                if (Session["CurrentMail"] != null && !string.IsNullOrEmpty(Session["CurrentMail"].ToString()) && Session["CurrentMail"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentMail"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentMail"] = value;
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
            ds = db.GetAllMails();
            uiGridViewNews.DataSource = ds;
            uiGridViewNews.DataBind();
        }

        protected void uiGridViewNews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editmails")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentMail = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetNewsContent(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    uiTextBoxPosition.Text = ds.Tables[0].Rows[0]["Position"].ToString();
                }
                uiPanelCurrentNews.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "Deletemails")
            {
                DBLayer db = new DBLayer();
                db.DeleteBookingMails(Convert.ToInt32(e.CommandArgument.ToString()));
                BindData();
                uiPanelCurrentNews.Visible = true;
                uiPanelCurrent.Visible = false;
            }
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            
            if (CurrentMail != 0)
            {
                db.SetBookingMails(CurrentMail, uiTextBoxTitle.Text, uiTextBoxPosition.Text);
            }
            else
            {
                db.AddBookingEmails(uiTextBoxTitle.Text, uiTextBoxPosition.Text);
            }

            uiTextBoxTitle.Text = "";
            uiTextBoxPosition.Text = "";
            CurrentMail = 0;
            uiPanelCurrentNews.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelCurrentNews.Visible = true;
            uiPanelCurrent.Visible = false;
            CurrentMail = 0;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiTextBoxTitle.Text = "";
            uiTextBoxPosition.Text = "";
            uiPanelCurrentNews.Visible = false;
            uiPanelCurrent.Visible = true;
        }
    }
}