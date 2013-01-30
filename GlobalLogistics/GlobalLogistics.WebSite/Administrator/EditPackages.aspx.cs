using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditPackages : System.Web.UI.Page
    {
        #region properties
        public BLL.Packages CurrentPackage
        {
            get
            {
                if (Session["CurrentPackage"] != null)
                    return (BLL.Packages)Session["CurrentPackage"];
                else
                    return null;
            }
            set
            {
                Session["CurrentPackage"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPackageOptions();
                BindData();
                uiPanelViewPackages.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        

        protected void uiGridViewPackages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPackage")
            {
                Packages objData = new Packages();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnName;
                uiTextBoxArName.Text = objData.ArName;
                uiTextBoxEnDesc.Text = objData.EnDescription;
                uiTextBoxArDesc.Text = objData.ArDescription;

                PackageOptionsLink options = new PackageOptionsLink ();
                options.GetPackageOptionsLinksByPackageID(objData.PackageID);
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
                

                uiPanelViewPackages.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentPackage = objData;
            }
            else if (e.CommandName == "DeletePackage")
            {
                Packages objData = new Packages();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentPackage = null;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentPackage != null)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewPackages.Visible = true;
            BindData();
            Clearfields();
            CurrentPackage = null;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewPackages.Visible = false;
        }

        protected void uiGridViewPackages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewPackages.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = false;
            uiPanelViewPackages.Visible = true;
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            BLL.Packages objData = new Packages();
            objData.SearchPackages(uiTextBoxSearch.Text);
            uiGridViewPackages.DataSource = objData.DefaultView;
            uiGridViewPackages.DataBind();
        }
        #endregion

        #region Methods

        private void LoadPackageOptions() 
        {
            PackageOptions objData = new PackageOptions();
            objData.LoadAll();
            uiCheckBoxListPackageOptions.DataSource = objData.DefaultView;
            uiCheckBoxListPackageOptions.DataTextField = "ArName";
            uiCheckBoxListPackageOptions.DataValueField = "PackageOptionID";
            uiCheckBoxListPackageOptions.DataBind();
        }

        private void BindData()
        {
            BLL.Packages objData = new Packages();
            objData.LoadAll();
            uiGridViewPackages.DataSource = objData.DefaultView;
            uiGridViewPackages.DataBind();
        }


        private void AddNewRecord()
        {
            Packages objData = new Packages();
            objData.AddNew();
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.EnDescription = uiTextBoxEnDesc.Text;
            objData.ArDescription = uiTextBoxArDesc.Text;
            objData.Save();

            
            foreach (ListItem item in uiCheckBoxListPackageOptions.Items)  
            {
                if (item.Selected)
                {
                    PackageOptionsLink Options = new PackageOptionsLink();
                    Options.AddNew();
                    Options.PackageID = objData.PackageID;
                    Options.PackageOptionID = Convert.ToInt32(item.Value);
                    Options.Save();
                }
            }

        }

        private void UpdateRecord()
        {
            Packages objData = CurrentPackage;
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.EnDescription = uiTextBoxEnDesc.Text;
            objData.ArDescription = uiTextBoxArDesc.Text;
            objData.Save();

            foreach (ListItem item in uiCheckBoxListPackageOptions.Items)  
            {
                if (item.Selected)
                {
                    try
                    {
                        PackageOptionsLink Options = new PackageOptionsLink();
                        Options.AddNew();
                        Options.PackageID = objData.PackageID;
                        Options.PackageOptionID = Convert.ToInt32(item.Value);
                        Options.Save();
                    }
                    catch (Exception ex)
                    {
                        continue;
                    }
                }
                else
                {
                    try
                    {
                        PackageOptionsLink Options = new PackageOptionsLink();
                        Options.LoadByPrimaryKey(objData.PackageID, Convert.ToInt32(item.Value));
                        Options.MarkAsDeleted();
                        Options.Save();                        
                    }
                    catch (Exception ex)
                    {
                        continue;
                    }
                }
            }
        }

        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxEnDesc.Text = "";
            uiTextBoxArDesc.Text = "";
            foreach (ListItem item in uiCheckBoxListPackageOptions.Items)
            {
                item.Selected = false;
            }
            uiLabelError.Visible = false;
        }
        #endregion 


    }
}