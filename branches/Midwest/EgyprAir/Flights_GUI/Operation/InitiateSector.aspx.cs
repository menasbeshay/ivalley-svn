using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Data;
using System.Collections;
using System.Drawing;

namespace Flights_GUI.Operation
{
    public partial class InitiatSector : System.Web.UI.Page
    {
        #region Properties
        public Sector CurrentSector
        {
            get
            {
                if (Session["CurrentSector"] != null)
                    return (Sector)Session["CurrentSector"];
                else
                    return null;
            }
            set
            {
                Session["CurrentSector"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateDDLs();                
                LoadDDLs();
                if (CurrentSector != null)
                    FillSectorData();
            }
        }

        protected void uiLinkButtonCancelSector_Click(object sender, EventArgs e)
        {
            ClearFields();
            Response.Redirect("~/Operation/SectorsList.aspx?" + Request.QueryString.ToString());
        }
      
        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearSectorFields();
            Response.Redirect("~/Operation/SectorsList.aspx?" + Request.QueryString.ToString());
        }

        protected void uiLinkButtonSaveSector_Click(object sender, EventArgs e)
        {
            if (CurrentSector != null)
            {
                Sector objData = CurrentSector;
                //objData.ReportID = CurrentFlightReport.ReportID;
                objData.SectorDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
                objData.From_AirportID = Convert.ToInt32(uiDropDownListSectorFrom.SelectedValue);
                objData.To_AirportID = Convert.ToInt32(uiDropDownListSectorTo.SelectedValue);
                objData.FlightNo = uiTextBoxSectorFlightNo.Text;
                objData.IsHeavy = uiCheckBoxIsHeavy.Checked;
                objData.AirCraft_AirPlaneID = Convert.ToInt32(uiDropDownListAirCraftRegistration.SelectedValue);
                objData.IsPAX = false;
               
                TimeSpan STD = new TimeSpan(Convert.ToInt32(uiDropDownListSTDHours.Text), Convert.ToInt32(uiDropDownListSTDMins.Text), 0);
                objData.STD = Convert.ToDateTime(STD.ToString());
                
                TimeSpan STA = new TimeSpan(Convert.ToInt32(uiDropDownListSTAHours.Text), Convert.ToInt32(uiDropDownListSTAMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListSTAHours.Text) < Convert.ToInt32(uiDropDownListSTDHours.Text))
                {
                    objData.STA = Convert.ToDateTime(STA.ToString()).AddDays(1);
                }
                else
                {
                    objData.STA = Convert.ToDateTime(STA.ToString());
                }

                if (uiDropDownListClients.SelectedIndex > -1)
                {
                    if (uiDropDownListClients.SelectedValue != "0")
                        objData.ClientID = Convert.ToInt32(uiDropDownListClients.SelectedValue);
                    else
                        objData.SetColumnNull("ClientID");
                }

                objData.Save();                

            }
            else
            {
                Sector objData = new Sector();                
                objData.AddNew();
                //objData.ReportID = CurrentFlightReport.ReportID;
                objData.SectorDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
                objData.From_AirportID = Convert.ToInt32(uiDropDownListSectorFrom.SelectedValue);
                objData.To_AirportID = Convert.ToInt32(uiDropDownListSectorTo.SelectedValue);
                objData.AirCraft_AirPlaneID = Convert.ToInt32(uiDropDownListAirCraftRegistration.SelectedValue);
                objData.FlightNo = uiTextBoxSectorFlightNo.Text;
                objData.IsHeavy = uiCheckBoxIsHeavy.Checked;
                objData.IsPAX = false;

                TimeSpan STD = new TimeSpan(Convert.ToInt32(uiDropDownListSTDHours.Text), Convert.ToInt32(uiDropDownListSTDMins.Text), 0);
                objData.STD = Convert.ToDateTime(STD.ToString());

                TimeSpan STA = new TimeSpan(Convert.ToInt32(uiDropDownListSTAHours.Text), Convert.ToInt32(uiDropDownListSTAMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListSTAHours.Text) < Convert.ToInt32(uiDropDownListSTDHours.Text))
                {
                    objData.STA = Convert.ToDateTime(STA.ToString()).AddDays(1);
                }
                else
                {
                    objData.STA = Convert.ToDateTime(STA.ToString());
                }

                if (uiDropDownListClients.SelectedIndex > -1)
                {
                    if (uiDropDownListClients.SelectedValue != "0")
                        objData.ClientID = Convert.ToInt32(uiDropDownListClients.SelectedValue);
                    else
                        objData.SetColumnNull("ClientID");
                }

                objData.Save();
                CurrentSector = null;
            }
            ClearSectorFields();
            Response.Redirect("~/Operation/SectorsList.aspx?" + Request.QueryString.ToString());
           
        }
        #endregion

