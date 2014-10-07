using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ITravel.BLL;

namespace ITravel
{
    public partial class Customer : BasePage
    {
        #region Properties
        public Passenger CurrentCustomer {
            get 
            {
                if (Session["CurrentCustomer"] != null)
                {
                    return (Passenger)Session["CurrentCustomer"];
                }
                else
                    return null;
            }
            set
            {
                Session["CurrentCustomer"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = GetLocalResourceObject("PageTitle").ToString();
                LoadDDLs();
                LoadAllCustomers();

                if (Request.QueryString["ct"] != null)
                {
                    if (Request.QueryString["ct"].ToString() == "true")
                    {
                        uiPanelEdit.Visible = true;
                        uiPanelAll.Visible = false;
                        ClearFields();
                    }
                    else
                    {
                        uiPanelEdit.Visible = false;
                        uiPanelAll.Visible = true;
                    }
                }
                else
                {
                    uiPanelEdit.Visible = false;
                    uiPanelAll.Visible = true;
                }
                
            }
        }

        
        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            Passenger customer = new Passenger();
            if (CurrentCustomer == null)
                customer.AddNew();
            else
                customer = CurrentCustomer;
            customer.FirstName = uiTextBoxFN.Text;
            customer.LastName = uiTextBoxLN.Text;
            customer.Email = uiTextBoxMail.Text;
            customer.Mobile = uiTextBoxMobile.Text;
            customer.TitleID = Convert.ToInt32(uiDropDownListTitle.SelectedValue);
            customer.Save();
            LoadAllCustomers();
            uiPanelAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
            CurrentCustomer = null;

        }

        protected void uiLinkButtonSearch_Click(object sender, EventArgs e)
        {
            LoadAllCustomers();
        }

        protected void uiGridViewCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCustomers.PageIndex = e.NewPageIndex;
            LoadAllCustomers();
        }

        protected void uiGridViewCustomers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditR")
            {
                Passenger passenger = new Passenger();
                passenger.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentCustomer = passenger;
                uiTextBoxFN.Text = passenger.FirstName;
                uiTextBoxLN.Text = passenger.LastName;
                uiTextBoxMail.Text = passenger.Email;
                uiTextBoxMobile.Text = passenger.Mobile;
                uiDropDownListTitle.SelectedValue = passenger.TitleID.ToString();
                uiPanelAll.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteR")
            {
                Passenger passenger = new Passenger();
                passenger.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                passenger.MarkAsDeleted();
                passenger.Save();
                LoadAllCustomers();
            }
        }


        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
            CurrentCustomer = null;
        }


        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
            CurrentCustomer = null;
        }
        #endregion

        #region Methods

        private void LoadAllCustomers()
        {
            Passenger customers = new Passenger();
            customers.SearchCustomers(uiTextBoxSearch.Text);
            uiGridViewCustomers.DataSource = customers.DefaultView;
            uiGridViewCustomers.DataBind();

        }

        private void LoadDDLs()
        {
            BLL.Title titles = new Title();
            titles.LoadAll();
            uiDropDownListTitle.DataSource = titles.DefaultView;
            uiDropDownListTitle.DataTextField = BLL.Title.ColumnNames.Name;
            uiDropDownListTitle.DataValueField= BLL.Title.ColumnNames.TitleID;
            uiDropDownListTitle.DataBind();
        }


        private void ClearFields()
        {
            uiTextBoxFN.Text = uiTextBoxLN.Text = uiTextBoxMail.Text = uiTextBoxMobile.Text = "";
        }


        #endregion



        
    }
}