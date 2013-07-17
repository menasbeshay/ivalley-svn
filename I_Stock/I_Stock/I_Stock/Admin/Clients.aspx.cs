using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace I_Stock.Admin
{
    public partial class Clients : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.Clients CurrentClient
        {
            get
            {
                if (Session["CurrentClient"] != null)
                    return (IStock.BLL.Clients)Session["CurrentClient"];
                else
                    return null;
            }
            set
            {
                Session["CurrentClient"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                LoadDDls();
                BindClients();                
                uiPanelEditClients.Visible = false;
                uiPanelAllClients.Visible = true;
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentClient = null;
            uiPanelEditClients.Visible = false;
            uiPanelAllClients.Visible = true;
            BindClients();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.Clients clients = new IStock.BLL.Clients();
            if (CurrentClient == null)
                clients.AddNew();
            else
                clients = CurrentClient;

            clients.Name = uiTextBoxName.Text;
            clients.Description = uiTextBoxDesc.Text;
            clients.Address = uiTextBoxAddress.Text;
            clients.Telephone = uiTextBoxTele.Text;
            clients.CityID = Convert.ToInt32(uiDropDownListCities.SelectedValue);
            clients.ClientTypeID = Convert.ToInt32(uiDropDownListClientTypes.SelectedValue);
            clients.StartCredit = decimal.Parse(uiTextBoxCredit.Text);
            clients.Save();
            ClearFields();
            CurrentClient = null;
            uiPanelEditClients.Visible = false;
            uiPanelAllClients.Visible = true;
            BindClients();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentClient = null;
            uiPanelEditClients.Visible = false;
            uiPanelAllClients.Visible = true;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentClient = null;
            uiPanelEditClients.Visible = true;
            uiPanelAllClients.Visible = false;
        }

        protected void uiGridViewClients_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewClients.PageIndex = e.NewPageIndex;
            BindClients();
        }

        protected void uiGridViewClients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditClient")
            {
                IStock.BLL.Clients objData = new IStock.BLL.Clients();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxName.Text = objData.Name;
                uiTextBoxDesc.Text = objData.Description;
                uiTextBoxAddress.Text = objData.Address;
                uiTextBoxTele.Text = objData.Telephone;
                uiDropDownListCities.SelectedValue = objData.CityID.ToString();
                uiDropDownListClientTypes.SelectedValue = objData.ClientTypeID.ToString();
                if(!objData.IsColumnNull("StartCredit"))
                    uiTextBoxCredit.Text = objData.StartCredit.ToString();

                uiPanelAllClients.Visible = false;
                uiPanelEditClients.Visible = true;
                CurrentClient = objData;

                BindClients();
            }
            else if (e.CommandName == "DeleteClient")
            {
                try
                {
                    IStock.BLL.Clients objData = new IStock.BLL.Clients();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentClient = null;
                    BindClients();
                }
                catch (Exception ex)
                {
                    
                }
            }
        }
        #endregion

        #region methods

        private void BindClients()
        {
            IStock.BLL.Clients clients = new IStock.BLL.Clients();
            clients.GetAllClients();            
            uiGridViewClients.DataSource = clients.DefaultView;
            uiGridViewClients.DataBind();
        }



        private void LoadDDls()
        {
            IStock.BLL.ClientTypes clientTypes = new IStock.BLL.ClientTypes();
            clientTypes.LoadAll();
            clientTypes.Sort = "Name";
            uiDropDownListClientTypes.DataSource = clientTypes.DefaultView;
            uiDropDownListClientTypes.DataTextField = "Name";
            uiDropDownListClientTypes.DataValueField = "ClientTypeID";
            uiDropDownListClientTypes.DataBind();

            IStock.BLL.Cities cities = new IStock.BLL.Cities();
            cities.LoadAll();
            cities.Sort = "Name";
            uiDropDownListCities.DataSource = cities.DefaultView;
            uiDropDownListCities.DataTextField = "Name";
            uiDropDownListCities.DataValueField = "CityID";
            uiDropDownListCities.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxDesc.Text = "";
            uiTextBoxAddress.Text = "";
            uiTextBoxTele.Text = "";
            uiTextBoxCredit.Text = "";
            uiDropDownListCities.SelectedIndex = 0;
            uiDropDownListClientTypes.SelectedIndex = 0;
        }


        #endregion
    }
}