        #region Methods
        public void populateDDLs()
        {
            ArrayList Hours = new ArrayList();
            for (int i = 0; i < 24; i++)
            {
                Hours.Add(i.ToString("00"));
            }

            ArrayList Mins = new ArrayList();
            for (int i = 0; i < 60; i++)
            {
                Mins.Add(i.ToString("00"));
            }            

            uiDropDownListSTAHours.DataSource = Hours;
            uiDropDownListSTAHours.DataBind();

            uiDropDownListSTDHours.DataSource = Hours;
            uiDropDownListSTDHours.DataBind();

            uiDropDownListSTAMins.DataSource = Mins;
            uiDropDownListSTAMins.DataBind();

            uiDropDownListSTDMins.DataSource = Mins;
            uiDropDownListSTDMins.DataBind();

        }

        private void LoadDDLs()
        {            
            AirPort AllAirports = new AirPort();
            AllAirports.LoadAll();
            uiDropDownListSectorFrom.DataSource = AllAirports.DefaultView;
            uiDropDownListSectorFrom.DataTextField = "IATACode";
            uiDropDownListSectorFrom.DataValueField = "AirPortID";
            uiDropDownListSectorFrom.DataBind();
            uiDropDownListSectorFrom.Items.Insert(0, new ListItem("Select Airport", "0"));

            uiDropDownListSectorTo.DataSource = AllAirports.DefaultView;
            uiDropDownListSectorTo.DataTextField = "IATACode";
            uiDropDownListSectorTo.DataValueField = "AirPortID";
            uiDropDownListSectorTo.DataBind();
            uiDropDownListSectorTo.Items.Insert(0, new ListItem("Select Airport", "0"));
  

            AirPlane Ap = new AirPlane();
            Ap.LoadAll();
            uiDropDownListAirCraftRegistration.DataSource = Ap.DefaultView;
            uiDropDownListAirCraftRegistration.DataTextField = "Name";
            uiDropDownListAirCraftRegistration.DataValueField = "AirPlaneID";
            uiDropDownListAirCraftRegistration.DataBind();

            SectorClients SC = new SectorClients();
            SC.LoadAll();
            uiDropDownListClients.DataSource = SC.DefaultView;
            uiDropDownListClients.DataTextField = "Name";
            uiDropDownListClients.DataValueField = "ClientID";
            uiDropDownListClients.DataBind();
            uiDropDownListClients.Items.Insert(0, new ListItem("Select Client", "0"));
        }

        private void ClearFields()
        {
            uiDropDownListAirCraftRegistration.SelectedIndex = 0;
            uiDropDownListClients.SelectedIndex = -1;
            uiTextBoxDate.Text = "";
            uiCheckBoxIsHeavy.Checked = false;
            ClearSectorFields();
        }

        private void ClearSectorFields()
        {
            uiDropDownListSectorFrom.SelectedIndex = -1;
            uiDropDownListSectorTo.SelectedIndex = -1;
            uiTextBoxSectorFlightNo.Text = "";
            
            uiDropDownListSTAHours.SelectedIndex = -1;
            uiDropDownListSTDHours.SelectedIndex = -1;
            
            uiDropDownListSTAMins.SelectedIndex = -1;
            uiDropDownListSTDMins.SelectedIndex = -1;            
        }

        private void FillSectorData()
        {
            uiDropDownListAirCraftRegistration.SelectedValue = CurrentSector.AirCraft_AirPlaneID.ToString();
            uiTextBoxDate.Text = CurrentSector.SectorDate.ToString("dd/MM/yyyy");
            uiCheckBoxIsHeavy.Checked = CurrentSector.IsHeavy;
            uiDropDownListSectorFrom.SelectedValue = CurrentSector.From_AirportID.ToString();
            uiDropDownListSectorTo.SelectedValue = CurrentSector.To_AirportID.ToString();
            uiTextBoxSectorFlightNo.Text = CurrentSector.FlightNo;

            if (!CurrentSector.IsColumnNull("STA"))
            {
                uiDropDownListSTAHours.SelectedValue = CurrentSector.STA.Hour.ToString("00");
                uiDropDownListSTAMins.SelectedValue = CurrentSector.STA.Minute.ToString("00");    
            }

            if (!CurrentSector.IsColumnNull("STD"))
            {
                uiDropDownListSTDHours.SelectedValue = CurrentSector.STD.Hour.ToString("00");
                uiDropDownListSTDMins.SelectedValue = CurrentSector.STD.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("ClientID"))
            {
                uiDropDownListClients.SelectedValue = CurrentSector.ClientID.ToString();
            }
        }
        
        #endregion
    }
}