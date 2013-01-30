using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditPackageOptions : System.Web.UI.Page
    {
        #region properties
        public BLL.PackageOptions CurrentPackageOptions
        {
            get
            {
                if (Session["CurrentPackageOptions"] != null)
                    return (BLL.PackageOptions)Session["CurrentPackageOptions"];
                else
                    return null;
            }
            set
            {
                Session["CurrentPackageOptions"] = value;
            }
        }
        #endregion
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                BindData();
                uiPanelViewPackageOptions.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiGridViewPackageOptions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPackageOption")
            {
                PackageOptions objData = new PackageOptions();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnName;
                uiTextBoxArName.Text = objData.ArName;
                uiTextBoxEnDesc.Text = objData.EnDescription;
                uiTextBoxArDesc.Text = objData.ArDescription;
               // uiDropDownListAllPackages.SelectedValue = objData.PackageID.ToString();
                uiPanelViewPackageOptions.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentPackageOptions = objData;                
            }
            else if (e.CommandName == "DeletePackageOption")
            {
                PackageOptions objData = new PackageOptions();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentPackageOptions = null;
                BindData();
            }
        }

        protected void uiGridViewPackageOptions_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewPackageOptions.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentPackageOptions != null)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewPackageOptions.Visible = true;
            BindData();
            Clearfields();
            CurrentPackageOptions = null;
        }


        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewPackageOptions.Visible = false;
        }        

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            CurrentPackageOptions = null;
            uiPanelEdit.Visible = false;
            uiPanelViewPackageOptions.Visible = true;
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            PackageOptions objData = new PackageOptions();
            objData.SearchPackageOptions(uiTextBoxSearch.Text, 0);
            uiGridViewPackageOptions.DataSource = objData.DefaultView;
            uiGridViewPackageOptions.DataBind();
        }

        protected void uiDropDownListAllPackages_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }
        #endregion
        #region Methods
       

        private void BindData()
        {
            PackageOptions objData = new PackageOptions();
            objData.LoadAll();
            uiGridViewPackageOptions.DataSource = objData.DefaultView;
            uiGridViewPackageOptions.DataBind();

        }

        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxEnDesc.Text = "";
            uiTextBoxArDesc.Text = "";
            //uiDropDownListAllPackages.SelectedIndex = 0;
            uiLabelError.Visible = false;
        }

        private void AddNewRecord()
        {
            PackageOptions objData = new PackageOptions();
            objData.AddNew();
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.EnDescription = uiTextBoxEnDesc.Text;
            objData.ArDescription = uiTextBoxArDesc.Text;
            //objData.PackageID = Convert.ToInt32(uiDropDownListAllPackages.SelectedValue);
            objData.Save();
        }

        private void UpdateRecord()
        {
            PackageOptions objData = CurrentPackageOptions;
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.EnDescription = uiTextBoxEnDesc.Text;
            objData.ArDescription = uiTextBoxArDesc.Text;
            //objData.PackageID = Convert.ToInt32(uiDropDownListAllPackages.SelectedValue);
            objData.Save();
        }


        #endregion

        

        

        
    }
}