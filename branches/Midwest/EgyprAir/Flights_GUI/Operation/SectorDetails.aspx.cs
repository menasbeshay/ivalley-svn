using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Collections;

namespace Flights_GUI.Operation
{
    public partial class SectorDetails : System.Web.UI.Page
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

        protected void uiLinkButtonSaveSector_Click(object sender, EventArgs e)
        {
            if (CurrentSector != null)
            {
                Sector objData = CurrentSector;                
                objData.IsPAX = false;
                if (!string.IsNullOrEmpty(uiTextBoxFule.Text))
                {
                    objData.FuleUplifted = Convert.ToInt32(uiTextBoxFule.Text);
                }

                if (!string.IsNullOrEmpty(uiTextBoxActualBurn.Text))
                {
                    objData.ActualBurnOff = Convert.ToInt32(uiTextBoxActualBurn.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxPlanBurnOff.Text))
                {
                    objData.StandardBurnOff = Convert.ToInt32(uiTextBoxPlanBurnOff.Text);
                }


                TimeSpan STD = new TimeSpan(Convert.ToInt32(uiDropDownListSTDHours.Text), Convert.ToInt32(uiDropDownListSTDMins.Text), 0);
                objData.STD = Convert.ToDateTime(STD.ToString());

                TimeSpan ATD = new TimeSpan(Convert.ToInt32(uiDropDownListATDHours.Text), Convert.ToInt32(uiDropDownListATDMins.Text), 0);
                objData.ATD = Convert.ToDateTime(ATD.ToString());

                TimeSpan ATA = new TimeSpan(Convert.ToInt32(uiDropDownListATAHours.Text), Convert.ToInt32(uiDropDownListATAMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListATAHours.Text) < Convert.ToInt32(uiDropDownListATDHours.Text))
                {
                    objData.ATA = Convert.ToDateTime(ATA.ToString()).AddDays(1);
                }
                else
                {
                    objData.ATA = Convert.ToDateTime(ATA.ToString());
                }

                TimeSpan OFF = new TimeSpan(Convert.ToInt32(uiDropDownListOFFHours.Text), Convert.ToInt32(uiDropDownListOFFMins.Text), 0);
                objData.ChoxOff = Convert.ToDateTime(OFF.ToString());

                TimeSpan On = new TimeSpan(Convert.ToInt32(uiDropDownListOnHours.Text), Convert.ToInt32(uiDropDownListOnMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListOnHours.Text) < Convert.ToInt32(uiDropDownListOFFHours.Text))
                {
                    objData.ChoxOn = Convert.ToDateTime(On.ToString()).AddDays(1);
                }
                else
                {
                    objData.ChoxOn = Convert.ToDateTime(On.ToString());
                }

                TimeSpan STA = new TimeSpan(Convert.ToInt32(uiDropDownListSTAHours.Text), Convert.ToInt32(uiDropDownListSTAMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListSTAHours.Text) < Convert.ToInt32(uiDropDownListSTDHours.Text))
                {
                    objData.STA = Convert.ToDateTime(STA.ToString()).AddDays(1);
                }
                else
                {
                    objData.STA = Convert.ToDateTime(STA.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListDelay1Code.SelectedValue))
                {
                    objData.DepDelayID1 = Convert.ToInt32(uiDropDownListDelay1Code.SelectedValue);
                    TimeSpan Delay1 = new TimeSpan(Convert.ToInt32(uiDropDownListDelay1Hours.Text), Convert.ToInt32(uiDropDownListDelay1Mins.Text), 0);
                    objData.DepDelayTime1 = Convert.ToDateTime(Delay1.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListDelay2Code.SelectedValue))
                {
                    objData.DepDelayID2 = Convert.ToInt32(uiDropDownListDelay2Code.SelectedValue);
                    TimeSpan Delay2 = new TimeSpan(Convert.ToInt32(uiDropDownListDelay2Hours.Text), Convert.ToInt32(uiDropDownListDelay2Mins.Text), 0);
                    objData.DepDelayTime2 = Convert.ToDateTime(Delay2.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListDelay3Code.SelectedValue))
                {
                    objData.DepDelayID3 = Convert.ToInt32(uiDropDownListDelay3Code.SelectedValue);
                    TimeSpan Delay3 = new TimeSpan(Convert.ToInt32(uiDropDownListDelay3Hours.Text), Convert.ToInt32(uiDropDownListDelay3Mins.Text), 0);
                    objData.DepDelayTime3 = Convert.ToDateTime(Delay3.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListArrDelay1Code.SelectedValue))
                {
                    objData.ArrDelayID1 = Convert.ToInt32(uiDropDownListArrDelay1Code.SelectedValue);
                    TimeSpan ArrDelay1 = new TimeSpan(Convert.ToInt32(uiDropDownListArrDelay1Hours.Text), Convert.ToInt32(uiDropDownListArrDelay1Mins.Text), 0);
                    objData.ArrDelayTime1 = Convert.ToDateTime(ArrDelay1.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListArrDelay2Code.SelectedValue))
                {
                    objData.ArrDelayID2 = Convert.ToInt32(uiDropDownListArrDelay2Code.SelectedValue);
                    TimeSpan ArrDelay2 = new TimeSpan(Convert.ToInt32(uiDropDownListArrDelay2Hours.Text), Convert.ToInt32(uiDropDownListArrDelay2Mins.Text), 0);
                    objData.ArrDelayTime2 = Convert.ToDateTime(ArrDelay2.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListArrDelay3Code.SelectedValue))
                {
                    objData.ArrDelayID3 = Convert.ToInt32(uiDropDownListArrDelay3Code.SelectedValue);
                    TimeSpan ArrDelay3 = new TimeSpan(Convert.ToInt32(uiDropDownListArrDelay3Hours.Text), Convert.ToInt32(uiDropDownListArrDelay3Mins.Text), 0);
                    objData.ArrDelayTime3 = Convert.ToDateTime(ArrDelay3.ToString());
                }

                TimeSpan Day = new TimeSpan(Convert.ToInt32(uiDropDownListDayHours.Text), Convert.ToInt32(uiDropDownListDayMins.Text), 0);
                objData.FlyAtDay = Convert.ToDateTime(Day.ToString());

                TimeSpan Night = new TimeSpan(Convert.ToInt32(uiDropDownListNightHours.Text), Convert.ToInt32(uiDropDownListNightMins.Text), 0);
                objData.FlyAtNight = Convert.ToDateTime(Night.ToString());


                if (!string.IsNullOrEmpty(uiTextBoxDepFuel.Text))
                {
                    objData.DepFule = Convert.ToInt32(uiTextBoxDepFuel.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxArrFuel.Text))
                {
                    objData.ArrFule = Convert.ToInt32(uiTextBoxArrFuel.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxNoOFPax_A.Text))
                {
                    objData.NoOfPax_A = Convert.ToInt32(uiTextBoxNoOFPax_A.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxNoOFPax_CH.Text))
                {
                    objData.NoOfPax_C = Convert.ToInt32(uiTextBoxNoOFPax_CH.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxNoOFPax_I.Text))
                {
                    objData.NoOfPax_I = Convert.ToInt32(uiTextBoxNoOFPax_I.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxTOW.Text))
                {
                    objData.TOW = Convert.ToInt32(uiTextBoxTOW.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxZFW.Text))
                {
                    objData.ZFW = Convert.ToInt32(uiTextBoxZFW.Text);
                }


                objData.Save();

            }
            else
            {
                Sector objData = new Sector();
                objData.AddNew();
                
                objData.IsPAX = false;

                if (!string.IsNullOrEmpty(uiTextBoxFule.Text))
                {
                    objData.FuleUplifted = Convert.ToInt32(uiTextBoxFule.Text);
                }

                if (!string.IsNullOrEmpty(uiTextBoxActualBurn.Text))
                {
                    objData.ActualBurnOff = Convert.ToInt32(uiTextBoxActualBurn.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxPlanBurnOff.Text))
                {
                    objData.StandardBurnOff = Convert.ToInt32(uiTextBoxPlanBurnOff.Text);
                }


                TimeSpan STD = new TimeSpan(Convert.ToInt32(uiDropDownListSTDHours.Text), Convert.ToInt32(uiDropDownListSTDMins.Text), 0);
                objData.STD = Convert.ToDateTime(STD.ToString());

                TimeSpan ATD = new TimeSpan(Convert.ToInt32(uiDropDownListATDHours.Text), Convert.ToInt32(uiDropDownListATDMins.Text), 0);
                objData.ATD = Convert.ToDateTime(ATD.ToString());

                TimeSpan ATA = new TimeSpan(Convert.ToInt32(uiDropDownListATAHours.Text), Convert.ToInt32(uiDropDownListATAMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListATAHours.Text) < Convert.ToInt32(uiDropDownListATDHours.Text))
                {
                    objData.ATA = Convert.ToDateTime(ATA.ToString()).AddDays(1);
                }
                else
                {
                    objData.ATA = Convert.ToDateTime(ATA.ToString());
                }

                TimeSpan OFF = new TimeSpan(Convert.ToInt32(uiDropDownListOFFHours.Text), Convert.ToInt32(uiDropDownListOFFMins.Text), 0);
                objData.ChoxOff = Convert.ToDateTime(OFF.ToString());

                TimeSpan On = new TimeSpan(Convert.ToInt32(uiDropDownListOnHours.Text), Convert.ToInt32(uiDropDownListOnMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListOnHours.Text) < Convert.ToInt32(uiDropDownListOFFHours.Text))
                {
                    objData.ChoxOn = Convert.ToDateTime(On.ToString()).AddDays(1);
                }
                else
                {
                    objData.ChoxOn = Convert.ToDateTime(On.ToString());
                }

                TimeSpan STA = new TimeSpan(Convert.ToInt32(uiDropDownListSTAHours.Text), Convert.ToInt32(uiDropDownListSTAMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListSTAHours.Text) < Convert.ToInt32(uiDropDownListSTDHours.Text))
                {
                    objData.STA = Convert.ToDateTime(STA.ToString()).AddDays(1);
                }
                else
                {
                    objData.STA = Convert.ToDateTime(STA.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListDelay1Code.SelectedValue))
                {
                    objData.DepDelayID1 = Convert.ToInt32(uiDropDownListDelay1Code.SelectedValue);
                    TimeSpan Delay1 = new TimeSpan(Convert.ToInt32(uiDropDownListDelay1Hours.Text), Convert.ToInt32(uiDropDownListDelay1Mins.Text), 0);
                    objData.DepDelayTime1 = Convert.ToDateTime(Delay1.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListDelay2Code.SelectedValue))
                {
                    objData.DepDelayID2 = Convert.ToInt32(uiDropDownListDelay2Code.SelectedValue);
                    TimeSpan Delay2 = new TimeSpan(Convert.ToInt32(uiDropDownListDelay2Hours.Text), Convert.ToInt32(uiDropDownListDelay2Mins.Text), 0);
                    objData.DepDelayTime2 = Convert.ToDateTime(Delay2.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListDelay3Code.SelectedValue))
                {
                    objData.DepDelayID3 = Convert.ToInt32(uiDropDownListDelay3Code.SelectedValue);
                    TimeSpan Delay3 = new TimeSpan(Convert.ToInt32(uiDropDownListDelay3Hours.Text), Convert.ToInt32(uiDropDownListDelay3Mins.Text), 0);
                    objData.DepDelayTime3 = Convert.ToDateTime(Delay3.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListArrDelay1Code.SelectedValue))
                {
                    objData.ArrDelayID1 = Convert.ToInt32(uiDropDownListArrDelay1Code.SelectedValue);
                    TimeSpan ArrDelay1 = new TimeSpan(Convert.ToInt32(uiDropDownListArrDelay1Hours.Text), Convert.ToInt32(uiDropDownListArrDelay1Mins.Text), 0);
                    objData.ArrDelayTime1 = Convert.ToDateTime(ArrDelay1.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListArrDelay2Code.SelectedValue))
                {
                    objData.ArrDelayID2 = Convert.ToInt32(uiDropDownListArrDelay2Code.SelectedValue);
                    TimeSpan ArrDelay2 = new TimeSpan(Convert.ToInt32(uiDropDownListArrDelay2Hours.Text), Convert.ToInt32(uiDropDownListArrDelay2Mins.Text), 0);
                    objData.ArrDelayTime2 = Convert.ToDateTime(ArrDelay2.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListArrDelay3Code.SelectedValue))
                {
                    objData.ArrDelayID3 = Convert.ToInt32(uiDropDownListArrDelay3Code.SelectedValue);
                    TimeSpan ArrDelay3 = new TimeSpan(Convert.ToInt32(uiDropDownListArrDelay3Hours.Text), Convert.ToInt32(uiDropDownListArrDelay3Mins.Text), 0);
                    objData.ArrDelayTime3 = Convert.ToDateTime(ArrDelay3.ToString());
                }

                TimeSpan Day = new TimeSpan(Convert.ToInt32(uiDropDownListDayHours.Text), Convert.ToInt32(uiDropDownListDayMins.Text), 0);
                objData.FlyAtDay = Convert.ToDateTime(Day.ToString());

                TimeSpan Night = new TimeSpan(Convert.ToInt32(uiDropDownListNightHours.Text), Convert.ToInt32(uiDropDownListNightMins.Text), 0);
                objData.FlyAtNight = Convert.ToDateTime(Night.ToString());


                if (!string.IsNullOrEmpty(uiTextBoxDepFuel.Text))
                {
                    objData.DepFule = Convert.ToInt32(uiTextBoxDepFuel.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxArrFuel.Text))
                {
                    objData.ArrFule = Convert.ToInt32(uiTextBoxArrFuel.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxNoOFPax_A.Text))
                {
                    objData.NoOfPax_A = Convert.ToInt32(uiTextBoxNoOFPax_A.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxNoOFPax_CH.Text))
                {
                    objData.NoOfPax_C = Convert.ToInt32(uiTextBoxNoOFPax_CH.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxNoOFPax_I.Text))
                {
                    objData.NoOfPax_I = Convert.ToInt32(uiTextBoxNoOFPax_I.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxTOW.Text))
                {
                    objData.TOW = Convert.ToInt32(uiTextBoxTOW.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxZFW.Text))
                {
                    objData.ZFW = Convert.ToInt32(uiTextBoxZFW.Text);
                }


                objData.Save();
                
            }
            ClearSectorFields();
            Response.Redirect("~/Operation/SectorsList.aspx?" + Request.QueryString.ToString());  
        }

