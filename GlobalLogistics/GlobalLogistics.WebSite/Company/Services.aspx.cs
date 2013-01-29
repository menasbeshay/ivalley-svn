using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Company
{
    public partial class Services : System.Web.UI.Page
    {
        #region properties
        public BLL.Services CurrentServices
        {
            get
            {
                if (Session["CurrentServices"] != null)
                    return (BLL.Services)Session["CurrentServices"];
                else
                    return null;
            }
            set
            {
                Session["CurrentServices"] = value;
            }
        }
        #endregion
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                BindData();
                uiPanelViewServices.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            CurrentServices = null;
            uiPanelEdit.Visible = true;
            uiPanelViewServices.Visible = false;                       
        }

        protected void uiDropDownListAllServiceType_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

        protected void uiGridViewServices_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewServices.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewServices_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditService")
            {
                BLL.Services objData = new BLL.Services();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnName;
                uiTextBoxArName.Text = objData.ArName;
                uiFCKeditorEnDesc.Value = Server.HtmlDecode(objData.EnDescription);
                uiFCKeditorArDesc.Value = Server.HtmlDecode(objData.ArDescription);
                uiPanelViewServices.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentServices = objData;
            }
            else if (e.CommandName == "DeleteService")
            {
                BLL.Services objData = new BLL.Services();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentServices != null)
            {
                BLL.Services objData = CurrentServices;
                objData.EnName = uiTextBoxEnName.Text;
                objData.ArName = uiTextBoxArName.Text;
                objData.EnDescription = Server.HtmlEncode(uiFCKeditorEnDesc.Value);
                objData.ArDescription = Server.HtmlEncode(uiFCKeditorArDesc.Value);
                objData.Save();
            }
            else
            {
                Companies objCompany = new Companies();
                objCompany.GetCompanyByUserName(User.Identity.Name);

                BLL.Services objData = new BLL.Services();
                objData.AddNew();
                objData.CompanyID = objCompany.CompanyID;
                objData.EnName = uiTextBoxEnName.Text;
                objData.ArName = uiTextBoxArName.Text;
                objData.EnDescription = Server.HtmlEncode(uiFCKeditorEnDesc.Value);
                objData.ArDescription = Server.HtmlEncode(uiFCKeditorArDesc.Value);
                objData.TypeID = Convert.ToInt32(uiDropDownListAllServiceType.SelectedValue);
                objData.CreatedDate = DateTime.Now;
                objData.Save();
            }
            uiPanelEdit.Visible = false;
            uiPanelViewServices.Visible = true;
            Clearfields();
            CurrentServices = null;
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewServices.Visible = true;
            Clearfields();
            CurrentServices = null;
        }
        #endregion
        #region Methods

        private void BindData()
        {
            BLL.Services objData = new BLL.Services();            
            Companies objCompany = new Companies();
            objCompany.GetCompanyByUserName(User.Identity.Name);

            objData.GetServicesByCompanyIDAndTypeID(objCompany.CompanyID, string.IsNullOrEmpty(uiDropDownListAllServiceType.SelectedValue) ? 0 : Convert.ToInt32(uiDropDownListAllServiceType.SelectedValue));
            uiGridViewServices.DataSource = objData.DefaultView;
            uiGridViewServices.DataBind();
        }

        private void LoadDDLs()
        {
            ServiceTypes types = new ServiceTypes();
            types.LoadAll();
            Companies objCompany = new Companies();
            objCompany.GetCompanyByUserName(User.Identity.Name);

            CompanyEnabledOptions options = new CompanyEnabledOptions();
            options.GetCompanyEnabledOptionsByCompanyID(objCompany.CompanyID);
            string filter =" ServiceTypeID in ( ";             
            for (int i = 0; i < options.RowCount; i++)
            {
                if ((options.PackageOptionID == 11 || options.PackageOptionID == 12 || options.PackageOptionID == 13 || options.PackageOptionID == 14))
                {
                    if (options.Enabled && options.PackageOptionID == 11)
                        filter += " 1 , ";
                    else if (options.Enabled && options.PackageOptionID == 12)
                        filter += " 6 , ";
                    else if (options.Enabled && options.PackageOptionID == 13)
                        filter += " 3 , ";
                    else if (options.Enabled && options.PackageOptionID == 14)
                        filter += " 7 , ";
                }
                options.MoveNext();
            }

            filter = filter.Substring(0, filter.LastIndexOf(",") - 1);
            filter += ")";
            types.Filter = filter;
            uiDropDownListAllServiceType.DataSource = types.DefaultView;
            uiDropDownListAllServiceType.DataTextField = "ArName";
            uiDropDownListAllServiceType.DataValueField = "ServiceTypeID";
            uiDropDownListAllServiceType.DataBind();
            uiDropDownListAllServiceType.SelectedIndex = 0;

        }

        private void Clearfields()
        {
            uiTextBoxArName.Text = "";
            uiTextBoxEnName.Text = "";
            uiFCKeditorArDesc.Value= "";
            uiFCKeditorEnDesc.Value = "";
        }

        #endregion


    }
}