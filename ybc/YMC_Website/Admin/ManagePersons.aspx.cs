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
    public partial class ManagePersons : System.Web.UI.Page
    {
        #region properties
        public YMC.BLL.Persons CurrentPerson
        {
            get
            {
                if (Session["CurrentPerson"] != null)
                    return (YMC.BLL.Persons)Session["CurrentPerson"];
                else
                    return null;
            }
            set
            {
                Session["CurrentPerson"] = value;
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

        protected void uiGridViewPersons_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewPersons.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewPersons_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPerson")
            {
                YMC.BLL.Persons objData = new YMC.BLL.Persons();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentPerson = objData;
                uiTextBoxArTitle.Text = objData.Name;
                uiTextBoxDetails.Text = objData.Details;
                uiImage.ImageUrl = objData.PersonImage;
                uiPanelViewAllPages.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeletePerson")
            {
                YMC.BLL.Persons objData = new YMC.BLL.Persons();
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
            CurrentPerson = null;
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            YMC.BLL.Persons objData = new YMC.BLL.Persons();
            if (CurrentPerson != null)
                objData = CurrentPerson;
            else
            {
                objData.AddNew();
            }
            objData.Name = uiTextBoxArTitle.Text;
            objData.Details = uiTextBoxDetails.Text;
            if (uiFileUploadImage.HasFile)
            {
                uiFileUploadImage.SaveAs(Server.MapPath("~/Userfiles/PersonsImages/") + uiFileUploadImage.FileName);
                objData.PersonImage = "/Userfiles/PersonsImages/" + uiFileUploadImage.FileName;
            }
            objData.Save();
            CurrentPerson = null;
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            BindData();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            Clearfields();
            CurrentPerson = null;
        }

        #endregion

        #region Methods
        private void BindData()
        {
            YMC.BLL.Persons objData = new YMC.BLL.Persons();
            objData.LoadAll();
            objData.Filter = "IsNationalCommitte <> 1 Or IsNationalCommitte is Null";
            uiGridViewPersons.DataSource = objData.DefaultView;
            uiGridViewPersons.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxArTitle.Text = "";
            uiTextBoxDetails.Text = "";            
            uiLabelError.Visible = false;
        }
        #endregion
    }
}