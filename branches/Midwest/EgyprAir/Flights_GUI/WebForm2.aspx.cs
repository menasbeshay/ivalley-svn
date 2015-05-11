using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using ValidationLayer;
using System.Data;
namespace Flights_GUI
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Sector sectors = new Sector();
            sectors.GetSectorsByFlightID(1981);

            DataTable test = sectors.DefaultView.ToTable();

            ValidationMaster validate = new ValidationMaster();
            validate.Validate(test, ValidationRuleToApply.FLIGHT_DUTY_PERIOD);

            Literal1.Text += "<br />" + validate.ValidationResult.ToString() + "<br />";
            foreach (string item in validate.ValidationMsg)
            {
                Literal1.Text += "<br />" + item;
            }
        }


    }
}