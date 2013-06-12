using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;

namespace Flights_GUI.Common.Controls
{
    public partial class SectorInfo : System.Web.UI.UserControl
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
            FillSectorData();
        }

        #endregion 

        #region Methods
        
        private void FillSectorData()
        {            
            uiLabelDate.Text = CurrentSector.SectorDate.ToString("dd/MM/yyyy");
            AirPort from = new AirPort();
            from.LoadByPrimaryKey(CurrentSector.From_AirportID);
            AirPort to = new AirPort();
            to.LoadByPrimaryKey(CurrentSector.To_AirportID);
            uiLabelFrom.Text = from.IATACode;
            uiLabelTo.Text = to.IATACode;
            uiLabelNO.Text = CurrentSector.FlightNo;
        }
        #endregion
    }
}