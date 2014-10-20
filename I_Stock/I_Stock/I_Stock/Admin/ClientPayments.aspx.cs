using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace I_Stock.Admin
{
    public partial class ClientPayments : System.Web.UI.Page
    {

        #region properties
        public IStock.BLL.Payments CurrentPayment
        {
            get
            {
                if (Session["CurrentPayment"] != null)
                    return (IStock.BLL.Payments)Session["CurrentPayment"];
                else
                    return null;
            }
            set
            {
                Session["CurrentPayment"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                loadDDLs();
                BindPayments();
                uiPanelEditPayment.Visible = false;
                uiPanelAllPayments.Visible = true;                
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentPayment = null;
            uiPanelEditPayment.Visible = false;
            uiPanelAllPayments.Visible = true;
            BindPayments();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.Payments Payment = new IStock.BLL.Payments();
            if (CurrentPayment == null)
            {
                Payment.AddNew();
                Payment.Confirmed = false;
            }
            else
                Payment = CurrentPayment;

            Payment.PaymentNo = uiTextBoxCode.Text;
            Payment.ClientID = Convert.ToInt32(uiDropDownListClients.SelectedValue);
            Payment.EmployeeID = Convert.ToInt32(uiDropDownListEmployee.SelectedValue);
            Payment.PaymentDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
            
            if (!string.IsNullOrEmpty(uiTextBoxAmount.Text))
                Payment.Amount = decimal.Parse(uiTextBoxAmount.Text);
            else
                Payment.Amount = 0;

            Payment.PaymentTypeID = Convert.ToInt32(uiRadioButtonListPaymentType.SelectedValue);
            
            Payment.Save();

            

            ClearFields();
            CurrentPayment = null;
            uiPanelEditPayment.Visible = false;
            uiPanelAllPayments.Visible = true;
            BindPayments();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentPayment = null;
            uiPanelEditPayment.Visible = false;
            uiPanelAllPayments.Visible = true;            
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentPayment = null;
            uipanelError.Visible = false;
            uiPanelEditPayment.Visible = true;
            IStock.BLL.Payments d = new IStock.BLL.Payments();
            uiTextBoxCode.Text = d.getNewSerial();
            uiPanelAllPayments.Visible = false;

            uiLinkButtonConfirm.Enabled = true;
            uiDropDownListClients.Enabled = true;
            uiTextBoxDate.Enabled = true;
            uiTextBoxAmount.Enabled = true;
            uiRadioButtonListPaymentType.Enabled = true;
            uiTextBoxCode.Enabled = true;
            uiDropDownListEmployee.Enabled = true;
            uiLinkButtonOK.Enabled = true;
            uiLinkButtonOK.Attributes.Remove("disabled");
        }


        protected void uiGridViewPayments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewPayments.PageIndex = e.NewPageIndex;
            BindPayments();
        }

        protected void uiGridViewPayments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPayment")
            {
                IStock.BLL.Payments objData = new IStock.BLL.Payments();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxCode.Text = objData.PaymentNo.ToString();
                uiTextBoxDate.Text = objData.PaymentDate.ToString("dd/MM/yyy");
                uiDropDownListClients.SelectedValue = objData.ClientID.ToString();
                if (!objData.IsColumnNull("PaymentTypeID"))
                    uiRadioButtonListPaymentType.SelectedValue = objData.PaymentTypeID.ToString();
                else
                    uiRadioButtonListPaymentType.SelectedValue = "1";

                uiDropDownListEmployee.SelectedValue = objData.EmployeeID.ToString();
                uiTextBoxAmount.Text = objData.Amount.ToString();

                uiPanelAllPayments.Visible = false;
                uiPanelEditPayment.Visible = true;

                CurrentPayment = objData;
                                              
                EnableDisableControls();              
            }
            else if (e.CommandName == "DeletePayment")
            {
                try
                {
                    IStock.BLL.Payments objData = new IStock.BLL.Payments();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    
                    IStock.BLL.Clients client = new IStock.BLL.Clients();
                    client.LoadByPrimaryKey(objData.ClientID);
                    client.StartCredit += objData.Amount;
                    client.Save();

                    objData.MarkAsDeleted();
                    objData.Save();                    
                    BindPayments();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }

        #endregion

        #region methods

        private void BindPayments()
        {
            IStock.BLL.Payments payments = new IStock.BLL.Payments();
            payments.GetAllPayments();
            uiGridViewPayments.DataSource = payments.DefaultView;
            uiGridViewPayments.DataBind();
        }

        private void loadDDLs()
        {
            IStock.BLL.Clients Clients = new IStock.BLL.Clients();
            Clients.LoadAll();
            Clients.Sort = "Name";
            uiDropDownListClients.DataSource = Clients.DefaultView;
            uiDropDownListClients.DataTextField = "Name";
            uiDropDownListClients.DataValueField = "ClientID";
            uiDropDownListClients.DataBind();
            uiDropDownListClients.Items.Insert(0, new ListItem("إختر العميل",""));

            IStock.BLL.Employees employees = new IStock.BLL.Employees();
            employees.LoadAll();
            employees.Sort = "Name";
            uiDropDownListEmployee.DataSource = employees.DefaultView;
            uiDropDownListEmployee.DataTextField = "Name";
            uiDropDownListEmployee.DataValueField = "EmployeeID";
            uiDropDownListEmployee.DataBind();
            uiDropDownListEmployee.Items.Insert(0, new ListItem("إختر الموظف",""));
        }


        private void EnableDisableControls()
        {
            if (!CurrentPayment.IsColumnNull("Confirmed"))
            {
                if (CurrentPayment.Confirmed)
                {
                    uiLinkButtonConfirm.Attributes.Add("disabled", "disabled");
                    uiLinkButtonOK.Attributes.Add("disabled", "disabled");
                }
                else
                {
                    uiLinkButtonConfirm.Attributes.Remove("disabled");
                    uiLinkButtonOK.Attributes.Remove("disabled");
                }
                uiDropDownListClients.Enabled = !CurrentPayment.Confirmed;
                uiTextBoxDate.Enabled = !CurrentPayment.Confirmed;
                uiTextBoxAmount.Enabled = !CurrentPayment.Confirmed;
                uiRadioButtonListPaymentType.Enabled = !CurrentPayment.Confirmed;
                uiTextBoxCode.Enabled = !CurrentPayment.Confirmed;
                uiDropDownListEmployee.Enabled = !CurrentPayment.Confirmed;
                
            }
            else
            {
                uiLinkButtonConfirm.Attributes.Remove("disabled");
                uiLinkButtonOK.Attributes.Remove("disabled");
                uiLinkButtonConfirm.Enabled = true;
                uiDropDownListClients.Enabled = true;
                uiTextBoxDate.Enabled = true;
                uiTextBoxAmount.Enabled = true;
                uiRadioButtonListPaymentType.Enabled = true;
                uiTextBoxCode.Enabled = true;
                uiDropDownListEmployee.Enabled = true;
            }

        }

        private void ClearFields()
        {
            uiTextBoxCode.Text = "";
            uiTextBoxDate.Text = "";
            uiTextBoxAmount.Text = "";
            
        }
        #endregion

        protected void uiGridViewPayments_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                LinkButton delete = (LinkButton)e.Row.FindControl("uiLinkButtonDelete");
                if (!string.IsNullOrEmpty(row["Confirmed"].ToString()))
                {
                    if ((bool)row["Confirmed"])
                    {
                        delete.Attributes.Add("disabled", "disabled");
                        delete.OnClientClick = "return false;";
                    }
                }
               
            }
        }

        protected void uiLinkButtonConfirm_Click(object sender, EventArgs e)
        {
            IStock.BLL.Clients client = new IStock.BLL.Clients();
            client.LoadByPrimaryKey(CurrentPayment.ClientID);
            if (!client.IsColumnNull("StartCredit"))
                client.StartCredit -= CurrentPayment.Amount;
            else
                client.StartCredit = 0 - CurrentPayment.Amount;

            client.Save();
            CurrentPayment.Confirmed = true;
            CurrentPayment.Save();
            EnableDisableControls();
        }
    }
}