        protected void uiLinkButtonCancelSector_Click(object sender, EventArgs e)
        {            
            CurrentSector = null;
            Response.Redirect("~/Operation/SectorsList.aspx?" + Request.QueryString.ToString());  
        }


        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {            
            CurrentSector = null;
            Response.Redirect("~/Operation/SectorsList.aspx?" + Request.QueryString.ToString());   
        }
        #endregion

        #region Methods


        private void ClearFields()
        {           
            ClearSectorFields();
        }

        private void ClearSectorFields()
        {            
            uiTextBoxFule.Text = "";            
            uiTextBoxActualBurn.Text = "";
            uiTextBoxPlanBurnOff.Text = "";

            uiDropDownListATAHours.SelectedIndex = -1;
            uiDropDownListATDHours.SelectedIndex = -1;
            uiDropDownListOFFHours.SelectedIndex = -1;
            uiDropDownListOnHours.SelectedIndex = -1;
            uiDropDownListSTAHours.SelectedIndex = -1;
            uiDropDownListSTDHours.SelectedIndex = -1;
            uiDropDownListDelay1Hours.SelectedIndex = -1;
            uiDropDownListDelay2Hours.SelectedIndex = -1;
            uiDropDownListDelay3Hours.SelectedIndex = -1;
            uiDropDownListArrDelay1Hours.SelectedIndex = -1;
            uiDropDownListArrDelay2Hours.SelectedIndex = -1;
            uiDropDownListArrDelay3Hours.SelectedIndex = -1;
            uiDropDownListDayHours.SelectedIndex = -1;
            uiDropDownListNightHours.SelectedIndex = -1;
            uiDropDownListATAMins.SelectedIndex = -1;
            uiDropDownListATDMins.SelectedIndex = -1;
            uiDropDownListOFFMins.SelectedIndex = -1;
            uiDropDownListOnMins.SelectedIndex = -1;
            uiDropDownListSTAMins.SelectedIndex = -1;
            uiDropDownListSTDMins.SelectedIndex = -1;
            uiDropDownListDelay1Mins.SelectedIndex = -1;
            uiDropDownListDelay2Mins.SelectedIndex = -1;
            uiDropDownListDelay3Mins.SelectedIndex = -1;
            uiDropDownListArrDelay1Mins.SelectedIndex = -1;
            uiDropDownListArrDelay2Mins.SelectedIndex = -1;
            uiDropDownListArrDelay3Mins.SelectedIndex = -1;
            uiDropDownListDayMins.SelectedIndex = -1;
            uiDropDownListNightMins.SelectedIndex = -1;
            uiDropDownListArrDelay1Code.SelectedIndex = -1;
            uiDropDownListArrDelay2Code.SelectedIndex = -1;
            uiDropDownListArrDelay3Code.SelectedIndex = -1;
            uiDropDownListDelay1Code.SelectedIndex = -1;
            uiDropDownListDelay2Code.SelectedIndex = -1;
            uiDropDownListDelay3Code.SelectedIndex = -1;

            uiTextBoxDepFuel.Text = "";
            uiTextBoxArrFuel.Text = "";
            uiTextBoxNoOFPax_A.Text = "";
            uiTextBoxNoOFPax_CH.Text = "";
            uiTextBoxNoOFPax_I.Text = "";

            uiTextBoxTOW.Text = "";
            uiTextBoxZFW.Text = "";
        }

