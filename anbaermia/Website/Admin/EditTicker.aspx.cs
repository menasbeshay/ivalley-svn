using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;
namespace Website.Admin
{
    public partial class EditTicker : System.Web.UI.Page
    {
        public NewsTicker CurrentNews
        {
            get
            {
                return (NewsTicker)(Session["CurrentNews"]);
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
                BindData();
                uiPanelCurrentNews.Visible = true;
                uiPanelCurrent.Visible = false;
                uiPanelEditSettings.Visible = false;
            }
        }

        private void BindData()
        {
            NewsTicker NT = new NewsTicker();
            NT.LoadAll();
            uiGridViewNews.DataSource = NT.DefaultView;
            uiGridViewNews.DataBind();
        }

        protected void uiGridViewNews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditNews")
            {
                NewsTicker objdata = new NewsTicker();
                objdata.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentNews = objdata;                
                uiTextBoxContent.Text = objdata.ArContent;               
                uiPanelCurrentNews.Visible = false;
                uiPanelCurrent.Visible = true;
                uiPanelEditSettings.Visible = false;
            }
            else if (e.CommandName == "DeleteNews")
            {
                NewsTicker objdata = new NewsTicker();
                objdata.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objdata.MarkAsDeleted();
                objdata.Save();
                BindData();
                uiPanelCurrentNews.Visible = true;
                uiPanelCurrent.Visible = false;
                uiPanelEditSettings.Visible = false;
            }
        }

        protected void uiLinkButtonUpdateNews_Click(object sender, EventArgs e)
        {
            if (CurrentNews != null)
            {
                CurrentNews.ArContent = uiTextBoxContent.Text;
                CurrentNews.PostedDate = DateTime.Now;
                CurrentNews.Save();
            }
            else
            {
                NewsTicker objdata = new NewsTicker();
                objdata.AddNew();
                objdata.ArContent = uiTextBoxContent.Text;
                objdata.PostedDate = DateTime.Now;
                objdata.Save();
            }
            uiTextBoxContent.Text = "";            
            CurrentNews = null;
            uiPanelCurrentNews.Visible = true;
            uiPanelCurrent.Visible = false;
            uiPanelEditSettings.Visible = false;
            BindData();
        }

        protected void uiLinkButtonCancelNews_Click(object sender, EventArgs e)
        {
            uiPanelCurrentNews.Visible = true;
            uiPanelCurrent.Visible = false;
            uiPanelEditSettings.Visible = false;
            CurrentNews = null;
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelCurrentNews.Visible = false;
            uiPanelCurrent.Visible = true;
            uiPanelEditSettings.Visible = false;
            CurrentNews = null;
            uiTextBoxContent.Text = "";   
        }

        protected void uiLinkButtonSettings_Click(object sender, EventArgs e)
        {
            uiPanelCurrentNews.Visible = false;
            uiPanelCurrent.Visible = false;
            uiPanelEditSettings.Visible = true;
            GeneralSettings GS = new GeneralSettings();
            GS.LoadByPrimaryKey(1);
            uiTextBoxNewsNo.Text = GS.Value;
        }

        protected void uiLinkButtonUpdateSettings_Click(object sender, EventArgs e)
        {
            GeneralSettings GS = new GeneralSettings();
            GS.LoadByPrimaryKey(1);
            GS.Value = uiTextBoxNewsNo.Text;
            GS.Save();
            uiPanelCurrentNews.Visible = true;
            uiPanelCurrent.Visible = false;
            uiPanelEditSettings.Visible = false;
            uiTextBoxNewsNo.Text = "";
        }

        protected void uiLinkButtonCancelSettings_Click(object sender, EventArgs e)
        {
            uiPanelCurrentNews.Visible = true;
            uiPanelCurrent.Visible = false;
            uiPanelEditSettings.Visible = false;
            uiTextBoxNewsNo.Text = "";
        }

       
    }
}