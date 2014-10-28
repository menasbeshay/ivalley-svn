using ITravel.BLL;
using Microsoft.Reporting.WebForms;
using NumberToWord;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITravel
{
    public partial class RecievingVoucher : BasePage
    {
        #region properties
        public BLL.ReceivingVoucher CurrentVoucher
        {
            get
            {
                if (Session["CurrentReceivingVoucher"] != null)
                {
                    return (BLL.ReceivingVoucher)Session["CurrentReceivingVoucher"];
                }
                else
                    return null;
            }
            set
            {
                Session["CurrentReceivingVoucher"] = value;
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
                LoadAllVouchers();
                uiPanelAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }


        

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
            CurrentVoucher = null;
        }

        protected void uiGridViewVouchers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewVouchers.PageIndex = e.NewPageIndex;
            LoadAllVouchers();
        }

        protected void uiGridViewVouchers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditR")
            {
                BLL.ReceivingVoucher voucher = new BLL.ReceivingVoucher();
                voucher.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentVoucher = voucher;
                uiTextBoxVoucherNo.Text = voucher.VoucherNumber;
                if (!voucher.IsColumnNull("VoucherDate"))
                    uiTextBoxVoucherDate.Text = voucher.VoucherDate.ToString("dd/MM/yyyy");
                uiTextBoxAmount.Text = voucher.Amount.ToString();
                uiCheckBoxIsCheque.Checked = voucher.IsCheque;
                uiTextBoxBank.Text = voucher.BankName;
                if (!voucher.IsColumnNull("ChuqueDate"))
                    uiTextBoxChequeDate.Text = voucher.ChuqueDate.ToString("dd/MM/yyyy");
                uiTextBoxReason.Text = voucher.Reason;

                if (!voucher.IsColumnNull(BLL.ReceivingVoucher.ColumnNames.PassengerId))
                {
                    uiDropDownListCustomer.SelectedValue = voucher.PassengerId.ToString();
                    
                }
                uiTextBoxPaidFor.Text = voucher.PaidFor;
                uiPanelAll.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteR")
            {
                BLL.ReceivingVoucher voucher = new BLL.ReceivingVoucher();
                voucher.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                voucher.MarkAsDeleted();
                voucher.Save();
                LoadAllVouchers();
            }
        }

        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            BLL.ReceivingVoucher voucher = new BLL.ReceivingVoucher();
            if (CurrentVoucher == null)
                voucher.AddNew();
            else
                voucher = CurrentVoucher;
            voucher.VoucherNumber = uiTextBoxVoucherNo.Text;
            try
            {
                voucher.VoucherDate = DateTime.ParseExact(uiTextBoxVoucherDate.Text, "dd/MM/yyyy", null);
            }
            catch (Exception)
            {
                
            }
            voucher.Amount = decimal.Parse(uiTextBoxAmount.Text);
            if (uiDropDownListCustomer.SelectedIndex == 0)
                voucher.PaidFor = uiTextBoxPaidFor.Text;
            else
            {
                voucher.PaidFor = uiDropDownListCustomer.SelectedItem.Text;
                voucher.PassengerId = Convert.ToInt32(uiDropDownListCustomer.SelectedValue);
            }
            voucher.IsCheque = uiCheckBoxIsCheque.Checked;
            voucher.BankName = uiTextBoxBank.Text;
            voucher.Reason = uiTextBoxReason.Text;
            try
            {
                voucher.ChuqueDate = DateTime.ParseExact(uiTextBoxChequeDate.Text, "dd/MM/yyyy", null);
            }
            catch (Exception)
            {
                
            }
            voucher.Save();
            LoadAllVouchers();
            uiPanelAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
            CurrentVoucher = null;
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
            CurrentVoucher = null;
        }

        protected void uiLinkButtonSearch_Click(object sender, EventArgs e)
        {
            LoadAllVouchers();
        }

        protected void uiLinkButtonPrint_Click(object sender, EventArgs e)
        {
            ToWord toWord = new ToWord(CurrentVoucher.Amount, new CurrencyInfo(CurrencyInfo.Currencies.SaudiArabia));

            CurrentVoucher.AddColumn("NumberWord", typeof(string));
            CurrentVoucher.SetColumn("NumberWord", toWord.ConvertToArabic());

            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = "ReportsFiles/RPT_ReceivingVoucher.rdlc";
            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("PaymentDataSet", CurrentVoucher.DefaultView));
            uiReportViewerMain.LocalReport.Refresh();
        }
        #endregion

        #region Methods
        private void LoadAllVouchers()
        {
            BLL.ReceivingVoucher vouchers = new BLL.ReceivingVoucher();
            vouchers.SearchReceivingVoucher(uiTextBoxSearch.Text);
            uiGridViewVouchers.DataSource = vouchers.DefaultView;
            uiGridViewVouchers.DataBind();
        }


        private void LoadDDLs()
        {
            Passenger customers = new Passenger();
            customers.LoadAll();
            customers.AddColumn("DisplayName", typeof(string));
            for (int i = 0; i < customers.RowCount; i++)
            {
                customers.SetColumn("DisplayName", customers.FirstName + " " + customers.LastName);
                customers.MoveNext();
            }
            uiDropDownListCustomer.DataSource = customers.DefaultView;
            uiDropDownListCustomer.DataTextField = "DisplayName";
            uiDropDownListCustomer.DataValueField = Passenger.ColumnNames.PassengerID;
            uiDropDownListCustomer.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxAmount.Text = uiTextBoxBank.Text = uiTextBoxChequeDate.Text = uiTextBoxPaidFor.Text = uiTextBoxReason.Text = uiTextBoxVoucherDate.Text = uiTextBoxVoucherNo.Text = "";
        }
        #endregion
    }
}