        private void FillSectorData()
        {
            
            if (!CurrentSector.IsColumnNull("FuleUplifted"))
            {
                uiTextBoxFule.Text = CurrentSector.FuleUplifted.ToString();
            }
            if (!CurrentSector.IsColumnNull("ActualBurnOff"))
            {
                uiTextBoxActualBurn.Text = CurrentSector.ActualBurnOff.ToString();
            }
            if (!CurrentSector.IsColumnNull("StandardBurnOff"))
            {
                uiTextBoxPlanBurnOff.Text = CurrentSector.StandardBurnOff.ToString();
            }
            if (!CurrentSector.IsColumnNull("ATA"))
            {
                uiDropDownListATAHours.SelectedValue = CurrentSector.ATA.Hour.ToString("00");
                uiDropDownListATAMins.SelectedValue = CurrentSector.ATA.Minute.ToString("00");
                
            }
            if (!CurrentSector.IsColumnNull("ATD"))
            {
                uiDropDownListATDHours.SelectedValue = CurrentSector.ATD.Hour.ToString("00");
                uiDropDownListATDMins.SelectedValue = CurrentSector.ATD.Minute.ToString("00");
                
            }
            if (!CurrentSector.IsColumnNull("ChoxOff"))
            {
                uiDropDownListOFFHours.SelectedValue = CurrentSector.ChoxOff.Hour.ToString("00");
                uiDropDownListOFFMins.SelectedValue = CurrentSector.ChoxOff.Minute.ToString("00");
                
            }
            if (!CurrentSector.IsColumnNull("ChoxOn"))
            {
                uiDropDownListOnHours.SelectedValue = CurrentSector.ChoxOn.Hour.ToString("00");
                uiDropDownListOnMins.SelectedValue = CurrentSector.ChoxOn.Minute.ToString("00");
                
            }
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

            if (!CurrentSector.IsColumnNull("DepDelayID1"))
            {
                uiDropDownListDelay1Code.SelectedValue = CurrentSector.DepDelayID1.ToString();
                uiDropDownListDelay1Hours.SelectedValue = CurrentSector.DepDelayTime1.Hour.ToString("00");
                uiDropDownListDelay1Mins.SelectedValue = CurrentSector.DepDelayTime1.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("DepDelayID2"))
            {
                uiDropDownListDelay2Code.SelectedValue = CurrentSector.DepDelayID2.ToString();

                uiDropDownListDelay2Hours.SelectedValue = CurrentSector.DepDelayTime2.Hour.ToString("00");
                uiDropDownListDelay2Mins.SelectedValue = CurrentSector.DepDelayTime2.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("DepDelayID3"))
            {
                uiDropDownListDelay3Code.SelectedValue = CurrentSector.DepDelayID3.ToString();
                uiDropDownListDelay3Hours.SelectedValue = CurrentSector.DepDelayTime3.Hour.ToString("00");
                uiDropDownListDelay3Mins.SelectedValue = CurrentSector.DepDelayTime3.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("ArrDelayID1"))
            {
                uiDropDownListArrDelay1Code.SelectedValue = CurrentSector.ArrDelayID1.ToString();
                uiDropDownListArrDelay1Hours.SelectedValue = CurrentSector.ArrDelayTime1.Hour.ToString("00");
                uiDropDownListArrDelay1Mins.SelectedValue = CurrentSector.ArrDelayTime1.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("ArrDelayID2"))
            {
                uiDropDownListArrDelay2Code.SelectedValue = CurrentSector.ArrDelayID2.ToString();
                uiDropDownListArrDelay2Hours.SelectedValue = CurrentSector.ArrDelayTime2.Hour.ToString("00");
                uiDropDownListArrDelay2Mins.SelectedValue = CurrentSector.ArrDelayTime2.Minute.ToString("00");
            }


            if (!CurrentSector.IsColumnNull("ArrDelayID3"))
            {
                uiDropDownListArrDelay3Code.SelectedValue = CurrentSector.ArrDelayID3.ToString();
                uiDropDownListArrDelay3Hours.SelectedValue = CurrentSector.ArrDelayTime3.Hour.ToString("00");
                uiDropDownListArrDelay3Mins.SelectedValue = CurrentSector.ArrDelayTime3.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("FlyAtDay"))
            {
                uiDropDownListDayHours.SelectedValue = CurrentSector.FlyAtDay.Hour.ToString("00");
                uiDropDownListDayMins.SelectedValue = CurrentSector.FlyAtDay.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("FlyAtDay"))
            {
                uiDropDownListNightHours.SelectedValue = CurrentSector.FlyAtNight.Hour.ToString("00");
                uiDropDownListNightMins.SelectedValue = CurrentSector.FlyAtNight.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("DepFule"))
            {
                uiTextBoxDepFuel.Text = CurrentSector.DepFule.ToString();
            }
            if (!CurrentSector.IsColumnNull("ArrFule"))
            {
                uiTextBoxArrFuel.Text = CurrentSector.ArrFule.ToString();
            }
            if (!CurrentSector.IsColumnNull("NoOfPax_A"))
            {
                uiTextBoxNoOFPax_A.Text = CurrentSector.NoOfPax_A.ToString();
            }
            if (!CurrentSector.IsColumnNull("NoOfPax_C"))
            {
                uiTextBoxNoOFPax_CH.Text = CurrentSector.NoOfPax_C.ToString();
            }
            if (!CurrentSector.IsColumnNull("NoOfPax_I"))
            {
                uiTextBoxNoOFPax_I.Text = CurrentSector.NoOfPax_I.ToString();
            }
            if (!CurrentSector.IsColumnNull("TOW"))
            {
                uiTextBoxTOW.Text = CurrentSector.TOW.ToString();
            }
            if (!CurrentSector.IsColumnNull("ZFW"))
            {
                uiTextBoxZFW.Text = CurrentSector.ZFW.ToString();
            }
        }

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

