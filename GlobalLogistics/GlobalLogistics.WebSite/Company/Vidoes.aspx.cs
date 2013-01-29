using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Company
{
    public partial class Vidoes : System.Web.UI.Page
    {
        #region Properties
        public BLL.Vedios CurrentVedio
        {
            get
            {
                if (Session["CurrentVedio"] != null)
                    return (BLL.Vedios)Session["CurrentVedios"];
                else
                    return null;
            }
            set
            {
                Session["CurrentVedios"] = value;
            }
        }
        #endregion
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {               
                BindData();               
                uiPanelViewVideos.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }
        
        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            CurrentVedio = null;
            uiPanelEdit.Visible = true;
            uiPanelViewVideos.Visible = false;
        }

        protected void uiGridViewVideos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewVideos.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewVideos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditVideo")
            {
                Vedios objData = new Vedios();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnTitle;
                uiTextBoxArName.Text = objData.ArTitle;
                uiTextBoxURL.Text = objData.URL;
                uiPanelViewVideos.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentVedio = objData;
            }
            else if (e.CommandName == "DeleteVideo")
            {                
                Vedios objData = new Vedios();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();

                BindData();
                uiPanelViewVideos.Visible = true;
                uiPanelEdit.Visible = false;            
            }

        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentVedio != null)
            {
                Vedios objData = CurrentVedio;
                objData.ArTitle = uiTextBoxArName.Text;
                objData.EnTitle = uiTextBoxEnName.Text;
                objData.URL = uiTextBoxURL.Text;
                objData.Save();
            }
            else
            {
                Companies objCompany = new Companies();
                objCompany.GetCompanyByUserName(User.Identity.Name);
                Vedios objData = new Vedios();
                objData.AddNew();
                objData.ArTitle = uiTextBoxArName.Text;
                objData.EnTitle = uiTextBoxEnName.Text;
                objData.URL = uiTextBoxURL.Text;
                objData.CompanyID = objCompany.CompanyID;
                objData.CreatedDate = DateTime.Now;
                objData.Save();
            }
            uiPanelEdit.Visible = false;
            uiPanelViewVideos.Visible = true;
            Clearfields();
            CurrentVedio = null;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            CurrentVedio = null;
            uiPanelEdit.Visible = false;
            uiPanelViewVideos.Visible = true;
        }
        #endregion
        #region Method
        private void BindData()
        {
            Vedios objData = new Vedios();
            Companies objCompany = new Companies();
            objCompany.GetCompanyByUserName(User.Identity.Name);
            objData.GetVedioByCompanyID(objCompany.CompanyID);
            uiGridViewVideos.DataSource = objData.DefaultView;
            uiGridViewVideos.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxURL.Text = "";
        }

        #endregion
    }
}
