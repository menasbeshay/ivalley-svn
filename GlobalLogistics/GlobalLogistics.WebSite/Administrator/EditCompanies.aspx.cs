using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;
using System.Web.Security;
using System.Threading;
namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditCompanies : System.Web.UI.Page
    {
        #region properties
        public BLL.Companies CurrentCompany
        {
            get
            {
                if (Session["CurrentCompany"] != null)
                    return (BLL.Companies)Session["CurrentCompany"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCompany"] = value;
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
                LoadCheckBoxLists();
                uiPanelViewCompanies.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            CurrentCompany = null;
            uiPanelEdit.Visible = true;
            uiPanelViewCompanies.Visible = false;
            uiLinkButtonResetPassword.Enabled = false;
            uiTextBoxPassword.TextMode = TextBoxMode.Password;
            uiTextBoxPassword.Enabled = true;
            uiTextBoxUserName.Enabled = true;
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            //Companies comp = new Companies();
            //comp.SearchCompanies(uiTextBoxSearch.Text, 0, Convert.ToInt32(uiDropDownListCategoryFilter.SelectedValue), Convert.ToInt32(uiDropDownListSubCategoryFilter.SelectedValue));
            //uiGridViewCompanies.DataSource = comp.DefaultView;
            //uiGridViewCompanies.DataBind();
            FilterCompanies();
        }

        protected void uiGridViewCompanies_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCompanies.PageIndex = e.NewPageIndex;
            //BindData();
            FilterCompanies();
        }

        protected void uiGridViewCompanies_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCompany")
            {
                Companies objData = new Companies();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnName;
                uiTextBoxArName.Text = objData.ArName;
                uiTextBoxEnAddress.Text = objData.EnAddress;
                uiTextBoxArAddress.Text = objData.ArAddress;
                uiTextBoxTele.Text = objData.Tele;
                uiTextBoxFax.Text = objData.Fax;
                uiDropDownListCity.SelectedValue = objData.CityID.ToString();
                uiDropDownListCategory.SelectedValue = objData.CategoryID.ToString();
                if (!objData.IsColumnNull("SubCategoryID"))
                {
                    uiDropDownListSubCategory.SelectedValue = objData.SubCategoryID.ToString();
                }
                uiImageLogo.ImageUrl = objData.LogoPath;
                uiLinkButtonResetPassword.Enabled = true;
                uiTextBoxUserName.Text = objData.UserName;
                uiTextBoxPassword.TextMode = TextBoxMode.SingleLine;
                uiTextBoxPassword.Text = Membership.GetUser(objData.UserName).GetPassword();
                uiTextBoxPassword.Enabled = false;
                uiTextBoxUserName.Enabled = false;
                

                if (!objData.IsColumnNull("PackageTypeID"))
                {
                    uiDropDownListPackages.SelectedValue = objData.PackageTypeID.ToString();
                }
                //  load packjage       
                CompanyEnabledOptions options = new CompanyEnabledOptions();
                options.GetCompanyEnabledOptionsByCompanyID(Convert.ToInt32(e.CommandArgument.ToString()));
                for (int i = 0; i < options.RowCount; i++)
                {
                    foreach (ListItem item in uiCheckBoxListPackageOptions.Items)
                    {
                        if (item.Value == options.PackageOptionID.ToString())
                        {
                            item.Selected = options.Enabled;
                            break;
                        }

                    }
                    options.MoveNext();
                }
                                
                uiPanelViewCompanies.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentCompany = objData;
            }
            else if (e.CommandName == "DeleteCompany")
            {
                
                Companies objData = new Companies();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                if (Membership.GetUser(objData.UserName) != null)
                {
                    Membership.DeleteUser(objData.UserName);
                }

                CompanyEnabledOptions options = new CompanyEnabledOptions();
                options.GetCompanyEnabledOptionsByCompanyID(objData.CompanyID);
                options.DeleteAll();
                options.Save();

                Photos pics = new Photos();
                pics.GetPhotosByCompanyID(objData.CompanyID);
                pics.DeleteAll();
                pics.Save();

                Vedios videos = new Vedios();
                videos.GetVedioByCompanyID(objData.CompanyID);
                videos.DeleteAll();
                videos.Save();
                
                objData.MarkAsDeleted();
                objData.Save();

                BindData();
                uiPanelViewCompanies.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiGridViewCompanies_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView objData = (DataRowView)e.Row.DataItem;
                Categories cat = new Categories();
                cat.LoadByPrimaryKey(Convert.ToInt32(objData["CategoryID"].ToString()));
                Label temp = (Label)e.Row.FindControl("uiLabelCategoryName");
                temp.Text = cat.ArName;
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            string filepath = "";
            if (uiFileUploadLogoPath.HasFile)
            {
                uiFileUploadLogoPath.SaveAs(Server.MapPath("~/FileUploads/Companies" + "/" + uiFileUploadLogoPath.FileName));
                filepath = "/Fileuploads/Companies" + "/" + uiFileUploadLogoPath.FileName;
            }

            if (CurrentCompany != null)
            {
                Companies objData = CurrentCompany;
                string temp = objData.LogoPath;
                objData.EnName = uiTextBoxEnName.Text;
                objData.ArName = uiTextBoxArName.Text;
                objData.EnAddress = uiTextBoxEnAddress.Text;
                objData.ArAddress = uiTextBoxArAddress.Text;
                objData.Tele = uiTextBoxTele.Text;
                objData.Fax = uiTextBoxFax.Text;
                try
                {
                    objData.Rank = Convert.ToInt32(uiTextBoxRank.Text);
                }
                catch (Exception ee)
                {
                    objData.Rank = 0;
                }
                objData.CityID = Convert.ToInt32(uiDropDownListCity.SelectedValue);
                objData.CategoryID = Convert.ToInt32(uiDropDownListCategory.SelectedValue);
                if (!string.IsNullOrEmpty(uiDropDownListSubCategory.SelectedValue))
                {
                    objData.SubCategoryID = Convert.ToInt32(uiDropDownListSubCategory.SelectedValue);
                }
                objData.PackageTypeID = Convert.ToInt32(uiDropDownListPackages.SelectedValue);
                if (!string.IsNullOrEmpty(filepath))
                {
                    objData.LogoPath = filepath;
                }
                objData.Save();

                CompanyEnabledOptions option = new CompanyEnabledOptions();
                option.GetCompanyEnabledOptionsByCompanyID(objData.CompanyID);
                foreach (ListItem item in uiCheckBoxListPackageOptions.Items)
                {
                    bool found = false;                 
                    for (int i = 0; i < option.RowCount; i++)
                    {
                        if (item.Value == option.PackageOptionID.ToString())
                        {
                            option.Enabled = item.Selected;
                            found = true;                            
                        }
                        if (found)
                        { break; }
                    }
                    if (!found)
                    {
                        option.AddNew();
                        option.CompanyID = objData.CompanyID;
                        option.PackageOptionID = Convert.ToInt32(item.Value);
                        option.Enabled = item.Selected;

                    }
                    option.MoveNext();
                }
                option.Save();

            }
            else
            {
                MembershipCreateStatus obj;
                MembershipUser objUser = Membership.CreateUser(uiTextBoxUserName.Text, uiTextBoxPassword.Text, "info@glologistics.com", null, null, true, out obj);
                bool success = true;
                switch (obj)
                {
                    case MembershipCreateStatus.DuplicateUserName:
                        uiLabelError.Text = "duplicate username";
                        uiLabelError.Visible = true;
                        success = false;
                        break;
                    case MembershipCreateStatus.InvalidPassword:
                        uiLabelError.Text = "invalid password. password must be (6) characters or more.";
                        uiLabelError.Visible = true;
                        success = false;
                        break;
                    case MembershipCreateStatus.ProviderError:                                               
                    case MembershipCreateStatus.UserRejected:
                        uiLabelError.Text = "an error occurred. please try again.";
                        uiLabelError.Visible = true;
                        success = false;
                        break;
                    default:
                        break;
                }
                if (!Roles.IsUserInRole(uiTextBoxUserName.Text, "Company"))
                {
                    Roles.AddUserToRole(uiTextBoxUserName.Text, "Company");
                }

                if (success)
                {
                    Companies objData = new Companies();
                    objData.AddNew();
                    objData.EnName = uiTextBoxEnName.Text;
                    objData.ArName = uiTextBoxArName.Text;
                    objData.EnAddress = uiTextBoxEnAddress.Text;
                    objData.ArAddress = uiTextBoxArAddress.Text;
                    objData.Tele = uiTextBoxTele.Text;
                    objData.Fax = uiTextBoxFax.Text;
                    objData.CityID = Convert.ToInt32(uiDropDownListCity.SelectedValue);
                    objData.CategoryID = Convert.ToInt32(uiDropDownListCategory.SelectedValue);
                    if (!string.IsNullOrEmpty(uiDropDownListSubCategory.SelectedValue))
                    {
                        objData.SubCategoryID = Convert.ToInt32(uiDropDownListSubCategory.SelectedValue);
                    }
                    objData.LogoPath = filepath;
                    objData.UserName = uiTextBoxUserName.Text;
                    objData.PackageTypeID = Convert.ToInt32(uiDropDownListPackages.SelectedValue);
                    try
                    {
                        objData.Rank = Convert.ToInt32(uiTextBoxRank.Text);
                    }
                    catch (Exception ee)
                    {
                        objData.Rank = 0;
                    }
                    objData.Save();
                    CompanyEnabledOptions option = new CompanyEnabledOptions();
                    foreach (ListItem item in uiCheckBoxListPackageOptions.Items)
                    {
                        
                        option.AddNew();
                        option.PackageOptionID = Convert.ToInt32(item.Value);
                        option.CompanyID = objData.CompanyID;
                        option.Enabled = item.Selected;
                        
                    }
                    option.Save();
                }
                else
                {
                    return;
                }
                                         
            }
            

            uiPanelEdit.Visible = false;
            uiPanelViewCompanies.Visible = true;
            BindData();
            Clearfields();
            
            CurrentCompany = null;

        }

       

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            CurrentCompany = null;
            uiPanelEdit.Visible = false;
            uiPanelViewCompanies.Visible = true;
        }


        protected void uiDropDownListCategoryFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategories objSubCategories = new SubCategories();
            objSubCategories.GetAllSubCategoriesByCategory(Convert.ToInt32(uiDropDownListCategoryFilter.SelectedValue));
            uiDropDownListSubCategoryFilter.DataSource = objSubCategories.DefaultView;
            uiDropDownListSubCategoryFilter.DataTextField = "ArName";
            uiDropDownListSubCategoryFilter.DataValueField = "SubCategoryID";
            uiDropDownListSubCategoryFilter.DataBind();
            uiDropDownListSubCategoryFilter.Items.Insert(0, new ListItem("Select Sub-Category", "0"));

            FilterCompanies();
        }
        #endregion

        #region Methods

        private void BindData()
        {
            Companies objData = new Companies();
            objData.LoadAll();
            uiGridViewCompanies.DataSource = objData.DefaultView;
            uiGridViewCompanies.DataBind();
        }

        private void LoadDDLs()
        {

            Cities objCities = new Cities();
            objCities.LoadAll();
            uiDropDownListCity.DataSource = objCities.DefaultView;
            uiDropDownListCity.DataTextField = "ArName";
            uiDropDownListCity.DataValueField = "CityID";
            uiDropDownListCity.DataBind();

            Categories objCats = new Categories();
            objCats.LoadAll();
            uiDropDownListCategory.DataSource = objCats.DefaultView;
            uiDropDownListCategory.DataTextField = "ArName";
            uiDropDownListCategory.DataValueField = "CategoryID";
            uiDropDownListCategory.DataBind();

            SubCategories objSubCat = new SubCategories();
            objSubCat.LoadAll();
            uiDropDownListSubCategory.DataSource = objSubCat.DefaultView;
            uiDropDownListSubCategory.DataTextField = "ArName";
            uiDropDownListSubCategory.DataValueField = "SubCategoryID";
            uiDropDownListSubCategory.DataBind();

            Packages objPackages = new Packages();
            objPackages.LoadAll();
            uiDropDownListPackages.DataSource = objPackages.DefaultView;
            uiDropDownListPackages.DataTextField = "EnName";
            uiDropDownListPackages.DataValueField = "PackageID";
            uiDropDownListPackages.DataBind();

            uiDropDownListCategoryFilter.DataSource = objCats.DefaultView;
            uiDropDownListCategoryFilter.DataTextField = "ArName";
            uiDropDownListCategoryFilter.DataValueField = "CategoryID";
            uiDropDownListCategoryFilter.DataBind();
            uiDropDownListCategoryFilter.Items.Insert(0, new ListItem("Select Category", "0"));

        }

        private void LoadCheckBoxLists()
        {
            PackageOptions objData = new PackageOptions();
            objData.LoadAll();
            uiCheckBoxListPackageOptions.DataSource = objData.DefaultView;
            uiCheckBoxListPackageOptions.DataTextField = "ArName";
            uiCheckBoxListPackageOptions.DataValueField = "PackageOptionID";
            uiCheckBoxListPackageOptions.DataBind();
        } 

        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxEnAddress.Text = "";
            uiTextBoxArAddress.Text = "";
            uiTextBoxTele.Text = "";
            uiTextBoxFax.Text = "";
            uiTextBoxUserName.Text = "";
            uiDropDownListCity.SelectedIndex = 0;
            uiDropDownListCategory.SelectedIndex = 0;
            uiDropDownListSubCategory.SelectedIndex = 0;
            uiImageLogo.ImageUrl = "";
            uiCheckBoxListPackageOptions.ClearSelection();
        }
        #endregion

        protected void uiDropDownListPackages_SelectedIndexChanged(object sender, EventArgs e)
        {            
            uiCheckBoxListPackageOptions.ClearSelection();
            PackageOptionsLink options = new PackageOptionsLink();
            options.GetPackageOptionsLinksByPackageID(Convert.ToInt32(uiDropDownListPackages.SelectedValue));
            for (int i = 0; i < options.RowCount; i++)
            {
                foreach (ListItem item in uiCheckBoxListPackageOptions.Items)
                {
                    if (item.Value == options.PackageOptionID.ToString())
                    {
                        item.Selected = true;
                        break;
                    }

                }
                options.MoveNext();
            }
        }



        public void FilterCompanies()
        {
            Companies comp = new Companies();
            comp.SearchCompanies(uiTextBoxSearch.Text,0,Convert.ToInt32(uiDropDownListCategoryFilter.SelectedValue), Convert.ToInt32(uiDropDownListSubCategoryFilter.SelectedValue));
            uiGridViewCompanies.DataSource = comp.DefaultView;
            uiGridViewCompanies.DataBind();
        }

        protected void uiDropDownListSubCategoryFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterCompanies();
        }

        

    }
}