            uiDropDownListATAHours.DataSource = Hours;
            uiDropDownListATAHours.DataBind();

            uiDropDownListATDHours.DataSource = Hours;
            uiDropDownListATDHours.DataBind();

            uiDropDownListOFFHours.DataSource = Hours;
            uiDropDownListOFFHours.DataBind();

            uiDropDownListOnHours.DataSource = Hours;
            uiDropDownListOnHours.DataBind();

            uiDropDownListSTAHours.DataSource = Hours;
            uiDropDownListSTAHours.DataBind();

            uiDropDownListSTDHours.DataSource = Hours;
            uiDropDownListSTDHours.DataBind();

            uiDropDownListDelay1Hours.DataSource = Hours;
            uiDropDownListDelay1Hours.DataBind();

            uiDropDownListDelay2Hours.DataSource = Hours;
            uiDropDownListDelay2Hours.DataBind();

            uiDropDownListDelay3Hours.DataSource = Hours;
            uiDropDownListDelay3Hours.DataBind();

            uiDropDownListArrDelay1Hours.DataSource = Hours;
            uiDropDownListArrDelay1Hours.DataBind();

            uiDropDownListArrDelay2Hours.DataSource = Hours;
            uiDropDownListArrDelay2Hours.DataBind();

            uiDropDownListArrDelay3Hours.DataSource = Hours;
            uiDropDownListArrDelay3Hours.DataBind();

