using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditServices : System.Web.UI.Page
    {
        #region properties
        public BLL.Services CurrentService
        {
            get
            {
                if (Session["CurrentService"] != null)
                    return (BLL.Services)Session["CurrentService"];
                else
                    return null;
            }
            set
            {
                Session["CurrentService"] = value;
            }
        }
        #endregion
        #region Events
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindAll();
                LoadDDLs();
                uiPanelViewServices.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentService != null)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }
            uiPanelViewServices.Visible = true;
            uiPanelEdit.Visible = false;
            BindAll();
        }

       
        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            Services objData = new Services();
            objData.SearchServices(uiTextBoxSearch.Text);
            uiGridViewServices.DataSource = objData.DefaultView;
            uiGridViewServices.DataBind();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelViewServices.Visible = false;
            uiPanelEdit.Visible = true;
            CurrentService = null;
            ClearFields();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelViewServices.Visible = true;
            uiPanelEdit.Visible = false;
            CurrentService = null;
            ClearFields();
        }


        protected void uiGridViewServices_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewServices.PageIndex = e.NewPageIndex;
            BindAll();
        }

        protected void uiGridViewServices_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditService")
            {
                Services objData = new Services();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnName;
                uiTextBoxArName.Text = objData.ArName;
                uiFCKeditorArDesc.Value = Server.HtmlDecode(objData.ArDescription);
                uiFCKeditorEnDesc.Value = Server.HtmlDecode(objData.EnDescription);
                uiDropDownListServiceTypes.SelectedValue = objData.TypeID.ToString();
                //uiDropDownListAllCategories.SelectedValue = objData.CategoryID.ToString();
                CurrentService = objData;
                uiPanelViewServices.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteService")
            {
                Services objData = new Services();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindAll();
            }
        }

        protected void uiGridViewServices_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    DataRowView objData = (DataRowView)e.Row.DataItem;
            //    Categories cat = new Categories();
            //    cat.LoadByPrimaryKey(Convert.ToInt32(objData["CategoryID"].ToString()));
            //    Label temp = (Label)e.Row.FindControl("uiLabelCategoryName");
            //    temp.Text = cat.ArName;
            //}
        }
        #endregion

        #region Methods

        private void AddNewRecord()
        {
            BLL.Services objData = new Services();
            objData.AddNew();
            //objData.CategoryID = 1;
            objData.TypeID = Convert.ToInt32(uiDropDownListServiceTypes.SelectedValue);
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.ArDescription = Server.HtmlEncode(uiFCKeditorArDesc.Value);
            objData.EnDescription = Server.HtmlEncode(uiFCKeditorEnDesc.Value);
            objData.CreatedDate = DateTime.Now;
            objData.Save();

        }

        private void UpdateRecord()
        {
            BLL.Services objData = CurrentService;            
            //objData.CategoryID = 1;
            objData.TypeID = Convert.ToInt32(uiDropDownListServiceTypes.SelectedValue);
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.ArDescription = Server.HtmlEncode(uiFCKeditorArDesc.Value);
            objData.EnDescription = Server.HtmlEncode(uiFCKeditorEnDesc.Value);            
            objData.Save();
        }

        private void LoadDDLs()
        {
            Categories objData = new Categories();
            objData.LoadAll();
            uiDropDownListAllCategories.DataSource = objData.DefaultView;
            uiDropDownListAllCategories.DataTextField = "ArName";
            uiDropDownListAllCategories.DataValueField = "CategoryID";
            uiDropDownListAllCategories.DataBind();


            ServiceTypes objData2 = new ServiceTypes();
            objData2.LoadAll();
            uiDropDownListServiceTypes.DataSource = objData2.DefaultView;
            uiDropDownListServiceTypes.DataTextField = "ArName";
            uiDropDownListServiceTypes.DataValueField = "ServiceTypeID";
            uiDropDownListServiceTypes.DataBind();
        }

        private void BindAll()
        {
            Services objData = new Services();
            objData.LoadAll();
            uiGridViewServices.DataSource = objData.DefaultView;
            uiGridViewServices.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxArName.Text = "";
            uiTextBoxEnName.Text = "";
            uiFCKeditorArDesc.Value = "";
            uiFCKeditorEnDesc.Value = "";            
        }

        #endregion

      

        

    }
}