using ITravel.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITravel
{
    public partial class BookTicket : BasePage
    {
        #region Properties
        public TicketInfo CurrentTicket
        {
            get
            {
                if (Session["CurrentTicket"] != null)
                {
                    return (TicketInfo)Session["CurrentTicket"];
                }
                else
                    return null;
            }
            set
            {
                Session["CurrentTicket"] = value;
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
                LoadAllTickets();
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


        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
            CurrentTicket = null;
            uiGridViewHistory.DataSource = null;
            uiGridViewHistory.DataBind();
        }

        

        protected void uiLinkButtonSearch_Click(object sender, EventArgs e)
        {
            LoadAllTickets();
        }

        protected void uiGridViewTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewTickets.PageIndex = e.NewPageIndex;
            LoadAllTickets();
        }

        protected void uiGridViewHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewHistory.PageIndex = e.NewPageIndex;
            LoadHistory();
        }

        protected void uiGridViewTickets_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditR")
            {
                TicketInfo ticket = new TicketInfo();
                ticket.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentTicket = ticket;
                uiDropDownListFrom.SelectedValue = ticket.From_AirportID.ToString();
                uiDropDownListTo.SelectedValue = ticket.To_AirportID.ToString();
                uiDropDownListAirLine.SelectedValue = ticket.AirLineID.ToString();
                uiDropDownListCustomer.SelectedValue = ticket.PassengerID.ToString();
                uiTextBoxTicketNo.Text =ticket.TicketNo;
                uiTextBoxActualPrice.Text = ticket.ActualPrice.ToString();
                uiTextBoxFinalPrice.Text = ticket.FinalPrice.ToString();
                uiTextBoxAddedValue.Text = ticket.AddedValue.ToString();
                uiTextBoxAddedPercentage.Text = ticket.AddedPercentage.ToString();
                uiCheckBoxIsCanceld.Checked = ticket.IsCanceled;
                uiCheckBoxIsRefunded.Checked = ticket.IsRefunded;
                uiCheckBoxIsConfirmed.Checked= ticket.IsConfirmed;
                uiTextBoxFromDate.Text = ticket.FromDate.ToString("MM/dd/yyyy hh:mm");
                LoadHistory();
                uiPanelAll.Visible = false;
                uiPanelEdit.Visible = true;
            }
            
        }


        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
            CurrentTicket = null;
        }

        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            TicketInfo Ticket = new TicketInfo();
            TicketHistory History = new TicketHistory();
            int seatno = 0;
            decimal actualprice, finalprice, addedvalue, addedpercentage = 0;
            History.AddNew();
            if (CurrentTicket == null)
            {
                Ticket.AddNew();
                Ticket.CreatedDate = DateTime.Now;                
            }
            else
            {
                Ticket = CurrentTicket;
            }
            Ticket.From_AirportID = History.From_AirportID = Convert.ToInt32(uiDropDownListFrom.SelectedValue);
            Ticket.To_AirportID = History.To_AirportID = Convert.ToInt32(uiDropDownListTo.SelectedValue);
            Ticket.AirLineID = History.AirLineID = Convert.ToInt32(uiDropDownListAirLine.SelectedValue);
            Ticket.PassengerID = Convert.ToInt32(uiDropDownListCustomer.SelectedValue);
            Ticket.TicketNo = uiTextBoxTicketNo.Text;
            Ticket.FlightNo = History.FlightNo = uiTextBoxFlightNo.Text;
            int.TryParse(uiTextBoxSeatNo.Text, out seatno);
            Ticket.SeatNo = History.SeatNo = seatno;
            Ticket.Cabin_type = History.Cabin_type = uiDropDownListCabinType.SelectedItem.Text;
            decimal.TryParse(uiTextBoxFinalPrice.Text, out finalprice);
            decimal.TryParse(uiTextBoxActualPrice.Text, out actualprice);
            decimal.TryParse(uiTextBoxAddedValue.Text, out addedvalue);
            decimal.TryParse(uiTextBoxAddedPercentage.Text, out addedpercentage);
            Ticket.ActualPrice = History.ActualPrice = actualprice;
            Ticket.FinalPrice = History.FinalPrice = finalprice;
            Ticket.AddedValue = History.AddedValue = addedvalue;
            Ticket.AddedPercentage = History.AddedPercentage = addedpercentage;
            Ticket.IsCanceled = History.IsCanceled = uiCheckBoxIsCanceld.Checked;
            Ticket.IsRefunded = History.IsRefunded = uiCheckBoxIsRefunded.Checked;
            Ticket.IsConfirmed = History.IsConfirmed = uiCheckBoxIsConfirmed.Checked;
            Ticket.FromDate = History.FromDate = DateTime.ParseExact(uiTextBoxFromDate.Text, "MM/dd/yyyy hh:mm", null);
            Ticket.Save();
            History.TicketID = Ticket.TicketID;
            History.UpdatedDate = DateTime.Now;
            History.Save();
            LoadAllTickets();
            uiPanelAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
            CurrentTicket = null;
        }

        protected void uiGridViewTickets_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;

                Label lblfrom = (Label)e.Row.FindControl("uiLabelFrom");
                Label lblto = (Label)e.Row.FindControl("uiLabelTo");

                AirPort airport = new AirPort();
                airport.LoadByPrimaryKey(Convert.ToInt32(row["From_AirportID"].ToString()));
                lblfrom.Text = airport.IATACode;

                airport.LoadByPrimaryKey(Convert.ToInt32(row["To_AirportID"].ToString()));
                lblto.Text = airport.IATACode;

            }
        }

        protected void uiGridViewHistory_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;

                Label lblfrom = (Label)e.Row.FindControl("uiLabelFrom");
                Label lblto = (Label)e.Row.FindControl("uiLabelTo");

                AirPort airport = new AirPort();
                airport.LoadByPrimaryKey(Convert.ToInt32(row["From_AirportID"].ToString()));
                lblfrom.Text = airport.IATACode;

                airport.LoadByPrimaryKey(Convert.ToInt32(row["To_AirportID"].ToString()));
                lblto.Text = airport.IATACode;


            }
        }
        #endregion

        #region Methods

        private void ClearFields()
        {
            uiDropDownListCustomer.SelectedIndex = uiDropDownListAirLine.SelectedIndex = uiDropDownListTo.SelectedIndex = uiDropDownListFrom.SelectedIndex = uiDropDownListCabinType.SelectedIndex = -1;
            uiTextBoxActualPrice.Text = uiTextBoxAddedPercentage.Text = uiTextBoxAddedValue.Text = uiTextBoxFinalPrice.Text = uiTextBoxTicketNo.Text = uiTextBoxFlightNo.Text = uiTextBoxSeatNo.Text = "";
        }

        private void LoadAllTickets()
        {
            TicketInfo tickets = new TicketInfo();
            tickets.SearchTickets(uiTextBoxSearch.Text);
            uiGridViewTickets.DataSource = tickets.DefaultView;
            uiGridViewTickets.DataBind();
        }



        private void LoadHistory()
        {
            TicketHistory history = new TicketHistory();
            history.Where.TicketID.Value = CurrentTicket.TicketID;
            history.Where.TicketID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            history.Query.Load();

            uiGridViewHistory.DataSource = history.DefaultView;
            uiGridViewHistory.DataBind();

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

            AirLine AirLines = new AirLine();
            AirLines.LoadAll();
            uiDropDownListAirLine.DataSource = AirLines.DefaultView;
            uiDropDownListAirLine.DataTextField = AirLine.ColumnNames.Name;
            uiDropDownListAirLine.DataValueField = AirLine.ColumnNames.AirLineID;
            uiDropDownListAirLine.DataBind();

            AirPort Airports = new AirPort();
            Airports.LoadAll();
            uiDropDownListFrom.DataSource = Airports.DefaultView;
            uiDropDownListFrom.DataTextField = AirPort.ColumnNames.IATACode;
            uiDropDownListFrom.DataValueField = AirPort.ColumnNames.AirPortID;
            uiDropDownListFrom.DataBind();

            uiDropDownListTo.DataSource = Airports.DefaultView;
            uiDropDownListTo.DataTextField = AirPort.ColumnNames.IATACode;
            uiDropDownListTo.DataValueField = AirPort.ColumnNames.AirPortID;
            uiDropDownListTo.DataBind();


        }
        #endregion 

       

       
    }
}