            uiDropDownListDayHours.DataSource = Hours;
            uiDropDownListDayHours.DataBind();

            uiDropDownListNightHours.DataSource = Hours;
            uiDropDownListNightHours.DataBind();

            uiDropDownListATAMins.DataSource = Mins;
            uiDropDownListATAMins.DataBind();

            uiDropDownListATDMins.DataSource = Mins;
            uiDropDownListATDMins.DataBind();

            uiDropDownListOFFMins.DataSource = Mins;
            uiDropDownListOFFMins.DataBind();

            uiDropDownListOnMins.DataSource = Mins;
            uiDropDownListOnMins.DataBind();

            uiDropDownListSTAMins.DataSource = Mins;
            uiDropDownListSTAMins.DataBind();

            uiDropDownListSTDMins.DataSource = Mins;
            uiDropDownListSTDMins.DataBind();

            uiDropDownListDelay1Mins.DataSource = Mins;
            uiDropDownListDelay1Mins.DataBind();

            uiDropDownListDelay2Mins.DataSource = Mins;
            uiDropDownListDelay2Mins.DataBind();

            uiDropDownListDelay3Mins.DataSource = Mins;
            uiDropDownListDelay3Mins.DataBind();

            uiDropDownListArrDelay1Mins.DataSource = Mins;
            uiDropDownListArrDelay1Mins.DataBind();

