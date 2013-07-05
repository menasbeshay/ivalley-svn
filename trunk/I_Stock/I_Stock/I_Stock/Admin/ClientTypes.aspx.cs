using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IStock.BLL;
namespace I_Stock.Admin
{
    public partial class ClientTypes : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.ClientTypes CurrentType
        {
            get
            {
                if (Session["CurrentType"] != null)
                    return (IStock.BLL.ClientTypes)Session["CurrentType"];
                else
                    return null;
            }
            set
            {
                Session["CurrentType"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                BindTypes();
                uipanelError.Visible = false;
                uiPanelEditTypes.Visible = false;
                uiPanelAllTypes.Visible = true;
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentType = null;
            uiPanelEditTypes.Visible = false;
            uiPanelAllTypes.Visible = true;
            BindTypes();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.ClientTypes Type = new IStock.BLL.ClientTypes();
            if (CurrentType == null)
                Type.AddNew();
            else
                Type = CurrentType;

            Type.Name = uiTextBoxName.Text;
            Type.Description = uiTextBoxDesc.Text;
            Type.Save();
            ClearFields();
            CurrentType = null;
            uiPanelEditTypes.Visible = false;
            uiPanelAllTypes.Visible = true;
            BindTypes();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentType = null;
            uiPanelEditTypes.Visible = false;
            uiPanelAllTypes.Visible = true;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentType = null;
            uiPanelEditTypes.Visible = true;
            uiPanelAllTypes.Visible = false;
        }

        protected void uiGridViewTypes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewTypes.PageIndex = e.NewPageIndex;
            BindTypes();
        }

        protected void uiGridViewTypes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditType")
            {
                IStock.BLL.ClientTypes objData = new IStock.BLL.ClientTypes();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxName.Text = objData.Name;
                uiTextBoxDesc.Text = objData.Description;

                uiPanelAllTypes.Visible = false;
                uiPanelEditTypes.Visible = true;
                CurrentType = objData;

                BindTypes();
            }
            else if (e.CommandName == "DeleteType")
            {
                try
                {
                    IStock.BLL.ClientTypes objData = new IStock.BLL.ClientTypes();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentType = null;
                    BindTypes();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }
        #endregion

        #region methods

        private void BindTypes()
        {
            IStock.BLL.ClientTypes Types = new IStock.BLL.ClientTypes();
            Types.LoadAll();
            Types.Sort = "Name";
            uiGridViewTypes.DataSource = Types.DefaultView;
            uiGridViewTypes.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxDesc.Text = "";
        }


        #endregion
    }
}