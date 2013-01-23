using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;
using System.Configuration;
namespace YMC_Website.Admin
{
    public partial class EditDepartments : System.Web.UI.Page
    {
        #region properties
        public Departements CurrentDepartment
        {
            get
            {
                if (Session["CurrentDepartment"] != null)
                    return (Departements)Session["CurrentDepartment"];
                else
                    return null;
            }
            set
            {
                Session["CurrentDepartment"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
        }

        protected void uiGridViewDepartments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewDepartments.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewDepartments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditDepartment")
            {
                Departements objData = new Departements();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentDepartment = objData;
                uiTextBoxArTitle.Text = objData.Name;
                uiFCKeditorContent.Value = Server.HtmlDecode(objData.DetailsArabic);
                uiPanelViewAllPages.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteDepartment")
            {
                Departements objData = new Departements();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelViewAllPages.Visible = false;
            uiPanelEdit.Visible = true;
            Clearfields();
            CurrentDepartment = null;
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            Departements objData = new Departements();
            if (CurrentDepartment != null)
                objData = CurrentDepartment;
            else
            {
                objData.AddNew();
            }
            objData.Name = uiTextBoxArTitle.Text;
            objData.DetailsArabic = Server.HtmlEncode(uiFCKeditorContent.Value);
            objData.Save();
            CurrentDepartment = null;
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            BindData();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            Clearfields();
            CurrentDepartment = null;
        }

        #endregion

        #region Methods
        private void BindData()
        {
            Departements objData = new Departements();
            objData.LoadAll();
            uiGridViewDepartments.DataSource = objData.DefaultView;
            uiGridViewDepartments.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxArTitle.Text = "";
            uiFCKeditorContent.Value = "";
            uiLabelError.Visible = false;
        }
        #endregion

       
    }
}