            uiDropDownListArrDelay2Mins.DataSource = Mins;
            uiDropDownListArrDelay2Mins.DataBind();

            uiDropDownListArrDelay3Mins.DataSource = Mins;
            uiDropDownListArrDelay3Mins.DataBind();

            uiDropDownListDayMins.DataSource = Mins;
            uiDropDownListDayMins.DataBind();

            uiDropDownListNightMins.DataSource = Mins;
            uiDropDownListNightMins.DataBind();

        }
        
        private void LoadDDLs()
        {
            
            Delay delays = new Delay();
            delays.LoadAll();
            uiDropDownListArrDelay1Code.DataSource = delays.DefaultView;
            uiDropDownListArrDelay1Code.DataTextField = "Code";
            uiDropDownListArrDelay1Code.DataValueField = "DelayID";
            uiDropDownListArrDelay1Code.DataBind();
            uiDropDownListArrDelay1Code.Items.Insert(0, new ListItem("Select Code", ""));

            uiDropDownListArrDelay2Code.DataSource = delays.DefaultView;
            uiDropDownListArrDelay2Code.DataTextField = "Code";
            uiDropDownListArrDelay2Code.DataValueField = "DelayID";
            uiDropDownListArrDelay2Code.DataBind();
            uiDropDownListArrDelay2Code.Items.Insert(0, new ListItem("Select Code", ""));

            uiDropDownListArrDelay3Code.DataSource = delays.DefaultView;
            uiDropDownListArrDelay3Code.DataTextField = "Code";
            uiDropDownListArrDelay3Code.DataValueField = "DelayID";
            uiDropDownListArrDelay3Code.DataBind();
            uiDropDownListArrDelay3Code.Items.Insert(0, new ListItem("Select Code", ""));

            uiDropDownListDelay1Code.DataSource = delays.DefaultView;
            uiDropDownListDelay1Code.DataTextField = "Code";
            uiDropDownListDelay1Code.DataValueField = "DelayID";
            uiDropDownListDelay1Code.DataBind();
            uiDropDownListDelay1Code.Items.Insert(0, new ListItem("Select Code", ""));

            uiDropDownListDelay2Code.DataSource = delays.DefaultView;
            uiDropDownListDelay2Code.DataTextField = "Code";
            uiDropDownListDelay2Code.DataValueField = "DelayID";
            uiDropDownListDelay2Code.DataBind();
            uiDropDownListDelay2Code.Items.Insert(0, new ListItem("Select Code", ""));

            uiDropDownListDelay3Code.DataSource = delays.DefaultView;
            uiDropDownListDelay3Code.DataTextField = "Code";
            uiDropDownListDelay3Code.DataValueField = "DelayID";
            uiDropDownListDelay3Code.DataBind();
            uiDropDownListDelay3Code.Items.Insert(0, new ListItem("Select Code", ""));

        }


        #endregion
    }
}