using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Flights_GUI
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                MembershipUser u = Membership.FindUsersByName("crewadmin")["crewadmin"];
                Response.Write( u.GetPassword());
                //ReportViewer1.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("StartDate", new DateTime(2012,10,1).ToString()));
                //ReportViewer1.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("EndDate", new DateTime(2012, 10, 15).ToString()));
                //ReportViewer1.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("FromAirPort", "0"));
                //ReportViewer1.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("ToAirPort", "0"));
                //ReportViewer1.LocalReport.Refresh();
            }
        }
    }
}