using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;
namespace Website.Admin
{
    public partial class EditReadings : System.Web.UI.Page
    {
        #region Properties
        public Readings CurrentRead
        {
            get
            {
                if (Session["CurrentRead"] != null)
                    return (Readings)Session["CurrentRead"];
                else
                    return null;
            }
            set
            {
                Session["CurrentRead"] = value;
            }
        }

        #endregion


        #region Events
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                uiPanelCurrent.Visible = false;
                uiPanelAllReadings.Visible = true;
                LoadReadings();
            }
        }

        protected void uiGridViewReadings_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewReadings.PageIndex = e.NewPageIndex;
            LoadReadings();
        }

        protected void uiGridViewReadings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRead")
            {
                Readings objData = new Readings();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiRadEditorPageContent.Content = Server.HtmlDecode(objData.ArContent);
                uiTextBoxDate.Text = objData.ViewDate.ToString("dd/MM/yyyy");                
                uiPanelAllReadings.Visible = false;
                uiPanelCurrent.Visible = true;
                CurrentRead = objData;
            }
            else if (e.CommandName == "DeleteRead")
            {
                Readings objData = new Readings();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                LoadReadings();
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelCurrent.Visible = true;
            uiPanelAllReadings.Visible = false;
            uiRadEditorPageContent.Content = "";
            uiTextBoxDate.Text = "";
        }

        protected void uiLinkButtonUpdateReadings_Click(object sender, EventArgs e)
        {
            if (CurrentRead != null)
            {
                CurrentRead.ArContent = Server.HtmlEncode(uiRadEditorPageContent.Content);
                CurrentRead.ViewDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
                CurrentRead.ReadingsType = 2;
                CurrentRead.Save();
            }
            else
            {
                Readings objData = new Readings();
                objData.AddNew();
                objData.ArContent = Server.HtmlEncode(uiRadEditorPageContent.Content);
                objData.ViewDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
                objData.ReadingsType = 2;
                objData.Save();
            }
            uiPanelCurrent.Visible = false;
            uiPanelAllReadings.Visible = true;
            uiRadEditorPageContent.Content = "";
            uiTextBoxDate.Text = "";
            LoadReadings();
        }

        protected void uiLinkButtonCancelReadings_Click(object sender, EventArgs e)
        {
            uiPanelCurrent.Visible = false;
            uiPanelAllReadings.Visible = true;
            uiRadEditorPageContent.Content = "";
            uiTextBoxDate.Text = "";
            CurrentRead = null;
        }

        #endregion
        
        
        #region Methods
        
        private void LoadReadings()
        {
            Readings read = new Readings();
            read.GetReadingsByTypeID(2);
            uiGridViewReadings.DataSource = read.DefaultView;
            uiGridViewReadings.DataBind();
        }
        #endregion

    }
}