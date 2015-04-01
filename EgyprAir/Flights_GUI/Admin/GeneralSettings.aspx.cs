using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
namespace Flights_GUI.Admin
{
    public partial class GeneralSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSettings();
            }
        }

        private void LoadSettings()
        {
            SystemSettings settings = new SystemSettings();
            settings.LoadAll();
            uiTextBoxFlightNoPrefix.Text = settings.FlightNoPrefix;
            if (!settings.IsColumnNull(SystemSettings.ColumnNames.EnableFlightTimeLimitaion))
                uiCheckBoxFlightTimeLimitation.Checked = settings.EnableFlightTimeLimitaion;
            else
                uiCheckBoxFlightTimeLimitation.Checked = false;
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            SystemSettings settings = new SystemSettings();
            settings.LoadAll();
            settings.FlightNoPrefix = uiTextBoxFlightNoPrefix.Text;
            settings.EnableFlightTimeLimitaion = uiCheckBoxFlightTimeLimitation.Checked;
            settings.Save();
            LoadSettings();
        }

        
    }
}