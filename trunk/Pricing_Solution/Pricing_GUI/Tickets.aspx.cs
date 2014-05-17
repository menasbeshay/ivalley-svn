using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pricing.BLL;
using System.Data;
using System.IO;
namespace Pricing_GUI
{
    public partial class Tickets : System.Web.UI.Page
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (!IsPostBack)
            {
                if (CodeGlobal.LogedInCompany == null)
                {
                    Response.Redirect("Company_Login.aspx");
                }
                BindTickets();
                LoadDDls();
            }
        }



        protected void uiGridViewTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewTickets.PageIndex = e.NewPageIndex;
            BindTickets();
        }

        protected void uiGridViewTickets_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewTicket")
            {
                Response.Redirect("ViewTicket.aspx?t=" + e.CommandArgument.ToString());
            }
        }

        protected void uiGridViewTickets_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                Label tradeName = (Label)e.Row.FindControl("uiLabelTradeName");
                if (!string.IsNullOrEmpty(row["MainTradeName"].ToString()))
                {
                    tradeName.Text = row["MainTradeName"].ToString();
                }
                else
                {
                    tradeName.Text = row["TradeName"].ToString();
                }
            }
        }


        protected void uiDropDownListType_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (uiDropDownListType.SelectedValue)
            {
                case "1":
                    uiPanelAppeal.Visible = true;
                    uiPanelPriceIncrease.Visible = false;
                    break;
                case "2":
                case "3":
                    uiPanelAppeal.Visible = false;
                    uiPanelPriceIncrease.Visible = true;
                    break;
                default:
                    uiPanelAppeal.Visible = false;
                    uiPanelPriceIncrease.Visible = false;
                    break;
                    
            }
        }

        protected void uiLinkButtonAddTicket_Click(object sender, EventArgs e)
        {
            Pricing.BLL.Tickets companyTickets = new Pricing.BLL.Tickets();
            companyTickets.AddNew();
            companyTickets.CompanyID = CodeGlobal.LogedInCompany.CompanyID;
            companyTickets.TicketTypeID = Convert.ToInt32(uiDropDownListType.SelectedValue);
            companyTickets.TicketStatusID = 1; // open
            if (uiDropDownListDrugs.SelectedValue != "0")
            {
                companyTickets.TradePricingID = Convert.ToInt32(uiDropDownListDrugs.SelectedValue);
            }
            else 
            {
                companyTickets.TradeName = uiTextBoxTradeName.Text;
            
            }

            companyTickets.TextRequest = uiTextBoxRequestText.Text;
            DirectoryInfo dir = new DirectoryInfo(Server.MapPath("~/Attachments/Tickets"));
            if (!dir.Exists)
                dir.Create();
            string filepath = "";
            if (uiFileUploadAttach.HasFile)
            {
                
                filepath = "/Attachments/Tickets/" + DateTime.Now.ToString("ddMMyyyyhhmmss_") + uiFileUploadAttach.FileName;
                uiFileUploadAttach.SaveAs(Server.MapPath("~"+filepath));
                companyTickets.FileAttachement = filepath;
            }
            companyTickets.InitiateDate = DateTime.Now;
            switch (uiDropDownListType.SelectedValue)
            {
                case "1":
                    if (!string.IsNullOrEmpty(uiTextBoxCommittedDate.Text))
                    {
                        DateTime d;
                        DateTime.TryParseExact(uiTextBoxCommittedDate.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out d);
                        if (d != null && d != DateTime.MinValue)
                        {
                            companyTickets.LastCommitteeDate = d;
                        }
                    }
                    companyTickets.LastDescision = uiTextBoxCommittedDecision.Text;
                    double price = 0;
                    double.TryParse(uiTextBoxCommittedPrice.Text, out price);
                    companyTickets.CurrentPrice = price;
                    break;
                case "2":
                case "3":
                    double currentprice = 0;
                    double.TryParse(uiTextBoxCurrentPrice.Text, out currentprice);
                    companyTickets.CurrentPrice = currentprice;

                    double suggestprice = 0;
                    double.TryParse(uiTextBoxSuggestedPrice.Text, out suggestprice);
                    companyTickets.CurrentPrice = suggestprice;
                    break;
                default:
                    break;
            }
            companyTickets.Save();
            BindTickets();
            

        }
        #endregion


        #region Methods
        private void BindTickets()
        {
            Pricing.BLL.Tickets companyTickets = new Pricing.BLL.Tickets();
            companyTickets.GetAllTicketsByCompanyID(CodeGlobal.LogedInCompany.CompanyID);
            uiGridViewTickets.DataSource = companyTickets.DefaultView;
            uiGridViewTickets.DataBind();
        }


        private void LoadDDls()
        {
            Pricing.BLL.TicketType types = new Pricing.BLL.TicketType();
            types.LoadAll();
            uiDropDownListType.DataSource = types.DefaultView;
            uiDropDownListType.DataTextField = Pricing.BLL.TicketType.ColumnNames.Name;
            uiDropDownListType.DataValueField = Pricing.BLL.TicketType.ColumnNames.TicketTypeID;
            uiDropDownListType.DataBind();            

            Pricing.BLL.TradePricing drugs = new Pricing.BLL.TradePricing();
            drugs.LoadAll();
            uiDropDownListDrugs.DataSource = drugs.DefaultView;
            uiDropDownListDrugs.DataTextField = Pricing.BLL.TradePricing.ColumnNames.TradeName;
            uiDropDownListDrugs.DataValueField = Pricing.BLL.TradePricing.ColumnNames.TradePricingID;
            uiDropDownListDrugs.DataBind();
            uiDropDownListDrugs.Items.Insert(0, new ListItem("select drug...", "0"));
        }
        #endregion


    }
}